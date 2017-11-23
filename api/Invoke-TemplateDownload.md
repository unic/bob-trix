

# Invoke-TemplateDownload

Downloads a boilerplate from git.unic.com.
## Syntax

    Invoke-TemplateDownload [-Project] <String> [-Repository] <String> [-OutputLocation] <String> [[-Credential] <PSCredential>] [[-Branch] <String>] [<CommonParameters>]


## Description

Downloads a boilerplate from git.unic.com. It will use the "download as ZIP"
functionality and extract it to the specified location.





## Parameters

    
    -Project <String>
_The name of the Stash project where the project is located._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -Repository <String>
_The name of the Stash repository where the project is located._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -OutputLocation <String>
_The folder where the boilerplate will be placed._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | true |  | false | false |


----

    
    
    -Credential <PSCredential>
_The credentials used to connect to git.unic.com_

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 4 | false | (Get-Credential) | false | false |


----

    
    
    -Branch <String>
_The branch of the boilerplate to use._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 5 | false | master | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Invoke-TemplateDownload -Project BUECS -Repository sitecore-boilerplate -OutputLocation D:\temp\sitecore-boilerplate































