function create-shortcut-to-folder {
    <#
    .SYNOPSIS
    Creates a shortcut to a specified folder.

    .DESCRIPTION
    This function creates a shortcut to a folder at the specified path and saves it with the given name.

    .PARAMETER path_to_folder
    The path to the folder for which the shortcut will be created.

    .PARAMETER shortcut_name
    The name of the shortcut to be created.

    .EXAMPLE
    create-shortcut-to-folder -path_to_folder "C:\Path\To\Folder" -shortcut_name "MyShortcut"

    This example creates a shortcut named "MyShortcut" to the folder located at "C:\Path\To\Folder".

    #>

    param(
        [Parameter(Mandatory=$true)]
        [string]$path_to_folder,
        [Parameter(Mandatory=$true)]
        [string]$shortcut_name
    )

    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("C:\PATH_PROGRAMS\$shortcut_name.lnk")
    $Shortcut.TargetPath = $path_to_folder
    $Shortcut.Save()
}
