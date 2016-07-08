unit SaveFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

function SaveFilterAs : String;

type
  TSaveFilterForm = class(TForm)
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
  SaveFilterForm: TSaveFilterForm;

implementation

uses ReportFilter, Main;

{$R *.DFM}

function SaveFilterAs : String;
begin
  SaveFilterForm := TSaveFilterForm.create(nil);
  if SaveFilterForm.ShowModal = mrOk then
    Result := SaveFilterForm.eName.Text else Result := '';
  SaveFilterForm.Free;
end;

procedure TSaveFilterForm.FormShow(Sender: TObject);
begin
  SaveFilterForm.Font := MainForm.Font;
  eName.SetFocus;
end;

procedure TSaveFilterForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

end.
