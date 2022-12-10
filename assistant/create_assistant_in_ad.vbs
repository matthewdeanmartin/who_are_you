' Import the Active Directory Library

Imports System.DirectoryServices

Sub Main()

' Set the domain name

Dim domain As String = "my-domain.com"

' Set the username for the new account

Dim username As String = "assistant"

' Set the password for the new account

Dim password As String = "my-password"

' Set the full name for the new account

Dim fullName As String = "Assistant"

' Set the description for the new account

Dim description As String = "This is the Assistant account"

' Set the default OU for the new account

Dim ou As String = "OU=Users,DC=my-domain,DC=com"

' Set the path to the domain

Dim domainPath As String = "LDAP://" + domain

' Set the directory entry for the domain

Dim entry As New DirectoryEntry(domainPath)

' Set the directory entry for the default OU

Dim ouEntry As New DirectoryEntry(ou)

' Set the directory entry for the new user

Dim userEntry As DirectoryEntry = ouEntry.Children.Add("CN=" + username, "user")

' Set the username for the new user

userEntry.Properties("samAccountName").Value = username

' Set the password for the new user

userEntry.Invoke("SetPassword", New Object() {password})

' Set the full name for the new user

userEntry.Properties("displayName").Value = fullName

' Set the description for the new user

userEntry.Properties("description").Value = description

' Set the user's account to be enabled

userEntry.Properties("userAccountControl").Value = 512

' Save the new user

userEntry.CommitChanges()

End Sub
