1. git clone https://github.com/pharo-project/opensmalltalk-vm.git
2. install visual studio code.
2.1. install extension 
	- cmake tools
	- c/c++
	- native debug (optionnal for building)
2.2 select a cmake kit - gcc 9.2.1 in my setup

3. In the cmake panel, click on "configure project"
	It will run the equivalent of "cmake .". You can check if all the libraries are found.
	On my system, I had:
	
	[main] Configuring folder: opensmalltalk-vm 
[proc] Executing command: /usr/bin/cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Debug -H/home/user/devzone/opensmalltalk-vm -B/home/user/devzone/opensmalltalk-vm/build -G "Unix Makefiles"
[cmake] Not searching for unused variables given on the command line.
[cmake] -- v8.1.0-alpha-275-g04d2c8660 - Commit: 04d2c8660 - Date: 2020-02-04 11:53:14 +0100
[cmake] -- The C compiler identification is GNU 9.2.1
[cmake] -- The CXX compiler identification is GNU 9.2.1
[cmake] -- Check for working C compiler: /usr/bin/cc
[cmake] -- Check for working C compiler: /usr/bin/cc -- works
[cmake] -- Detecting C compiler ABI info
[cmake] -- Detecting C compiler ABI info - done
[cmake] -- Detecting C compile features
[cmake] -- Detecting C compile features - done
[cmake] -- Check for working CXX compiler: /usr/bin/c++
[cmake] -- Check for working CXX compiler: /usr/bin/c++ -- works
[cmake] -- Detecting CXX compiler ABI info
[cmake] -- Detecting CXX compiler ABI info - done
[cmake] -- Detecting CXX compile features
[cmake] -- Detecting CXX compile features - done
[cmake] -- Building Pharo with executable named pharo
[cmake] -- Looking for sys/types.h
[cmake] -- Looking for sys/types.h - found
[cmake] -- Looking for stdint.h
[cmake] -- Looking for stdint.h - found
[cmake] -- Looking for stddef.h
[cmake] -- Looking for stddef.h - found
[cmake] -- Check size of int
[cmake] -- Check size of int - done
[cmake] -- Check size of long
[cmake] -- Check size of long - done
[cmake] -- Check size of long long
[cmake] -- Check size of long long - done
[cmake] -- Check size of void*
[cmake] -- Check size of void* - done
[cmake] -- int 4
[cmake] -- long 8
[cmake] -- long long 8
[cmake] -- void* 8
[cmake] -- Writing libraries to: build/vm
[cmake] -- Looking for include file dirent.h
[cmake] -- Looking for include file dirent.h - found
[cmake] -- Looking for include file features.h
[cmake] -- Looking for include file features.h - found
[cmake] -- Looking for include file unistd.h
[cmake] -- Looking for include file unistd.h - found
[cmake] -- Looking for include file ndir.h
[cmake] -- Looking for include file ndir.h - not found
[cmake] -- Looking for include file sys/ndir.h
[cmake] -- Looking for include file sys/ndir.h - not found
[cmake] -- Looking for include file sys/dir.h
[cmake] -- Looking for include file sys/dir.h - found
[cmake] -- Looking for include file sys/filio.h
[cmake] -- Looking for include file sys/filio.h - not found
[cmake] -- Looking for include file sys/time.h
[cmake] -- Looking for include file sys/time.h - found
[cmake] -- Looking for include file execinfo.h
[cmake] -- Looking for include file execinfo.h - found
[cmake] -- Looking for include file dlfcn.h
[cmake] -- Looking for include file dlfcn.h - found
[cmake] -- Looking for dlopen in dl
[cmake] -- Looking for dlopen in dl - found
[cmake] -- Looking for dlopen in dyld
[cmake] -- Looking for dlopen in dyld - not found
[cmake] -- Performing Test HAVE_TM_GMTOFF
[cmake] -- Performing Test HAVE_TM_GMTOFF - Success
[cmake] -- Looking for include file sys/uuid.h
[cmake] -- Looking for include file sys/uuid.h - not found
[cmake] -- Looking for include file uuid/uuid.h
[cmake] -- Looking for include file uuid/uuid.h - found
[cmake] -- Looking for include file uuid.h
[cmake] -- Looking for include file uuid.h - not found
[cmake] -- Looking for uuidgen in uuid
[cmake] -- Looking for uuidgen in uuid - not found
[cmake] -- Looking for uuid_generate in uuid
[cmake] -- Looking for uuid_generate in uuid - found
[cmake] -- C Compiler: /usr/bin/cc
[cmake] -- C++ Compiler: /usr/bin/c++
[cmake] -- Resource Compiler: 
[cmake] -- Adding plugin: SecurityPlugin
[cmake] -- Adding plugin: FilePlugin
[cmake] -- Adding plugin: FileAttributesPlugin
[cmake] -- Adding plugin: UUIDPlugin
[cmake] -- Adding plugin: SocketPlugin
[cmake] -- Adding plugin: SurfacePlugin
[cmake] -- Adding plugin: LargeIntegers
[cmake] -- Adding plugin: JPEGReaderPlugin
[cmake] -- Adding plugin: JPEGReadWriter2Plugin
[cmake] -- Adding plugin: MiscPrimitivePlugin
[cmake] -- Adding plugin: B2DPlugin
[cmake] -- Adding plugin: LocalePlugin
[cmake] -- Adding plugin: SqueakSSL
[cmake] -- Adding plugin: DSAPrims
[cmake] -- Adding plugin: UnixOSProcessPlugin
[cmake] Adding third-party libraries for linux: PThreadedFFI-1.2.0-linux64
[cmake] Adding third-party libraries for linux: libffi-3.3-rc0
[cmake] Adding third-party libraries for linux: libgit2-0.25.1
[cmake] Adding third-party libraries for linux: libssh2-1.7.0
[cmake] Adding third-party libraries for linux: openssl-1.0.2q
[cmake] Adding third-party libraries for linux: SDL2-2.0.7
[cmake] -- Configuring done
[cmake] -- Generating done
[cmake] -- Build files have been written to: /home/user/devzone/opensmalltalk-vm/build

ndir.h, filio.h and uuid.h were not found. Only uuid.h is relevant to build the VM on linux. 
I had to install the equivalent dev library

third parties library are pre-build and downloaded from pharo server. This can be an issue,
especially with libgit, libssh and openssl. 

VMMaker home page is on http://source.squeak.org/VMMaker/
To contribute to the VM, you can either:

Opensmalltalk website:  http://opensmalltalk.org/
Opensmalltalk mailing list: vm-dev@lists.squeakfoundation.org
=> subscription on http://lists.squeakfoundation.org/mailman/listinfo/vm-dev
=> browse archive on http://forum.world.st/Squeak-VM-f104410.html

For Pharo: look on pharo web site.

looking for 3rd party libs:
THIRDPARTYLIBS="libsdl2 openssl libssh2 libgit2"


3. install uuid-dev on ubuntu
sudo apt-get install libevent-dev libncurses-dev uuid-dev pkg-config 

VM and VMMaker available under build directory
