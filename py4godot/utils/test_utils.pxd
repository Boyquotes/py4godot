from py4godot.godot_bindings.binding4_godot4 cimport *
cimport py4godot.classes.generated4_core as core
cimport py4godot.classes.cpp_bridge as bridge

cdef extern from "py4godot/cpputils/utils.h":
    void decrefPyObject(PyObject* object)
    PyObject* gd_string_to_unicode(bridge.String& string, int length)