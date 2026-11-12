param(
    [string]$RutaPHP = 'php'
)

$archivoOrigen =Join-Path $PSScriptRoot 'origen\index.php'
$archivoOrigen =Join-Path $PSScriptRoot 'pruebas\index.php'

& $RutaPHP -l $archivoOrigen

if ($LASTEXITCODE -ne 0){
    write-Host "Hay un error de sintaxis. no se publique el cambio"
    exit 1
}
Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Archivo publicado correctamente en el ambiente de pruebas"
& 'C:\xampp\php\php.exe' -S localhost:8080 -t .\pruebas