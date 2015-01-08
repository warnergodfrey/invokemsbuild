## Invoke-MSBuild

[![Build status](https://ci.appveyor.com/api/projects/status/22y60ef0qbjcyc1h)](https://ci.appveyor.com/project/warnergodfrey/invokemsbuild)

### Project Description

A PowerShell module to make building projects with MsBuild easy. It provides many features like fire-and-forget, or build and wait to check if build succeeded.

The module builds using the Visual Studio Command Prompt when available in order to support more project types (e.g. XNA projects). When not using the -PassThru switch, it returns $true if the build succeeded, $false if it failed, and $null if we could not determine the build result. It also provides parameters for showing or hiding the build window, and automatically opening the error log when the build fails.

The module simply passes through any MsBuild command-line parameters you supply, so it supports all functionality (e.g. project types, targets, etc.) that you would get by calling MsBuild directly.

Forked from original project on [CodePlex](https://invokemsbuild.codeplex.com/)

### Installation

The Invoke-MSBuild Cmdlet is distributed as a [Chocolatey package](https://chocolatey.org/packages?q=invokemsbuild).

#### Pre-Requisites

- [Chocolatey](https://github.com/chocolatey/chocolatey/wiki/Installation)

### Install Chocolatey Package

Install the package using Chocolatey:

```
choco install invokemsbuild
```
