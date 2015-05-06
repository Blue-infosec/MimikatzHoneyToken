; Created by Justin Henderson
; Last updated on 5/5/2015
; Version 1.1

Opt("WinTitleMatchMode", 2)
; Change this.  Should be in domain\user format
Local $user = "securitymapper.com\administrator"
; Change this to the password you would like to use.  Special characters may be problematic.
; If special characters are needed test.  If it doesn't work edit the last line.
Local $pass = "Password1234"
; Leave this line alone
Local $path = @SCRIPTDIR & '\'

Run('cmd.exe /C title SecurityProfileAuditingScriptByJH && runas /user:' & $user & ' /netonly "' & $path & 'runme.exe"', "", @SW_HIDE)
WinWait("SecurityProfileAuditingScriptByJH")
ControlSend("SecurityProfileAuditingScriptByJH", "", "", "" & $pass & "{ENTER}")