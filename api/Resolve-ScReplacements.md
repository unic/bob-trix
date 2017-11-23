

# Resolve-ScReplacements

Returns a PascalCase and camelCase version of every passed replacement.
## Syntax

    Resolve-ScReplacements [-Replacements] <Hashtable> [<CommonParameters>]


## Description

Returns a PascalCase and camelCase version of every passed replacement.
So if @{"Customer"="Unic"} is passed @{"Customer"="Unic"; "customer" = "unic"}
is returned.





## Parameters

    
    -Replacements <Hashtable>
_A PowerShell hashtable of replacements to return._

| Position | Required | Default value | Accept pipeline input | Accept wildchard characters |
| -------- | -------- | ------------- | --------------------- | --------------------------- |
| 1 | true |  | false | false |


----

    

## Examples

### -------------------------- EXAMPLE 1 --------------------------
    Resolve-ScReplacements @{"Customer"="Unic"}































