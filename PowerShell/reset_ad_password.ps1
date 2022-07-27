$user = "mysamAccountName"
$passwordLength = 8
$Password = -join ([char[]]([char]65..[char]90) + ([char[]]([char]97..[char]122)) `
     + ([char[]]([char]33,35,36,37,43,47,61,63,64,95)) + 0..9 | Get-Random -C $passwordLength)

Clear-Host
#-------------[Change Password]-----------
try {
  Set-ADAccountPassword -Identity $user -Reset `
     -NewPassword (ConvertTo-SecureString -AsPlainText "$Password" -Force) `
	 -ErrorAction Stop
  #Unlock the account
  #Unlock-ADAccount -Identity $user
}
catch [Exception]{
  Write-Host $($Error[0].Exception.Message)
  break
}

# Set the Clipboard (Optional)
$Password | clip

#-------------[Log]-----------
$user.Name + " - " + $Password | Out-File "$($env:USERPROFILE)\Desktop\cred.txt" -Append
"-------------------------------------------------------"
Write-Host $ReturnValue
Write-Host "Account: " -ForegroundColor Yellow -NoNewline
Write-Host -ForegroundColor Cyan $user
Write-Host "Password: " -ForegroundColor Yellow -NoNewline
Write-Host -ForegroundColor Cyan $Password
"-------------------------------------------------------"
