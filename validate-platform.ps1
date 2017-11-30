$platform = $args[0]
pykwalify -q -s schema.yml -d "Platforms\$($platform).yml"
$valid = $?
yamllint -s -c .\no-line-warnings.yml "Platforms\$($platform).yml"
$linted = $?
return New-Object psobject -Property @{'Valid'=$valid; 'Platform'=$platform; 'Lint'=$linted}