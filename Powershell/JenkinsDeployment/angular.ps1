$path = ""
$dist = ""
$websitePath = ""

Set-Location $path

npm install

ng build --prod

if (!(Test-Path $dist)) {
    throw '$dist absent. Killing deployment'

    exit 0
}
else {
    "Found dist folder: $dist"

    Get-ChildItem -Path $websitePath -Recurse| Foreach-object {Remove-item -Recurse -path $_.FullName }

    Copy-Item $dist* $websitePath -Recurse

    try {
        copy-item E:\Templates\web.config $websitePath
    }
    Catch {
        "Couldn't copy web.config. Its in use"
    }
}