# MimikatzHoneyToken
This is a logon script used to detect the theft of credentials by tools such as Mimikatz.  This script is an AutoIT logon script that launches cmd.exe as a fake user account.  It is intended to be ran as a logon script on windows systems.

Concept for using runas with /netonly came from Mark Baggett's blog on "Detecting Mimikatz Use On Your Network" found at https://isc.sans.edu/diary/Detecting+Mimikatz+Use+On+Your+Network/19311.

When an attacker runs a tool such as Mimikatz against a system running this script they will see the fake account and hopefully attempt to use it to gain access to other machines on the network.  This enables defenders to catch this attempt by looking for the fake account with an IDS or looking for failed log on attempts in Windows event logs.

Recommendations:

- Create IDS rules looking for traffic using the fake user and password.  Also, consider creating IDS rules looking for the NTLM hash of the fake user.
- Create log alarms looking for failed log on attempts from this user account.
- Send event ID 4625 to a SIEM or use Microsoft Event Forwarding (server is free if you have a spare license of Server 2008 R2 or higher) or even use something like an ELK Stack or SecurityOnion to send the logs to (Sample script found in repository at https://github.com/SMAPPER/MimikatzHoneyToken/blob/master/powershell_alert.ps1)

Check out the wiki for more information on how to use: https://github.com/SMAPPER/MimikatzHoneyToken/wiki

This solution would work great if you setup alerts on Event ID 4625.  

Example, forward event ID 4625 to a Windows Server and use powershell to look for the "fake" account.  If found, email or kick of some action.

Powershell Alert Example - See 
