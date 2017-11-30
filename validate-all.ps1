$results = @()
Get-ChildItem -Directory games | ForEach-Object {
	$result = .\validate.ps1 $_.BaseName
	$results = $results + $result
}
$platresults = @()
Get-ChildItem platforms | ForEach-Object {
	$platresult = .\validate-platform.ps1 $_.BaseName
	$platresults = $platresults + $platresult
}
$results | Format-Table -Property Game,Valid,Lint,Metadata-Valid,Metadata-Lint
$platresults | Format-Table -Property Platform,Valid,Lint