Param(
    [string]$originPath,
    [string]$fileName
)

$currentDate = Get-Date
$formattedDate = $currentDate.ToShortDateString().Replace('/', '-')
$destinationPath = "$originPath\$fileName" + "_$formattedDate.zip"

If (-not (Test-Path -Path $destinationPath)) {
    try {
        Compress-Archive -Path "$originPath\*.pdf" -DestinationPath 
    }
    catch {
        Write-Host "Cannot write to $destinationPath due to error: $($error[0])"
    }
}
Else {
    Write-Host "Cannot write to $destinationPath because file already exists. Please specify another file name"
}
