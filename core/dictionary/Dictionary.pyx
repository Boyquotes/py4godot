from core.variant.Variant cimport *
from core.array.Array cimport *
from core.dictionary.dictionary_binding cimport *
from cython.operator cimport dereference
from libc.stdio cimport printf

cdef api set_api_core_dict(godot_gdnative_core_api_struct * core):
    global api_core
    print("set_api_core")
    printf("%p\n", &api_core)
    api_core = core
    print("end_api_core")


cdef class Dictionary:

    def __init__(self):
        print("start_api_core_dictionary")
        printf("%p\n", &api_core)
        #api_core.godot_string_num(1)
        cdef godot_dictionary dictionary
        api_core.godot_dictionary_new(&dictionary)
        print("end_api_core")

    def new_copy(self, Dictionary src):
        api_core.godot_dictionary_new_copy(&self._native, &src._native)

    def destroy(self):
        api_core.godot_dictionary_destroy(&self._native)

    def size(self):
        return api_core.godot_dictionary_size(&self._native)

    def empty(self):
        return api_core.godot_dictionary_empty(&self._native)

    def clear(self):
        api_core.godot_dictionary_clear(&self._native)

    def has(self, Variant key):
        return api_core.godot_dictionary_has(&self._native, &key._native)

    def has_all(self, Array keys):
        return api_core.godot_dictionary_has_all(&self._native, &keys._native)

    def erase(self, Variant key):
        return api_core.godot_dictionary_erase(&self._native, &key._native)

    def hash(self):
        return api_core.godot_dictionary_hash(&self._native)

    def keys(self):
        return Array. new_static(api_core.godot_dictionary_keys(&self._native))

    def values(self):
        return Array. new_static(api_core.godot_dictionary_values(&self._native))

    def get(self, Variant key):
        return Variant. new_static(api_core.godot_dictionary_get(&self._native, &key._native))

    def set(self, Variant key, Variant value):
        api_core.godot_dictionary_set(&self._native, &key._native, &value._native)

    def next_(self, Variant key):
        cdef godot_variant * variant
        variant = (api_core.godot_dictionary_next(&self._native, &key._native))
        return Variant.new_static(dereference(variant))

    def __eq__(self, Dictionary other):
        return api_core.godot_dictionary_operator_equal(&self._native, &other._native)

    def json(self):
        return api_core.godot_dictionary_to_json(&self._native)

