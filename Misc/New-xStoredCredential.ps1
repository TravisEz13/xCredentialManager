$Properties = @{
    UserTag          = New-xDscResourceProperty -Name UserTag -Type String -Attribute Key `
                                         -Description 'A tag uniquely identifying the user to store the credentials for.'
    UserCredential   = New-xDscResourceProperty -Name UserCredential -Type PSCredential -Attribute Required `
                                         -Description 'The user for which to store the credential.'
    Target           = New-xDscResourceProperty -Name Target -Type String -Attribute Key `
                                         -Description 'The host to store the credential for.'
    TargetCredential = New-xDscResourceProperty -Name TargetCredential -Type PSCredential -Attribute Write `
                                        -Description 'The credential to connect to the target.'
    Force            = New-xDscResourceProperty -Name Force -Type Boolean -Attribute Write `
                                       -Description 'Update the credential even if it already exists.'
    Ensure           = New-xDscResourceProperty -Name Ensure -Type String -Attribute Write `
                                      -ValueMap 'Present','Absent' `
                                      -Values 'Present','Absent' `
                                      -Description 'Whether the stored credential should be added or removed.'
}

New-xDscResource -Name MSFT_xStoredCredential -Property $Properties.Values -ModuleName xCredentialManager -FriendlyName xStoredCredential
