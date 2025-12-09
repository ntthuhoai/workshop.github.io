# PowerShell script to fix date format in Hugo markdown files
$contentDir = "e:\fcj-workshop-template-main\fcj-workshop-template-main\content"
$currentDate = Get-Date -Format "yyyy-MM-dd"

$fixedCount = 0
$totalFiles = 0

# Get all markdown files recursively
$mdFiles = Get-ChildItem -Path $contentDir -Filter "*.md" -Recurse

foreach ($file in $mdFiles) {
    $totalFiles++
    
    try {
        # Read file content
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        
        # Check if file contains the problematic date format
        if ($content -match 'date\s*:\s*"?`r Sys\.Date\(\)`"?') {
            # Replace the date (handles multiple spaces around colon and quotes)
            $newContent = $content -replace 'date\s*:\s*"?`r Sys\.Date\(\)`"?\s*', "date: $currentDate `n"
            
            # Write back to file
            Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
            
            Write-Host "Fixed: $($file.FullName)" -ForegroundColor Green
            $fixedCount++
        }
    }
    catch {
        Write-Host "Error fixing $($file.FullName): $_" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "Total files checked: $totalFiles" -ForegroundColor Yellow
Write-Host "Files fixed: $fixedCount" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Cyan
