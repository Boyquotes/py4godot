import json
import os.path

from generate_classes import  pythonize_boolean_types, unref_type, \
    unnull_type
from generate_classes_hpp import has_native_struct

INDENT = "  "


class ReturnType:
    def __init__(self, name, type_):
        self.type = type_
        self.name = name
        self.is_primitive = False

class BuiltinClass:
    def __init__(self, name):
        self.name = name
        self.core_members = []
class CoreMember:
    def __init__(self, name, type_):
        self.name = name
        self.type_  = type_

class Operator:
    def __init__(self, class_, operator_string, return_type):
        self.right_type_values = []
        self.class_ = class_
        self.operator_string = operator_string
        self.return_type = return_type

class GraphNode():
    def __init__(self, class_):
        self.class_ = class_
        self.children = []


IGNORED_CLASSES = {"Nil", "bool", "float", "int"}

ACCEPTED_CLASSES = {"Object", "String"}

native_structs = {}
forbidden_types = {"cont void*", "void*"}
normal_classes = set()
singletons = set()
builtin_classes = set()
core_classes = dict()
operator_dict = dict()
root_node = None
operator_to_method = {"+": "__add__",
                      "*": "__mul__",
                      "-": "__sub__",
                      "/": "__div__",
                      "%": "__mod__",
                      "**": "__pow__",
                      "==": "__eq__",
                      "!=": "__ne__",
                      "<": "__lt__",
                      "<=": "__le__",
                      ">": "__gt__",
                      ">=": "__ge__",
                    }
operator_to_variant_operator = {"+":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_ADD",
                                "*":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_MULTIPLY",
                                "-":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_SUBTRACT",
                                "/":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_DIVIDE",
                                "%":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_MODULE",
                                "**":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_POWER",
                                "==":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_EQUAL",
                                "!=":"GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_NOT_EQUAL",
                                "<": "GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_LESS",
                                "<=": "GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_LESS_EQUAL",
                                ">": "GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_GREATER",
                                ">=": "GDExtensionVariantOperator.GDEXTENSION_VARIANT_OP_GREATER_EQUAL",
                                }
def generate_import():
    result = \
        """
ctypedef void * GDExtensionObjectPtr
ctypedef void * GDExtensionTypePtr
ctypedef bint bool
cdef cppclass Error:
    pass
cdef cppclass Variant:
    pass
"""
    return result

def generate_constructor_args(constructor):
    result = ""
    if "arguments" not in constructor:
        return result

    for arg in constructor["arguments"]:
        if not arg["type"].startswith("enum::"):
            result += f"{untypearray(unbitfield_type(arg['type']))} {pythonize_name(arg['name'])}, "
        else:
            #enums are marked with enum:: . To be able to use this, we have to strip this
            arg_type = arg["type"].replace("enum::", "")
            result += f"{untypearray(unenumize_type(arg_type))} {pythonize_name(arg['name'])}, "
    result = result[:-2]
    return result

