$TestRecordingFile = Join-Path $PSScriptRoot 'Switch-AzWebAppSlot.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Switch-AzWebAppSlot' {
    It 'SwapExpanded1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'SwapExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Swap1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Swap' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'SwapViaIdentityExpanded1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'SwapViaIdentityExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'SwapViaIdentity1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'SwapViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
