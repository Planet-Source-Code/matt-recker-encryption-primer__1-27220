<div align="center">

## Encryption Primer


</div>

### Description

This is a tutorial/article on encryption basics. I cover very basic and easy to understand encryption up to the hard stuff like 128 bit encryption. I garauntee this will be the easiest 128-bit encryption you have ever seen. I also have added a zip file. This zip file contains the article in HTML form so you can view it offline and it also includes a working example.
 
### More Info
 


<span>             |<span>
---                |---
**Submitted On**   |2001-09-15 16:12:54
**By**             |[Matt Recker](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByAuthor/matt-recker.md)
**Level**          |Intermediate
**User Rating**    |5.0 (50 globes from 10 users)
**Compatibility**  |VB 3\.0, VB 4\.0 \(16\-bit\), VB 4\.0 \(32\-bit\), VB 5\.0, VB 6\.0
**Category**       |[Encryption](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByCategory/encryption__1-48.md)
**World**          |[Visual Basic](https://github.com/Planet-Source-Code/PSCIndex/blob/master/ByWorld/visual-basic.md)
**Archive File**   |[Encryption264389142001\.zip](https://github.com/Planet-Source-Code/matt-recker-encryption-primer__1-27220/archive/master.zip)





### Source Code

I feel I should start out by telling you about myself and my experience. I have been programming for 3+ years and I have many certifications including: C++, VB, Computer Repair and Win 95/98 Administration. I program in the following languages: VB, VC++, ASM(Z80 Chipset), PERL, ASP and some smaller scripting languages like JavaScript and VBScript. One of my favorite past times is to come up with new encryption algorithms and I thought I might share some of my algorithms and help out people just starting to learn encryption.
 I remember when I was starting out with encryption the examples were few and far between and those that I did find were just source code that wasn't well commented. I seek to change that.
 The truth is encryption is easy once you break into it. NOTE: All of these algorithms can be applied to any language but the examples will be in Visual Basic.
 The most important part of developing an encryption algorithm is to write it down as you go so that decrypting and undoing what was done will be much easier. I write it down on a notepad in regular english so I don't have to interpret code when coming up with the decryption method.<p>
 The first thing you have to realize about text is that each letter has a number code to go with it called ASCII code. This is a very important part of encryption. When you change a letter or character to this ASCII code it becomes a 3-digit number that you can work with. Then it is in this number state you can perform mathematical functions on it which is how you change the data to an unreadable for that is reversible.
<p>
 This is an example of a algorithm for changing the characters to ASCII and performing mathematical functions on them:<br><center>
  <small>First Character -> Encrypt Function -> ASCII Code<br>
  ASCII Code - 13 -> New ASCII Code -> Back to Character Format<br>
  Now the first character is something different</small></center><p>
 To get back the original:<p>
  <center>
  <small>First Character -> Decrypt Function -> ASCII Code<br>
  ASCII Code + 13 -> New ASCII Code -> Back to Character Format<br>
  Now the first character is back to the original</small><br><p>
</center>
 Sound simple? That's because it is. No encryption would be written like this if you had something important to hide because it could be easily cracked. But it is a good place to start. Here is the Visual Basic source code to the same algorithm:<p>
<small>
text1.text = Encrypt(character)<p>
<br>
Private function Encrypt(char as string)<br>
dim newASCII as integer<br>
dim newChar as string<br>
<br>
	newASCII = asc(char)    'Convert to ASCII<br>
	newASCII = newASCII - 13     'Subtract 13 from the ASCII<br>
	newChar = chr(newASCII)     ' Convert the new ASCII into Character format<br>
	Encrypt = newChar    'Return the result to the line calling it<br>
<br>
end function<br>
</small>
<p>
That was a simple example and as I said before you wouldn't use something like that to encrypt because it would be easy to figure out. All the cracker has to do it realize that 13 is subtracted from each character's ASCII code and they will be able to read everything.<p>
There are three important things that need to be learned from this example . 1. Asc() is a function provided by Visual Basic and it is used to convert a single character into ASCII. 2. Chr() is another function provided by Visual Basic and it will convert ASCII code into character format. 3. The third thing to note is that wherever you can add randomness the more secure your algorithm will be. If you had made the number subtracted a random number and changed it for each character than your encryption would have been more secure but you have to store those numbers somewhere and that is what's called a key. Now you wouldn't want to make a random number for each character or your key would be huge.
<p>
Something else you should know is that you can convert to other formats too. These are Octohedral with Oct() and Hexadecimal with hex(). These functions can be useful in adding an extra level of security but they are for more advanced algorithms and pretty much beyond the scope of this article.<p>
The next thing you need to be able to do is break up a string into one character chunks. I am not going to go through the encryption methods right now, because the important part is how to break up the string. Here is the english version: <p>
<small>
<center>
String -> Get first Character -> Perform any math -> Replace original with updated character -> Go on to the next character and repeat until the end
</center>
</small>
<p>
This is something very important and I use it in every single one of my encryption algorithms. You have to be able to break up or parse the string if you have any hope of encrypting it. The Visual Basic translation would be:
<p>
<small>
Private function ParseandEncrypt(string as string)<p>
dim count as integer     'Declare the variable for the loop<br>
dim Char as string    'Declare the variable for the character<br>
dim newString as string     'Declare the variable for the new string<br>
dim newASCII as integer     'Declare the variable for the new ASCII code<br>
<br>
for count = 1 to len(string)    'Loop from 1 to the length of the string<br>
	Char = mid(string,count,1)    'Start with the character at the 'count' position and go one unit<br>
	newASCII = asc(Char)+(rnd*30)    'Add the ASCII number to a random number 0-30<br>
	newString = newString & chr(newASCII)    'Convert to regular character format and add to the new string<br>
next count    'Loop again<br>
<br>
ParseandEncrypt = newString     'Return the new string<br>
<br>
End Function<br>
</small>
<p>
That was a complete encryption code. That would take any string and return it in an altered version. The only downside is that it would be useless. You have know way of knowing what was added to the ASCII code so you cannot know what to subtract.<p>
That's where keys come in. Keys are used to store the numbers used in the mathematical functions. You can store the keys anyway you choose but I prefer arrays as it offers they easiest way for creation and implementation. The easiest thing to do is to store the numbers in the array before doing the math. I am going to show you how to do it in VB it should be almost identical in every other language so here it is: <p>
<small>
dim arrayKey(128) as integer<p>
for x = 0 to 127<br>
arrayKey(x) = (rnd*9)<br>
next x<br>
</small>
<p>
That code produces an array with 128 numbers ranging from 0 to 9. This is effectively 128-bit encryption. The bit number refers to the length of the key. When the key is run together for storage it will be 128 digits long therefore making it a 128-bit key. To use this key all you have to do is loop it into the parse function:<p>
<small>
Private function ParseandEncrypt(string as string)<p>
dim count as integer     'Declare the variable for the loop<br>
dim Char as string    'Declare the variable for the character<br>
dim newString as string     'Declare the variable for the new string<br>
dim newASCII as integer     'Declare the variable for the new ASCII code<br>
<br>
<p>
for y = 0 to 127<br>
arrayKey(x) = (rnd*9)<br>
next y<br>
<p>
for count = 1 to len(string)    'Loop from 1 to the length of the string<br>
	Char = mid(string,count,1)    'Start with the character at the 'count' position and go one unit<br>
	newASCII = asc(Char)+arrayKey(x)    'Add the ASCII number to a random number 0-30<br>
	newString = newString & chr(newASCII)    'Convert to regular character format and add to the new string<br>
<br>
x = x + 1<br>
if x > 127 then x = 0<p>
next count    'Loop again<br>
<br>
ParseandEncrypt = newString     'Return the new string<br>
<br>
End Function<br>
</small>
<p>
And that's it. That is a complete working encryption function. It parses, creates a key, stores the key, encrypts the string and then returns it. I haven't covered much about decryption until now because it is the exact opposite so I'm just going to show you a complete decryption function now:
<p>
<small>
Private function ParseandDecrypt(string as string, key as integer)<p>
dim count as integer     'Declare the variable for the loop<br>
dim Char as string    'Declare the variable for the character<br>
dim newString as string     'Declare the variable for the new string<br>
dim newASCII as integer     'Declare the variable for the new ASCII code<br>
<br>
<p>
<p>
for count = 1 to len(string)    'Loop from 1 to the length of the string<br>
	Char = mid(string,count,1)    'Start with the character at the 'count' position and go one unit<br>
	newASCII = asc(Char)-key(x)    'Add the ASCII number to a random number 0-30<br>
	newString = newString & chr(newASCII)    'Convert to regular character format and add to the new string<br>
<br>
x = x + 1<br>
if x > 127 then x = 0<p>
next count    'Loop again<br>
<br>
ParseandDecrypt = newString     'Return the new string<br>
<br>
End Function<br>
</small>
<p>
And to go about calling that you would say something like this:<p>
<small>
text1.text = ParseandDecrypt(text1.text, arrayKey)
</small>
<p>
And that's all I have for you on encryption. There are a few other things you will need to figure out before you use this commercially or privately. One thing you need to do is somehow save your keys on the computer and then come up with a way to load them again later. However if you take the code presented here and give an hour or so you can have a working text encryptor with little problem.<p>
Feel free to email me if you have any questions or comments my email is <a href="mailto:newrepsoft@aol.com">NewRepSoft@aol.com</a> and I look forward to recieving feedback. I will try to help any body that asks for help. Thank you and I hope you found this article useful.

