<#
.SYNOPSIS
Creates a new instance of Sitecore project or module based on a specific template.

.DESCRIPTION
Creates a new instance of Sitecore project or module based on a specific template
by coping all folders and all folders and replacing the specified replacements
in the file content and all file and folder names.


.PARAMETER TemplateLocation
The location to the template.

.PARAMETER Replacements
A hashtable of replacements to use.

.PARAMETER OutputLocation
The folder where the resulting project will be written to.

.EXAMPLE

#>
function New-ScProject
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $TemplateLocation,
        [Parameter(Mandatory=$true)]
        [Hashtable] $Replacements,
        [Parameter(Mandatory=$true)]
        [string] $OutputLocation

    )
    Process
    {
        $TemplateLocation = (Resolve-Path $TemplateLocation).Path.TrimEnd("\")

        if(-not (Test-Path $OutputLocation)) {
            mkdir $OutputLocation
        }

        if((ls $OutputLocation).Length -gt 0) {
            Write-Error "$OutputLocation is not empty."
        }

        $OutputLocation = (Resolve-Path $OutputLocation).Path.TrimEnd("\")

        $fixedReplacements = Resolve-ScReplacements $Replacements

        ls $TemplateLocation -Directory -Recurse  | % {
            $newFolderName = $_.FullName.Replace($TemplateLocation, $OutputLocation)
            $fixedReplacements.Keys | %{Write-Host $_; $newFolderName = $newFolderName.Replace($_, $fixedReplacements[$_])}
            if(-not (Test-Path $newFolderName)) { mkdir $newFolderName }
        }

        foreach($file in (ls $TemplateLocation -Recurse -File).FullName) {
            $newFileName = $file.Replace($TemplateLocation, $OutputLocation)
            $fixedReplacements.Keys | %{$newFileName = $newFileName.Replace($_, $fixedReplacements[$_])}

            if(-not (Test-BinaryFile $file)) {
                $content = (Get-Content $file | Out-String)
                $fixedReplacements.Keys | %{$content = $content.Replace($_, $fixedReplacements[$_])}
                $content | Out-File -FilePath $newFileName  -Encoding utf8
            }
            else {
                cp $file $newFileName
            }
        }

    }
}
