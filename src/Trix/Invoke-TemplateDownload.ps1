<#
.SYNOPSIS
Downloads a boilerplate from git.unic.com.

.DESCRIPTION
Downloads a boilerplate from git.unic.com. It will use the "download as ZIP"
functionality and extract it to the specified location.

.PARAMETER Project
The name of the Stash project where the project is located.

.PARAMETER Repository
The name of the Stash repository where the project is located.

.PARAMETER OutputLocation
The folder where the boilerplate will be placed.

.PARAMETER Credential
The credentials used to connect to git.unic.com

.PARAMETER Branch
The branch of the boilerplate to use.

.EXAMPLE
Invoke-TemplateDownload -Project BUECS -Repository sitecore-boilerplate -OutputLocation D:\temp\sitecore-boilerplate 

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
