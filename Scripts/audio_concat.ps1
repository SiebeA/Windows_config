# set default value for $folderPath
# Prompt the user to enter a folder path or use a default folder path
$folderPath = Read-Host "Enter input file folder (or press enter for default folder C:\Users\Siebe\Desktop\input)"

# If no folder path is entered, use the default folder path
if ($folderPath -eq "") {
    $outputFolder = "C:\Users\Siebe\Desktop\"

    # Create the folder if it doesn't already exist
    if (!(Test-Path $outputFolder)) {
        New-Item -ItemType Directory -Path $outputFolder | Out-Null
        Write-Host "input folder created: $outputFolder" -ForegroundColor Green
    }

    # Set the folder path to the input folder in the default folder path
    $folderPath = "$outputFolder\input"
}
else {
    # Remove any quotes around the entered folder path
    $folderPath = $folderPath.Trim('"')
}

# Set the path for the list file used by ffmpeg
$listFile = "$folderPath\list.txt"

# Prompt the user to enter a path for the output file or use a default path
$outputFile = Read-Host "Enter output file path (or press enter for default)"

# If no output file path is entered, use the default output file path
if ($outputFile -eq "") {
    $outputFolder = "C:\Users\Siebe\Desktop\output"

    # Create the output folder if it doesn't already exist
    if (!(Test-Path $outputFolder)) {
        New-Item -ItemType Directory -Path $outputFolder | Out-Null
        Write-Host "Output folder created: $outputFolder" -ForegroundColor Green
    }

    # Set the output file path to the default output file
    $outputFile = "$outputFolder\output.mp3"
}
else {
    # Remove any quotes around the entered output file path
    $outputFile = $outputFile.Trim('"')
}

# Get all mp3 files in the input folder and sort them
$files = Get-ChildItem -Path $folderPath -Filter *.mp3 | Sort-Object

# If no mp3 files are found, inform the user
if ($files.Count -eq 0) {
    Write-Host "No MP3 files found in folder" -ForegroundColor Yellow
}
else {
    # Create a list of files for ffmpeg to use
    $fileList = ""
    foreach ($file in $files) {
        $fileList += "file '$($file.FullName)'" + [Environment]::NewLine
    }

    # Remove the last newline character and save the list to a file
    $fileList.TrimEnd([Environment]::NewLine) | Out-File $listFile -Encoding utf8
    Write-Host "List file created successfully" -ForegroundColor Green

    # print the list in the console
    Write-Host $fileList

    # ask user to confirm concatenation
    $confirm = Read-Host "Concatenate files? (y/n)"
    # if the user doesn't confirm, exit the script
    if ($confirm -ne "y") {
        Write-Host "Concatenation cancelled" -ForegroundColor Yellow
        exit
    }

    # Concatenate the mp3 files in the list file using ffmpeg and save to the output file path
    ffmpeg -f concat -safe 0 -i $listFile -c copy $outputFile
    Write-Host "Output file created: $outputFile" -ForegroundColor Green
}

# TODO: Add option to delete the input files after concatenation and delete the list file