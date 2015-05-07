; Created by Justin Henderson
; Last updated on 5/5/2015
; Version 1.2

Opt("WinTitleMatchMode", 2)
; Change this.  Should be in domain\user format
Local $user = "SMAPPER\administrator"
; Change this to the password you would like to use.  Special characters may be problematic.
; If special characters are needed test.  If it doesn't work edit the last line.
Local $pass = "Sup3rUltrAS3cr3tPA44w0rdThAtCANN0TB3HACK3D"
; If you are using an account that doesn't exist leave this set to 1 otherwise set it to 0
Local $fake = 1
; Leave this line alone
Local $path = @SCRIPTDIR & '\'

If $fake == 1 Then
   $netonly = " /netonly"
Else
   $netonly = ''
EndIf

Run('cmd.exe /C copy /Y "' & $path & 'runme.exe" C:\Windows\Temp', "", @SW_HIDE)
Run('cmd.exe /C title SecurityProfileAuditingScriptByJH && runas /user:' & $user & $netonly & ' "C:\Windows\Temp\runme.exe"', "", @SW_HIDE)
WinWait("SecurityProfileAuditingScriptByJH")
ControlSend("SecurityProfileAuditingScriptByJH", "", "", "" & $pass & "{ENTER}")