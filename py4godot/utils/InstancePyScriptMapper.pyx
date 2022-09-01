class InstancePyScriptMapper:
    def __init__(self):
        self.map_inst_to_script = dict()

    def register_script(self, int id, object PyScript):
        self.map_inst_to_script[id] = object

    def get_pyscript(self, int id):
        if id in self.map_inst_to_script:
            return self.map_inst_to_script[id]
        return None

instanceMapper = InstancePyScriptMapper()
