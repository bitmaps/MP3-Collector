unit Filters;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls;

type
  TFiltersForm = class(TForm)
    Bevel1: TBevel;
    bOk: TButton;
    bCancel: TButton;
    dbgSavedFilters: TwwDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FiltersForm: TFiltersForm;

implementation

uses Main, datamod;

{$R *.DFM}

procedure TFiltersForm.FormShow(Sender: TObject);
begin
  FiltersForm.Font := MainForm.Font;
  bOk.Enabled := (dmMain.Querys.RecordCount > 0);
end;

procedure TFiltersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOk then
  begin
    dmMain.Querys.Delete;
    MainForm.AddFilterMenu(nil, MainForm.RunSavedFilter);
  end;
  dmMain.Querys.Close;
end;

procedure TFiltersForm.FormCreate(Sender: TObject);
begin
//  MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
  dmMain.Querys.IndexName := 'iName';
  dmMain.Querys.Open;
end;

end.
