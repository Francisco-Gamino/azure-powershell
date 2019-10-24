$TestRecordingFile = Join-Path $PSScriptRoot 'Test-Az.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Test-Az' {
    It 'ValidateExpanded1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Validate1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ValidateViaIdentityExpanded1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ValidateViaIdentity1' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
