trap {
  Write-ChocolateyFailure 'Invoke-MSBuild' $($_.Exception.Message)
  Throw $_
}

$params = ConvertFrom-StringData ($env:chocolateyPackageParameters -replace ';', "`n")

$ModuleRoot = $params.PSModuleDirectory
if (-not $ModuleRoot) {
  $ModuleRoot = Join-Path $env:USERPROFILE "Documents\WindowsPowerShell\Modules"
}

if (-not (Test-Path $ModuleRoot)) {
  New-Item -Type directory $ModuleRoot
}
$ModuleTarget = Join-Path $env:chocolateyPackageFolder "Modules"
if (Test-Path "$ModuleRoot\Invoke-MSBuild") {
  cmd /c rmdir "$ModuleRoot\Invoke-MSBuild"
}
cmd /c mklink /j "$ModuleRoot\Invoke-MSBuild" "$ModuleTarget\Invoke-MSBuild"
Get-ChildItem -Path "$ModuleRoot\$_" -File -Recurse | Unblock-File

Write-ChocolateySuccess 'Invoke-MSBuild'
