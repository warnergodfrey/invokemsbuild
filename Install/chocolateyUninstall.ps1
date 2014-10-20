try
{
	$params = ConvertFrom-StringData -StringData ($env:chocolateyPackageParameters -replace ';', "`n")
  $ModuleRoot = if ($params.PSModuleDirectory) { $params.PSModuleDirectory }
    else { Join-Path $HOME "Documents\WindowsPowerShell\Modules" }
	$ModuleTarget = Join-Path $env:chocolateyPackageFolder "Modules"
	Get-ChildItem $ModuleTarget | Foreach-Object { cmd /c rmdir "$ModuleRoot\$_" }

	Write-ChocolateySuccess 'Invoke-MSBuild'
} catch {
	Write-ChocolateyFailure 'Invoke-MSBuild' $($_.Exception.Message)
	throw $_
}
