unit AddWizard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls, EasyFileSearch, FileSearch,
  ID3v2, ID3, db, FileCtrl, MPlayer, Registry, PBFolderDialog,
  ToolEdit, ImgList, mmsystem;

type
  TAddWizardForm = class(TForm)
    EasyFileSearch1: TEasyFileSearch;
    MediaPlayer: TMediaPlayer;
    PBFolderDialog: TPBFolderDialog;
    nb: TNotebook;
    bNext: TButton;
    bPrevious: TButton;
    bClose: TButton;
    pDisplayInfo: TPanel;
    lProgress: TLabel;
    Panel2: TPanel;
    lCatDetails: TLabel;
    lbCatID: TLabel;
    lbCatName: TLabel;
    edCatalogueID: TEdit;
    edCatalogueVolName: TEdit;
    Panel1: TPanel;
    lDirectory: TLabel;
    cbIncludeSubFolders: TCheckBox;
    ceDirectory: TComboEdit;
    cbDuplicates: TCheckBox;
    lbProgressItems: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    mCatalogueNotes: TMemo;
    Bevel1: TBevel;
    Timer1: TTimer;
    cbSongLengths: TCheckBox;
    DrivesPanel: TPanel;
    cbEject: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelClick(Sender: TObject);
    procedure ToggleItems(Enabled : Boolean);
    procedure AddMp3ToCatalogue(Mp3Filename, CatalogueName, CatalogueNumber : String);
    function AddArtistToCatalogue(Artist : String) : Integer;
    function AddAlbumToCatalogue(Album : String; ArtistID : Integer) : Integer;
    function AddGenreToCatalogue(Genre : String) : Integer;
    function AddCatalogueToCatalogue(Catalogue, CatalogueNumber : String) : Integer;
    procedure AddCatalogue;
    procedure EasyFileSearch1FileFound(FileFound: TFileInformations);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ceDirectoryChange(Sender: TObject);
    procedure ceDirectoryButtonClick(Sender: TObject);
    procedure bNextClick(Sender: TObject);
    procedure bPreviousClick(Sender: TObject);
    procedure ButtonClick(Sender: TObject);
    procedure bCloseClick(Sender: TObject);
    procedure edCatalogueVolNameChange(Sender: TObject);
    procedure edCatalogueIDChange(Sender: TObject);
    function EasyFileSearch1AcceptFile(
      FileFound: TFileInformations): Boolean;
      procedure UpdateProgressList(MP3Filename : String);
    function GetTrackNumber(TrackString : String) : Integer;
    function CheckYear(YearString : String) : Integer;
    procedure edCatalogueIDKeyPress(Sender: TObject; var Key: Char);
    function CheckGenre(GenreString : String) : String;
    function GetTrackLength(Mp3Filename : String) : String;
    procedure NewBitBtnClick(Sender: TObject);
    procedure GetDriveShortcuts;
    procedure GetDriveInfo(Drive : string);
    procedure Eject(Drive: String);
    procedure PBFolderDialogInitialized(Sender: TPBFolderDialog;
      DialogHandle: HWND);
  private
    { Private declarations }
  public
    { Public declarations }
    addingmp3, CancelAdd : Boolean;
    AmountFound, AmountAdded, CatalogueCount : Integer;
    SongsList : TStringList;
    VolName, VolSerial : string;
  end;

var
  AddWizardForm: TAddWizardForm;
  FileTag3v2: Tid3v2Tag;
  FileTag3v1: Tid3Tag;
  PrevDir, PrevAlbumTitle : String;
  {PrevArtistID,} PrevAlbumID : Integer;

implementation

uses Main, datamod;

{$R *.DFM}

procedure TAddWizardForm.Eject(Drive: String);
var  OpenParm: TMCI_Open_Parms;
begin
  OpenParm.dwCallback := 0;
  OpenParm.lpstrDeviceType := 'CDAudio';
  OpenParm.lpstrElementName := PChar(Drive);
  mciSendCommand(0, MCI_OPEN, MCI_OPEN_ELEMENT or MCI_OPEN_TYPE, Longint(@OpenParm));
  mciSendCommand(OpenParm.wDeviceID, MCI_SET, MCI_SET_DOOR_OPEN, 0);
  mciSendCommand(OpenParm.wDeviceID, MCI_CLOSE, MCI_NOTIFY, Longint(@OpenParm));
end;

function MinimizeNameForCaption(const Filename : string; MaxWidth :
integer) : string;
var
  ncm : TNonClientMetrics;
  img : TImage;
