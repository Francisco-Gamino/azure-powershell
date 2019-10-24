$TestRecordingFile = Join-Path $PSScriptRoot 'Confirm-AzConnectionConsentCode.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Confirm-AzConnectionConsentCode' {
    It 'ConfirmExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Confirm' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ConfirmViaIdentityExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ConfirmViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
