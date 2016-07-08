unit ColumnConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst;

type
  TColumnConfigForm = class(TForm)
    CheckListBox1: TCheckListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ColumnConfigForm: TColumnConfigForm;

implementation

{$R *.DFM}

end.
