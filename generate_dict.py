import json
with open('py4godot/godot-headers/api.json', 'r') as myfile:
    data = myfile.read()
    obj = json.loads(data)

objects = set([element["name"] for element in obj])

for obj in objects:
    print(f"'{obj}' : py_generated.{obj},")