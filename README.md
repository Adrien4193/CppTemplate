# C++ template project

My C++ template project (Windows only for now).

Requires installing Visual Studio 2022, CMake and vcpkg.

In case of issues, reload the window ;)

For VSCode usage, add the following user files:

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

Example CMakeUserPresets.json to add vcpkg environment variable to download dependencies (edit VCPKG_ROOT!!!):

```json
{
    "version": 5,
    "configurePresets": [
        {
            "name": "user-windows-x64",
            "displayName": "User Windows x64",
            "inherits": "windows-x64",
            "environment": {
                "VCPKG_ROOT": "path/tovcpkg"
            }
        }
    ],
    "buildPresets": [
        {
            "name": "user-debug",
            "displayName": "User debug",
            "inherits": "debug",
            "configurePreset": "user-windows-x64"
        },
        {
            "name": "user-release",
            "displayName": "User release",
            "inherits": "release",
            "configurePreset": "user-windows-x64"
        }
    ],
    "testPresets": [
        {
            "name": "user-debug",
            "inherits": "debug",
            "displayName": "User debug",
            "configurePreset": "user-windows-x64"
        },
        {
            "name": "user-release",
            "inherits": "release",
            "displayName": "User release",
            "configurePreset": "user-windows-x64"
        }
    ]
}
```
