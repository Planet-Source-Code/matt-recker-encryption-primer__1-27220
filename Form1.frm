VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3750
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4095
   LinkTopic       =   "Form1"
   ScaleHeight     =   3750
   ScaleWidth      =   4095
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Load Key Into Array"
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   6
      Top             =   3120
      Width           =   3615
   End
   Begin VB.TextBox Text3 
      Height          =   975
      Left            =   240
      MultiLine       =   -1  'True
      TabIndex        =   5
      Top             =   2040
      Width           =   3615
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Generate Key"
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   1320
      Width           =   3615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Decrypt"
      Height          =   255
      Left            =   2640
      TabIndex        =   3
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Encrypt"
      Height          =   255
      Left            =   2640
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Top             =   840
      Width           =   2055
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim arrayKey(128) As Integer 'This is the array to store the key

Private Sub Command1_Click()
Text2.Text = ParseAndEncrypt(Text1.Text) 'Call the function to parse and encrypt and pass along the string you want encrypted
Text1.Text = "" 'Clear the first text box
End Sub

Private Sub Command2_Click()
Text1.Text = ParseAndDecrypt(Text2.Text) 'Call the function to parse and decrypt and pass along the string to decrypt
Text2.Text = "" 'Clear the second text box
End Sub

Private Sub Command3_Click()

Text3.Text = "" 'Clear the third text box

For x = 0 To 127 'start loop to create the key
arrayKey(x) = (Rnd * 9) 'add a number from 0-9
Next x 'increment x and repeat

For x = 0 To 127 'start loop to display key
Text3.Text = Text3.Text & arrayKey(x) 'Add each value to the third text box
Next x 'increment x and repeat

Command4.Enabled = False

End Sub

Private Sub Command4_Click()

For x = 0 To 127 'Start the loop to clear the key
arrayKey(x) = 0 'replace all the items with 0
Next x 'increment x and repeat

For x = 0 To 127 'Start loop to load the key from the third text box
arrayKey(x) = Mid(Text3.Text, x + 1, 1) 'Get characters one at a time and load them into the appropriate slots
Next x 'increment x and repeat

End Sub

Private Sub Form_Load()
Randomize 'self explanatory
End Sub

Private Function ParseAndEncrypt(parse As String)

i = 0 'set i to 0

If Text3.Text = "" Then 'If there is no key in the box then create one
Call Command3_Click
End If

For x = 1 To Len(parse) 'Start the encrypt loop

Char = Mid(parse, x, 1) 'get a character
ASCIIChar = Asc(Char) + arrayKey(i) 'change it's ascii value
Char = Chr(ASCIIChar) 'change the new ascii value to character
ParseAndEncrypt = ParseAndEncrypt & Char 'add all the new characters together
i = i + 1 'increment i

Next x 'increment x and repeat

End Function

Private Function ParseAndDecrypt(parse As String)

'This is exactly the same as the encrypt except for two things
'which I will point out

i = 0

For x = 1 To Len(parse)

Char = Mid(parse, x, 1)
ASCIIChar = Asc(Char) - arrayKey(i) 'subtract this time
Char = Chr(ASCIIChar)
ParseAndDecrypt = ParseAndDecrypt & Char 'and put together in the ParseAndDecrypt variable
i = i + 1

Next x

End Function

Private Sub Text3_Change()
Command4.Enabled = True
End Sub
