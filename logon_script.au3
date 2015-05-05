; Created by Justin Henderson
; Last updated on 5/5/2015
; Version 1.0

; Change this to the DOMAIN\user you would like to use
Local $user = "securitymapper.com\administrator"
; Change this to the password you would like to use.  Special characters may be problematic.
; If you are dead set on using certain special characters remove $pass and edit line the ControlSend()
; line directly.
Local $pass = "Password1234"

Run('cmd.exe /C title SecurityProfileAuditingScriptByJH && runas /user:' & $user & ' /netonly "cmd.exe /C start /min title SecurityProfileAuditingScriptGo"', "" , @SW_HIDE)
WinWait("SecurityProfileAuditingScriptByJH")
ControlSend("SecurityProfileAuditingScriptByJH", "", "", "" & $pass & "{ENTER}")
WinWait("SecurityProfileAuditingScriptGo")
WinSetState("SecurityProfileAuditingScriptGo","",@SW_HIDE)