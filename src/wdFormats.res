        ��  ��                    4   T E X T   F O R M A T S         0 	        wdFormatDOSTextLineBreaks=5
wdFormatEncodedText=7
wdFormatFilteredHTML=10
wdFormatOpenDocumentText=23
wdFormatHTML=8
wdFormatRTF=6
wdFormatStrictOpenXMLDocument=24
wdFormatTemplate=1
wdFormatText=2
wdFormatTextLineBreaks=3
wdFormatUnicodeText=7
wdFormatWebArchive=9
wdFormatXML=11
wdFormatDocument97=0
wdFormatDocumentDefault=16
wdFormatPDF=17
wdFormatTemplate97=1
wdFormatXMLDocument=12
wdFormatXMLDocumentMacroEnabled=13
wdFormatXMLTemplate=14
wdFormatXMLTemplateMacroEnabled=15
wdFormatXPS=18
  �  ,   T E X T   H E L P       0 	        Help
Version:0.1ALPHA
Command Line Parameters
Each Parameter should be followed by its value  -f "c:\Docs\MyDoc.doc" -O "C:\MyDir\MyFile"
  -H  This message
  -F  Input File or Directory
  -O  Output File or Directory to place converted Docs
  -T  Format(Type) to convert file to, either integer or wdSaveFormat constant.
      Available from http://msdn.microsoft.com/en-us/library/microsoft.office.interop.word.wdsaveformat.aspx
      See current List Below.
  -TF Force Format.  -T values are checked against current list compiled in and not passed if unavailable.
      To future proof, -TF will pass through value without checking.
      Word will return an "EOleException  Value out of range" error if invalid.
      Use instead of -T not as well as.
  -L  Log Level 0 Silent, 1 Standard, 10 VERBOSE
      Default: 1 Standard
  -G  Write Log to file in directory
  -GL Log File Name to Use default 'DocTo.Log';
  -Q  Quiet Mode: Equivalent to setting -L 0


ERROR CODES:
200 : Invalid File Format specified
201 : Insufficient Inputs.  Minimum of Input File, Output File & Type
202 : Incorrect switches.  Switch requires value
203 : Unknown switch in command
220 : Word or COM Error
221 : Word not Installed    4   T E X T   H E L P J S O N       0 	        JSON Format Help

TODO!   