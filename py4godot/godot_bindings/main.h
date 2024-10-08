#pragma once
#include "py4godot/godot_bindings/macros.h"
#include "gdextension_interface.h"
#include "functions.h"
#include "Python.h"


#ifdef _WIN64
#define PYTHONHOME L"addons/py4godot/cpython-3.12.4-windows64/python/install"

#elif _WIN32
#define PYTHONHOME L"cpython-3.12.4-windows32/python/install"

#elif __linux32__
#define PYTHONHOME L"cpython-3.12.4-linux/python/install/lib"

#elif __linux__
#define PYTHONHOME L"addons/py4godot/cpython-3.12.4-linux64/python/install"

#elif __APPLE__
#define PYTHONHOME L"cpython-3.12.4-windows32/python/install"
#endif
#if !defined(GDN_EXPORT)
#if defined(_WIN32)
#define GDN_EXPORT __declspec(dllexport)
#elif defined(__GNUC__)
#define GDN_EXPORT __attribute__((visibility("default")))
#else
#define GDN_EXPORT
#endif
#endif

//Setting up threading
#ifdef _WIN32
    #ifdef _M_IX86
        //extern int mtx;
        #define NOMINMAX
        #define NOATOM
        #include <windows.h>
        #undef far
        #undef near
        #undef interface
        extern CRITICAL_SECTION mtx;
        class MutexLock {
        private:
            CRITICAL_SECTION& mutex;

        public:
            MutexLock(CRITICAL_SECTION& m) : mutex(m) {
                EnterCriticalSection(&mutex);
            }

            ~MutexLock() {
                LeaveCriticalSection(&mutex);
            }
        };
        #define LOCK //MutexLock lock

    #else
        #include <mutex>
        extern std::mutex mtx; // Define a mutex
        #define LOCK std::lock_guard<std::mutex> lock
    #endif
#else
    #include <mutex>
    extern std::mutex mtx; // Define a mutex
    #define LOCK std::lock_guard<std::mutex> lock
#endif

extern GDExtensionClassLibraryPtr _library;

static PyThreadState *gilstate = NULL;
GDExtensionBool GDN_EXPORT py4godot_init(GDExtensionInterfaceGetProcAddress p_get_proc_address, GDExtensionClassLibraryPtr p_library, GDExtensionInitialization *r_initialization);