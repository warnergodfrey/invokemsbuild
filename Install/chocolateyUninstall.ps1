$params = ConvertFrom-StringData -StringData ($env:chocolateyPackageParameters -replace ';', "`n")
$ModuleRoot = if ($params.PSModuleDirectory) { $params.PSModuleDirectory }
else { Join-Path $HOME "Documents\WindowsPowerShell\Modules" }
$ModuleTarget = Join-Path $env:chocolateyPackageFolder "Modules"
Get-ChildItem $ModuleTarget | Foreach-Object { cmd /c rmdir "$ModuleRoot\$_" }
