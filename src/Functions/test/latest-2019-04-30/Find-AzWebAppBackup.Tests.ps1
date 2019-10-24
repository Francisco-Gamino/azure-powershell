$TestRecordingFile = Join-Path $PSScriptRoot 'Find-AzWebAppBackup.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Find-AzWebAppBackup' {
    It 'DiscoverExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Discover' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DiscoverViaIdentityExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'DiscoverViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
