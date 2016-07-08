unit DatabaseOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, StdCtrls;

type
  TDatabaseForm = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    Bevel1: TBevel;
    StringGrid1: TStringGrid;
    bNew: TButton;
    bDelete: TButton;
    Label1: TLabel;
    procedure bNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatabaseForm: TDatabaseForm;

implementation

uses NewDatabase, Main;

{$R *.DFM}

procedure TDatabaseForm.bNewClick(Sender: TObject);
begin
  NewDatabaseForm := TNewDatabaseForm.create(self);
  NewDatabaseForm.Showmodal;
  NewDatabaseForm.Free;
end;

procedure TDatabaseForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
     MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

procedure TDatabaseForm.FormShow(Sender: TObject);
begin
  DatabaseForm.Font := MainForm.Font;
end;

end.
