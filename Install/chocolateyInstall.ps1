trap {
  Write-ChocolateyFailure 'Invoke-MSBuild' $($_.Exception.Message)
  Throw $_
}

$params = ConvertFrom-StringData -StringData ($env:chocolateyPackageParameters -replace ';', "`n")

$ModuleRoot = if ($params.PSModuleDirectory) { $params.PSModuleDirectory }
  else { Join-Path $env:USERPROFILE "Documents\WindowsPowerShell\Modules" }

if (-not (Test-Path $ModuleRoot)) {
  New-Item -Type directory $ModuleRoot
}
$ModuleTarget = Join-Path $env:chocolateyPackageFolder "Modules"
Get-ChildItem $ModuleTarget | Foreach-Object {
  if (Test-Path "$ModuleRoot\$_") {
    cmd /c rmdir "$ModuleRoot\$_"
  }
  cmd /c mklink /j "$ModuleRoot\$_" "$ModuleTarget\$_"
  Get-ChildItem -Path "$ModuleRoot\$_" -File -Recurse | Unblock-File
}

Write-ChocolateySuccess 'Invoke-MSBuild'
