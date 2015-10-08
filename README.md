[![Build status](https://ci.appveyor.com/api/projects/status/uan12tf7tfxhg7m5/branch/master?svg=true)](https://ci.appveyor.com/project/TravisEz13/xcredentialmanager/branch/master)

# xCredentialManager

The **xCredentialManager** DSC resources are used for storing credentials in [Credential Manager](http://windows.microsoft.com/en-US/Windows7/What-is-Credential-Manager). They include **xStoredCredential** 

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xStoredCredential** ensures that a credential is stored for a particular user.


### xCredentialManager

* **UserTag**: A tag uniquely identifying the user to store the credentials for.
* **UserCredential**: The user for which to store the credential.
* **Target**: The host to store the credential for.
* **TargetCredential**: The credential to connect to the target.
* **Ensure**: Tells the resource if the credentials for the target should be present or absent


## Versions

0.1


* Initial release with the following resources 
    * **xStoredCredential**

## Examples

### Storing a credential

```powershell
configuration Sample_xCredentialManager
{
	param([PSCredential] $UserCredential, [PSCredential] $TargetCredential, [string] $Target)
 
    Import-DscResource -module xCredentialManager
    xCredentialManager Scope
    {
        Ensure = 'Present'
        UserTag = $UserCredential.UserName.GetHashCode()
        UserCredential = $UserCredential
        Target = $Target
        TargetCredential = $TargetCredential
    }
}
```
