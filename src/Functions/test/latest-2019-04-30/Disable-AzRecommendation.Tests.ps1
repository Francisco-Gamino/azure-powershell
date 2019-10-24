$TestRecordingFile = Join-Path $PSScriptRoot 'Disable-AzRecommendation.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Disable-AzRecommendation' {
    It 'Disable' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Disable4' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Disable2' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Disable3' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Disable1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity4' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity3' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity2' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DisableViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
