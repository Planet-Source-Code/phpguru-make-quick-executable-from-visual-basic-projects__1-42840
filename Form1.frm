VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2370
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4980
   LinkTopic       =   "Form1"
   ScaleHeight     =   2370
   ScaleWidth      =   4980
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Open another file"
      Height          =   495
      Left            =   2520
      TabIndex        =   2
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Make exe"
      Height          =   495
      Left            =   960
      TabIndex        =   1
      Top             =   1320
      Width           =   1455
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   360
      Top             =   1320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Filter          =   "Visual Basic projects (*.vbp)|*.vbp"
   End
   Begin VB.Label Label1 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   240
      Width           =   4215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Private Sub Command1_Click()
r = ShellExecute(Me.hwnd, "Open", "C:\Program Files\Microsoft Visual Studio\VB98\vb6.exe ", "/make " & Label1.Caption, "c:\", SW_SHOWNORMAL)
If r <= 32 Then
 Select Case r
Case SE_ERR_FNF
msg = "File not found"
Case SE_ERR_PNF
msg = "Path not found"
Case SE_ERR_ACCESSDENIED
msg = "Access denied"
Case SE_ERR_OOM
msg = "Out of memory"
Case SE_ERR_DLLNOTFOUND
msg = "DLL not found"
Case SE_ERR_SHARE
msg = "A sharing violation occurred"
Case SE_ERR_ASSOCINCOMPLETE
msg = "Incomplete or invalid file association"
Case SE_ERR_DDETIMEOUT
msg = "DDE Time out"
Case SE_ERR_DDEFAIL
msg = "DDE transaction failed"
Case SE_ERR_DDEBUSY
msg = "DDE busy"
Case SE_ERR_NOASSOC
msg = "No association for file extension"
Case ERROR_BAD_FORMAT
msg = "Invalid EXE file or error in EXE image"
Case Else
msg = "Unknown error"
End Select

MsgBox msg
End If

End Sub

Private Sub Command2_Click()
CommonDialog1.ShowOpen
fname = CommonDialog1.FileName
Label1.Caption = fname
End Sub

Private Sub Form_Load()
CommonDialog1.ShowOpen
fname = CommonDialog1.FileName
Label1.Caption = fname
End Sub

