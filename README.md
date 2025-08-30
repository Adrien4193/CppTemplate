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

If you don't use vcpkg, make sure all CMake dependencies listed in [vcpkg.json](vcpkg.json) are available in PATH.

If you do use vcpkg, it will fetch the dependencies automatically when configuring CMake if you provide the correct toolchain file:

Here is how to build in debug assuming vcpkg repo is cloned in the parent folder of the current repo (see [CMakePresets.json](CMakePresets.json) for the list of available presets)

```shell
# With vcpkg
cmake . --preset debug -DCMAKE_TOOLCHAIN_FILE="../vcpkg/scripts/buildsystems/vcpkg.cmake"

# OR without vcpkg it is just
# cmake . --preset debug

cmake --build --preset debug
```

## Testing

Not for distribution preset.

```shell
ctest --preset debug
```

## Packaging

Only for distribution preset, make sure to repeat the build steps replacing "debug" by "distribution".

```shell
cpack --preset distribution
```

## VSCode

Example settings.json to have:

- A custom terminal with Visual Studio Developer PowerShell.
- Visual studio CMake plugin able to find Visual Studio compile tools.
- Ignore GoogleTest warnings with clang-tidy.
- Provide automatically vcpkg toolchain file to CMake plugin.

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
    "cmake.configureArgs": [
        "-DCMAKE_TOOLCHAIN_FILE=${workspaceFolder}/../vcpkg/scripts/buildsystems/vcpkg.cmake"
    ],
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
