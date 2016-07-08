unit SongProperties;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls;

type
  TSongPropertiesForm = class(TForm)
    PageControl: TPageControl;
    tsCatalogueEntry: TTabSheet;
    ID3v1x: TTabSheet;
    tsID3v2: TTabSheet;
    bSave: TButton;
    bClose: TButton;
    eArtist: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    eSong: TEdit;
    eAlbum: TEdit;
    eCatNum: TEdit;
    eCatName: TEdit;
    eGenre: TEdit;
    eFilename: TEdit;
    eSize: TEdit;
    eTrackNum: TEdit;
    eYear: TEdit;
    Label11: TLabel;
    Edit1: TEdit;
    Label12: TLabel;
    Edit2: TEdit;
    Label13: TLabel;
    Edit3: TEdit;
    Label14: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label15: TLabel;
    Edit6: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit7: TEdit;
    Label18: TLabel;
    Edit8: TEdit;
    Label19: TLabel;
    Edit9: TEdit;
    Label20: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label21: TLabel;
    Edit12: TEdit;
    Label22: TLabel;
    procedure DisplaySongDetails;
    procedure SaveCatalogueDetails;
    procedure FormCreate(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    SongID : Integer;
  end;

var
  SongPropertiesForm: TSongPropertiesForm;

implementation

uses Main, Search, datamod;

{$R *.DFM}

procedure TSongPropertiesForm.DisplaySongDetails;
var total : Real;
begin
  if dmMain.dsqSongs.Active then
  begin
    eSong.Text := dmMain.dsqSongs.FieldByName('Song_Title').AsString;
    eCatName.Text := dmMain.dsqSongs.FieldByName('Catalogue_Name').AsString;
    eFilename.Text := dmMain.dsqSongs.FieldByName('Filename').AsString;
    eAlbum.Text := dmMain.dsqSongs.FieldByName('Album_Title').AsString;
    eArtist.Text := dmMain.dsqSongs.FieldByName('Artist_Name').AsString;
    eGenre.Text := dmMain.dsqSongs.FieldByName('Genre_Name').AsString;
    eCatNum.Text := dmMain.dsqSongs.FieldByName('Catalogue_Number').AsString;

    if dmMain.dsqSongs.FieldByName('Filesize').IsNull then esize.Text := '' else
    begin
      total := (dmMain.dsqSongs.FieldByName('Filesize').AsFloat / 1024) / 1024;
      eSize.Text := FormatFloat('0.00',Total)+' MB';
    end;

    if dmMain.dsqSongs.FieldByName('Track_Number').AsInteger = 0 then eTrackNum.Text := '' else
      eTrackNum.Text := IntToStr(dmMain.dsqSongs.FieldByName('Track_Number').AsInteger);
    if dmMain.dsqSongs.FieldByName('Year').AsInteger = 0 then eYear.Text := '' else
      eYear.Text := IntToStr(dmMain.dsqSongs.FieldByName('Year').AsInteger);
  end;
end;

procedure TSongPropertiesForm.FormCreate(Sender: TObject);
begin
  MainForm.StatusBar.Panels[0].ImageIndex := 10;
  DisplaySongDetails;
end;

procedure TSongPropertiesForm.SaveCatalogueDetails;
var ArtistID, AlbumID, GenreID, CatalogueID{, slashpos} : Integer;
    ErrorStr : String;
begin
  //Validate entries
  ErrorStr := '';
  if eArtist.Text = '' then
  begin
    ErrorStr := 'Artist'+#13+#10;
  end;
  if eSong.Text = '' then
  begin
    ErrorStr := ErrorStr+'Song'+#13+#10;
  end;
  if eCatNum.Text = '' then
  begin
    ErrorStr := ErrorStr+'Catalogue #'+#13+#10;
  end;
  if eCatName.Text = '' then
  begin
    ErrorStr := ErrorStr+'Catalogue Name';
  end;
  if ErrorStr <> '' then
  begin
    ErrorStr := 'The following fields are required: '+#13+#10+#13+#10+ErrorStr;
    MessageDlg(ErrorStr, mtError, [mbOK], 0);
    exit;
  end;

  ArtistID := 0;
  AlbumID := 0;
  GenreID := 0;
  CatalogueID := 0;
  if eArtist.Text <> '' then
    ArtistID := SearchForm.AddArtistToCatalogue(eArtist.Text);
  if eAlbum.Text <> '' then
    AlbumID := SearchForm.AddAlbumToCatalogue(eAlbum.Text, ArtistID);
  if eGenre.Text <> '' then
    GenreID := SearchForm.AddGenreToCatalogue(eGenre.Text);
  if ((eCatNum.Text <> '') and (eCatName.Text <> '')) then
    CatalogueID := SearchForm.AddCatalogueToCatalogue(eCatName.Text, eCatNum.Text);

  dmMain.Songs.Edit;
  if ((ArtistID <> dmMain.Songs.FieldByName('Artist_ID').AsInteger) and
     (ArtistID <> 0)) then
      dmMain.Songs.FieldByName('Artist_ID').AsInteger := ArtistID;

  if AlbumID = 0 then
  begin
    dmMain.Songs.FieldByName('Album_ID').Value := null;
  end else
  begin
    if ((AlbumID <> dmMain.Songs.FieldByName('Album_ID').AsInteger) and
       (AlbumID <> 0)) then
        dmMain.Songs.FieldByName('Album_ID').AsInteger := AlbumID;
  end;

  if ((CatalogueID <> dmMain.Songs.FieldByName('Catalogue_ID').AsInteger) and
     (CatalogueID <> 0)) then
      dmMain.Songs.FieldByName('Catalogue_ID').AsInteger := CatalogueID;

  if GenreID = 0 then
  begin
    dmMain.Songs.FieldByName('Genre_ID').Value := null;
  end else
  begin
    if ((GenreID <> dmMain.Songs.FieldByName('Genre_ID').AsInteger) and
       (GenreID <> 0)) then
        dmMain.Songs.FieldByName('Genre_ID').AsInteger := GenreID;
  end;

  if eSong.Text <> dmMain.Songs.FieldByName('Song_Title').AsString then
    dmMain.Songs.FieldByName('Song_Title').AsString := eSong.Text;

  if eTrackNum.Text = '' then
  begin
    dmMain.Songs.FieldByName('Track_Number').Value := null;
  end else
  begin
    if ((StrToInt(eTrackNum.Text) <> dmMain.Songs.FieldByName('Track_Number').AsInteger) and
       (eTrackNum.Text <> '')) then
        dmMain.Songs.FieldByName('Track_Number').AsInteger := StrToInt(eTrackNum.Text);
  end;

  if eYear.Text = '' then
  begin
    dmMain.Songs.FieldByName('Year').Value := null;
  end else
  begin
    if ((StrToInt(eYear.Text) <> dmMain.Songs.FieldByName('Year').Value) and
       (eYear.Text <> '')) then
        dmMain.Songs.FieldByName('Year').Value := StrToInt(eYear.Text);
  end;
  dmMain.Songs.Post;

  //Refresh display to latest entry
  with MainForm do
  begin
    dmMain.dsqSongs.DisableControls;
    RefreshMp3List;
    dmMain.dsqSongs.EnableControls;
  end;
end;

procedure TSongPropertiesForm.bSaveClick(Sender: TObject);
begin
  SaveCatalogueDetails;
end;

procedure TSongPropertiesForm.bCloseClick(Sender: TObject);
begin
  close;
end;

procedure TSongPropertiesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  MainForm.StatusBar.Panels[0].ImageIndex := -1;
end;

end.
