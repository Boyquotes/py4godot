class InstancePyScriptMapper:
    def __init__(self):
        self.map_inst_to_script = dict()

    def register_script(self, int id, object py_script):
        self.map_inst_to_script[id] = py_script

    def unregister_script(self, int id):
        del self.map_inst_to_script[id]

    def get_pyscript(self, int id):
        if id in self.map_inst_to_script:
            return self.map_inst_to_script[id]
        return None
instance_mapper = InstancePyScriptMapper()
def get_instance_mapper():
    return instance_mapper
