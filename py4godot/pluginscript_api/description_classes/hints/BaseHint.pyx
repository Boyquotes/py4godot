from py4godot.godot_bindings.binding_external cimport *
from py4godot.enums.enums cimport *
cdef class BaseHint(object):
    def __init__(self):
        self.hint = GODOT_PROPERTY_HINT_NONE
        self.hint_string = ""
    def get_hint(self):
        return self.hint

    def set_hint(self,value):
        self.hint = value

    def get_string(self):
        return self.hint_string