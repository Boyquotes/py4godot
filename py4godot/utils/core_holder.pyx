from py4godot.godot_bindings.binding cimport *
from py4godot.godot_bindings.binding_external cimport *
from py4godot.godot_bindings.types cimport *

cdef godot_gdnative_ext_nativescript_1_1_api_struct* nativescript_api_holder
cdef godot_gdnative_core_api_struct* api_core_holder

cdef api set_native_script_holder(godot_gdnative_ext_nativescript_1_1_api_struct* api):
    global nativescript_api_holder
    nativescript_api_holder = api

cdef api set_core_holder(godot_gdnative_core_api_struct* core):
    global api_core_holder
    api_core_holder = core

cdef godot_gdnative_core_api_struct* get_core():
    return api_core_holder

cdef godot_gdnative_ext_nativescript_1_1_api_struct* get_nativescript():
    return nativescript_api_holder