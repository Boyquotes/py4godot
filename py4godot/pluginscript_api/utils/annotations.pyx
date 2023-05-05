import sys,os
import inspect, traceback
from py4godot.utils.print_tools import *
from py4godot.pluginscript_api.hints.BaseHint cimport *
from py4godot.pluginscript_api.utils.PropertyDescription cimport *
from py4godot.pluginscript_api.utils.SignalDescription cimport *

"""annotations used to define all the godot members"""
"""methods = []
gd_class = None
gd_tool_class = None
properties = []
signals = []"""

class TransferObject():
    def __init__(self, gd_class, properties,signals):
        self.gd_class = gd_class
        self.properties = properties
        self.signals = signals

def exec_class(source_string):
    global  gd_class, properties, signals
    methods = []
    gd_class = None
    gd_tool_class = None
    properties = []
    signals = []
    print_error("before exec_source_string:", source_string)
    cdef str string = source_string
    try:
        exec(string)
    except Exception as e:
        print_error("exec_class: Exception happened:", traceback.format_exc())
    print_error("After exec")
    print_error("gd_class:", gd_class)
    return TransferObject(gd_class, properties, signals)


def gdclass(cls):
        global gd_class
        if(gd_class == None):
            gd_class = cls
        else:
            raise Exception("More than one class was marked as gd_class or gd_tool_class in one file")
        return cls

def gdtool(cls):
        global gd_tool_class

        if(gd_tool_class == None):
            gd_tool_class = cls
        else:
            raise Exception("More than one class was marked as gd_class or gd_tool_class in one file")
        return cls

def prop(name,type_, defaultval, hint = BaseHint(), hint_string = ""):
    properties.append(PropertyDescription(name = name,
                type_=type_,hint = hint,usage = 4096|6|32768,
                default_value=defaultval))


def signal(name):
    signals.append(SignalDescription(name))