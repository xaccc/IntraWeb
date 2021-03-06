﻿unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompLabel, Controls, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton, IWCompGradButton;

type
  TIWForm1 = class(TIWAppForm)
    IWButton1: TIWButton;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    procedure IWButton4Click(Sender: TObject);
  private
    function CreateTestFile: string;
  public
  end;

implementation

{$R *.dfm}

uses
  IWGlobal;

function TIWForm1.CreateTestFile: string;
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.Add('this is a test file for IW');
    sl.Add('侯：真喝醉的人，怕别人说他醉了');
    sl.Add('der jämmerlich heulte. „Warum heulst du denn so, Pack an?“');
    sl.Add('áéíóúàèìòùãõ');
    Result := gSC.ContentPath + 'áéíóúàèìòùãõ.dat';
    sl.SaveToFile(Result, TEncoding.UTF8);
  finally
    sl.Free;
  end;
end;

procedure TIWForm1.IWButton4Click(Sender: TObject);
var
  FileName: string;
begin
  FileName := CreateTestFile;
  WebApplication.SendFile(FileName, False);
end;

initialization
  TIWForm1.SetAsMainForm;

end.
