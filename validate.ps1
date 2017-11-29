$game = $args[0]
pykwalify -q -s schema.yml -d "Games\$($game)\game.yml"
$valid = $?
yamllint -s -c .\no-line-warnings.yml "Games\$($game)\game.yml"
$linted = $?
pykwalify -q -s metadata-schema.yml -d "Games\$($game)\metadata.yml"
$mdvalid = $?
yamllint -s -c .\no-line-warnings.yml "Games\$($game)\metadata.yml"
$mdlint = $?
return New-Object psobject -Property @{'Valid'=$valid; 'Game'=$game; 'Lint'=$linted; 'Metadata-Valid'=$mdvalid;'Metadata-Lint'=$mdlint}