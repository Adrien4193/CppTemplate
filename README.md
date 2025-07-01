# C++ template project

My C++ template project (Windows only for now).

## Requirements

* [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/#remote-tools-for-visual-studio-2022).
* [CMake](https://cmake.org/download).
* [Ninja](https://ninja-build.org).
* [vcpkg](https://learn.microsoft.com/en-us/vcpkg/get_started/get-started).

## Visual Studio Build Tools and Ninja

Replace CMake executable by the following script (cmake.bat):

```shell
call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat"
cmake %*
```

## VSCode

Example tasks.json for vscode to build with CMake using Ctrl+Shift+B:

```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "type": "cmake",
            "label": "CMake: build",
            "command": "build",
            "preset": "${command:cmake.activeBuildPresetName}",
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": [],
            "detail": "CMake template build task"
        }
    ]
}
```

Example launch.json for vscode to debug apps and tests:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug application",
            "type": "cppvsdbg",
            "request": "launch",
            "program": "${command:cmake.launchTargetPath}",
            "cwd": "${workspaceFolder}",
            "console": "integratedTerminal"
        },
        {
            "name": "(ctest) Launch",
            "type": "cppvsdbg",
            "request": "launch",
            "program": "${cmake.testProgram}",
            "cwd": "${workspaceFolder}",
            "args": [
                "${cmake.testArgs}"
            ]
        }
    ]
}
```

Example CMakeUserPresets.json to add custom paths in presets:

```json
{
    "version": 5,
    "configurePresets": [
        {
            "name": "user-windows",
            "displayName": "User Windows",
            "inherits": "windows",
            "toolchainFile": "${sourceDir}/../vcpkg/scripts/buildsystems/vcpkg.cmake",
            "cmakeExecutable": "${sourceDir}/Bin/cmake.bat",
            "cacheVariables": {
                "CMAKE_MAKE_PROGRAM": "${sourceDir}/Bin/ninja.exe"
            }
        }
    ],
    "buildPresets": [
        {
            "name": "user-debug",
            "displayName": "User debug",
            "inherits": "windows-debug",
            "configurePreset": "user-windows"
        },
        {
            "name": "user-release",
            "displayName": "User release",
            "inherits": "windows-release",
            "configurePreset": "user-windows"
        }
    ],
    "testPresets": [
        {
            "name": "user-debug",
            "inherits": "windows-debug",
            "displayName": "User debug",
            "configurePreset": "user-windows"
        },
        {
            "name": "user-release",
            "inherits": "windows-release",
            "displayName": "User release",
            "configurePreset": "user-windows"
        }
    ]
}
```
