from py4godot.godot_bindings.binding_external cimport *
from py4godot_core_holder.core_holder cimport get_core, get_nativescript
from py4godot.utils.InstancePyScriptMapper import get_instance_mapper

cdef godot_method_bind *bind_object_get_instance_id
api_core = get_core()
bind_object_get_instance_id = api_core.godot_method_bind_get_method('Object', 'get_instance_id')

cdef int get_instance_id(godot_object *_owner):

    cdef int ret

    assert api_core != NULL, 'api_core must not be NULL, unexpected error'
    cdef void * args[1]
    args[0] = NULL
    api_core.godot_method_bind_ptrcall(bind_object_get_instance_id, _owner, args,&ret)
    return ret

cdef class Wrapper(object):

    def set_property(self, name, value):
        setattr(self, name, value)

    def get_pyscript(self):
        return get_instance_mapper().get_pyscript(<int>self.godot_owner)
    def __del__(self):
        print_ptr(self.godot_owner)
        #if(self.godot_owner !=NULL):
            #Free space, if obtained
            #print("Free", self)
            #api_core.godot_free(self.godot_owner)
            #print("Free successfull")