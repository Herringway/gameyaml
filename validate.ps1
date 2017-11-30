$game = $args[0]
pykwalify -q -s schema.yml -d "games\$($game)\game.yml"
$valid = $?
yamllint -s -c .\no-line-warnings.yml "games\$($game)\game.yml"
$linted = $?
pykwalify -q -s metadata-schema.yml -d "games\$($game)\metadata.yml"
$mdvalid = $?
yamllint -s -c .\no-line-warnings.yml "games\$($game)\metadata.yml"
$mdlint = $?
return New-Object psobject -Property @{'Valid'=$valid; 'Game'=$game; 'Lint'=$linted; 'Metadata-Valid'=$mdvalid;'Metadata-Lint'=$mdlint}