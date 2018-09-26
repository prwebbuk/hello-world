$Folder = "C:\Users\MrPhi\OneDrive\Documents\Home\Household\Tesco\Groceries"

$Files = Get-ChildItem -Path $Folder -Recurse

foreach ($File in $Files)
{
    if (($File.Extension -eq ".pdf") -and ($File.Name -like "*-0001.pdf"))
    {
        $newName = $File.name -replace "-0001",""
        if (Test-Path -Path (($File.Directory.FullName +"\" + $newName)))
        {
            Remove-Item -Path ($File.Directory.FullName +"\" + $newName)
        }
        Rename-Item -Path $File.FullName -NewName ($File.Directory.FullName +"\" + $newName)
    }
}