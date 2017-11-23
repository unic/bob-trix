

# New-ScProject

Creates a new instance of Sitecore project or module based on a specific template.
## Syntax

    New-ScProject [-TemplateLocation] <String> [-Replacements] <Hashtable> [-OutputLocation] <String> [<CommonParameters>]


## Description

Creates a new instance of Sitecore project or module based on a specific
template by copying all folders and replacing the specified replacements in
the file content and all file and folder names.





## Parameters

    
    -TemplateLocation <String>
_The location to the template._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    
    
    -Replacements <Hashtable>
_A hashtable of replacements to use. It will always use the PascalCase and
camelCase of a replacement. This means when @{"Customer"="Unic"} all instances
of Customer will be replaced by Unic and all instances of customer will be
replaced by unic._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 2 | true |  | false | false |


----

    
    
    -OutputLocation <String>
_The folder where the resulting project will be written to._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 3 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    New-ScProject -TemplateLocation D:\bob-boilerplate -Replacements @{"Customer" = "Unic"} -OutputLocation D:\unic-website































