$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

Describe "Resolve-ScReplacements" {
    Context "When replacing Customer = Unic" {

        $fixed = Resolve-ScReplacements @{"Customer" = "Unic"}

        It "Should have two keys" {
            $fixed.Keys.Count | Should Be 2
        }

        It "Should have added 'customer' = 'unic'" {
            $fixed["customer"] | Should BeExactly  "unic"
        }
        It "Should have kept 'Customer' = 'customer'" {
            $fixed["Customer"] | Should BeExactly  "Unic"
        }
    }
}
