$results = @()
Get-ChildItem -Directory Games | ForEach-Object {
	$result = .\validate.ps1 $_.BaseName
	$results = $results + $result
}
$results | Format-Table -Property Game,Valid,Lint,Metadata-Valid,Metadata-Lint