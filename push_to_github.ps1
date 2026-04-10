$attempt = 1
$maxAttempts = 100  # Maximum attempts to prevent infinite loop

Write-Host "Starting to push to GitHub, trying every 5 minutes..."

while ($attempt -le $maxAttempts) {
    Write-Host "Attempt $attempt..."
    
    # Execute git push command
    git push
    
    # Check command execution status
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Push successful!"
        break
    } else {
        Write-Host "Push failed, retrying in 5 minutes..."
        Start-Sleep -Seconds 300  # 5 minutes = 300 seconds
        $attempt++
    }
}

if ($attempt -gt $maxAttempts) {
    Write-Host "Maximum attempts reached, push failed. Please check network connection and try manually."
}