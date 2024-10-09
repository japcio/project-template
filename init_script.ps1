# Set the project name
while (-not $projectName) {
    $projectName = Read-Host "Enter your project name"
}

# Define the path to the pyproject.toml file
$pyprojectFile = "pyproject.toml"

# Check if the pyproject.toml file exists
if (Test-Path $pyprojectFile) {
    # Read the content of the pyproject.toml file
    $content = Get-Content $pyprojectFile

    # Replace the <project_name> placeholder with the project name
    $newContent = $content -replace 'name = "<project_name>"', "name = `"$projectName`""

    # Write the updated content back to the pyproject.toml file
    Set-Content $pyprojectFile $newContent

    Write-Host "Project name updated to $projectName"

    # Run the Poetry commands
    poetry install
    poetry shell
}
else {
    Write-Host "pyproject.toml not found!"
}
