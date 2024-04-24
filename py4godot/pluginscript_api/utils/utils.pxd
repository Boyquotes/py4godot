from py4godot.godot_bindings.binding4_godot4 cimport *
from py4godot.classes.cpp_bridge cimport *
from libcpp.vector cimport vector

cdef extern from "help_types.h":
    ctypedef struct TransferObject:
        vector[Dictionary] signals
        vector[GDExtensionPropertyInfo] properties
        vector [PyObject*] default_values
        PyObject* class_
        PyObject* instance
        bool is_tool


    ctypedef struct CPPSignalArg:
        char* name;
        GDExtensionVariantType type;

cdef extern from "py4godot/pluginscript_api/utils/signal_description_utils.h":
    shared_ptr[Dictionary] init_signal_description(char* name, vector[CPPSignalArg] args)
    void print_error(char* text)

cdef extern from "py4godot/pluginscript_api/utils/property_description_utils.h":
    void init_property_description(GDExtensionPropertyInfo& property_info,
    GDExtensionVariantType type_,
    StringName name,
    StringName class_name,
    uint32_t hint,
    String hint_string,
    uint32_t usage
)