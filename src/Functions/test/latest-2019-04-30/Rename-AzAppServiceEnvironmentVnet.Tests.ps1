$TestRecordingFile = Join-Path $PSScriptRoot 'Rename-AzAppServiceEnvironmentVnet.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Rename-AzAppServiceEnvironmentVnet' {
    It 'ChangeExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Change' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ChangeViaIdentityExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ChangeViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