begin
  Result := '';

  ncm.cbSize := SizeOF(TNonClientMetrics);
  SystemParametersInfo(SPI_GETNONCLIENTMETRICS,
                       SizeOf(TNonClientMetrics),
                       @ncm,
                       0);
  img := TImage.Create(nil);
  try
    img.Canvas.Font.Name := ncm.lfCaptionFont.lfFaceName;

    if ncm.lfCaptionFont.lfWeight = FW_BOLD then
      img.Canvas.Font.Style := [fsBold];

    if ncm.lfCaptionFont.lfItalic <> 0 then
      img.Canvas.Font.Style := [fsItalic];

    Result := MinimizeName(Filename, img.Canvas, MaxWidth);
  finally
    img.Free;
  end;
end;

function GetVolumeName(szDriveRoot: PChar): string;
(* szDriveRoot should be 'A:\', 'a:\', 'C:\' etc *)
var
  volname: array [0..255] of char;
  volnamelen: DWORD;
  volumeserialnumber: DWORD;
  maxfilenamelen: DWORD;
  filesystemflags: DWORD;
  filesystemname: array [0..255] of char;
  fsnamelen: DWORD;
begin
  volnamelen := 256;
  volumeserialnumber := 0;
  maxfilenamelen := 0;
  filesystemflags := 0;
  fsnamelen := 256;
  Windows.GetVolumeInformation(szDriveRoot, volname, volnamelen,
    @volumeserialnumber, maxfilenamelen, filesystemflags,
    filesystemname, fsnamelen);
  GetVolumeName := volname;
end;

function GetFileSize(const FileName: String): Int64;
Var
  FFD: TWIN32FindData;
begin
  If Windows.FindClose( Windows.FindFirstFile( PChar(FileName), FFD) ) then
  begin
    Result:=(FFD.nFileSizeHigh * MAXDWORD) + FFD.nFileSizeLow;
  end
  else
    Result:=0;
end;

function TAddWizardForm.AddArtistToCatalogue(Artist : String) : Integer;
begin
//  Artists.Open;
  if dmMain.Artists.Locate('Artist_Name', Artist, [loCaseInsensitive]) = True then
    Result := dmMain.Artists.fieldbyname('ID').AsInteger else
    begin
      dmMain.Artists.Insert;
      dmMain.Artists.FieldByName('Artist_Name').AsString := Artist;
      dmMain.Artists.Post;
      Result := dmMain.Artists.fieldbyname('ID').AsInteger;
    end;
//  Artists.Close;
end;

function TAddWizardForm.AddAlbumToCatalogue(Album : String; ArtistID : Integer) : Integer;
begin
//  Albums.Open;
  if dmMain.Albums.Locate('Album_Title;Artist_ID', VarArrayOf([Album, ArtistID]), [loCaseInsensitive]) = True then
    Result := dmMain.Albums.fieldbyname('ID').AsInteger else
    begin
      dmMain.Albums.Insert;
      dmMain.Albums.FieldByName('Album_Title').AsString := Album;
      dmMain.Albums.FieldByName('Artist_ID').AsInteger := ArtistID;
      dmMain.Albums.Post;
      Result := dmMain.Albums.fieldbyname('ID').AsInteger;
    end;
//  Albums.Close;
end;

function TAddWizardForm.AddGenreToCatalogue(Genre : String) : Integer;
begin
//  Genres.Open;
  if dmMain.Genres.Locate('Genre_Name', Genre, [loCaseInsensitive]) = True then
    Result := dmMain.Genres.fieldbyname('ID').AsInteger else
    begin
      dmMain.Genres.Insert;
      dmMain.Genres.FieldByName('Genre_Name').AsString := Genre;
      dmMain.Genres.Post;
      Result := dmMain.Genres.fieldbyname('ID').AsInteger;
    end;
//  Genres.Close;
end;

function TAddWizardForm.AddCatalogueToCatalogue(Catalogue, CatalogueNumber : String) : Integer;
begin
//  Catalogues.Open;
  if dmMain.Catalogues.Locate('Catalogue_Name', Catalogue, [loCaseInsensitive]) = True then
    Result := dmMain.Catalogues.fieldbyname('ID').AsInteger else
    begin
      dmMain.Catalogues.Insert;
      dmMain.Catalogues.FieldByName('Catalogue_Name').AsString := Catalogue;
//      dmMain.Catalogues.FieldByName('Volume_Name').AsString := DiskInfo.VolumeLabel;
      dmMain.Catalogues.FieldByName('Volume_Name').AsString := VolName;
//      dmMain.Catalogues.FieldByName('Serial').AsString := DiskInfo.SerialNumberStr;
      dmMain.Catalogues.FieldByName('Serial').AsString := VolSerial;
      dmMain.Catalogues.FieldByName('Catalogue_Number').AsInteger := StrToInt(CatalogueNumber);
      dmMain.Catalogues.FieldByName('Created_Date').AsDateTime := now;
      dmMain.Catalogues.FieldByName('Comments').AsString := mCatalogueNotes.Lines.Text;
      dmMain.Catalogues.Post;
      Result := dmMain.Catalogues.fieldbyname('ID').AsInteger;
    end;
//  Catalogues.Close;
end;

procedure TAddWizardForm.AddMp3ToCatalogue(Mp3Filename, CatalogueName, CatalogueNumber : String);
var ArtistID, AlbumID, GenreID, CatalogueID{, slashpos, PrevAlbumID} : Integer;
    {FileSizeMB : Real;}
    TagFound : Boolean;
    ArtistName, AlbumName : String;

  procedure AddSong;
  var TrackNum,Year, StrPos : Integer;
      TempInt : Word;
      TempStr, GenreStr, Dir1, Dir2 : string;
  begin
  //By default add 3v2 tag details to catalogue else add 3v1 if doesnt exist
   tempInt := FileTag3v2.loadFromFile(Mp3Filename, 0);
   if (tempInt <= 255) then
    begin
      dmMain.Songs.Insert;
      FileTag3v2.getAsciiText('TPE1', TempStr);
      ArtistID := AddArtistToCatalogue(TempStr);
      FileTag3v2.getAsciiText('TALB', tempStr);
      if (PrevDir = ExtractFileDir(Mp3Filename)) and (PrevAlbumTitle = tempStr) then  //Added for compilation cds with different artist names
      begin
        AlbumID := PrevAlbumID;
      end else
        AlbumID := AddAlbumToCatalogue(tempStr, ArtistID);

      FileTag3v2.getAsciiText('TCON', tempStr);
      GenreStr := CheckGenre(TempStr);
      GenreID := AddGenreToCatalogue(GenreStr);
      CatalogueID := AddCatalogueToCatalogue(CatalogueName, CatalogueNumber);
      dmMain.Songs.FieldByName('Artist_ID').AsInteger := ArtistID;
      dmMain.Songs.FieldByName('Album_ID').AsInteger := AlbumID;
      dmMain.Songs.FieldByName('Catalogue_ID').AsInteger := CatalogueID;
      FileTag3v2.getAsciiText('TIT2', tempStr);
      dmMain.Songs.FieldByName('Song_Title').AsString := tempStr;
      FileTag3v2.getAsciiText('TYER', tempStr);
      Year := CheckYear(TempStr);
      If Year > -1 then
        dmMain.Songs.FieldByName('Year').AsInteger := Year;
      dmMain.Songs.FieldByName('Genre_ID').AsInteger := GenreID;
      dmMain.Songs.FieldByName('Filename').AsString := Mp3Filename;
      FileTag3v2.getAsciiText('TRCK', tempStr);
      TrackNum := GetTrackNumber(tempStr);
      if TrackNum > 0 then
        dmMain.Songs.FieldByName('Track_Number').AsInteger := TrackNum;
      dmMain.Songs.FieldByName('Filesize').AsFloat := GetFileSize(Mp3Filename);

      if cbSongLengths.Checked then
        dmMain.Songs.FieldByName('Length').AsString := GetTrackLength(Mp3Filename);

      dmMain.Songs.Post;
      AmountAdded := AmountAdded + 1;
      TagFound := True;
      UpdateProgressList(Mp3Filename);

      PrevDir := ExtractFileDir(Mp3Filename);
//      PrevArtistID := ArtistID;
      PrevAlbumID := AlbumID;
      FileTag3v2.getAsciiText('TALB', tempStr);
      PrevAlbumTitle := tempStr;

    end else
    begin
      tempInt := FileTag3v1.loadFromFile(Mp3Filename);
      if (tempInt <= 255) then
        begin
          dmMain.Songs.Insert;
          ArtistID := AddArtistToCatalogue(FileTag3v1.Artist);

          if (PrevDir = ExtractFileDir(Mp3Filename)) and (PrevAlbumTitle = FileTag3v1.Album) then
          begin
            AlbumID := PrevAlbumID;
          end else
            AlbumID := AddAlbumToCatalogue(FileTag3v1.Album, ArtistID);

  //        GenreID := AddGenreToCatalogue(FileTag3v1.Genre);
          CatalogueID := AddCatalogueToCatalogue(CatalogueName, CatalogueNumber);
          dmMain.Songs.FieldByName('Artist_ID').AsInteger := ArtistID;
          dmMain.Songs.FieldByName('Album_ID').AsInteger := AlbumID;
          dmMain.Songs.FieldByName('Catalogue_ID').AsInteger := CatalogueID;
          dmMain.Songs.FieldByName('Song_Title').AsString := FileTag3v1.Title;
          Year := CheckYear(FileTag3v1.Year);
          If Year > -1 then
            dmMain.Songs.FieldByName('Year').AsInteger := Year;
  //        if FileTag3v1.Year <> '' then
  //          MainForm.Songs.FieldByName('Year').AsInteger := StrToInt(FileTag3v1.Year);
  //        MainForm.Songs.FieldByName('Genre_ID').AsInteger := GenreID;
          dmMain.Songs.FieldByName('Filename').AsString := Mp3Filename;

          TrackNum := GetTrackNumber(IntToStr(FileTag3v1.Track));
          if TrackNum > 0 then
            dmMain.Songs.FieldByName('Track_Number').AsInteger := TrackNum;

         // if FileTag3v1.Track > 0 then MainForm.Songs.FieldByName('Track_Number').AsInteger := FileTag3v1.Track;
          dmMain.Songs.FieldByName('Filesize').AsFloat := GetFileSize(Mp3Filename);
          if cbSongLengths.Checked then
            dmMain.Songs.FieldByName('Length').AsString := GetTrackLength(Mp3Filename);

          dmMain.Songs.Post;
          AmountAdded := AmountAdded + 1;
          TagFound := True;
          UpdateProgressList(Mp3Filename);

          PrevDir := ExtractFileDir(Mp3Filename);
    //      PrevArtistID := ArtistID;
          PrevAlbumID := AlbumID;
          PrevAlbumTitle := FileTag3v1.Album;
        end;
    end;

    if TagFound = False then
    begin
      dmMain.Songs.Insert;

      //No tag found so use filename etc for catalogue entry
      dmMain.Songs.FieldByName('Song_Title').AsString :=
        copy(ExtractFilename(Mp3Filename), 0, length(ExtractFilename(Mp3Filename))-length(ExtractFileext(Mp3Filename)));

//      //Use Parent Directory as Artist name
//      ArtistName := Extractfiledir(Mp3Filename);
//      while pos('\', ArtistName) <> 0 do
//      begin
//        slashpos := pos('\', ArtistName);
//        delete(ArtistName,1, slashpos);
//      end;

      TempStr := ExtractFilePath(Mp3Filename);
      StrPos := pos(':\', TempStr);
      Delete(TempStr, 1, StrPos + 1);

      if StrPos > 0 then  //First directory used for artist name
      begin
        StrPos := pos('\', TempStr);
        Dir1 := copy(TempStr, 0, StrPos - 1);
        ArtistName := Dir1;
        Delete(TempStr, 1, StrPos);
      end;

      StrPos := pos('\', TempStr); //Second directory used for album name
      if StrPos > 0 then
      begin
        Dir2 := copy(TempStr, 0, StrPos - 1);
        AlbumName := Dir2;
        Delete(TempStr, 1, StrPos);
      end;

      ArtistID := AddArtistToCatalogue(ArtistName);
      AlbumID := AddAlbumToCatalogue(AlbumName, ArtistID);
  //        GenreID := AddGenreToCatalogue(' ');
      CatalogueID := AddCatalogueToCatalogue(CatalogueName, CatalogueNumber);

      dmMain.Songs.FieldByName('Album_ID').AsInteger := AlbumID;
      dmMain.Songs.FieldByName('Artist_ID').AsInteger := ArtistID;
      dmMain.Songs.FieldByName('Catalogue_ID').AsInteger := CatalogueID;
  //        MainForm.Songs.FieldByName('Genre_ID').AsInteger := GenreID;
      dmMain.Songs.FieldByName('Filename').AsString := Mp3Filename;
      dmMain.Songs.FieldByName('Filesize').AsFloat := GetFileSize(Mp3Filename);

      if cbSongLengths.Checked then
        dmMain.Songs.FieldByName('Length').AsString := GetTrackLength(Mp3Filename);

      dmMain.Songs.Post;
      AmountAdded := AmountAdded + 1;
      UpdateProgressList(Mp3Filename);
    end;
  end;

begin
  TagFound := False;
  //Only add song if it hasnt already been added to catalogue
  AmountFound := AmountFound + 1;

{  if cbDuplicates.Checked = False then
  begin
    if MainForm.Songs.Locate('Filename', Mp3Filename, [loCaseInsensitive]) = False then
    begin
      AddSong;
    end;
  end else
  begin
    if MainForm.Songs.Locate('Filename', Mp3Filename, [loCaseInsensitive]) = True then
    begin
      AddSong;
    end;
  end;}

{  if MainForm.Songs.Locate('Filename', Mp3Filename, [loCaseInsensitive]) = False then
  begin}


  AddSong;
{  end;}

end;

procedure TAddWizardForm.ToggleItems(Enabled : Boolean);
begin
  ceDirectory.Enabled := Enabled;
  cbIncludeSubFolders.Enabled := Enabled;
  edCatalogueID.Enabled := Enabled;
  edCatalogueVolName.Enabled := Enabled;
  lbCatID.Enabled := Enabled;
  lbCatName.Enabled := Enabled;
  cbDuplicates.Enabled := Enabled;

  if Enabled = True then
  begin
    ceDirectory.Color := clWindow;
    edCatalogueID.Color := clWindow;
    edCatalogueVolName.Color := clWindow;
  end else
  begin
    ceDirectory.Color := clBtnFace;
    edCatalogueID.Color := clBtnFace;
    edCatalogueVolName.Color := clBtnFace;
  end;
end;

procedure TAddWizardForm.FormClose(Sender: TObject; var Action: TCloseAction);
var     Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      WriteInteger('CatalogueCount', CatalogueCount);
      WriteBool('IncludeSubFolders', cbIncludeSubFolders.Checked);
      WriteBool('Duplicates', cbDuplicates.Checked);
      WriteBool('Eject', cbEject.Checked);
      CloseKey;
    end;
  finally
    Reg.Free;
  end;

  if AmountAdded > 0 then
  begin
    dmMain.dsqSongs.DisableControls;
    MainForm.RefreshMp3List;
    dmMain.dsqSongs.EnableControls;
    MainForm.RefreshGenreLists;
    MainForm.RefreshCatalogueLists;
  end;
  MainForm.StatusBar.Panels[0].ImageIndex := -1;
  MainForm.StatusBar.Panels[1].Text := '';
end;

procedure TAddWizardForm.bCancelClick(Sender: TObject);
begin
  CancelAdd := true;
  close;
end;

procedure TAddWizardForm.AddCatalogue;
var i : Integer;
begin
  CancelAdd := False;
  ToggleItems(False);
  bPrevious.Visible := False;
  bNext.Visible := False;
  bClose.Caption := '&Cancel';
  lbProgressItems.Items.Clear;
  application.ProcessMessages;
  AmountFound := 0;
  AmountAdded := 0;
  PrevDir := '';
//  PrevArtistID := -1;
  PrevAlbumID := -1;
  PrevAlbumTitle := '';
  GetDriveInfo(Copy(ceDirectory.Text, 1, 1));

  if cbIncludeSubFolders.Checked = True then EasyFileSearch1.SearchOptions := [okIncludeSubfolder, okLookForAnyFile] else
    EasyFileSearch1.SearchOptions := [okLookForAnyFile];
  EasyFileSearch1.FileNames.Clear;
  EasyFileSearch1.FileNames.Add('*.mp3');
  EasyFileSearch1.RootPath := ceDirectory.Text;

  try
    SongsList := TStringlist.Create;
    EasyFileSearch1.Search;
    MainForm.StatusBar.Panels[1].Text := '';
    MainForm.StatusBar.Panels[1].Component := MainForm.ProgressBar1;
    MainForm.ProgressBar1.step := 1;
    MainForm.ProgressBar1.Position := 0;
    MainForm.ProgressBar1.Visible := True;
    MainForm.ProgressBar1.Max := SongsList.Count;
    MainForm.OpenTables;
    for i:=0 to SongsList.Count-1 do
    begin
      if CancelAdd = true then exit;
      AddMp3ToCatalogue(SongsList.Strings[i], edCatalogueVolName.Text, edCatalogueID.Text);
      MainForm.ProgressBar1.StepIt;
      Application.ProcessMessages;
    end;
  finally
    MainForm.CloseTables;
    MainForm.StatusBar.Panels[1].Component := nil;
    MainForm.ProgressBar1.Visible := False;
    SongsList.Free;
    ToggleItems(True);
  end;

  lbProgressItems.Items.Add('');
  lbProgressItems.Items.Add('Mp3''s found: '+Inttostr(AmountFound)+' / Mp3''s added: '+IntToStr(AmountAdded));
  lbProgressItems.ItemIndex := lbProgressItems.Items.Count - 1;

  try
    StrToInt(edCatalogueID.Text);
    CatalogueCount := StrToInt(edCatalogueID.Text);
    Inc(CatalogueCount);
    edCatalogueID.Text := IntToStr(CatalogueCount);
  except
  end;

  if AmountAdded > 0 then
  begin
    dmMain.dsqSongs.DisableControls;
    MainForm.RefreshMp3List;
    dmMain.dsqSongs.EnableControls;
    AmountAdded := 0;
  end;

  bPrevious.Visible := True;
  bPrevious.Caption := '&Add Another';
  bClose.Caption := '&Close';

  if cbEject.Checked = True then
  begin
    Eject(Copy(ceDirectory.Text, 1, 1));
  end;
end;

procedure TAddWizardForm.EasyFileSearch1FileFound(FileFound: TFileInformations);
begin
  if CancelAdd = true then exit;

  SongsList.Add(FileFound.Path+FileFound.Name);
//  AddMp3ToCatalogue(FileFound.Path+FileFound.Name, edCatalogueVolName.Text, edCatalogueID.Text);
end;

procedure TAddWizardForm.FormCreate(Sender: TObject);
var Reg : TRegistry;
begin
  GetDriveShortcuts;

  nb.PageIndex := 0;
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);

  MainForm.StatusBar.Panels[1].Text := 'Add a new catalogue';

  MainForm.StatusBar.Panels[0].ImageIndex := 4;
  CancelAdd := False;
  AmountFound := 0;
  AmountAdded := 0;


  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      try
        CatalogueCount := ReadInteger('CatalogueCount');
      except
        CatalogueCount := 1;
      end;
      try
        cbIncludeSubFolders.Checked := ReadBool('IncludeSubFolders');
      except
        cbIncludeSubFolders.Checked := True;
      end;
      try
        cbDuplicates.Checked := ReadBool('Duplicates');
      except
        cbDuplicates.Checked := True;
      end;
      try
        cbEject.Checked := ReadBool('Eject');
      except
        cbEject.Checked := True;
      end;
      CloseKey;
    end;
  finally
    Reg.Free;
  end;


{  IniFile := TIniFile.Create(ExtractFilePath(application.exename)+'settings.ini');
  CatalogueCount := IniFile.ReadInteger('Configuration', 'CatalogueCount', 1);
  cbIncludeSubFolders.Checked := IniFile.ReadBool('Configuration', 'IncludeSubFolders', True);
  cbRedisplay.Checked := IniFile.ReadBool('Configuration', 'RedisplaySearch', True);
  cbDuplicates.Checked := IniFile.ReadBool('Configuration', 'Duplicates', True);
  IniFile.Free;}

  edCatalogueID.Text := IntToStr(CatalogueCount);
  ButtonClick(nil);
end;

procedure TAddWizardForm.FormShow(Sender: TObject);
begin
  AddWizardForm.Font := MainForm.Font;
  lDirectory.Font := MainForm.Font;
  lDirectory.Font.Color := clHighlightText;
  lDirectory.Font.Style := [fsBold];
  lCatDetails.Font := MainForm.Font;
  lCatDetails.Font.Color := clHighlightText;
  lCatDetails.Font.Style := [fsBold];
  lProgress.Font := MainForm.Font;
  lProgress.Font.Color := clHighlightText;
  lProgress.Font.Style := [fsBold];

  {SearchForm.}Caption := 'Add Wizard [1/3]';
  ceDirectory.SetFocus;
end;

procedure TAddWizardForm.ceDirectoryChange(Sender: TObject);
begin
  bNext.Enabled := (length(ceDirectory.Text) > 0);

  if length(ceDirectory.Text) > 0 then
  begin
//    DiskInfo.Disk := copy(ceDirectory.Text, 0, 1)[1];
    edCatalogueVolName.Text := GetVolumeName(pchar(ceDirectory.Text));
//    edCatalogueVolName.Text := DiskInfo.VolumeLabel;
  end;
end;

procedure TAddWizardForm.ceDirectoryButtonClick(Sender: TObject);
begin
  if PBFolderDialog.Execute then ceDirectory.Text := PBFolderDialog.Folder;
  ceDirectoryChange(nil);
end;

procedure TAddWizardForm.bNextClick(Sender: TObject);
begin
  ButtonClick(bNext);
end;

procedure TAddWizardForm.bPreviousClick(Sender: TObject);
begin
  ButtonClick(bPrevious);
end;

procedure TAddWizardForm.ButtonClick(Sender: TObject);
begin
  if Sender = bPrevious then
  begin
    if bPrevious.Caption = '&Add Another' then
    begin
      //Reset everything as starting process again
      bPrevious.Caption := '&Previous';
      nb.PageIndex := 0;
      bNext.Visible := True;
//      ceDirectory.Text := '';
//      edCatalogueID.Text := '';
      edCatalogueVolName.Text := '';
      VolName := '';
      VolSerial := '';
      mCatalogueNotes.Lines.Clear;
      ButtonClick(nil);
    end;

    if nb.PageIndex > 0 then nb.PageIndex := nb.PageIndex - 1;
  end else
  if Sender = bNext then
  begin
    if nb.PageIndex < 2 then nb.PageIndex := nb.PageIndex + 1;
  end;

  case nb.PageIndex of
  0 : begin
        bPrevious.Enabled := False;
        bNext.Enabled := (length(ceDirectory.Text) > 0);
        {SearchForm.}Caption := 'Add Wizard [1/3]';
      end;
  1 : begin
        bPrevious.Enabled := True;
        bNext.enabled := (length(edCatalogueID.Text) > 0) and (length(edCatalogueVolName.Text) > 0);
        {SearchForm.}Caption := 'Add Wizard [2/3]';
      end;
  2 : begin
        {SearchForm.}Caption := 'Add Wizard [3/3]';
        if Sender = bNext then AddCatalogue;
      end;
  end;
end;

procedure TAddWizardForm.bCloseClick(Sender: TObject);
begin
  CancelAdd := true;
  close;
end;

procedure TAddWizardForm.edCatalogueVolNameChange(Sender: TObject);
begin
  bNext.enabled := (length(edCatalogueID.Text) > 0) and (length(edCatalogueVolName.Text) > 0);
end;

procedure TAddWizardForm.edCatalogueIDChange(Sender: TObject);
begin
  bNext.enabled := (length(edCatalogueID.Text) > 0) and (length(edCatalogueVolName.Text) > 0);
end;

function TAddWizardForm.EasyFileSearch1AcceptFile(FileFound: TFileInformations): Boolean;
begin
  application.ProcessMessages;
end;

procedure TAddWizardForm.UpdateProgressList(MP3Filename : String);
begin
  lbProgressItems.Items.Add(MinimizeNameForCaption(Mp3Filename, 294));
  lbProgressItems.ItemIndex := lbProgressItems.Items.Count - 1;
end;

function TAddWizardForm.CheckGenre(GenreString : String) : String;
var startpos : Integer;
begin
  //Sometimes tags have (genre number)genre description e.g. (13)Pop
  //Just need description
  if GenreString = '' then Result := '';
  startpos := pos(')', GenreString);
  if startpos > 0 then
  begin
    Result := copy(GenreString, startpos + 1, length(GenreString) - 1);
  end;
end;

function TAddWizardForm.CheckYear(YearString : String) : Integer;
begin
  if YearString = '' then Result := -1;
  try
    StrToInt(YearString);
    Result := StrToInt(YearString);
  except
    Result := -1;
  end;
end;

function TAddWizardForm.GetTrackLength(Mp3Filename : String) : String;
var Min,Sec : Integer;
begin
  //Get file length  - really slow using media player
  try
    MediaPlayer.FileName := Mp3Filename;
    MediaPlayer.Open;
    MediaPlayer.TimeFormat := tfMilliseconds;
    Sec := MediaPlayer.TrackLength[1] Div 1000;
    Min := Sec Div 60;
    Sec := Sec Mod 60;
    MediaPlayer.Close;
    Result := Format('%.2d:%.2d',[Min,Sec]);
  except
    Result := '';
  end;
end;

function TAddWizardForm.GetTrackNumber(TrackString : String) : Integer;
var Slashpos : Integer;
    TrackNumber : String;
begin
  if TrackString = '' then Result := -1;
  try
    StrToInt(TrackString);
    Result := StrToInt(TrackString);
  except
    SlashPos := pos('/', TrackString);
    if Slashpos > 0 then
    begin
      TrackNumber := copy(TrackString, 0, slashpos -1);
      try
        Result := StrToInt(TrackNumber);
      except
        Result := -1;
      end;
    end else Result := -1;
  end;
end;

procedure TAddWizardForm.edCatalogueIDKeyPress(Sender: TObject;
  var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TAddWizardForm.NewBitBtnClick(Sender: TObject);
var NewBtn : TSpeedButton;
  Drive, DriveType : String;
begin
  NewBtn := (Sender as TSpeedButton);
  Drive := copy(NewBtn.Name, length(NewBtn.Name), 1);
  ceDirectory.Text := Drive + ':\';
  ceDirectoryChange(nil);
end;

procedure TAddWizardForm.GetDriveInfo(Drive : string);
var
  TmpRootPathName,
  TmpVolumeName,
  TmpFileSystemName: string;
  TmpMaxCompLen,
  TmpFileSystemFlags,
  TmpSerialNumber: DWORD;
  const
{  SFmt : string =
    'Root path name       : %s'#13#10 +
    'Volume name          : %s'#13#10 +
    'File system name     : %s'#13#10 +
    'Max component length : %d'#13#10 +
    'File system flags    : %d'#13#10 +
    'Serial number        : %.4x-%.4x';}
  SerialFmt : string = '%.4x-%.4x';
begin
  SetLength(TmpVolumeName, MAX_PATH);
  SetLength(TmpFileSystemName, MAX_PATH);
  TmpRootPathName := Drive + ':';
  GetVolumeInformation(
    PCHAR(TmpRootPathName),
    PCHAR(TmpVolumeName),
    Length(TmpVolumeName),
    @TmpSerialNumber,
    TmpMaxCompLen,
    TmpFileSystemFlags,
    PCHAR(TmpFileSystemName),
    Length(TmpFileSystemName));
  SetLength(TmpVolumeName, StrLen(PCHAR(TmpVolumeName)));
  SetLength(TmpFileSystemName, StrLen(PCHAR(TmpFileSystemName)));


{  ShowMessage( Format(SFmt, [
     RootPathName,
     VolumeName,
     FileSystemName,
     MaxCompLen,
     FileSystemFlags,
     SerialNumber SHR 16,
     SerialNumber AND $FFFF]));}
  VolSerial := Format(SerialFmt, [TmpSerialNumber SHR 16, TmpSerialNumber AND $FFFF]);
  VolName := TmpVolumeName;
end;

procedure TAddWizardForm.GetDriveShortcuts;
var DriveBitmask: set of 0..25;
  Drive, PreviousPos, Count: Integer;
  NewBtn : TSpeedButton;
  NewLabel : TLabel;
  NewBtnBitmap : TBitmap;
  DriveType : String;

  function GetDriveType(Path:string):string;
  var
    lpPath: array[0..259] of char;
  begin
    StrPCopy(lpPath,Path);
    case GetDriveTypeA(lpPath) of
      2: Result := 'Removeable media';
      3: Result := 'Fixed drive';
      4: Result := 'Remote drive';
      5: Result := 'CD-ROM';
      6: Result := 'RAM-disk';
      else Result := 'Unknown';
    end;
  end;

begin
  Integer(DriveBitmask) := GetLogicalDrives();
  PreviousPos := -45;
  Count := 0;
  for Drive := 0 to 25 do
    if Drive in DriveBitmask then
    begin
      if Count < 6 then
      begin
        NewBtn := TSpeedButton.Create(self);  //Create drive shortcut button
        NewBtn.Parent := DrivesPanel;
        NewBtn.Name := 'NewBtn'+Chr(Drive+Ord('A'));
        NewBtn.OnClick := NewBitBtnClick;
        NewBtn.Tag := Drive;
        NewBtn.Height := 45;
        NewBtn.GroupIndex := 1;
        NewBtn.Width := 45;
        NewBtn.Flat := True;
        NewBtn.Layout := blGlyphBottom;
        NewBtn.Left := PreviousPos + NewBtn.Width + 5;
        NewBtn.Top := 8;
        NewBtn.Visible := True;

        NewBtnBitmap := TBitmap.Create; //Set drive shortcut buttons icon
       { if (Chr(Drive+Ord('A')) = 'A') or (Chr(Drive+Ord('A')) = 'B') then  //Used as DiskInfo accesses diskdrive which you dont want.
        begin
          ImageList32x32.GetBitmap(0, NewBtnBitmap);
        end else
        begin}
          DriveType := GetDriveType(Chr(Drive+Ord('A'))+':\');
          NewBtn.Hint := DriveType+' '+Chr(Drive+Ord('A'))+':\';
          NewBtn.ShowHint := True;
//          DiskInfo.Disk := Chr(Drive+Ord('A'));
       {   if DiskInfo.DriveType = dtCDROM then
            ImageList32x32.GetBitmap(1, NewBtnBitmap) else
          if DiskInfo.DriveType = dtFixed then
            ImageList32x32.GetBitmap(2, NewBtnBitmap) else
          if DiskInfo.DriveType = dtNetwork then
            ImageList32x32.GetBitmap(3, NewBtnBitmap) else
            ImageList32x32.GetBitmap(2, NewBtnBitmap); //Default set to harddisk image}
          if DriveType = 'Removeable media' then
            MainForm.ImageList32x32.GetBitmap(0, NewBtnBitmap) else
          if DriveType = 'CD-ROM' then
            MainForm.ImageList32x32.GetBitmap(1, NewBtnBitmap) else
          if DriveType = 'Fixed drive' then
            MainForm.ImageList32x32.GetBitmap(2, NewBtnBitmap) else
          if DriveType = 'Remote drive' then
            MainForm.ImageList32x32.GetBitmap(3, NewBtnBitmap) else
            MainForm.ImageList32x32.GetBitmap(2, NewBtnBitmap);
//        end;
        NewBtn.Glyph := NewBtnBitmap;
        NewBtnBitmap.Free;

        PreviousPos := NewBtn.Left;
        NewLabel := TLabel.Create(self);  //Create drive shortcut button label
        NewLabel.AutoSize := False;
        NewLabel.Top := NewBtn.Top + NewBtn.Height + 5;
        NewLabel.Left := NewBtn.Left;
        NewLabel.Width := NewBtn.Width;
        NewLabel.parent := DrivesPanel;
        NewLabel.Caption := Chr(Drive+Ord('A')) + ':';
        NewLabel.Alignment := taCenter;
        Count := Count + 1;
      end;
    end;
end;


procedure TAddWizardForm.PBFolderDialogInitialized(Sender: TPBFolderDialog;
  DialogHandle: HWND);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(PBFolderDialog.DialogHandle, (255 * MainForm.Percents) div 100);
end;

initialization
  FileTag3v2 := Tid3v2tag.create;
  FileTag3v1 := Tid3tag.create;

finalization
  if FileTag3v2 <> nil then FileTag3v2.free;
  if FileTag3v1 <> nil then FileTag3v1.free;

end.
