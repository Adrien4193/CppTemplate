# C++ template project

My C++ template project (Windows only for now).

## Requirements

- [Git](https://git-scm.com/downloads).
- [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/#remote-tools-for-visual-studio-2022).
- [CMake](https://cmake.org/download).
- [Ninja](https://ninja-build.org).
- [vcpkg](https://learn.microsoft.com/en-us/vcpkg/get_started/get-started) Optional, dependencies can be provided by other means.
- [NSIS](https://nsis.sourceforge.io/Download) Optional, Only to package an installer on Windows.

## VSCode

Example settings.json to have:

- A custom terminal with Visual Studio Developer PowerShell.
- CMake able to find cl.exe.
- Ignore GoogleTest warnings with clang-tidy.

```json
{
    "terminal.integrated.profiles.windows": {
        "Developer PowerShell": {
            "source": "PowerShell",
            "args": [
                "-NoExit",
                "-Command",
                "& \"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\VsDevCmd.bat\""
            ]
        }
    },
    "cmake.useVsDeveloperEnvironment": "always",
    "C_Cpp.codeAnalysis.exclude": {
        "Tests/": true
    }
}

```

Example tasks.json to build with CMake using Ctrl+Shift+B:

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

Example launch.json to debug apps and tests:

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

Example CMakeUserPresets.json to add custom paths to Ninja and vcpkg in presets:

```json
{
    "version": 10,
    "configurePresets": [
        {
            "name": "user-default",
            "hidden": true,
            "toolchainFile": "${sourceDir}/../vcpkg/scripts/buildsystems/vcpkg.cmake"
        },
        {
            "name": "user-debug",
            "displayName": "User Debug",
            "inherits": [
                "user-default",
                "debug"
            ]
        },
        {
            "name": "user-release",
            "displayName": "User Release",
            "inherits": [
                "user-default",
                "release"
            ]
        },
        {
            "name": "user-distribution",
            "displayName": "User Distribution",
            "inherits": [
                "user-default",
                "distribution"
            ]
        }
    ],
    "testPresets": [
        {
            "name": "user-debug",
            "inherits": "debug",
            "displayName": "User debug",
            "configurePreset": "user-debug"
        }
    ],
    "packagePresets": [
        {
            "name": "user-windows",
            "inherits": "windows",
            "displayName": "User Windows",
            "configurePreset": "user-distribution"
        }
    ]
}
```
