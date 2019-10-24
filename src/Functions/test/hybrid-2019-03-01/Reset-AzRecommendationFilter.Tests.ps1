$TestRecordingFile = Join-Path $PSScriptRoot 'Reset-AzRecommendationFilter.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Reset-AzRecommendationFilter' {
    It 'Reset' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Reset2' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ResetViaIdentity2' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ResetViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
