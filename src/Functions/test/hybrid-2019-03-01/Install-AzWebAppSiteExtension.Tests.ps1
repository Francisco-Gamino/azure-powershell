$TestRecordingFile = Join-Path $PSScriptRoot 'Install-AzWebAppSiteExtension.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Install-AzWebAppSiteExtension' {
    It 'Install' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'InstallViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}
