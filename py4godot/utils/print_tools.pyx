
from py4godot.godot_bindings.binding4_godot4 cimport *
from py4godot_core_holder.core_holder cimport *

cdef GDNativeInterface* gdnative_interface = get_interface()

def print_warning(*objects, sep=' ', end=''):
    gdnative_interface.print_warning("print_warning", "test", "test",1);
    cdef str string = ""
    for object in objects:
        string += str(object) + sep
    string.rstrip(sep)
    string += end
    b_str = string.encode('utf-8')
    cdef char* c_str = b_str
    gdnative_interface.print_warning(c_str, "test", "test",1);

def print(*objects, sep=' ', end=''):
    string = ""
    for object in objects:
        string += str(object) + sep
    string.rstrip(sep)
    string += end
    gdnative_interface.print_warning(string, "test", "test",1);