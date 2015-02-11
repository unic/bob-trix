<#
.SYNOPSIS

.DESCRIPTION


.PARAMETER

.EXAMPLE

#>
function Invoke-TemplateDownload
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $Project,
        [Parameter(Mandatory=$true)]
        [string] $Repository,
        [Parameter(Mandatory=$true)]
        [string] $OutputLocation,
        [PSCredential] $Credential = (Get-Credential),
        [string] $Branch = "master"
    )
    Process
    {
        [System.Reflection.Assembly]::LoadWithPartialName("System.Web") | out-null
        $fullBranch = [System.Web.HttpUtility]::UrlEncode("refs/heads/$branch")
        $url = "https://git.unic.com/plugins/servlet/archive/projects/$Project/repos/${Repository}?at=$fullBranch"

        if(-not (Test-Path $OutputLocation)) {
            mkdir $OutputLocation
        }
        $path = "$OutputLocation\Template.zip"

        $Username = $Credential.UserName
        $Password = $Credential.GetNetworkCredential().Password
        $header = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($userName + ":" + $password));

        $WebClient = New-Object System.Net.WebClient
        $WebClient.Headers["Authorization"] = "Basic " +  $header
        $WebClient.DownloadFile($url, $Path )

        Expand-RubbleArchive $path $OutputLocation
        rm $Path
    }
}
