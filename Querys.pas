unit Querys;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls;

type
  TQuerysForm = class(TForm)
    Bevel1: TBevel;
    bOk: TButton;
    bCancel: TButton;
    dbgSavedQuerys: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QuerysForm: TQuerysForm;

implementation

uses Main, datamod;

{$R *.DFM}

procedure TQuerysForm.FormShow(Sender: TObject);
begin
  QuerysForm.Font := MainForm.Font;
  bOk.Enabled := (dmMain.Querys.RecordCount > 0);
end;

procedure TQuerysForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    dmMain.Querys.Delete;
    MainForm.AddFilterMenu(nil, MainForm.RunSavedFilter);
  end;
  dmMain.Querys.Close;
end;

procedure TQuerysForm.FormCreate(Sender: TObject);
begin
//  MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
  dmMain.Querys.IndexName := 'iName';
  dmMain.Querys.Open;
end;

end.
