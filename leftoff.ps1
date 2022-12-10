# ask for user input
$request = Read-Host "Enter whether you want to see the TODO or Edit: {y/n/e}"

if ($request -eq 'y') {	
	Get-Content "C:\Users\Siebe\Documents\PowerShell\todo.txt"
}
elseif ($request -eq 'e') {
	notepad "C:\Users\Siebe\Documents\PowerShell\todo.txt"
}