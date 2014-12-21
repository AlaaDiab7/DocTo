unit WordUtils;
(*************************************************************
Copyright � 2012 Toby Allen (http://github.com/tobya)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the �Software�), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute, sub-license, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice, and every other copyright notice found in this software, and all the attributions in every file, and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED �AS IS�, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****************************************************************)
interface
uses Classes, MainUtils, ResourceUtils,  ActiveX, ComObj, WinINet, Variants,  Types;

type

TWordDocConverter = Class(TDocumentConverter)
Private
    WordApp : OleVariant;
protected



public
    Constructor Create();
    function CreateOfficeApp() : boolean;  override;
    function DestroyOfficeApp() : boolean; override;
    function ExecuteConversion(fileToConvert: String; OutputFilename: String; OutputFileFormat : Integer): string; override;
    function AvailableFormats() : TStringList; override;
    function FormatsExtensions(): TStringList; override;
End;





implementation

function TWordDocConverter.AvailableFormats() : TStringList;
var
  Formats : TStringList;

begin
  Formats := Tstringlist.Create();
  LoadStringListFromResource('WORDFORMATS',Formats);

  result := Formats;
end;

function TWordDocConverter.FormatsExtensions() : TStringList;
var
  Extensions : TStringList;

begin
  Extensions := Tstringlist.Create();
  LoadStringListFromResource('EXTENSIONS',Extensions);

  result := Extensions;
end;





{ TWordDocConverter }

constructor TWordDocConverter.Create;
begin
  inherited;
  Extension := '.doc';
  LogFilename := 'DocTo.Log';
end;

function TWordDocConverter.CreateOfficeApp: boolean;
begin
    Wordapp :=  CreateOleObject('Word.Application');
    Wordapp.Visible := false;
end;

function TWordDocConverter.DestroyOfficeApp: boolean;
begin
  if not VarIsEmpty(WordApp) then
  begin
    WordApp.Quit();
  end;

end;

function TWordDocConverter.ExecuteConversion(fileToConvert: String; OutputFilename: String; OutputFileFormat : Integer): string;
begin
            //Open doc and save in requested format.
            Wordapp.documents.Open( FileToConvert, false, true);
            Wordapp.activedocument.Saveas(OutputFilename ,OutputFileFormat );

            Wordapp.activedocument.Close;
end;



end.
