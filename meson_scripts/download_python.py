import pathlib
import wget
import zstandard
import tarfile
import os
from shutil import copytree, ignore_patterns

platform_dict = {"windows64": "x86_64-pc-windows-msvc-shared-pgo", "windows":"i686-pc-windows-msvc-shared-pgo",
                 "linux64":"x86_64-unknown-linux-gnu-lto", "linux":"i686-unknown-linux-gnu-pgo"}
python_files_dir = "python_files"
copy_dir = "build/addons"
python_ver = "cpython-3.9.7"

sitecustomize_py = """
import site
import os

site.addsitedir(os.getcwd()+'/addons/{platform}')
site.addsitedir(os.getcwd())
"""


def download_file(platform, allow_copy = False):
    """Function for downloading python versions for various platforms and extracting them to the build folder"""
    python_folder = f"{python_ver}-" + platform

    print("download:"+platform)

    url = f'https://github.com/indygreg/python-build-standalone/releases/download/20211017/{python_ver}-{platform_dict[platform]}-20211017T1616.tar.zst'
    python_file = f'{python_files_dir}/{python_ver}-{platform_dict[platform]}.tar.zst'
    export_name = f"{python_ver}-" + platform

    if(not os.path.isfile(python_file)):# checking whether file was already downloaded
        print(f"downloading {python_ver} from :\n {url}")
        if(not os.path.isdir(python_files_dir)):
            os.mkdir(python_files_dir)
        wget.download(url, python_file) # download .tar.zst file
        print()
    if(not os.path.isfile(python_file.replace(".zst",""))): #extracting the .zst file if it doesn't exist
        print("extracting .zst file")
        decompress_zstandard_to_folder(python_file)
    if(not os.path.isdir(python_folder)):# extracting the files from the tar folder
        print("extracting .tar file")
        extract_tar(python_file.replace(".zst",""),export_name)

    if(allow_copy):
        create_sitecustomization(export_name, platform)
        copy_to_build(export_name +"/", platform)


def decompress_zstandard_to_folder(input_file):
    """function for extraticing .zst files"""
    input_file = pathlib.Path(input_file)
    with open(input_file, 'rb') as compressed:
        decomp = zstandard.ZstdDecompressor()
        output_path = pathlib.Path(python_files_dir) / input_file.stem
        with open(output_path, 'wb') as destination:
            decomp.copy_stream(compressed, destination)

def extract_tar(file, export_name):
    """function for extracting .tar archieve"""
    if(not os.path.isdir(python_files_dir+"/"+export_name)):
        my_tar = tarfile.open(file)
        my_tar.extractall(python_files_dir+"/"+export_name)  # specify which folder to extract to
        my_tar.close()

def copy_to_build(export_folder, platform):
    """function for copying files to build folder"""
    if (not os.path.isdir(copy_dir +"/" + platform + "/" + export_folder)):
        for i in range(2):
            #TODO fix this why is a loop needed?
            try:
                copytree(python_files_dir +"/" + export_folder, copy_dir +"/" + platform + "/" + export_folder,
                         ignore=ignore_patterns("build"), dirs_exist_ok=True) # build and lib are unnecessary
            except Exception as e:
                pass

def create_sitecustomization(export_folder, platform):
    if "windows" in platform:
        with open(f"python_files/{export_folder}/python/install/Lib/site-packages/sitecustomize.py", "w") as sitecustomize_file:
            sitecustomize_file.write(sitecustomize_py.replace("{platform}", platform))
    elif "linux" in platform:
        with open(f"python_files/{export_folder}/python/install/lib/python3.9/site-packages/sitecustomize.py", "w") as sitecustomize_file:
            sitecustomize_file.write(sitecustomize_py.replace("{platform}", platform))