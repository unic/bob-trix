<#
.SYNOPSIS

.DESCRIPTION


.PARAMETER

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
        $TemplateLocation = (Resolve-Path $TemplateLocation).Path
        if(Test-Path $OutputLocation) {
            Write-Error "$OutputLocation allready exists."
        }
        mkdir $OutputLocation
        $OutputLocation = (Resolve-Path $OutputLocation).Path

        ls $TemplateLocation -Directory -Recurse  | % {
            $newFolderName = $_.FullName.Replace($TemplateLocation, $OutputLocation)
            $Replacements.Keys | %{$newFolderName = $newFolderName.Replace($_, $Replacements[$_])}
            if(-not (Test-Path $newFolderName)) { mkdir $newFolderName }
        }

        foreach($file in (ls $TemplateLocation -Recurse -File).FullName) {
            $newFileName = $file.Replace($TemplateLocation, $OutputLocation)
            $Replacements.Keys | %{$newFileName = $newFileName.Replace($_, $Replacements[$_])}

            if(-not (Test-BinaryFile $file)) {
                $content = (Get-Content $file | Out-String)
                $Replacements.Keys | %{$content = $content.Replace($_, $Replacements[$_])}
                $content | Out-File -FilePath $newFileName  -Encoding utf8
            }
            else {
                cp $file $newFileName
            }
        }

    }
}