def convert_camel_case_to_underscore(string):
    res = ""
    was_upper = True
    was_number = False
    for char in string:
        if char.isupper():
            if was_upper or was_number:
                res += char

            else:
                res += "_"+char
        else:
            res += char
        was_upper = char.isupper()
        was_number = char in {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
    if (("vector3" in res.lower() or "vector2" in res.lower()) or "float64" in res.lower() or "float32" in res.lower() or "int64" in res.lower() or "int32" in res.lower()):
        res = res.replace("Array", "_Array")
    return res
def generate_variant_type(class_):
    if class_ in builtin_classes:
        return f"GDExtensionVariantType.GDEXTENSION_VARIANT_TYPE_{convert_camel_case_to_underscore(class_).upper()}"
    else:
        return f"GDExtensionVariantType.GDEXTENSION_VARIANT_TYPE_NIL"

def generate_constructors(class_):
    res = ""
    if "constructors" not in class_.keys():
        return res
    for constructor in class_["constructors"]:
        res += f"{INDENT*2}@staticmethod"
        res = generate_newline(res)
        res += f"{INDENT*2}{class_['name']} new{constructor['index']}({generate_constructor_args(constructor)});"
        res = generate_newline(res)
    return res

def generate_class_imports(classes):
    result = '#include "py4godot/cppclasses/generated4_core.h"'
    result = generate_newline(result)
    result += '#include "py4godot/gdextension-api/gdextension_interface.h"'
    result = generate_newline(result)
    for class_ in classes:
        result += f'#include "py4godot/cppclasses/{class_}/{class_}.h"'
        result = generate_newline(result)
    return result

def generate_newline(str_):
    return str_ + "\n"


def get_base_class(class_):
    if "inherits" in class_.keys():
        return class_["inherits"]
    if class_["name"] in builtin_classes:
        return "VariantTypeWrapper"
    return "Wrapper"

def strip_symbols_from_type(type):
    return type.replace("*","").replace("const","").strip()
def native_structs_in_method(mMethod):
    #TODO: check whether this method makes sense for later
    if("arguments" in mMethod):
        for arg in mMethod["arguments"]:
            if arg["type"] in forbidden_types:
                return True
            if("*" in arg["type"]):
                return True
            if strip_symbols_from_type(arg["type"]) in native_structs:
                return True
    #if "return_value" in mMethod.keys():
    #    if mMethod["return_value"]["type"] in forbidden_types:
    #        return True
    #    if strip_symbols_from_type(mMethod["return_value"]["type"]) in native_structs:
    #        return True
    return False

def generate_properties(class_):
    result = ""
    if("properties" in class_.keys()):
        for property in class_["properties"]:
            result += generate_property(property)
    return result
def generate_singleton_constructor(classname):
    res = INDENT*2 + "@staticmethod"
    res = generate_newline(res)
    res += f"{INDENT*2}{classname} get_instance();"
    res = generate_newline(res)
    return res
def generate_construction(class_):
    res = ""
    if is_singleton(class_["name"]):
        res += generate_singleton_constructor(class_["name"])
    return res

def is_singleton(class_name):
    return class_name in singletons


def generate_method_bind_name(class_name, method_name):
    return f"method_bind__{class_name}_{method_name}"

def get_variant_type(class_name):
    DICT = {

        "Nil":"GDEXTENSION_VARIANT_TYPE_NIL",

        #  atomic types
        "bool":"GDEXTENSION_VARIANT_TYPE_BOOL",
        "int":"GDEXTENSION_VARIANT_TYPE_INT",
        "float":"GDEXTENSION_VARIANT_TYPE_FLOAT",
        "string":"GDEXTENSION_VARIANT_TYPE_STRING",

        # math types
        "vector2":"GDEXTENSION_VARIANT_TYPE_VECTOR2",
        "vector2i":"GDEXTENSION_VARIANT_TYPE_VECTOR2I",
        "rect2":"GDEXTENSION_VARIANT_TYPE_RECT2",
        "rect2i":"GDEXTENSION_VARIANT_TYPE_RECT2I",
        "vector3":"GDEXTENSION_VARIANT_TYPE_VECTOR3",
        "vector3i":"GDEXTENSION_VARIANT_TYPE_VECTOR3I",
        "transform2d":"GDEXTENSION_VARIANT_TYPE_TRANSFORM2D",
        "vector4":"GDEXTENSION_VARIANT_TYPE_VECTOR4",
        "vector4i":"GDEXTENSION_VARIANT_TYPE_VECTOR4I",
        "plane":"GDEXTENSION_VARIANT_TYPE_PLANE",
        "quaternion":"GDEXTENSION_VARIANT_TYPE_QUATERNION",
        "aabb":"GDEXTENSION_VARIANT_TYPE_AABB",
        "basis":"GDEXTENSION_VARIANT_TYPE_BASIS",
        "transform3d":"GDEXTENSION_VARIANT_TYPE_TRANSFORM3D",
        "projection":"GDEXTENSION_VARIANT_TYPE_PROJECTION",

        # misc types
        "color":"GDEXTENSION_VARIANT_TYPE_COLOR",
        "stringname":"GDEXTENSION_VARIANT_TYPE_STRING_NAME",
        "nodepath":"GDEXTENSION_VARIANT_TYPE_NODE_PATH",
        "rid":"GDEXTENSION_VARIANT_TYPE_RID",
        "object":"GDEXTENSION_VARIANT_TYPE_OBJECT",
        "callable":"GDEXTENSION_VARIANT_TYPE_CALLABLE",
        "signal":"GDEXTENSION_VARIANT_TYPE_SIGNAL",
        "dictionary":"GDEXTENSION_VARIANT_TYPE_DICTIONARY",
        "array":"GDEXTENSION_VARIANT_TYPE_ARRAY",

        # typed arrays
        "packedbytearray":"GDEXTENSION_VARIANT_TYPE_PACKED_BYTE_ARRAY",
        "packedint32array":"GDEXTENSION_VARIANT_TYPE_PACKED_INT32_ARRAY",
        "packedint64array":"GDEXTENSION_VARIANT_TYPE_PACKED_INT64_ARRAY",
        "packedfloat32array":"GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT32_ARRAY",
        "packedfloat64array":"GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT64_ARRAY",
        "packedstringarray":"GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY",
        "packedvector2array":"GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR2_ARRAY",
        "packedvector3array":"GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR3_ARRAY",
        "packedcolorarray":"GDEXTENSION_VARIANT_TYPE_PACKED_COLOR_ARRAY"
    }

    return DICT[class_name.lower()]

def generate_virtual_return_type(return_type):
    if return_type == "bool":
        return "False"
    elif return_type == "int":
        return "0"
    elif return_type == "String":
        return "String()"

    return return_type+"()"
def is_static(mMethod):
    return mMethod["is_static"]
def generate_method_modifiers(mMethod):
    res = ""
    if is_static(mMethod):
        res = f"{INDENT * 2}@staticmethod"
        return res
    return ""

def generate_method(class_, mMethod):
    res = ""
    if has_native_struct(mMethod):
        return res
    args = generate_args(mMethod)
    def_function = f"{INDENT*2}{untypearray(get_ret_value(mMethod))} {pythonize_name(mMethod['name'])}({args});"
    res = generate_newline(res)
    res += generate_method_modifiers(mMethod)
    res = generate_newline(res)
    res += def_function
    res = generate_newline(res)
    return res

def get_ret_value(method):
    if "return_value" in method.keys() or "return_type" in method.keys():
        if "return_value" in method.keys():
            return_type = method["return_value"]["type"]
        else:
            return_type = method["return_type"]
        return unbitfield_type(unenumize_type(return_type))
    return "void"

def generate_operators(class_):
    if class_["name"] == "Dictionary":
        print(class_["name"])
        if("operators" in class_.keys()):
            for operator in class_["operators"]:
                print(operator)
    return ""

def collect_members(obj):
    global core_classes
    print(obj["builtin_class_member_offsets"][3])
    for class_ in obj["builtin_class_member_offsets"][3]["classes"]:
        core_class = BuiltinClass(class_["name"])
        for member in class_["members"]:
            core_member = CoreMember(member["member"], member["meta"].replace("32", ""))
            core_class.core_members.append(core_member)
        core_classes[class_["name"]] = core_class
    print(core_classes)

def generate_common_methods(class_):
    result = ""
    if not is_singleton(class_["name"]):
        result += generate_constructor(class_["name"])
        result = generate_newline(result)
    result = generate_newline(result)
    result += generate_constructors(class_)
    result = generate_newline(result)
    result += generate_new_static(class_)
    result = generate_newline(result)
    return result

def generate_enums(class_):
    if not "enums" in class_.keys():
        return ""
    res = ""
    for enum in class_["enums"]:
        res += f"cpdef enum {class_['name']}__{enum['name']}:"
        res = generate_newline(res)
        for enum_value in enum["values"]:
            res += f"{INDENT}{class_['name']}__{enum_value['name']} = {enum_value['value']}"
            res = generate_newline(res)
    res = generate_newline(res)
    return res

def generate_member_getter(class_,member):
    res = ""
    res += f"{INDENT}"
    res = generate_newline(res)
    res += f"{INDENT*2}{member.type_} member_get_{member.name}();"
    res = generate_newline(res)
    return res

def generate_member_setter(class_,member):
    res = ""
    res += f"{INDENT*2}void member_set_{member.name}({member.type_} value);"
    return res


def generate_members_of_class(class_):
    res = ""
    if class_["name"] in core_classes.keys():
        for member in core_classes[class_["name"]].core_members:
            res += generate_member_getter(class_["name"],member)
            res = generate_newline(res)
            res += generate_member_setter(class_["name"],member)
    return res

def simplify_type(type):
    list_types = type.split(",")
    return list_types[-1]
def generate_property(property):
    result = ""
    if "typedarray" in property["type"]:
        return result #TODO: Enable again
    result += f"{INDENT*2}{simplify_type(unbitfield_type(unenumize_type((property['type']))))} prop_get_{pythonize_name(property['name'])}()"+";"
    result = generate_newline(result)

    if "setter" in property and property["setter"] != "":
        result += f"{INDENT*2}void prop_set_{pythonize_name(property['name'])}({simplify_type(untypearray(simplify_type(property['type'])))} value);"
        result = generate_newline(result)

    return result


def pythonize_name(name):
    if name in ("from", "len", "in", "for", "with", "class", "pass", "raise", "global", "char", "default"):
        return name + "_"
    return name

def unbitfield_type(arg_type):
    if arg_type.startswith("bitfield::"):
        return "int"
    return arg_type


def generate_args(method_with_args):
    result = " "
    if(is_static(method_with_args)):
        result = ""
    if "arguments" not in method_with_args:
        return result[:-2]

    for arg in method_with_args["arguments"]:
        if not arg["type"].startswith("enum::"):
            result += f"{untypearray(unbitfield_type(arg['type']))} {pythonize_name(arg['name'])}, "
        else:
            #enums are marked with enum:: . To be able to use this, we have to strip this
            result += f"{untypearray(unenumize_type(arg['type']))} {pythonize_name(arg['name'])} , "
    result = result[:-2]
    return result
def unenumize_type(type_):
    if "enum" in type_:
        return "int"
    enum_type = type_.replace("enum::", "")
    type_list = enum_type.split(".")
    if len(type_list) > 1:
        return "int" #TODO: enable this again
        #return type_list[0]+ "__" + type_list[1]
    return type_list[0]

def untypearray(type_):
    #TODO improve this by creating actually typed arrays
    if "typedarray" in type_:
        return "Array"
    return type_

def get_class_from_enum(type_):
    enum_type = type_.replace("enum::", "")
    type_list = enum_type.split(".")
    return type_list[0]
def get_classes_to_import(classes):
    classes_to_import = set()
    for class_ in classes:
        if( "inherits" in class_.keys()):
            classes_to_import.add(class_["inherits"])
        if "methods" in class_.keys():
            for method in class_["methods"]:
                if("return_value" in method.keys()):
                    if(unbitfield_type(get_class_from_enum(method["return_value"]["type"])) in normal_classes):
                        classes_to_import.add(get_class_from_enum(method["return_value"]["type"]))
                if("arguments" not in method.keys()):
                    continue
                for argument in method["arguments"]:
                    if argument["type"] in normal_classes:
                        classes_to_import.add(argument["type"])
                    if "enum" in argument["type"]:
                        type = argument["type"].lstrip("enum::")
                        if type.split(".")[0] in normal_classes:
                            classes_to_import.add(type.split(".")[0])

        if "properties" in class_.keys():
            for prop in class_["properties"]:

                if simplify_type(prop["type"]) in normal_classes:
                    classes_to_import.add(simplify_type(prop["type"]))

    return classes_to_import

def generate_constructor(classname):
    res = f"{INDENT*2}@staticmethod"
    res = generate_newline(res)
    res += f"{INDENT*2}{classname} constructor();"
    res = generate_newline(res)
    return res

def generate_new_static(class_):
    res = f"{INDENT*2}@staticmethod"
    res = generate_newline(res)
    if (class_["name"] in builtin_classes):
        res += f"{INDENT*2}{class_['name']} new_static(GDExtensionTypePtr owner);"
    else:
        res += f"{INDENT*2}{class_['name']} new_static(GDExtensionObjectPtr owner);"

    return res



def generate_operators_for_class(class_name):
    res = ""
    if class_name in operator_dict.keys():
        for operator in operator_dict[class_name]:
            if operator in operator_to_method.keys():
                op = operator_dict[class_name][operator]
                if op.right_type_values:
                    for right_type in op.right_type_values:
                        pass
                        #TODO: implement
                        #res += f"{INDENT*2}{op.return_type} operator {operator} ({right_type} other);"
                        #res = generate_newline(res)
    res = generate_newline(res)
    return res


def generate_classes(classes, filename, is_core=False):
    res = generate_import()
    res = generate_newline(res)
    res += f'cdef extern from "py4godot/cpputils/Wrapper.h" namespace "godot":'
    res = generate_newline(res)
    res += f'{INDENT}cdef cppclass Wrapper:'
    res = generate_newline(res)
    res += f'{INDENT*2}pass'
    res = generate_newline(res)

    res += f'cdef extern from "py4godot/cpputils/VariantTypeWrapper.h" namespace "godot":'
    res = generate_newline(res)
    res += f'{INDENT}cdef cppclass VariantTypeWrapper:'
    res = generate_newline(res)
    res += f'{INDENT * 2}pass'
    res = generate_newline(res)

    for class_ in classes:
        if (class_["name"] in IGNORED_CLASSES):
            continue
        if class_["name"] in builtin_classes:
            res += f'cdef extern from "py4godot/cppclasses/generated4_core.h" namespace "godot":'
        else:
            res += f'cdef extern from "py4godot/cppclasses/{class_["name"]}/{class_["name"]}.h" namespace "godot":'
        res = generate_newline(res)
        res = generate_newline(res)
        res += f"{INDENT}cdef cppclass {class_['name']}({get_base_class(class_)}):"
        res = generate_newline(res)
        res += generate_common_methods(class_)
        res += generate_special_methods(class_)
        res = generate_newline(res)
        res += generate_construction(class_)
        res = generate_newline(res)
        if "methods" not in class_.keys():
            continue
        res += generate_properties(class_)
        res += generate_members_of_class(class_)
        for method in class_["methods"]:
            if native_structs_in_method(method):
                # TODO: Check if this makes sense
                continue
            res += generate_method(class_, method)
            res = generate_newline(res)
        res += generate_operators_for_class(class_["name"])
        res = generate_newline(res)
    if(os.path.exists(filename)):
        with open(filename, "r") as already_existing_file:
            if already_existing_file.read() == res:
                return
    with open(filename, "w") as f:
        f.write(res)


def generate_dictionary_set_item():
    res = ""
    #res += f"{INDENT}Variant operator [](Variant key);"
    res = generate_newline(res)
    return res


def generate_special_methods_dictionary():
    res = ""
    res += generate_dictionary_set_item()
    res = generate_newline(res)
    return res


def generate_array_set_item(class_):
    res = ""
    return res
    if class_["name"] == "PackedInt32Array":
        res += f"{INDENT}int& operator [](int index);"
    elif class_["name"] == "PackedInt64Array":
        res += f"{INDENT}int64_t& operator [](int index);"
    elif class_["name"] == "PackedFloat32Array":
        res += f"{INDENT}float& operator [](int index);"
    elif class_["name"] == "PackedFloat64Array":
        res += f"{INDENT}double& operator [](int index);"
    elif class_["name"] == "PackedBoolArray":
        res += f"{INDENT}bool& operator [](int index);"
    elif class_["name"] == "PackedByteArray":
        res += f"{INDENT}byte& operator [](int index);"

    elif class_["name"] == "PackedColorArray":
        res += f"{INDENT}Color operator [](int index);"
    elif class_["name"] == "PackedVector3Array":
        res += f"{INDENT}Vector3 operator [](int index);"
    elif class_["name"] == "PackedVector2Array":
        res += f"{INDENT}Vector2 operator [](int index);"
    elif class_["name"] == "PackedStringArray":
        res += f"{INDENT}String operator [](int index);"
    elif class_["name"] == "Array":
        res += f"{INDENT}Variant operator [](int index);"
    return res

def generate_special_methods_array(class_):
    res = ""
    res += generate_array_set_item(class_)
    return res


def generate_special_methods(class_):
    res = ""
    if class_["name"] == "Dictionary":
        res += generate_special_methods_dictionary()
    
    if "array" in class_["name"].lower():
        res += generate_special_methods_array(class_)

    return res

def generate_operators_set(class_):
    for operator in class_["operators"]:
        print(operator)
        if not class_["name"] in operator_dict.keys():
            operator_dict[class_["name"]] = dict()
        if not operator["name"] in operator_dict[class_["name"]]:
            operator_dict[class_["name"]][operator["name"]] = Operator(class_["name"], operator["name"], operator["return_type"])
        if "right_type" in operator.keys():
            operator_dict[class_["name"]][operator["name"]].right_type_values.append(operator["right_type"])



classes = set()

def find_class(_class, obj_clases):
    for i in obj_clases:
        if _class == i["name"]:
            return i
    return None

def is_already_in_graph(_class, node):
    if _class == node.class_["name"]:
        return True
    for child in node.children:
        ret = is_already_in_graph(_class, child)
        if ret:
            return True
    return False

def find_graph_node(_class_name, node):
    if _class_name == node.class_["name"]:
        return node

    for child in node.children:
        node =  find_graph_node(_class_name, child)
        if node != None:
            return node

    return None


def add_class(_class, obj_classes):
    if _class["name"] == root_node.class_["name"]:
        return root_node
    parent = _class["inherits"]
    if is_already_in_graph(parent, root_node):
        node = find_graph_node(parent, root_node)
        node.children.append(GraphNode(_class))
    else:
        add_class(find_class(parent, obj_classes), obj_classes)
        find_graph_node(parent, root_node).children.append(GraphNode(_class))

def graph_to_list(node, liste):
    liste.append(node.class_)
    for child in node.children:
        graph_to_list(child, liste)



if __name__ == "__main__":
    with open('py4godot/gdextension-api/extension_api.json', 'r') as myfile:
        data = myfile.read()
        obj = json.loads(data)
        root_node = find_class("Object", obj["classes"])

        classes = set([class_['name'] if class_["name"] not in IGNORED_CLASSES else None for class_ in
                       obj['classes'] + obj["builtin_classes"]])

        builtin_classes = set(class_["name"] for class_ in obj["builtin_classes"])
        normal_classes = set([class_['name'] for class_ in obj['classes']])
        native_structs = set([native_struct["name"] for native_struct in obj["native_structures"]])
        singletons = set([singleton["name"] for singleton in obj["singletons"]])
        collect_members(obj)
        classes_to_generate = []

        root_node = GraphNode(find_class("Object", obj["classes"]))
        for class_ in obj["classes"]:
            if class_ == "Object":
                continue
            if not is_already_in_graph(class_["name"], root_node):
                add_class(class_, obj["classes"])

        classes_to_generate = []
        graph_to_list(root_node, classes_to_generate)

        #for class_ in obj["classes"]:
        #    if class_["name"] in {"Object", "RefCounted", "AESContext"}:
        #        classes_to_generate.append(class_)

        is_in_classes_to_generate = False
        for class_ in classes_to_generate:
            print(class_["name"])
            if class_["name"] == "EditorNode3DGizmo":
                is_in_classes_to_generate = True

        generate_classes(obj["builtin_classes"] + classes_to_generate, f"py4godot/classes/cpp_bridge.pxd", is_core=True)
