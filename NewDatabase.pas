unit NewDatabase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls;

type
  TNewDatabaseForm = class(TForm)
    Bevel1: TBevel;
    bOk: TButton;
    bCancel: TButton;
    lbDirectory: TLabel;
    DirectoryEdit: TDirectoryEdit;
    Label1: TLabel;
    eDatabaseName: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewDatabaseForm: TNewDatabaseForm;

implementation

{$R *.DFM}

procedure TNewDatabaseForm.FormShow(Sender: TObject);
begin
  eDatabaseName.SetFocus;
end;

procedure TNewDatabaseForm.FormCreate(Sender: TObject);
begin
//  MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

end.
