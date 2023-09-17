import glob, json
"""This file is for finding all the c files that were generated by cythonize and we want to compile with meson/ninja"""

with open('config.json', 'r') as f:
    config_data = json.load(f)

build_folder = config_data['output_dir']
core_folder = config_data['core_folder']

if __name__=="__main__":
    l = glob.glob("**/*.cpp", recursive=True)


    for entry in l:
        if(not entry.startswith("build_meson") and not entry.startswith("python_files") and not entry.startswith("build")\
                and not entry.startswith("venv") and not entry.startswith('tests') and not entry.startswith("meson_cache")):
            if "cppclasses" in entry or "test_bridge.cpp" in entry:
                print(entry.lstrip("../"))