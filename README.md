# C++ template project

My C++ template project (Windows only for now).

## Requirements

- [Git](https://git-scm.com/downloads).
- [Visual Studio 2022](https://visualstudio.microsoft.com/downloads/#remote-tools-for-visual-studio-2022).
- [CMake](https://cmake.org/download).
- [Ninja](https://ninja-build.org).
- [vcpkg](https://learn.microsoft.com/en-us/vcpkg/get_started/get-started) Optional, dependencies can be provided by other means.
- [NSIS](https://nsis.sourceforge.io/Download) Optional, Only to package an installer on Windows.

## Building

Make sure all CMake dependencies are available in PATH or use vcpkg to fetch them automatically by creating the following CMakeUserPresets.json besides CMakePresets.json:

```json
{
    "version": 10,
    "configurePresets": [
        {
            "name": "user-default",
            "hidden": true,
            "toolchainFile": "path/to/vcpkg/scripts/buildsystems/vcpkg.cmake"
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

Now the project can be built with:

```shell
# If you are using CMakeUserPresets.json
cmake . --preset user-debug

# OR if you not using CMakeUserPresets.json but have all dependencies in CMAKE_PREFIX_PATH.
cmake . --preset debug

# Then build
cmake --build ./Build/user-debug
```

## VSCode

Example settings.json to have:

- A custom terminal with Visual Studio Developer PowerShell.
- Visual studio CMake plugin able to find Visual Studio compile tools.
- Ignore GoogleTest warnings with clang-tidy.

```json
{
    "terminal.integrated.profiles.windows": {
        "Developer PowerShell": {
            "source": "PowerShell",
            "args": [
                "-NoExit",
                "-Command",
                "& \"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\Launch-VsDevShell.ps1\" -Arch amd64"
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
