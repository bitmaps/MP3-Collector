unit ReportFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Registry, ExtCtrls;

  function GetReportFilter : Integer;

type
  TReportFilterForm = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportFilterForm: TReportFilterForm;

implementation

uses Main;

{$R *.DFM}

function GetReportFilter : Integer;
var Reg : TRegistry;
    FilterPrompt, DefaultFilter : Integer;
begin
  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      try
        DefaultFilter := ReadInteger('DefaultFilter');
      except
        DefaultFilter := 0;
      end;
      try
        FilterPrompt := ReadInteger('FilterPrompt');
      except
        FilterPrompt := 0;
      end;
      CloseKey;
    end;
  finally
    Reg.Free;
  end;

  if FilterPrompt = 0 then //Show filter options
  begin
    ReportFilterForm := TReportFilterForm.create(nil);
    ReportFilterForm.bOk.default := (DefaultFilter = 0);
    ReportFilterForm.bCancel.default := (DefaultFilter = 1);
    if ReportFilterForm.ShowModal = mrOk then
      Result := 0
    else
      Result := 1;
    ReportFilterForm.Free;
  end else
    Result := DefaultFilter;  //Default option
end;

procedure TReportFilterForm.FormShow(Sender: TObject);
begin
  ReportFilterForm.Font := MainForm.Font;
end;

procedure TReportFilterForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

end.
