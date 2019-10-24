$TestRecordingFile = Join-Path $PSScriptRoot 'New-AzWebAppNewSitePublishingPassword.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'New-AzWebAppNewSitePublishingPassword' {
    It 'Generate' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'GenerateViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
