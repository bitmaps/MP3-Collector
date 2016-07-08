unit QuerySave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

function SaveQueryAs : String;

type
  TQuerySaveForm = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    Bevel1: TBevel;
    eName: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuerySaveForm: TQuerySaveForm;

implementation

uses ReportFilter, Main;

{$R *.DFM}

function SaveQueryAs : String;
begin
  QuerySaveForm := TQuerySaveForm.create(nil);
  if QuerySaveForm.ShowModal = mrOk then
    Result := QuerySaveForm.eName.Text else Result := '';
  QuerySaveForm.Free;
end;

procedure TQuerySaveForm.FormShow(Sender: TObject);
begin
  QuerySaveForm.Font := MainForm.Font;
  eName.SetFocus;
end;

procedure TQuerySaveForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

end.
