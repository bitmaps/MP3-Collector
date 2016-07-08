unit Confirm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Registry;

type
  TConfirmForm = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    cbPrompt: TCheckBox;
    Image1: TImage;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfirmForm: TConfirmForm;

implementation

uses Main;

{$R *.DFM}

procedure TConfirmForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      WriteBool('ConfirmSave', cbPrompt.Checked);
      CloseKey;
    end;
  finally
    Reg.Free;
  end;
  MainForm.ConfirmSave := cbPrompt.Checked;
end;

procedure TConfirmForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

procedure TConfirmForm.FormShow(Sender: TObject);
begin
  ConfirmForm.Font := MainForm.Font;
end;

end.
