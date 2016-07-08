unit CatalogueDetails;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBISAMTb;

type
  TCatDetailsForm = class(TForm)
    lbCatID: TLabel;
    edCatalogueID: TEdit;
    lbCatName: TLabel;
    edCatalogueVolName: TEdit;
    Label4: TLabel;
    mCatalogueNotes: TMemo;
    bUpdate: TButton;
    bClose: TButton;
    Label1: TLabel;
    edCatCreatedDate: TEdit;
    Bevel1: TBevel;
    dsqCatalogues: TDBISAMQuery;
    dsqCataloguesID: TIntegerField;
    dsqCataloguesCatalogue_Number: TIntegerField;
    dsqCataloguesCatalogue_Name: TStringField;
    dsqCataloguesCreated_Date: TDateField;
    dsqCataloguesComments: TMemoField;
    Label2: TLabel;
    edSerial: TEdit;
    Label3: TLabel;
    edVolumeName: TEdit;
    dsqCataloguesSerial: TStringField;
    dsqCataloguesVolume_Name: TStringField;
    procedure bCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SaveCatalogueDetails;
    procedure bUpdateClick(Sender: TObject);
    procedure edCatalogueIDChange(Sender: TObject);
    procedure edCatalogueVolNameChange(Sender: TObject);
    procedure edCatCreatedDateChange(Sender: TObject);
    procedure mCatalogueNotesChange(Sender: TObject);
    procedure ModeStatus;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CatID : Integer;
    DoRefresh, ModifiedEntry : Boolean;
  end;

var
  CatDetailsForm: TCatDetailsForm;

implementation

uses Main, datamod;

{$R *.DFM}

procedure TCatDetailsForm.bCloseClick(Sender: TObject);
begin
  ModifiedEntry := False;
  ModeStatus;
  close;
end;

procedure TCatDetailsForm.FormShow(Sender: TObject);
begin
  CatDetailsForm.Font := MainForm.Font;
  dsqCatalogues.ParamByName('vCatID').AsInteger := CatID;
  dsqCatalogues.Active := True;
  edCatalogueID.Text := IntToStr(dsqCatalogues.FieldByName('Catalogue_Number').AsInteger);
  edCatalogueVolName.Text := dsqCatalogues.FieldByName('Catalogue_Name').AsString;
  edCatCreatedDate.Text := DateToStr(dsqCatalogues.FieldByName('Created_Date').AsDateTime);
  mCatalogueNotes.Lines.Text := dsqCatalogues.FieldByName('Comments').AsString;
  edSerial.Text := dsqCatalogues.FieldByName('Serial').AsString;
  edVolumeName.Text := dsqCatalogues.FieldByName('Volume_Name').AsString;

  dsqCatalogues.Active := False;
  DoRefresh := False;
  ModifiedEntry := False;
  ModeStatus;
end;

procedure TCatDetailsForm.SaveCatalogueDetails;
begin
  with MainForm do
  begin
    if dmMain.Catalogues.Locate('ID', CatID,  [loCaseInsensitive]) = True then
    begin
      StatusBar.Panels[1].text := 'Updating catalogue details...';
      StatusBar.Panels[0].ImageIndex := 17;
      dmMain.Catalogues.Edit;
      dmMain.Catalogues.FieldByName('Catalogue_Number').AsInteger := StrToInt(edCatalogueID.Text);
      dmMain.Catalogues.FieldByName('Catalogue_Name').AsString := edCatalogueVolName.Text;
    //  Catalogues.FieldByName('Created_Date').AsDateTime := StrToDate(edCatCreatedDate.Text);
      dmMain.Catalogues.FieldByName('Comments').AsString := mCatalogueNotes.Lines.Text;
    //  Catalogues.FieldByName('Serial').AsString := edSerial.Text;
    //  Catalogues.FieldByName('Volume_Name').AsString := edVolumeName.Text;
      dmMain.Catalogues.Post;
      StatusBar.Panels[1].text := '';
      StatusBar.Panels[0].ImageIndex := -1;

      if DoRefresh = True then
      begin
        //Refresh catalogue volume name and number on main screen
        dmMain.dsqSongs.DisableControls;
        RefreshMp3List;
        dmMain.dsqSongs.EnableControls;
      end;
    end;
  end;
end;

procedure TCatDetailsForm.bUpdateClick(Sender: TObject);
begin
  SaveCatalogueDetails;
  Close;
end;

procedure TCatDetailsForm.edCatalogueIDChange(Sender: TObject);
begin
  ModifiedEntry := True;
  DoRefresh := True;
  ModeStatus;
end;

procedure TCatDetailsForm.edCatalogueVolNameChange(Sender: TObject);
begin
  ModifiedEntry := True;
  DoRefresh := True;
  ModeStatus;
end;

procedure TCatDetailsForm.edCatCreatedDateChange(Sender: TObject);
begin
  ModifiedEntry := True;
  ModeStatus;
end;

procedure TCatDetailsForm.mCatalogueNotesChange(Sender: TObject);
begin
  ModifiedEntry := True;
  ModeStatus;
end;

procedure TCatDetailsForm.ModeStatus;
begin
  if ModifiedEntry = True then
  begin
    MainForm.StatusBar.Panels[1].Text := ' Edit Mode ';
    MainForm.StatusBar.Panels[0].ImageIndex := 10;
    bUpdate.Enabled := True;
  end else
  begin
    MainForm.StatusBar.Panels[1].Text := '';
    MainForm.StatusBar.Panels[0].ImageIndex := -1;
    bUpdate.Enabled := False;
  end;
end;

procedure TCatDetailsForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
end;

end.
