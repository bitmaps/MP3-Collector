{
  Components Used:
  ----------------
  1st Class 3000         - http://www.woll2woll.com
  DBISAM                 - http://www.elevatesoft.com
  FileSearch             - ?
  ID3v1 Tag              - http://www.audioxl.com
  ID3v2 Tag              - http://www.audioxl.com
  InfoPower 3000         - http://www.woll2woll.com
  PBFolderDialog         - http://home11.inet.tele.dk/BakSoft/
  RxLib                  - ?
  Toolbar 2000           - http://www.jrsoftware.org
  TBX                    - http://www.g32.org/tbx/
  TBXThemes              - http://www.rmklever.com/
  PJVersionInfo          - http://www.delphidabbler.com


  Date:       Notes:
  09/12/2003  Replaced TBXIEditItems with TEdit as they didnt work with program shortcut keys
              and are missing lots of events.

}

unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ExtCtrls, {ID3v2, ID3,} Db, DBISAMTb, ComCtrls,
  Grids, DBGrids, EasyFileSearch, FileSearch, ImgList, ToolWin, Menus,
  Wwdbigrd, Wwdbgrid, Buttons, fcStatusBar, ShellAPI, tbxthemes, 
  TB2Item, TB2ExtItems, TBXExtItems, TB2Dock, TB2Toolbar, TBX, TBXSwitcher,
  TBXStripesTheme, TBXOfficeXPTheme, Registry, DBCtrls,
  TBXAcroTheme, TBXMonaiTheme, TBXMonaiXPTheme, TBXNewOfficeXPTheme,
  TBXNexos2Theme, TBXNexosTheme, TBXOffice11AdaptiveTheme,
  TBXOffice11XPTheme, TBXOffice2003Theme, TBXOfficeCTheme,
  TBXOfficeKTheme, TBXOfficeXPGradientTheme, TBXRomaTheme,
  TBXTristan2Theme, TBXTristanTheme, {TBXWosTheme, TBXLongHornTheme,}
  TBXAthenTheme, TBXAthenXTheme, TBXDkPanels, Placemnt;

const
  WS_EX_LAYERED = $80000;
  LWA_COLORKEY = 1;
  LWA_ALPHA    = 2;
  ApplicationName = 'MP3 Collection Manager';
  Homepage = 'http://www.dingdangdo.com/';

type
  PMyRec = ^TMyRec;
  TMyRec = record
    CatID: integer;
    ArtId: integer;
    AlbId: Integer;
  end;

  TMenuParent = (mpFile, mpQuery);
  //Parent menu types
  TSetLayeredWindowAttributes = function (
     hwnd : HWND;         // handle to the layered window
     crKey : TColor;      // specifies the color key
     bAlpha : byte;       // value for the blend function
     dwFlags : DWORD      // action
     ): BOOL; stdcall;

  TMainForm = class(TForm)
    ImageList16x16: TImageList;
    StatusBar: TfcStatusBar;
    SaveDialog: TSaveDialog;
    Panel1: TPanel;
    pcSongs: TPageControl;
    tsSongs: TTabSheet;
    tbdSongsTop: TTBDock;
    tbxtArtist: TTBXToolbar;
    TBXLabelItem1: TTBXLabelItem;
    tbxeArtist: TEdit;
    tbxtCatalogue: TTBXToolbar;
    TBXLabelItem4: TTBXLabelItem;
    tbxeCatNo: TEdit;
    tbxtGenre: TTBXToolbar;
    TBXLabelItem6: TTBXLabelItem;
    tbxtTrack: TTBXToolbar;
    TBXLabelItem7: TTBXLabelItem;
    tbxeTrackNo: TEdit;
    tbxtFileDetails: TTBXToolbar;
    TBXLabelItem9: TTBXLabelItem;
    tbxeFilename: TEdit;
    dbgSongs: TwwDBGrid;
    tbdSongsBottom: TTBDock;
    tbdTop: TTBDock;
    tbxtFileMenu: TTBXToolbar;
    tbxiAdd: TTBXItem;
    tbxiDelete: TTBXItem;
    TBXSwitcher: TTBXSwitcher;
    tbxtMainMenu: TTBXToolbar;
    TBXSIFile: TTBXSubmenuItem;
    TBXSIView: TTBXSubmenuItem;
    TBXSIHelp: TTBXSubmenuItem;
    tbxiFileFilter: TTBXItem;
    tbxiFileAdd: TTBXItem;
    tbxiFileDelete: TTBXItem;
    tbxiFileExit: TTBXItem;
    tbxiViewArtist: TTBXItem;
    tbxiViewCatalogue: TTBXItem;
    tbxiViewGenre: TTBXItem;
    tbxiViewFilename: TTBXItem;
    tbxiViewTrack: TTBXItem;
    tbxiHomepage: TTBXItem;
    tbxiAbout: TTBXItem;
    TBXSeparatorItem3: TTBXSeparatorItem;
    tbxiSettings: TTBXItem;
    tbxiDbSave: TTBXItem;
    tbxiDbCancel: TTBXItem;
    EasyFileSearch: TEasyFileSearch;
    TBXSeparatorItem5: TTBXSeparatorItem;
    tbxtChanges: TTBXToolbar;
    tbxiSave: TTBXItem;
    tbxiCancel: TTBXItem;
    tbxtNavigation: TTBXToolbar;
    tbxiFirst: TTBXItem;
    tbxiPrevious: TTBXItem;
    tbxiNext: TTBXItem;
    tbxiLast: TTBXItem;
    TBXSINavigation: TTBXSubmenuItem;
    tbxiNavFirst: TTBXItem;
    tbxiNavPrevious: TTBXItem;
    tbxiNavNext: TTBXItem;
    tbxiNavLast: TTBXItem;
    TBXSeparatorItem4: TTBXSeparatorItem;
    tsProperties: TTabSheet;
    pcSongProperties: TPageControl;
    tsSongDetails: TTabSheet;
    tsMP3Details: TTabSheet;
    gbID3v1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ev1Title: TEdit;
    ev1Artist: TEdit;
    ev1Album: TEdit;
    ev1Genre: TEdit;
    ev1TrackNo: TEdit;
    ev1Year: TEdit;
    Label17: TLabel;
    ev1Comment: TEdit;
    cbIDV3v1: TCheckBox;
    gbID3v2: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    ev2Title: TEdit;
    ev2Artist: TEdit;
    ev2Album: TEdit;
    ev2Genre: TEdit;
    ev2TrackNo: TEdit;
    ev2Year: TEdit;
    cbIDV3v2: TCheckBox;
    mv2Comment: TMemo;
    gbMPEG: TGroupBox;
    ev2Composer: TEdit;
    ev2OrigArtist: TEdit;
    ev2Copyright: TEdit;
    ev2URL: TEdit;
    ev2EncodedBy: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    bmp3CopyID3v2: TButton;
    bmp3CopyID3v1: TButton;
    tsPlaylist: TTabSheet;
    pmMainGrid: TPopupMenu;
    pmMainDelete: TMenuItem;
    pmMainPlay: TMenuItem;
    N1: TMenuItem;
    tbxcbGenre: TComboBox;
    tsAlbumDetails: TTabSheet;
    GroupBox1: TGroupBox;
    dbgAlbumTracks: TwwDBGrid;
    GroupBox2: TGroupBox;
    eAlbumAlbumName: TEdit;
    TBXSIReports: TTBXSubmenuItem;
    Panel5: TPanel;
    gbsSongs: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    speSong: TEdit;
    speAlbum: TEdit;
    speTrackNum: TEdit;
    speYear: TEdit;
    speArtist: TEdit;
    gbsCatalogue: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    speCatNum: TEdit;
    gbsFile: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    speFilename: TEdit;
    speSize: TEdit;
    bCopyID3v2: TButton;
    bCopyID3v1: TButton;
    spcbGenres: TComboBox;
    spcbCatName: TComboBox;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    Panel7: TPanel;
    mLyrics: TMemo;
    tbxiRepAlbumLyrics: TTBXItem;
    speLength: TEdit;
    Label30: TLabel;
    pmMainSongDetails: TMenuItem;
    pmMainCatalogueDetails: TMenuItem;
    pmMainAlbumDetails: TMenuItem;
    N2: TMenuItem;
    Panel4: TPanel;
    Panel8: TPanel;
    Splitter1: TSplitter;
    Panel9: TPanel;
    Panel10: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Panel11: TPanel;
    dbgPlaylists: TwwDBGrid;
    bNewPlaylist: TButton;
    bDeletePlaylist: TButton;
    Panel12: TPanel;
    dbgPlaylistSongs: TwwDBGrid;
    pmAddSongToPlaylist: TMenuItem;
    pmAddAlbumToPlaylist: TMenuItem;
    bExportPlaylist: TButton;
    pmAddAllToPlaylist: TMenuItem;
    PlaylistBreak: TMenuItem;
    tbxiRepCatalogues: TTBXItem;
    tbxiRepArtists: TTBXItem;
    tbxiRepAlbums: TTBXItem;
    tbxiRepAlbumsFull: TTBXItem;
    tbxtAlbum: TTBXToolbar;
    TBXLabelItem3: TTBXLabelItem;
    tbxeAlbum: TEdit;
    tbxiViewAlbum: TTBXItem;
    pmTopToolbar: TPopupMenu;
    pmTopMenuButtonLabels: TMenuItem;
    tbxtTitle: TTBXToolbar;
    TBXLabelItem2: TTBXLabelItem;
    tbxeTitle: TEdit;
    tbxiViewTitle: TTBXItem;
    tbxtCatalogueName: TTBXToolbar;
    TBXLabelItem5: TTBXLabelItem;
    tbxcbCatName: TComboBox;
    tbxiViewCatalogueName: TTBXItem;
    tbxtYear: TTBXToolbar;
    TBXLabelItem8: TTBXLabelItem;
    tbxeYear: TEdit;
    tbxiViewYear: TTBXItem;
    pmQueryToolbar: TPopupMenu;
    pmvqAlbum: TMenuItem;
    pmvqArtist: TMenuItem;
    pmvqCatalogue: TMenuItem;
    pmvqCatalogueName: TMenuItem;
    pmvqGenre: TMenuItem;
    pmvqFilename: TMenuItem;
    pmvqTitle: TMenuItem;
    pmvqTrack: TMenuItem;
    pmvqYear: TMenuItem;
    TBXSeparatorItem1: TTBXSeparatorItem;
    tbxiRepCatFileLising: TTBXItem;
    TBXMDMainRight: TTBXMultiDock;
    TBXMDMainBottom: TTBXMultiDock;
    TBXMDMainLeft: TTBXMultiDock;
    TBXMDMainTop: TTBXMultiDock;
    TBXMultiDock1: TTBXMultiDock;
    TBXMultiDock2: TTBXMultiDock;
    TBXSIQuerys: TTBXSubmenuItem;
    TBXISaveFilter: TTBXItem;
    TBXIDeleteFilter: TTBXItem;
    TBXSeparatorItem2: TTBXSeparatorItem;
    fpMain: TFormPlacement;
    StartupTimer: TTimer;
    ProgressBar1: TProgressBar;
    pmMainQuickQuery: TMenuItem;
    pmQQArtist: TMenuItem;
    pmQQAlbum: TMenuItem;
    pmQQCatalogue: TMenuItem;
    pmDelArtist: TMenuItem;
    pmDelSong: TMenuItem;
    pmDelAlbum: TMenuItem;
    pmDelCatalogue: TMenuItem;
    TBXDPTreeview: TTBXDockablePanel;
    FilterTV: TTreeView;
    tbxiFilterTreeBar: TTBXItem;
    Panel13: TPanel;
    cbTreeFilter: TCheckBox;
    tbxiFileReset: TTBXItem;
    tbxtQueryMenu: TTBXToolbar;
    tbxiReset: TTBXItem;
    ImageList32x32: TImageList;
    tbxiFilter: TTBXSubmenuItem;
    tbxiBlankFilterText: TTBXItem;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RefreshMp3List;
    Procedure SetupDatabase(DatabasePath : String);
    procedure dbgSongsTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgArtistsTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgCataloguesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure tbxiFilterClick(Sender: TObject);
    procedure tbxiAddClick(Sender: TObject);
    procedure tbxiDeleteClick(Sender: TObject);
//    procedure tbxiExportClick(Sender: TObject);
    procedure tbxiSaveClick(Sender: TObject);
    procedure tbxiCancelClick(Sender: TObject);
    procedure tbxtArtistClose(Sender: TObject);
    procedure tbxtCatalogueClose(Sender: TObject);
    procedure tbxtGenreClose(Sender: TObject);
    procedure tbxtTrackClose(Sender: TObject);
    procedure tbxtFileDetailsClose(Sender: TObject);
    procedure tbxiAboutClick(Sender: TObject);
    procedure tbxiViewArtistClick(Sender: TObject);
    procedure tbxiViewCatalogueClick(Sender: TObject);
    procedure tbxiViewGenreClick(Sender: TObject);
    procedure tbxiViewTrackClick(Sender: TObject);
    procedure tbxiViewFilenameClick(Sender: TObject);
    procedure tbxiSettingsClick(Sender: TObject);
    procedure tbxiFileExitClick(Sender: TObject);
    procedure IconLayout(LayoutStyle : Integer);
    procedure ShowIconText(ShowText : Integer);
//    procedure tbxsiExportClick(Sender: TObject);
    procedure EasyFileSearchStatistics(Stats: TStatistics);
    procedure OpenTables;
    procedure RefreshTotals;
    procedure MainSQL(OrderBy{, Filter} : String);
    procedure tbxiFirstClick(Sender: TObject);
    procedure tbxiPreviousClick(Sender: TObject);
    procedure tbxiNextClick(Sender: TObject);
    procedure tbxiLastClick(Sender: TObject);
    procedure pcSongsChange(Sender: TObject);
    procedure speArtistChange(Sender: TObject);
    procedure speSongChange(Sender: TObject);
    procedure speAlbumChange(Sender: TObject);
    procedure speTrackNumChange(Sender: TObject);
    procedure speYearChange(Sender: TObject);
    procedure speCatNumChange(Sender: TObject);
    procedure pmMainDeleteClick(Sender: TObject);
    procedure pmMainPlayClick(Sender: TObject);
    procedure spcbGenresChange(Sender: TObject);
    procedure spcbCatNameChange(Sender: TObject);
    procedure RefreshGenreLists;
    procedure RefreshCatalogueLists;
    procedure pcSongPropertiesChange(Sender: TObject);
    procedure dbgAlbumTracksMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgAlbumTracksDblClick(Sender: TObject);
    procedure eAlbumAlbumNameChange(Sender: TObject);
    procedure mLyricsChange(Sender: TObject);
    procedure tbxiRepAlbumLyricsClick(Sender: TObject);
    procedure ProgramHints;
    Procedure ShowHint(Sender: TObject);
    procedure SetTransparentForm(AHandle : THandle; AValue : byte = 0);
    procedure pmMainCatalogueDetailsClick(Sender: TObject);
    procedure pmMainSongDetailsClick(Sender: TObject);
    procedure pmMainAlbumDetailsClick(Sender: TObject);
    procedure tbxiHomepageClick(Sender: TObject);
    procedure bNewPlaylistClick(Sender: TObject);
    procedure pmAddSongToPlaylistClick(Sender: TObject);
    procedure PlaylistsAfterScroll(DataSet: TDataSet);
    procedure bDeletePlaylistClick(Sender: TObject);
    procedure pmAddAlbumToPlaylistClick(Sender: TObject);
    procedure bExportPlaylistClick(Sender: TObject);
    procedure speYearKeyPress(Sender: TObject; var Key: Char);
    procedure speCatNumKeyPress(Sender: TObject; var Key: Char);
    procedure speTrackNumKeyPress(Sender: TObject; var Key: Char);
    procedure ev1TrackNoKeyPress(Sender: TObject; var Key: Char);
    procedure ev1YearKeyPress(Sender: TObject; var Key: Char);
    procedure ev2TrackNoKeyPress(Sender: TObject; var Key: Char);
    procedure ev2YearKeyPress(Sender: TObject; var Key: Char);
    procedure tbxiRepCataloguesClick(Sender: TObject);
    procedure CreateHTMLStyleSheet(CSSFilename : String);
    procedure tbxiRepArtistsClick(Sender: TObject);
    procedure tbxiRepAlbumsClick(Sender: TObject);
    procedure TBXItem4Click(Sender: TObject);
    procedure RefreshAlbumDetails;
    procedure SongDetailsHint;
    procedure DefaultStatusBarHint;
    procedure RefreshTabChangeDetails;
    procedure RefreshPlaylistSongs;
    procedure tbxiViewAlbumClick(Sender: TObject);
    procedure pmMainGridPopup(Sender: TObject);
    procedure dbgSongsDblClick(Sender: TObject);
    procedure pmTopMenuButtonLabelsClick(Sender: TObject);
    procedure tbxiViewTitleClick(Sender: TObject);
    procedure tbxiViewCatalogueNameClick(Sender: TObject);
    procedure tbxiViewYearClick(Sender: TObject);
    procedure tbxtYearClose(Sender: TObject);
    procedure tbxtCatalogueNameClose(Sender: TObject);
    procedure tbxtAlbumClose(Sender: TObject);
    procedure tbxtTitleClose(Sender: TObject);
    procedure SetTheme(ThemeNumber : Integer);
    procedure tbxiRepCatFileLisingClick(Sender: TObject);
    procedure TBXISaveFilterClick(Sender: TObject);
    procedure TBXIDeleteFilterClick(Sender: TObject);
    procedure AddFilterMenu(Sender : TObject; Method : TNotifyEvent);
    procedure RunSavedFilter(Sender : TObject);
    procedure StartupTimerTimer(Sender: TObject);
    procedure ToggleGui(Enabled : Boolean);
    procedure pmQQArtistClick(Sender: TObject);
    procedure pmQQCatalogueClick(Sender: TObject);
    procedure pmQQAlbumClick(Sender: TObject);
    procedure pmDelCatalogueClick(Sender: TObject);
    procedure pmDelSongClick(Sender: TObject);
    procedure pmDelArtistClick(Sender: TObject);
    procedure pmDelAlbumClick(Sender: TObject);
    procedure ProcessFilterTV(FilterType : Integer);
    procedure StandardFilterTV;
    procedure ArtistFilterTV;
    procedure AlphaArtistFilterTV;
    procedure tbxiFilterTreeBarClick(Sender: TObject);
    procedure TBXDPTreeviewClose(Sender: TObject);
    procedure FilterTVExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure cbTreeFilterClick(Sender: TObject);
    procedure FilterTVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pmtvCatalogueDetailsClick(Sender: TObject);
    procedure FilterTVKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function GetDriveTypeImageIndex(Path:string):integer;
    procedure pcSongsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tbxiResetClick(Sender: TObject);
    procedure tbxiBlankFilterTextClick(Sender: TObject);
    procedure CloseTables;
  private
    { Private declarations }
    procedure PropertiesModeStatus;
    procedure ClearSongDetails;
    function CheckQueryFilter(FilterStr : String) : String;
    function CheckFilterLine(FilterStr : String) : String;
    procedure CatalogueSQL(OrderBy : String);
    procedure ArtistSQL(OrderBy : String);
    procedure DoTVFilter;
    procedure RunFilter;
    procedure EnableFilterMode;
    procedure ConfirmSaveEntry;
    procedure ToggleSaveMode(Toggle : Boolean);
    procedure SaveSettings;
    procedure LoadSettings;
    procedure DisplaySongPropertiesSongDetails;
    procedure SongPropertiesSaveCatalogueDetails;
    procedure ShowMP3Details(Mp3Filename : String);
    procedure ToggleID3v1Details(Toggle : Boolean);
    procedure ToggleID3v2Details(Toggle : Boolean);
    procedure PlaySong(Filename : String);
    procedure AddSongToPlaylist(SongID, PlaylistID : Integer);
    procedure AddAlbumToPlaylist(AlbumID, PlaylistID : Integer);
    procedure DeletePlaylistAndSongs;
    procedure ExportPlaylist(ExportFilename : String);
    procedure SongsDblClick;
    function CreateMenuItem(Caption : string; Method : TNotifyEvent ) : TTBCustomItem;
    function AddMenuItem(MenuParent : TMenuParent; Caption : string; Method : TNotifyEvent ) : TTBCustomItem;
    procedure GetFont( afont: TFont );
  public
    ConfirmSave, UseFilterBar, PropertiesIsLoading : Boolean;
    OrderBy : String;
    Percents, SongsDbl, AutoFilterBar : Integer;
//    DisplayTag3v2: Tid3v2Tag;
//    DisplayTag3v1: Tid3Tag;
    TVFilterType : Integer;
  end;

var
  MainForm: TMainForm;
  CaptionTotals, ShowHints, SongsDesc, CatDesc, ArtDesc, ModifiedEntry : Boolean;

implementation

uses datamod, AddWizard, Delete, Settings, ReportFilter, CatalogueDetails, PlaylistDetails, Reports,
     Tables, Splash, Filters, SaveFilter;

{$R *.dfm}

function TMainForm.GetDriveTypeImageIndex(Path:string):integer;
var
  lpPath: array[0..259] of char;
begin
  StrPCopy(lpPath,Path);
  case GetDriveTypeA(lpPath) of
    2: Result := 0;
    3: Result := 2;
    4: Result := 3;
    5: Result := 1;
    6: Result := 2;
    else Result := -1;
  end;
end;

function AutolaunchReport : Integer;
var Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      try
        Result := ReadInteger('AutoLaunchRep');
      except
        Result := 0;
      end;
      CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

Procedure TMainForm.GetFont( afont: TFont );
var
  ncMetrics: TNonClientMetrics;
begin
  assert(assigned(afont));
  ncMetrics.cbSize := sizeof(TNonClientMetrics);
  SystemParametersInfo(SPI_GETNONCLIENTMETRICS,
                       sizeof(TNonClientMetrics),
                       @ncMetrics, 0);
  afont.Handle  := CreateFontIndirect(ncMetrics.lfMessageFont);

{
  The TNonClientMetrics structure also contains information on other fonts
  used in the non-client area:

  lfCaptionFont         Font used in regular captions
  lfSmCaptionFont       Font used in small captions
  lfMenuFont            Font used in menus
  lfStatusFont          Font used in status bars
  lfMessageFont         Font used in message boxes
}
end;

procedure TMainForm.SetTransparentForm(AHandle : THandle; AValue : byte = 0);
var
 Info: TOSVersionInfo;
 SetLayeredWindowAttributes: TSetLayeredWindowAttributes;
begin
 //Check Windows version
 Info.dwOSVersionInfoSize := SizeOf(Info);
 GetVersionEx(Info);
 if (Info.dwPlatformId = VER_PLATFORM_WIN32_NT) and
 (Info.dwMajorVersion >= 5) then
   begin
     SetLayeredWindowAttributes := GetProcAddress(GetModulehandle(user32), 'SetLayeredWindowAttributes');
      if Assigned(SetLayeredWindowAttributes) then
       begin
        SetWindowLong(AHandle, GWL_EXSTYLE, GetWindowLong(AHandle, GWL_EXSTYLE) or WS_EX_LAYERED);
        //Make form transparent
        SetLayeredWindowAttributes(AHandle, 0, AValue, LWA_ALPHA);
      end;
   end;
end;

procedure TMainForm.ProgramHints;
begin
  tbxiFileReset.Hint := tbxiReset.Hint;
  tbxiFileFilter.Hint := tbxiFilter.Hint;
  tbxiFileAdd.Hint := tbxiAdd.Hint;
  tbxiFileDelete.Hint := tbxiDelete.Hint;
  tbxiDbSave.Hint := tbxiSave.Hint;
  tbxiDBCancel.Hint := tbxiCancel.Hint;
  tbxiNavFirst.Hint := tbxiFirst.Hint;
  tbxiNavPrevious.Hint := tbxiPrevious.Hint;
  tbxiNavNext.Hint := tbxiNext.Hint;
  tbxiNavLast.Hint := tbxiLast.Hint;
end;

procedure TMainForm.ConfirmSaveEntry;
var ErrorStr : String;
begin
  if ModifiedEntry = False then exit;

  if pcSongs.ActivePage = tsProperties then
  begin
    if pcSongProperties.ActivePage = tsSongDetails then
    begin
      //Validate entries
      ErrorStr := '';
      if speArtist.Text = '' then
      begin
        ErrorStr := 'Artist'+#13+#10;
      end;
      if speSong.Text = '' then
      begin
        ErrorStr := ErrorStr+'Song'+#13+#10;
      end;
      if speCatNum.Text = '' then
      begin
        ErrorStr := ErrorStr+'Catalogue #'+#13+#10;
      end;
      if spcbCatName.Text = '' then
      begin
        ErrorStr := ErrorStr+'Catalogue Name';
      end;
      if ErrorStr <> '' then
      begin
        ErrorStr := 'The following fields are required: '+#13+#10+#13+#10+ErrorStr;
        MessageDlg(ErrorStr, mtError, [mbOK], 0);
        exit;
      end;
    end;
  end;

{  if ConfirmSave = False then
  begin
    ConfirmForm := TConfirmForm.create(nil);
    if ConfirmForm.ShowModal = mrOk then
    begin
     if (pcSongs.ActivePage = tsProperties) then SongPropertiesSaveCatalogueDetails;
    end;
    ConfirmForm.Free;
  end else
  begin}
    if (pcSongs.ActivePage = tsProperties) then SongPropertiesSaveCatalogueDetails;
{  end;}
end;

{Procedure TMainForm.SaveEntry;
var ArtistID, AlbumID, GenreID, CatalogueID, TempID, TempCatID, TempArtID : Integer;
    Save_Cursor:TCursor;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    StatusBar.Panels[1].text := 'Saving...';
    ArtistID := 0;
    AlbumID := 0;
    GenreID := 0;
    CatalogueID := 0;

    StatusBar.Panels[0].ImageIndex := 17;
    ModifiedEntry := False;
    if dmMain.Songs.Locate('ID', dmMain.dsqSongs.fieldbyname('ID').AsInteger,  [loCaseInsensitive]) = True then
    begin
      dmMain.Songs.Edit;
  //    if tbxeArtist.Text <> '' then
      ArtistID := SearchForm.AddArtistToCatalogue(tbxeArtist.Text);
      if tbxeAlbum.Text <> '' then
        AlbumID := SearchForm.AddAlbumToCatalogue(tbxeAlbum.Text, ArtistID);
  //    if tbxeGenre.Text <> '' then
  //      GenreID := SearchForm.AddGenreToCatalogue(tbxeGenre.Text);
      if tbxcbGenre.Text <> '' then
        GenreID := SearchForm.AddGenreToCatalogue(tbxcbGenre.Text);

      if tbxeCatNo.Text <> '' then
        CatalogueID := SearchForm.AddCatalogueToCatalogue(tbxcbCatName.Text, tbxeCatNo.Text);
      if ArtistID > 0 then
        dmMain.Songs.FieldByName('Artist_ID').AsInteger := ArtistID;
      if AlbumID > 0 then
        dmMain.Songs.FieldByName('Album_ID').AsInteger := AlbumID;
      if CatalogueID > 0 then
        dmMain.Songs.FieldByName('Catalogue_ID').AsInteger := CatalogueID;
      if tbxeTitle.Text <> '' then
        dmMain.Songs.FieldByName('Song_Title').AsString := tbxeTitle.Text;
      if length(tbxeYear.Text) > 0 then
        dmMain.Songs.FieldByName('Year').AsInteger := StrToInt(tbxeYear.Text) else
          dmMain.Songs.FieldByName('Year').Value := null;
      if GenreID > 0 then
        dmMain.Songs.FieldByName('Genre_ID').AsInteger := GenreID else
          dmMain.Songs.FieldByName('Genre_ID').Value := null;
      if tbxeFilename.Text <> '' then
        dmMain.Songs.FieldByName('Filename').AsString := tbxeFilename.Text;
      if length(tbxeTrackNo.Text) > 0 then
        dmMain.Songs.FieldByName('Track_Number').AsInteger := StrToInt(tbxeTrackNo.Text) else
          dmMain.Songs.FieldByName('Track_Number').Value := null;
      dmMain.Songs.Post;
      TempID := dmMain.dsqSongs.fieldbyname('ID').AsInteger;
      TempCatID := dmMain.dsqSongs.fieldbyname('Catalogue_ID').AsInteger;//dmMain.dsqCatalogues.fieldbyname('ID').AsInteger;
      TempArtID := dmMain.dsqSongs.fieldbyname('Artist_ID').AsInteger;//dmMain.dsqArtists.fieldbyname('ID').AsInteger;

      //Refresh
      dmMain.dsqSongs.DisableControls;
      RefreshMp3List;
      dmMain.dsqSongs.EnableControls;

      //Go back to record you saved
      dmMain.dsqSongs.Locate('ID', TempID,  [loCaseInsensitive]);
    end;
  //  StatusBar.Panels[1].text := '';
    DefaultStatusBarHint;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;}

Procedure TMainForm.SetupDatabase(DatabasePath : String);
begin
  EasyFileSearch.FileNames.Clear;
  EasyFileSearch.FileNames.Add('*.dat');
  EasyFileSearch.FileNames.Add('*.idx');
  EasyFileSearch.RootPath := DatabasePath;
  EasyFileSearch.Search;


  dmMain.DBISAMDatabase.Connected := False;
  dmMain.DBISAMDatabase.Directory := DatabasePath;
  dmMain.DBISAMDatabase.Connected := True;
end;

Procedure TMainForm.ShowHint(Sender: TObject);
Begin
  if (ShowHints = True) and (ProgressBar1.Visible = False) then
    StatusBar.Panels[1].text := Application.Hint
  else
    DefaultStatusBarHint;
End;

procedure TMainForm.OpenTables;
begin
  dmMain.Songs.Open;
  dmMain.Albums.Open;
  dmMain.Artists.Open;
  dmMain.Genres.Open;
  dmMain.Catalogues.Open;
  dmMain.Playlists.Open;
  dmMain.PlaylistSongs.Open;
end;

procedure TMainForm.CloseTables;
begin
  dmMain.PlaylistSongs.Close;
  dmMain.Playlists.Close;
  dmMain.Songs.Close;
  dmMain.Albums.Close;
  dmMain.Artists.Close;
  dmMain.Genres.Close;
  dmMain.Catalogues.Close;
end;

procedure TMainForm.MainSQL(OrderBy{, Filter }: String);
var SQLString : TStringList;
    Save_Cursor:TCursor;
begin
  try
    ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    dmMain.dsqSongs.DisableControls;
    SQLString := TStringlist.Create;

    SQLString.Add(' Select Songs.ID, Songs.Song_Title, Songs.Track_Number, Songs.Year, Songs.Filename, Songs.Filesize, Songs.Lyrics, Songs.Length, ');
    SQLString.Add(' Albums.ID Album_ID, Albums.Album_Title, ');
    SQLString.Add(' Artists.ID Artist_ID, Artists.Artist_Name, ');
    SQLString.Add(' Genres.Genre_Name, ');
    SQLString.Add(' Catalogues.ID Catalogue_ID, Catalogues.Catalogue_Name, Catalogues.Catalogue_Number ');
    SQLString.Add(' From Songs, Artists, Catalogues ');
    SQLString.Add(' LEFT OUTER JOIN Genres ON Songs.Genre_ID = Genres.ID ');
    SQLString.Add(' LEFT OUTER JOIN Albums ON Songs.Album_ID = Albums.ID ');
    SQLString.Add(' Where Songs.Artist_ID = Artists.ID ');
    SQLString.Add(' and Songs.Catalogue_ID = Catalogues.ID ');
    if length(OrderBy) > 0 then
      SQLString.Add(' Order by '+ OrderBy);


    dmMain.dsqSongs.Active := False;
    dmMain.dsqSongs.sql.Clear;
    dmMain.dsqSongs.sql.AddStrings(SQLString);

    ProgressBar1.Visible := True;
    StatusBar.Panels[1].Text := '';
    StatusBar.Panels[1].Component := MainForm.ProgressBar1;
    ProgressBar1.Position := 1;

    dmMain.dsqSongs.Active := True;
    StatusBar.Panels[1].Component := nil;
    ProgressBar1.Visible := False;
    SQLString.Free;
    dmMain.dsqSongs.EnableControls;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TMainForm.CatalogueSQL(OrderBy : String);
begin
end;

procedure TMainForm.ArtistSQL(OrderBy : String);
begin
end;

procedure TMainForm.ClearSongDetails;
begin
  ModifiedEntry := False;
  { Clear all captions }
  tbxeArtist.Text := '';
  tbxeTitle.Text := '';
  tbxeAlbum.Text := '';
//  tbxeGenre.Text := '';
  tbxcbGenre.Text := '';
  tbxcbCatName.Text := '';
  tbxeFilename.Text := '';
  tbxeCatNo.Text := '';
  tbxeTrackNo.Text := '';
  tbxeYear.Text := '';
//  tbxeFilesize.Text := '';
end;

procedure TMainForm.CloseButtonClick(Sender: TObject);
begin
  { Exit }
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var DatabasePath{, OldIndex} : String;
    Reg : TRegistry;
begin
//  IsReadOnly := False;
  dbgSongs.IniAttributes.FileName := 'Software\'+ApplicationName;
  dbgAlbumTracks.IniAttributes.FileName := 'Software\'+ApplicationName;
  dbgPlaylists.IniAttributes.FileName := 'Software\'+ApplicationName;
  dbgPlaylistSongs.IniAttributes.FileName := 'Software\'+ApplicationName;
  fpMain.IniFilename := 'Software\'+ApplicationName;
  fpMain.IniSection := 'MainFormConfig';
  Caption := ApplicationName;
  Application.Title := ApplicationName;

  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      try
        DatabasePath := ReadString('DatabasePath');
      except
        DatabasePath := ExtractFilePath(application.exename);
      end;
      CloseKey;
    end;
  finally
    Reg.Free;
  end;


  if length(DatabasePath) = 0 then DatabasePath := ExtractFilePath(application.exename);
  SetupDatabase(DatabasePath);
  LoadSettings;
//  Timer.Enabled := True;
  application.ProcessMessages;
  SongsDesc := True;
  CatDesc := True;
  ArtDesc := True;
  ModifiedEntry := False;

//  OpenTables;
  RefreshGenreLists;
  RefreshCatalogueLists;

  Application.OnHint := ShowHint;
  DefaultStatusBarHint;

  tsMP3Details.TabVisible := False; //Not finished yet
  tsPlaylist.TabVisible := False; //Not finished yet
  pmAddSongToPlaylist.Visible := tsPlaylist.TabVisible;
  pmAddAlbumToPlaylist.Visible := tsPlaylist.TabVisible;
  pmAddAllToPlaylist.Visible := tsPlaylist.TabVisible;
  PlaylistBreak.Visible := tsPlaylist.TabVisible;
  ProgressBar1.Visible := False;
  ProgramHints;
  ShowHints := True;
  Application.OnHint := ShowHint;
  AddFilterMenu(nil, RunSavedFilter);
  if Percents <> 100 then
    SetTransparentForm(Handle, (255 * Percents) div 100);  // setup transparency in percents : (255 * Percents) / 100
end;

procedure TMainForm.RefreshGenreLists;
var OldIndex : String;
begin
  tbxcbGenre.Clear;
  OldIndex := dmMain.Genres.IndexName;
  dmMain.Genres.Open;
  dmMain.Genres.IndexName := 'iGenre_Name';
  dmMain.Genres.First;
  while not dmMain.Genres.Eof do
  begin
    if (spcbGenres.Items.IndexOf(dmMain.Genres.fieldByName('Genre_Name').AsString) = -1) and
       (dmMain.Genres.fieldByName('Genre_Name').AsString <> '') and
       (dmMain.Genres.fieldByName('Genre_Name').AsString <> ' ') then
       spcbGenres.Items.Add(dmMain.Genres.fieldByName('Genre_Name').AsString);

    if (tbxcbGenre.Items.IndexOf(dmMain.Genres.fieldByName('Genre_Name').AsString) = -1) and
       (dmMain.Genres.fieldByName('Genre_Name').AsString <> '') and
       (dmMain.Genres.fieldByName('Genre_Name').AsString <> ' ') then
        tbxcbGenre.Items.Add(dmMain.Genres.fieldByName('Genre_Name').AsString);

    dmMain.Genres.Next;
  end;
  dmMain.Genres.IndexName := OldIndex;
  dmMain.Genres.Close;
end;

procedure TMainForm.RefreshCatalogueLists;
var OldIndex : String;
begin
  tbxcbCatName.Clear;
  OldIndex := dmMain.Catalogues.IndexName;
  dmMain.Catalogues.IndexName := 'iCatalogue_Name';
  dmMain.Catalogues.Open;
  dmMain.Catalogues.First;
  while not dmMain.Catalogues.Eof do
  begin
    if (spcbCatName.Items.IndexOf(dmMain.Catalogues.fieldByName('Catalogue_Name').AsString) = -1) and
       (dmMain.Catalogues.fieldByName('Catalogue_Name').AsString <> '') and
       (dmMain.Catalogues.fieldByName('Catalogue_Name').AsString <> ' ') then
       spcbCatName.Items.Add(dmMain.Catalogues.fieldByName('Catalogue_Name').AsString);

    if (tbxcbCatName.Items.IndexOf(dmMain.Catalogues.fieldByName('Catalogue_Name').AsString) = -1) and
       (dmMain.Catalogues.fieldByName('Catalogue_Name').AsString <> '') and
       (dmMain.Catalogues.fieldByName('Catalogue_Name').AsString <> ' ') then
        tbxcbCatName.Items.Add(dmMain.Catalogues.fieldByName('Catalogue_Name').AsString);

    dmMain.Catalogues.Next;
  end;
  dmMain.Catalogues.Close;
  dmMain.Catalogues.IndexName := OldIndex;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  CloseTables;
  SaveSettings;
end;

procedure TMainForm.RefreshMp3List;
begin
  ProgressBar1.Visible := True;
  StatusBar.Panels[1].Text := '';
  StatusBar.Panels[1].Component := MainForm.ProgressBar1;
  ProgressBar1.Position := 1;
  dmMain.dsqSongs.DisableControls;
  dmMain.dsqSongs.Active := False;
  dmMain.dsqSongs.Active := True;
  StatusBar.Panels[1].Component := nil;
  ProgressBar1.Visible := False;
  dmMain.dsqSongs.EnableControls;

  if TBXDPTreeview.Visible then ProcessFilterTV(TVFilterType);

  RefreshTotals;
end;

procedure TMainForm.RefreshTotals;
var CatFilter, ArtFilter : String;
begin
  if CaptionTotals = True then
  begin
    if dmMain.dsqSongs.Active then tsSongs.Caption := 'Songs - '+IntToStr(dmMain.dsqSongs.RecordCount) else
      tsSongs.Caption := 'Songs';
  end;

  if dmMain.dsqSongs.Active = True then
    if dmMain.dsqSongs.RecordCount = 0 then ClearSongDetails;

  if dmMain.dsqSongs.Active then StatusBar.Panels[2].Text := {'Songs: '+}IntToStr(dmMain.dsqSongs.recordcount)
   + ' / ' + IntToStr(dmMain.SongsTotal) else StatusBar.Panels[2].Text := ''{'Songs: 0 / 0'};
  
end;

procedure TMainForm.EnableFilterMode;
begin
  DefaultStatusBarHint;
  ClearSongDetails;
  pcSongs.ActivePage := tsSongs;

  if tbxtArtist.Visible then
  begin
    {tbxtArtist.View.Selected := tbxtArtist.View.Find(tbxeArtist);
    tbxtArtist.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxeArtist.SetFocus;
  end else
  if tbxtTitle.Visible then
  begin
    {tbxtTitle.View.Selected := tbxtTitle.View.Find(tbxeTitle);
    tbxtTitle.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxeTitle.SetFocus;
  end else
  if tbxtAlbum.Visible then
  begin
    {tbxtAlbum.View.Selected := tbxtAlbum.View.Find(tbxeAlbum);
    tbxtAlbum.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxeAlbum.SetFocus;
  end else
  if tbxtCatalogue.Visible then
  begin
    {tbxtCatalogue.View.Selected := tbxtCatalogue.View.Find(tbxcbCatName);
    tbxtCatalogue.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxcbCatName.SetFocus;
  end else
  if tbxtCatalogueName.Visible then
  begin
    {tbxtCatalogueName.View.Selected := tbxtCatalogueName.View.Find(tbxeCatNo);
    tbxtCatalogueName.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxeCatNo.SetFocus;
  end else
{    if tbxtGenre.Visible then
  begin
    tbxtGenre.View.Selected := tbxtGenre.View.Find(tbxeGenre);
    tbxtGenre.View.EnterToolbarLoop([tbetMouseDown]);
  end else}
  if tbxtFileDetails.Visible then
  begin
    {tbxtFileDetails.View.Selected := tbxtFileDetails.View.Find(tbxeFilename);
    tbxtFileDetails.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxeFilename.SetFocus;
  end else
  if tbxtTrack.Visible then
  begin
    {tbxtTrack.View.Selected := tbxtTrack.View.Find(tbxeTrackNo);
    tbxtTrack.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxeTrackNo.SetFocus;
  end else
  if tbxtYear.Visible then
  begin
    {tbxtYear.View.Selected := tbxtYear.View.Find(tbxeYear);
    tbxtYear.View.EnterToolbarLoop([tbetMouseDown]);}
    tbxeYear.SetFocus;
  end;

  cbTreeFilter.Checked := False;
  dmMain.dsqSongs.Filter := '';
  dmMain.dsqSongs.Filtered := False;
  RefreshTotals;
end;

function TMainForm.CheckQueryFilter(FilterStr : String) : String;
begin
  if pos('>', FilterStr) > 0 then
  begin
    result := FilterStr;
    exit;
  end;
  if pos('<', FilterStr) > 0 then
  begin
    result := FilterStr;
    exit;
  end;
  result := ' = '+FilterStr;
end;

function TMainForm.CheckFilterLine(FilterStr : String) : String;
var StrPos : Integer;
 FirstBit , SecondBit : String;
begin
  StrPos := pos('''', FilterStr);
  if StrPos > 0 then
  begin
    FirstBit := copy(FilterStr, 0, StrPos);
    SecondBit := copy(FilterStr, StrPos, length(FilterStr)-1);
    Result := FirstBit+''+SecondBit;
  end else Result := FilterStr;
end;

Function FindAndReplace(MainString : string; Find : string; Replace : string; CaseSensitive : boolean):string;
var
  position : integer;
begin
  result := MainString;
  if (Find = replace) then exit;                 // no endless loops
  if (MainString = '')or(Find = '') then exit;   // need string + find

  result := '';

  position := 1;
  while position <= length(mainstring) do
    if ((copy(mainstring,position,length(find)) = find)and casesensitive)
    or ((uppercase(copy(mainstring,position,length(find))) = uppercase(find))and not casesensitive) then
      begin
        // Delete does NOT appear to like parentheses - use 2 'copy' functions to
        // copy the text before the text to be replaced and that from the end of
        // the replaced text to the end of the string.
        MainString := copy(mainstring,0,position -1) + copy(mainstring,position + length(find),length(MainString));
        //Delete(MainString,position,length(Find));         // cut
        insert(replace,MainString,position);              // replace
        position := position + length(replace);           // move to end of replace
      end
    else
      position := position + 1;                           // move to next pos

  result := MainString;
end;

function CheckLikeFilter(SQLFilter, FilterText : string) : string;
begin
  FilterText := FindAndReplace(FilterText, '*', '%', False);

  if Pos('%', FilterText) > 0  then
    Result := ' upper('+SQLFilter + ') like upper(' + chr(39)+FilterText+chr(39)+')' else
    Result := ' '+SQLFilter + ' = ' + chr(39)+FilterText+chr(39);
end;

procedure TMainForm.RunFilter;
var ArtistFilter, ArtistIDFilter, TitleFilter, AlbumFilter, GenreFilter, CatalogueIDFilter, CatalogueFilter, QueryFilter,
    CatNumFilter, TrackFilter, Str, YearFilter, FilesizeFilter, FilenameFilter : String;
    Save_Cursor:TCursor;
    CatId, ArtId, AlbId : Integer;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    ArtistFilter := '';
    ArtistIDFilter := '';
    TitleFilter := '';
    AlbumFilter := '';
    GenreFilter := '';
    CatalogueIDFilter := '';
    CatalogueFilter := '';
    CatNumFilter := '';
    TrackFilter := '';
    YearFilter := '';
    FilesizeFilter := '';
    FilenameFilter := '';
    QueryFilter := '';

    if length(tbxeTrackNo.Text) > 0 then
    begin
      TrackFilter := CheckQueryFilter(tbxeTrackNo.Text);
      TrackFilter := ' Track_Number '+TrackFilter;
    end;
    if length(tbxeYear.Text) > 0 then
    begin
      YearFilter := CheckQueryFilter(tbxeYear.Text);
      YearFilter := ' Year '+YearFilter;
    end;
    if length(tbxeCatNo.Text) > 0 then
    begin
      CatNumFilter := CheckQueryFilter(tbxeCatNo.Text);
      CatNumFilter := ' Catalogue_Number '+CatNumFilter;
    end;

    //Check text for ''' as it screws up SQL filtering
    tbxeArtist.Text := CheckFilterLine(tbxeArtist.Text);
    tbxeTitle.Text := CheckFilterLine(tbxeTitle.Text);
    tbxeAlbum.Text := CheckFilterLine(tbxeAlbum.Text);
    tbxcbCatName.Text := CheckFilterLine(tbxcbCatName.Text);

    if length(tbxeArtist.Text) > 0 then ArtistFilter := CheckLikeFilter('Artist_Name',tbxeArtist.Text);
    if length(tbxeTitle.Text) > 0 then TitleFilter := CheckLikeFilter('Song_Title',tbxeTitle.Text);
    if length(tbxeAlbum.Text) > 0 then AlbumFilter := CheckLikeFilter('Album_Title',tbxeAlbum.Text);
    if length(tbxcbGenre.Text) > 0 then GenreFilter := CheckLikeFilter('Genre_Name',tbxcbGenre.Text);
    if length(tbxcbCatName.Text) > 0 then CatalogueFilter := CheckLikeFilter('Catalogue_Name',tbxcbCatName.Text);
    if length(tbxeFilename.Text) > 0 then FilenameFilter := CheckLikeFilter('Filename',tbxeFilename.Text);

    if ArtistFilter <> '' then QueryFilter := ArtistFilter;

    if TrackFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ TrackFilter else
        QueryFilter := TrackFilter;
    end;
    if YearFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ YearFilter else
        QueryFilter := YearFilter;
    end;
    if CatNumFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ CatNumFilter else
        QueryFilter := CatNumFilter;
    end;
    if TitleFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ TitleFilter else
        QueryFilter := TitleFilter;
    end;
    if AlbumFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ AlbumFilter else
        QueryFilter := AlbumFilter;
    end;
    if GenreFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ GenreFilter else
        QueryFilter := GenreFilter;
    end;
    if CatalogueFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ CatalogueFilter else
        QueryFilter := CatalogueFilter;
    end;
    if CatalogueIDFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ CatalogueIDFilter else
        QueryFilter := CatalogueIDFilter;
    end;
    if ArtistIDFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ ArtistIDFilter else
        QueryFilter := ArtistIDFilter;
    end;
    if FilenameFilter <> '' then
    begin
      if QueryFilter <> '' then QueryFilter := QueryFilter +' AND '+ FilenameFilter else
        QueryFilter := FilenameFilter;
    end;

    if (UseFilterBar = True) and (cbTreeFilter.Checked = True) then
    begin
      try
        CatId := PMyRec(FilterTV.Selected.Data)^.CatId;
      except
        CatId := 0;
      end;
      try
        ArtId := PMyRec(FilterTV.Selected.Data)^.ArtId;
      except
        ArtId := 0;
      end;
      try
        AlbId := PMyRec(FilterTV.Selected.Data)^.AlbId;
      except
        AlbId := 0;
      end;

      if ArtID > 0 then
      begin
        if QueryFilter <> '' then QueryFilter := QueryFilter + ' AND ';
        QueryFilter := QueryFilter + 'Artist_ID = '+IntToStr(ArtID);
      end;
      if CatID > 0 then
      begin
        if QueryFilter <> '' then QueryFilter := QueryFilter + ' AND ';
        QueryFilter := QueryFilter + 'Catalogue_ID = '+IntToStr(CatID);
      end;
      if AlbID > 0 then
      begin
        if QueryFilter <> '' then QueryFilter := QueryFilter + ' AND ';
        QueryFilter := QueryFilter + 'Album_ID = '+IntToStr(AlbID);
      end;

      case TVFilterType of    //Add alphabetically sort , dont include the #
      0 : begin
          end;
      1 : begin
          end;
      2 : begin
            if (FilterTV.Items.Item[FilterTV.Selected.AbsoluteIndex].Level = 0) and
               (Copy(FilterTV.Items.Item[FilterTV.Selected.AbsoluteIndex].Text, 1, 1) <> '#') then
            begin
              Str := Copy(FilterTV.Items.Item[FilterTV.Selected.AbsoluteIndex].Text, 1, 1);
              if QueryFilter <> '' then QueryFilter := QueryFilter + ' AND ';
              ArtistFilter := CheckLikeFilter('Artist_Name',Str+'*');
              QueryFilter := QueryFilter + ArtistFilter;
            end;
          end;
      end;

    end;

    dmMain.dsqSongs.filter := '';
    dmMain.dsqSongs.Filtered := False;
    dmMain.dsqSongs.filter := QueryFilter;
    dmMain.dsqSongs.Filtered := True;
  //  tbApply.Enabled := QueryMode;
  //  tbCancel.Enabled := QueryMode;

    RefreshTotals;
    pcSongs.ActivePage := tsSongs;
    dbgSongs.SetFocus;

  finally
    if tbxiBlankFilterText.Checked = True then ClearSongDetails;
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  GetFont(MainForm.Font);  //Set apps font to same as windows one.
  StartupTimer.Enabled := True;
  pcSongs.ActivePage := tsSongs;
  dbgSongs.SetFocus;
  EnableFilterMode;
end;

procedure TMainForm.SongDetailsHint;
begin
  dbgSongs.Hint := 'Artist: '+dmMain.dsqSongs.FieldByName('Artist_Name').AsString +#13+#10+
                   'Song: '+dmMain.dsqSongs.FieldByName('Song_Title').AsString +#13+#10+
                   'Album: '+dmMain.dsqSongs.FieldByName('Album_Title').AsString +#13+#10+
                   'Track #: '+dmMain.dsqSongs.FieldByName('Track_Number').AsString +#13+#10+
                   'Year: '+dmMain.dsqSongs.FieldByName('Year').AsString +#13+#10+
                   'Cat #: '+dmMain.dsqSongs.FieldByName('Catalogue_Number').AsString +#13+#10+
                   'Catalogue Name: '+dmMain.dsqSongs.FieldByName('Catalogue_Name').AsString;
end;

procedure TMainForm.ToggleSaveMode(Toggle : Boolean);
begin
  tbxiSave.Enabled := Toggle;
  tbxiCancel.Enabled := Toggle;
  tbxiDbSave.Enabled := Toggle;
  tbxiDbCancel.Enabled := Toggle;
  TBXSINavigation.Enabled := Toggle;
  tbxiNavFirst.Enabled := not Toggle;
  tbxiNavPrevious.Enabled := not Toggle;
  tbxiNavNext.Enabled := not Toggle;
  tbxiNavLast.Enabled := not Toggle;
  TBXSIHelp.Enabled := Enabled;
end;

procedure TMainForm.dbgSongsTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if SongsDesc = True then
  begin
    SongsDesc := False;
    MainSQL(AFieldName+' desc '{, dsqSongs.Filter});
    OrderBy := AFieldName+' desc ';
  end else
  begin
    SongsDesc := True;
    MainSQL(AFieldName{, dsqSongs.Filter});
    OrderBy := AFieldName;
  end;
end;

procedure TMainForm.dbgArtistsTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if ArtDesc = True then
  begin
    ArtDesc := False;
    ArtistSQL(AFieldName+' desc ');
  end else
  begin
    ArtDesc := True;
    ArtistSQL(AFieldName);
  end;
end;

procedure TMainForm.dbgCataloguesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  if CatDesc = True then
  begin
    CatDesc := False;
    CatalogueSQL(AFieldName+' desc ');
  end else
  begin
    CatDesc := True;
    CatalogueSQL(AFieldName);
  end;
end;

procedure TMainForm.SaveSettings;
var Reg : TRegistry;
    IconText : Integer;
begin
  if pmTopMenuButtonLabels.Checked = True
    then IconText := 0 else IconText := 1;
  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Views',true);
      WriteBool('CatName', tbxiViewCatalogueName.Checked);
      WriteBool('Year', tbxiViewYear.Checked);
      WriteBool('Artist', tbxiViewArtist.Checked);
      WriteBool('Album', tbxiViewAlbum.Checked);
      WriteBool('Catalogue', tbxiViewCatalogue.Checked);
      WriteBool('Genre', tbxiViewGenre.Checked);
      WriteBool('Track', tbxiViewTrack.Checked);
      WriteBool('Filename', tbxiViewFilename.Checked);
      WriteBool('TreeviewFilterBar', tbxiFilterTreeBar.Checked);
      WriteBool('Title', tbxiViewTitle.Checked);
      CloseKey;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      WriteBool('ConfirmSave', ConfirmSave);
      WriteString('OrderBy', OrderBy);
      WriteInteger('IconText', IconText);
      WriteBool('BlankFilterText', tbxiBlankFilterText.Checked);
      if FilterTV.AutoExpand then
        WriteInteger('AutoExpand', 0) else WriteInteger('AutoExpand', 1);
      CloseKey;
    end;
  finally
    Reg.Free;
  end;

  tbRegSavePositions(self,HKey_CURRENT_USER,'Software\'+ApplicationName);
end;

procedure TMainForm.LoadSettings;
var Reg : TRegistry;
    IconLayoutSetting, IconCaptions, ThemeNumber, AutoExpand, IncludeFilterBar : Integer;
begin
  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Views',true);
      try
        tbxiViewYear.Checked := ReadBool('Year');
      except
        tbxiViewYear.Checked := True;
      end;
      pmvqYear.Checked := tbxiViewYear.Checked;
      try
        tbxiViewCatalogueName.Checked := ReadBool('CatName');
      except
        tbxiViewCatalogueName.Checked := True;
      end;
      pmvqCatalogueName.Checked := tbxiViewCatalogueName.Checked;
      try
        tbxiViewTitle.Checked := ReadBool('Title');
      except
        tbxiViewTitle.Checked := True;
      end;
      pmvqTitle.Checked := tbxiViewTitle.Checked;
      try
        tbxiViewArtist.Checked := ReadBool('Artist');
      except
        tbxiViewArtist.Checked := True;
      end;
      pmvqArtist.Checked := tbxiViewArtist.Checked;
      try
        tbxiViewAlbum.Checked := ReadBool('Album');
      except
        tbxiViewAlbum.Checked := True;
      end;
      pmvqAlbum.Checked := tbxiViewAlbum.Checked;
      try
        tbxiViewCatalogue.Checked := ReadBool('Catalogue');
      except
        tbxiViewCatalogue.Checked := True;
      end;
      pmvqCatalogue.Checked := tbxiViewCatalogue.Checked;
      try
        tbxiViewGenre.Checked := ReadBool('Genre');
      except
        tbxiViewGenre.Checked := True;
      end;
      pmvqGenre.Checked := tbxiViewGenre.Checked;
      try
        tbxiViewTrack.Checked := ReadBool('Track');
      except
        tbxiViewTrack.Checked := True;
      end;
      pmvqTrack.Checked := tbxiViewTrack.Checked;
      try
        tbxiViewFilename.Checked := ReadBool('Filename');
      except
        tbxiViewFilename.Checked := True;
      end;
      pmvqFilename.Checked := tbxiViewFilename.Checked;
      try
        tbxiFilterTreeBar.Checked := ReadBool('TreeviewFilterBar');
      except
        tbxiFilterTreeBar.Checked := True;
      end;
      CloseKey;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      try
        tbxiBlankFilterText.Checked := ReadBool('BlankFilterText');
      except
        tbxiBlankFilterText.Checked := True;
      end;
      try
        TVFilterType := ReadInteger('FilterDisplayStyle');
      except
        TVFilterType := 0;
      end;
      try
        AutoFilterBar := ReadInteger('AutoFilterbar');
      except
        AutoFilterBar := 0;
      end;
      try
        ThemeNumber := ReadInteger('Theme');
      except
        ThemeNumber := 0;
      end;
      try
        SongsDbl := ReadInteger('SongsDblClick');
      except
        SongsDbl := 0;
      end;
      try
        AutoExpand := ReadInteger('AutoExpand');
      except
        AutoExpand := 0;
      end;
      case AutoExpand of
        0 : FilterTV.AutoExpand := True;
        1 : FilterTV.AutoExpand := False;
      end;
      try
        IncludeFilterBar := ReadInteger('IncludeFilterbar');
      except
        IncludeFilterBar := 0;
      end;
      case IncludeFilterBar of
        0 : UseFilterBar := True;
        1 : UseFilterBar := False;
      end;
      try
        ConfirmSave := ReadBool('ConfirmSave');
      except
        ConfirmSave := True;
      end;
      try
        OrderBy := ReadString('OrderBy');
      except
        OrderBy := 'Catalogue_ID';
      end;
      try
        Percents := ReadInteger('Transparency');
      except
        Percents := 100;
      end;
      try
        IconLayoutSetting := ReadInteger('IconLayout');
      except
        IconLayoutSetting := 0;
      end;
      try
        IconCaptions := ReadInteger('IconText');
      except
        IconCaptions := 0;
      end;
      CloseKey;
    end;
  finally
    Reg.Free;
  end;
  SetTheme(ThemeNumber);
  IconLayout(IconLayoutSetting);
  ShowIconText(IconCaptions);
  pmTopMenuButtonLabels.Checked := (IconCaptions = 0);

  tbxtArtist.Visible := tbxiViewArtist.Checked;
  tbxtCatalogue.Visible := tbxiViewCatalogue.Checked;
  tbxtGenre.Visible := tbxiViewGenre.Checked;
  tbxtTrack.Visible := tbxiViewTrack.Checked;
  tbxtFileDetails.Visible := tbxiViewFilename.Checked;
  tbxtTitle.Visible := tbxiViewTitle.Checked;
  tbxtAlbum.Visible := tbxiViewAlbum.Checked;
  tbxtCatalogueName.Visible := tbxiViewCatalogueName.Checked;
  TBXDPTreeview.Visible := tbxiFilterTreeBar.Checked;

  if TBXDPTreeview.Visible then ProcessFilterTV(TVFilterType);

  tbRegLoadPositions(self,HKey_CURRENT_USER,'Software\'+ApplicationName);
end;

procedure TMainForm.tbxiFilterClick(Sender: TObject);
begin
  RunFilter;
end;

procedure TMainForm.tbxiAddClick(Sender: TObject);
begin
  AddWizardForm := TAddWizardForm.create(self);
  AddWizardForm.Showmodal;
  AddWizardForm.Free;
  DefaultStatusBarHint;
end;

procedure TMainForm.tbxiDeleteClick(Sender: TObject);
begin
  try
    OpenTables;
    DeleteForm := TDeleteForm.create(self);
    DeleteForm.Showmodal;
    DeleteForm.Free;
  finally
    CloseTables;
  end;
end;

procedure TMainForm.tbxiSaveClick(Sender: TObject);
begin
  ConfirmSaveEntry;
  ModifiedEntry := False;
  ToggleGui(True);
  RefreshTabChangeDetails;
  DefaultStatusBarHint;
end;

procedure TMainForm.tbxiCancelClick(Sender: TObject);
begin
  ModifiedEntry := False;
  ToggleGui(True);
  DisplaySongPropertiesSongDetails;
  DefaultStatusBarHint;
end;

procedure TMainForm.tbxtArtistClose(Sender: TObject);
begin
  tbxiViewArtist.Checked := tbxtArtist.Visible;
end;

procedure TMainForm.tbxtCatalogueClose(Sender: TObject);
begin
  tbxiViewCatalogue.Checked := tbxtCatalogue.Visible;
end;

procedure TMainForm.tbxtGenreClose(Sender: TObject);
begin
  tbxiViewGenre.Checked := tbxtGenre.Visible;
end;

procedure TMainForm.tbxtTrackClose(Sender: TObject);
begin
  tbxiViewTrack.Checked := tbxtTrack.Visible;
end;

procedure TMainForm.tbxtFileDetailsClose(Sender: TObject);
begin
  tbxiViewFilename.Checked := tbxtFileDetails.Visible;
end;

procedure TMainForm.PropertiesModeStatus;
begin
  if PropertiesIsLoading = False then
  begin
    StatusBar.Panels[1].Text := ' Edit Mode ';
    StatusBar.Panels[0].ImageIndex := 10;
    ModifiedEntry := True;
  end else
    DefaultStatusBarHint;
end;

procedure TMainForm.tbxiAboutClick(Sender: TObject);
begin
  SplashForm := TSplashForm.create(self);
  SplashForm.Splashmode := False;
  SplashForm.Showmodal;
  SplashForm.Free;
end;

procedure TMainForm.tbxiViewArtistClick(Sender: TObject);
begin
  if tbxiViewArtist.Checked = True then tbxiViewArtist.Checked := False
    else tbxiViewArtist.Checked := True;

  tbxtArtist.Visible := tbxiViewArtist.Checked;
  pmvqArtist.Checked := tbxiViewArtist.Checked;
end;

procedure TMainForm.tbxiViewCatalogueClick(Sender: TObject);
begin
  if tbxiViewCatalogue.Checked = True then tbxiViewCatalogue.Checked := False
    else tbxiViewCatalogue.Checked := True;

  tbxtCatalogue.Visible := tbxiViewCatalogue.Checked;
  pmvqCatalogue.Checked := tbxiViewCatalogue.Checked;
end;

procedure TMainForm.tbxiViewGenreClick(Sender: TObject);
begin
  if tbxiViewGenre.Checked = True then tbxiViewGenre.Checked := False
    else tbxiViewGenre.Checked := True;

  tbxtGenre.Visible := tbxiViewGenre.Checked;
  pmvqGenre.Checked := tbxiViewGenre.Checked;
end;

procedure TMainForm.tbxiViewTrackClick(Sender: TObject);
begin
  if tbxiViewTrack.Checked = True then tbxiViewTrack.Checked := False
    else tbxiViewTrack.Checked := True;

  tbxtTrack.Visible := tbxiViewTrack.Checked;
  pmvqTrack.Checked := tbxiViewTrack.Checked;
end;

procedure TMainForm.tbxiViewFilenameClick(Sender: TObject);
begin
  if tbxiViewFilename.Checked = True then tbxiViewFilename.Checked := False
    else tbxiViewFilename.Checked := True;

  tbxtFileDetails.Visible := tbxiViewFilename.Checked;
  pmvqFilename.Checked := tbxiViewFilename.Checked;
end;

procedure TMainForm.tbxiSettingsClick(Sender: TObject);
begin
  SettingsForm := TSettingsForm.create(self);
  SettingsForm.Showmodal;
  SettingsForm.Free;
end;

procedure TMainForm.tbxiFileExitClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.IconLayout(LayoutStyle : Integer);
begin
  case LayoutStyle of
  0 : begin
        tbxiFilter.Layout := tbxlGlyphTop;
        tbxiReset.Layout := tbxlGlyphTop;
        tbxiAdd.Layout := tbxlGlyphTop;
        tbxiDelete.Layout := tbxlGlyphTop;
        tbxiSave.Layout := tbxlGlyphTop;
        tbxiCancel.Layout := tbxlGlyphTop;
        tbxiFirst.Layout := tbxlGlyphTop;
        tbxiPrevious.Layout := tbxlGlyphTop;
        tbxiNext.Layout := tbxlGlyphTop;
        tbxiLast.Layout := tbxlGlyphTop;
      end;
  1 : begin
        tbxiFilter.Layout := tbxlGlyphLeft;
        tbxiReset.Layout := tbxlGlyphLeft;
        tbxiAdd.Layout := tbxlGlyphLeft;
        tbxiDelete.Layout := tbxlGlyphLeft;
        tbxiSave.Layout := tbxlGlyphLeft;
        tbxiCancel.Layout := tbxlGlyphLeft;
        tbxiFirst.Layout := tbxlGlyphLeft;
        tbxiPrevious.Layout := tbxlGlyphLeft;
        tbxiNext.Layout := tbxlGlyphLeft;
        tbxiLast.Layout := tbxlGlyphLeft;
      end;
  end;
end;

procedure TMainForm.ShowIconText(ShowText : Integer);
begin
  case ShowText of
  0 : begin
        tbxiFilter.Caption := 'Filter';
        tbxiReset.Caption := 'Reset';
        tbxiAdd.Caption := 'Add';
        tbxiDelete.Caption := 'Delete';
        tbxiSave.Caption := 'Save';
        tbxiCancel.Caption := 'Cancel';
        tbxiFirst.Caption := 'First';
        tbxiPrevious.Caption := 'Previous';
        tbxiNext.Caption := 'Next';
        tbxiLast.Caption := 'Last';
      end;
  1 : begin
        tbxiFilter.Caption := '';
        tbxiReset.Caption := '';
        tbxiAdd.Caption := '';
        tbxiDelete.Caption := '';
        tbxiSave.Caption := '';
        tbxiCancel.Caption := '';
        tbxiFirst.Caption := '';
        tbxiPrevious.Caption := '';
        tbxiNext.Caption := '';
        tbxiLast.Caption := '';
        IconLayout(0);
      end;
  end;
end;

procedure TMainForm.EasyFileSearchStatistics(Stats: TStatistics);
var Save_Cursor:TCursor;
begin
  if stats.NbFilesFound = 0 then
  begin
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    CreateTables(EasyFileSearch.RootPath);
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TMainForm.tbxiFirstClick(Sender: TObject);
begin
  if dmMain.dsqSongs.RecordCount > 0 then
  begin
    dmMain.dsqSongs.First;
    RefreshTabChangeDetails;
  end;
end;

procedure TMainForm.tbxiPreviousClick(Sender: TObject);
begin
  if (dmMain.dsqSongs.RecordCount > 0) then
  begin
    RefreshTabChangeDetails;
    dmMain.dsqSongs.Prior;
  end;
end;

procedure TMainForm.tbxiNextClick(Sender: TObject);
begin
  if (dmMain.dsqSongs.RecordCount > 0) then
  begin
    RefreshTabChangeDetails;
    dmMain.dsqSongs.Next;
  end;
end;

procedure TMainForm.tbxiLastClick(Sender: TObject);
begin
  if (dmMain.dsqSongs.RecordCount > 0) then
  begin
    RefreshTabChangeDetails;
    dmMain.dsqSongs.Last;
  end;
end;

procedure TMainForm.DisplaySongPropertiesSongDetails;
var total : Real;
begin
  if dmMain.dsqSongs.Active then
  begin
    PropertiesIsLoading := True;
    ModifiedEntry := False;
    speSong.Text := dmMain.dsqSongs.FieldByName('Song_Title').AsString;
    spcbCatName.Text := dmMain.dsqSongs.FieldByName('Catalogue_Name').AsString;
    speFilename.Text := dmMain.dsqSongs.FieldByName('Filename').AsString;
    speAlbum.Text := dmMain.dsqSongs.FieldByName('Album_Title').AsString;
    speArtist.Text := dmMain.dsqSongs.FieldByName('Artist_Name').AsString;
//    speGenre.Text := dsqSongs.FieldByName('Genre_Name').AsString;
    spcbGenres.Text := dmMain.dsqSongs.FieldByName('Genre_Name').AsString;
    speCatNum.Text := dmMain.dsqSongs.FieldByName('Catalogue_Number').AsString;
    mLyrics.Text := dmMain.dsqSongs.FieldByName('Lyrics').AsString;
    speLength.Text := dmMain.dsqSongs.FieldByName('Length').AsString;

    if dmMain.dsqSongs.FieldByName('Filesize').IsNull then spesize.Text := '' else
    begin
      total := (dmMain.dsqSongs.FieldByName('Filesize').AsFloat / 1024) / 1024;
      speSize.Text := FormatFloat('0.00',Total)+' MB';
    end;

    if dmMain.dsqSongs.FieldByName('Track_Number').AsInteger = 0 then speTrackNum.Text := '' else
      speTrackNum.Text := IntToStr(dmMain.dsqSongs.FieldByName('Track_Number').AsInteger);
    if dmMain.dsqSongs.FieldByName('Year').AsInteger = 0 then speYear.Text := '' else
      speYear.Text := IntToStr(dmMain.dsqSongs.FieldByName('Year').AsInteger);

    PropertiesIsLoading := False;
    ModifiedEntry := False;
    DefaultStatusBarHint;
    tsAlbumDetails.TabVisible := (length(speAlbum.Text) > 0);
  end;
end;

procedure TMainForm.RefreshTabChangeDetails;
begin
  if pcSongs.ActivePage = tsProperties then
  begin
    DisplaySongPropertiesSongDetails;
    ShowMP3Details(dmMain.dsqSongs.fieldbyname('Filename').AsString);
    RefreshAlbumDetails;
    bCopyID3v2.Visible := tsMP3Details.TabVisible;
    bCopyID3v1.Visible := tsMP3Details.TabVisible;
  end else
  if pcSongs.ActivePage = tsPlaylist then
  begin
    RefreshPlaylistSongs;
  end;
end;

procedure TMainForm.pcSongsChange(Sender: TObject);
begin
  RefreshTabChangeDetails;
end;

procedure TMainForm.SongPropertiesSaveCatalogueDetails;
var ArtistID, AlbumID, GenreID, CatalogueID, {slashpos,} TempID, TempCatID, TempArtID, OldSongID, OldAlbumID : Integer;
begin
  OpenTables;
  if (pcSongProperties.ActivePage = tsSongDetails) then
  begin
    if dmMain.Songs.Locate('ID', dmMain.dsqSongs.fieldbyname('ID').AsInteger,  [loCaseInsensitive]) = True then
    begin
      ArtistID := 0;
      AlbumID := 0;
      GenreID := 0;
      CatalogueID := 0;
//      if speArtist.Text <> '' then
      ArtistID := AddWizardForm.AddArtistToCatalogue(speArtist.Text);
      OldAlbumID := dmMain.Songs.FieldByName('Album_ID').AsInteger;
      if speAlbum.Text <> '' then
        AlbumID := AddWizardForm.AddAlbumToCatalogue(speAlbum.Text, ArtistID);
  {    if speGenre.Text <> '' then
        GenreID := AddWizardForm.AddGenreToCatalogue(speGenre.Text);}
      if spcbGenres.Text <> '' then
        GenreID := AddWizardForm.AddGenreToCatalogue(spcbGenres.Text);

      if (spcbGenres.Items.IndexOf(spcbGenres.Text) = -1) and
         (spcbGenres.Text <> '') and (spcbGenres.Text <> ' ') then
         spcbGenres.Items.Add(spcbGenres.Text);

      if (tbxcbGenre.Items.IndexOf(tbxcbGenre.Text) = -1) and
         (tbxcbGenre.Text <> '') and (tbxcbGenre.Text <> ' ') then
          tbxcbGenre.Items.Add(tbxcbGenre.Text);

      if ((speCatNum.Text <> '') and (spcbCatName.Text <> '')) then
        CatalogueID := AddWizardForm.AddCatalogueToCatalogue(spcbCatName.Text, speCatNum.Text);

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

      if speSong.Text <> dmMain.Songs.FieldByName('Song_Title').AsString then
        dmMain.Songs.FieldByName('Song_Title').AsString := speSong.Text;

      if speTrackNum.Text = '' then
      begin
        dmMain.Songs.FieldByName('Track_Number').Value := null;
      end else
      begin
        dmMain.Songs.FieldByName('Track_Number').AsInteger := StrToInt(speTrackNum.Text);
      end;

      if speYear.Text = '' then
      begin
        dmMain.Songs.FieldByName('Year').Value := null;
      end else
      begin
        dmMain.Songs.FieldByName('Year').AsInteger := StrToInt(speYear.Text);
      end;

      dmMain.Songs.FieldByName('Lyrics').AsString := mLyrics.Text;

      dmMain.Songs.Post;

      if OldAlbumID <> AlbumID then
      begin
        //Update other relating album songs to new album
        dmMain.qTemp.Active := False;
        dmMain.qTemp.SQL.Clear;
        dmMain.qTemp.SQL.Add('Select ID, Album_ID from Songs where Album_ID = '+IntToStr(OldAlbumID));
        dmMain.qTemp.Active := True;
        while not dmMain.qTemp.Eof do
        begin
          if dmMain.Songs.Locate('ID', dmMain.qTemp.fieldbyname('ID').AsInteger,  [loCaseInsensitive]) = True then
          begin
            dmMain.Songs.Edit;
            dmMain.Songs.FieldByName('Album_ID').AsInteger := AlbumID;
            dmMain.Songs.Post;
            dmMain.qTemp.Next;
          end;
        end;
        dmMain.qTemp.SQL.Clear;
        dmMain.qTemp.Active := False;
      end;

      TempID := dmMain.dsqSongs.fieldbyname('ID').AsInteger;
      TempCatID := dmMain.dsqSongs.fieldbyname('Catalogue_ID').AsInteger;
      TempArtID := dmMain.dsqSongs.fieldbyname('Artist_ID').AsInteger;

      //Refresh display to latest entry
      dmMain.dsqSongs.DisableControls;
      RefreshMp3List;
      dmMain.dsqSongs.EnableControls;

      //Go back to record you saved
      dmMain.dsqSongs.Locate('ID', TempID,  [loCaseInsensitive]);

    end;
  end else
  if (pcSongProperties.ActivePage = tsAlbumDetails) then
  begin
    AlbumID := 0;
    TempCatID := dmMain.dsqSongs.fieldbyname('Catalogue_ID').AsInteger;
    TempArtID := dmMain.dsqSongs.fieldbyname('Artist_ID').AsInteger;
    OldSongID := dmMain.dsqAlbumTracks.fieldbyname('ID').AsInteger;
    if speAlbum.Text <> '' then
      AlbumID := AddWizardForm.AddAlbumToCatalogue(eAlbumAlbumName.Text, TempArtID);


    if AlbumID = 0 then
    begin
      dmMain.dsqAlbumTracks.First;
      while not dmMain.dsqAlbumTracks.Eof do
      begin
        if dmMain.Songs.Locate('ID', dmMain.dsqAlbumTracks.fieldbyname('ID').AsInteger,  [loCaseInsensitive]) = True then
        begin
          dmMain.Songs.Edit;
          dmMain.Songs.FieldByName('Album_ID').Value := null;
          dmMain.Songs.Post;
        end;
        dmMain.dsqAlbumTracks.Next;
      end;

    end else
    begin
      if ((AlbumID <> dmMain.Songs.FieldByName('Album_ID').AsInteger) and
         (AlbumID <> 0)) then
         begin
           dmMain.dsqAlbumTracks.First;
           while not dmMain.dsqAlbumTracks.Eof do
           begin
             if dmMain.Songs.Locate('ID', dmMain.dsqAlbumTracks.fieldbyname('ID').AsInteger,  [loCaseInsensitive]) = True then
             begin
               dmMain.Songs.Edit;
               dmMain.Songs.FieldByName('Album_ID').AsInteger := AlbumID;
               dmMain.Songs.Post;
             end;
             dmMain.dsqAlbumTracks.Next;
           end;
         end;
    end;

    //Refresh display to latest entry
    dmMain.dsqSongs.DisableControls;
    dmMain.dsqAlbumTracks.DisableControls;
    dmMain.dsqAlbumTracks.Active := False;
    dmMain.dsqAlbumTracks.Active := True;
    RefreshMp3List;
    dmMain.dsqAlbumTracks.EnableControls;
    dmMain.dsqSongs.EnableControls;
    dmMain.dsqSongs.Locate('ID', OldSongID,  [loCaseInsensitive]);
    dmMain.dsqAlbumTracks.Locate('ID', OldSongID,  [loCaseInsensitive]);

  end;
  ModifiedEntry := False;
  DefaultStatusBarHint;
  CloseTables;
end;

procedure TMainForm.spcbGenresChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.spcbCatNameChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.speArtistChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.speSongChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.speAlbumChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.speTrackNumChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.speYearChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.speCatNumChange(Sender: TObject);
begin
  PropertiesModeStatus;
end;

procedure TMainForm.ToggleID3v2Details(Toggle : Boolean);
begin
//
end;

procedure TMainForm.ToggleID3v1Details(Toggle : Boolean);
begin
  ev1Artist.enabled := Toggle;
  ev1Album.enabled := Toggle;
  ev1Genre.enabled := Toggle;
  ev1Title.enabled := Toggle;
  ev1Year.enabled := Toggle;
  ev1TrackNo.enabled := Toggle;
  ev1Comment.enabled := Toggle;

  if Toggle = False then
  begin
    ev1Artist.Text := '';
    ev1Album.Text := '';
    ev1Genre.Text := '';
    ev1Title.Text := '';
    ev1Year.Text := '';
    ev1TrackNo.Text := '';
    ev1Comment.Text := '';
    ev1Artist.Color := clBtnFace;
    ev1Album.Color := clBtnFace;
    ev1Genre.Color := clBtnFace;
    ev1Title.Color := clBtnFace;
    ev1Year.Color := clBtnFace;
    ev1TrackNo.Color := clBtnFace;
    ev1Comment.Color := clBtnFace;
  end else
  begin
    ev1Artist.Color := clWindow;
    ev1Album.Color := clWindow;
    ev1Genre.Color := clWindow;
    ev1Title.Color := clWindow;
    ev1Year.Color := clWindow;
    ev1TrackNo.Color := clWindow;
    ev1Comment.Color := clWindow;
  end;
end;

procedure TMainForm.ShowMP3Details(Mp3Filename : String);
begin
  if tsMP3Details.Visible = False then exit;

{  //Read ID3v2 tag details
  if FileExists(Mp3Filename) then
  begin

    DisplayTag3v2 := TID3v2.Create;
    if DisplayTag3v2.ReadFromFile(Mp3Filename) then
    begin
      if DisplayTag3v2.Exists then
      begin
        ev2Artist.Text := DisplayTag3v2.Artist;
        ev2Album.Text := DisplayTag3v2.Album;
        ev2Genre.Text := DisplayTag3v2.Genre;
        ev2Title.Text := DisplayTag3v2.Title;
        ev2Year.Text := DisplayTag3v2.Year;
        ev2TrackNo.Text := IntToStr(DisplayTag3v2.Track);
        mv2Comment.Text := DisplayTag3v2.Comment;
      end else
      begin

      end;
      cbIDV3v2.Checked := DisplayTag3v2.Exists;
      ToggleID3v2Details(cbIDV3v2.Checked);
    end;
    DisplayTag3v2.Free;

    //Read ID3v1 tag details
    DisplayTag3v1 := TID3v1.Create;
    if DisplayTag3v1.ReadFromFile(Mp3Filename) then
    begin
      if DisplayTag3v1.Exists then
      begin
        ev1Artist.Text := DisplayTag3v1.Artist;
        ev1Album.Text := DisplayTag3v1.Album;
        ev1Genre.Text := DisplayTag3v1.Genre;
        ev1Title.Text := DisplayTag3v1.Title;
        ev1Year.Text := DisplayTag3v1.Year;
        ev1TrackNo.Text := IntToStr(DisplayTag3v1.Track);
        ev1Comment.Text := DisplayTag3v1.Comment;
      end else
      begin

      end;
      cbIDV3v1.Checked := DisplayTag3v1.Exists;
      ToggleID3v1Details(cbIDV3v1.Checked);
    end;
    DisplayTag3v1.Free;
  end;}
end;

procedure TMainForm.pmMainDeleteClick(Sender: TObject);
begin
//  tbxiDeleteClick(nil);
end;

procedure TMainForm.pmMainPlayClick(Sender: TObject);
begin
  PlaySong(dmMain.dsqSongs.FieldByName('Filename').AsString);
end;

procedure TMainForm.RefreshAlbumDetails;
begin
  if pcSongProperties.ActivePage = tsAlbumDetails then
  begin
    PropertiesIsLoading := True;
    ModifiedEntry := False;
    dmMain.dsqAlbumTracks.Active := False;
    dmMain.dsqAlbumTracks.sql.Clear;
    dmMain.dsqAlbumTracks.sql.Add(
      ' Select Songs.ID, Songs.Song_Title, Songs.Track_Number'+
      ' From Songs'+
      ' Where '+
//      ' Songs.Artist_ID = :vArtistID and '
      ' Songs.Album_ID = :vAlbumID'+
      ' Order By Songs.Track_Number');

//    dsqAlbumTracks.ParamByName('vArtistID').AsInteger := dsqSongs.fieldbyname('ArtID').AsInteger;
    dmMain.dsqAlbumTracks.ParamByName('vAlbumID').AsInteger := dmMain.dsqSongs.fieldbyname('Album_ID').AsInteger;
    dmMain.dsqAlbumTracks.Active := True;
    dmMain.dsqAlbumTracks.Locate('ID', dmMain.dsqSongs.fieldbyname('ID').AsInteger,  [loCaseInsensitive]);
{    if Albums.Locate('ID', dsqAlbumTracks.fieldbyname('ID').AsInteger,  [loCaseInsensitive]) = True then
      eAlbumAlbumName.Text := Albums.FieldByName('Album_Title').AsString else eAlbumAlbumName.Text := '';}
    eAlbumAlbumName.Text := speAlbum.Text;
    ModifiedEntry := False;
    PropertiesIsLoading := False;
  end else
    dmMain.dsqAlbumTracks.Active := False;
end;

procedure TMainForm.pcSongPropertiesChange(Sender: TObject);
begin
  RefreshTabChangeDetails;
  RefreshAlbumDetails;
end;

procedure TMainForm.PlaySong(Filename : String);
begin
  if FileExists(Filename) then
    ShellExecute(Handle, 'OPEN', PChar(Filename), nil, nil, sw_shownormal);
end;

procedure TMainForm.dbgAlbumTracksMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if dmMain.dsqSongs.Locate('ID', dmMain.dsqAlbumTracks.fieldbyname('ID').AsInteger,  [loCaseInsensitive]) = True then
  begin
    dmMain.dsqAlbumTracks.Locate('ID', dmMain.dsqSongs.fieldbyname('ID').AsInteger,  [loCaseInsensitive]);
  end;
end;

procedure TMainForm.dbgAlbumTracksDblClick(Sender: TObject);
begin
  PlaySong(dmMain.dsqSongs.FieldByName('Filename').AsString);
end;

procedure TMainForm.eAlbumAlbumNameChange(Sender: TObject);
begin
  PropertiesModeStatus;  //ModeStatus;
end;

procedure TMainForm.mLyricsChange(Sender: TObject);
begin
//  ModeStatus;
  PropertiesModeStatus;
end;

procedure TMainForm.tbxiRepAlbumLyricsClick(Sender: TObject);
var FilterType : Integer;
begin
  if SaveDialog.Execute then
  begin
    FilterType := GetReportFilter;
    if FilterType = -1 then Exit;
    CreateHTMLStyleSheet(ExtractFilePath(SaveDialog.FileName)+'styles.css');
    CreateLyricsHTMLFile(SaveDialog.FileName, ExtractFilePath(SaveDialog.FileName)+'styles.css', FilterType);
    if (FileExists(SaveDialog.FileName)) and (AutolaunchReport = 0) then
      ShellExecute(Handle, 'OPEN', PChar(SaveDialog.FileName), nil, nil, sw_shownormal);
  end;
end;

procedure TMainForm.pmMainCatalogueDetailsClick(Sender: TObject);
begin
  if dmMain.dsqSongs.FieldByName('Catalogue_ID').AsInteger > 0 then
  begin
    CatDetailsForm := TCatDetailsForm.create(self);
    CatDetailsForm.CatID := dmMain.dsqSongs.FieldByName('Catalogue_ID').AsInteger;
    CatDetailsForm.ShowModal;
    CatDetailsForm.Free;
  end;
end;

procedure TMainForm.pmMainSongDetailsClick(Sender: TObject);
begin
  pcSongs.ActivePageIndex := 1;
  pcSongProperties.ActivePageIndex := 0;
  RefreshTabChangeDetails;
  RefreshAlbumDetails;
end;

procedure TMainForm.pmMainAlbumDetailsClick(Sender: TObject);
begin
  pcSongs.ActivePageIndex := 1;
  pcSongProperties.ActivePageIndex := 1;
  RefreshTabChangeDetails;
  RefreshAlbumDetails;
end;

procedure TMainForm.tbxiHomepageClick(Sender: TObject);
begin
  ShellExecute(Handle, 'OPEN', PChar(Homepage), nil, nil, sw_shownormal);
end;

procedure TMainForm.bNewPlaylistClick(Sender: TObject);
begin
  PlaylistForm := TPlaylistForm.create(self);
  PlaylistForm.ShowModal;
  PlaylistForm.Free;
end;

procedure TMainForm.AddSongToPlaylist(SongID, PlaylistID : Integer);
begin
  if (SongID < 1) or (PlaylistID < 1) then exit;
  dmMain.PlaylistSongs.Append;
  dmMain.PlaylistSongs.FieldByName('SongID').AsInteger := SongID;
  dmMain.PlaylistSongs.FieldByName('PlaylistID').AsInteger := PlaylistID;
  dmMain.PlaylistSongs.Post;
  RefreshPlaylistSongs;
end;

procedure TMainForm.AddAlbumToPlaylist(AlbumID, PlaylistID : Integer);
begin
  dmMain.qTemp.Active := False;
  dmMain.qTemp.SQL.Clear;
  dmMain.qTemp.SQL.Add('Select ID, Track_Number from Songs where Album_ID = '+IntToStr(AlbumID)+ ' Order by Track_Number');
  dmMain.qTemp.Active := True;
  while not dmMain.qTemp.Eof do
  begin
    AddSongToPlaylist(dmMain.qTemp.FieldByName('ID').AsInteger, PlaylistID);
    dmMain.qTemp.Next;
  end;
  dmMain.qTemp.SQL.Clear;
  dmMain.qTemp.Active := False;
end;

procedure TMainForm.pmAddSongToPlaylistClick(Sender: TObject);
begin
  AddSongToPlaylist(dmMain.dsqSongs.fieldbyname('ID').AsInteger, dmMain.Playlists.fieldbyname('PlaylistID').AsInteger);
end;

procedure TMainForm.PlaylistsAfterScroll(DataSet: TDataSet);
begin
  RefreshPlaylistSongs;
end;

procedure TMainForm.RefreshPlaylistSongs;
begin
  dmMain.qPlaylistSongs.DisableControls;
  dmMain.qPlaylistSongs.Active := False;
  dmMain.qPlaylistSongs.ParamByName('vPlaylistID').AsInteger := dmMain.Playlists.fieldByName('PlaylistID').AsInteger;
  dmMain.qPlaylistSongs.Active := True;
  dmMain.qPlaylistSongs.EnableControls;
end;

procedure TMainForm.bDeletePlaylistClick(Sender: TObject);
begin
  DeletePlaylistAndSongs;
end;

procedure TMainForm.DeletePlaylistAndSongs;
begin
  if dmMain.Playlists.RecordCount > 0 then
  begin
    dmMain.PlaylistSongs.Filter := 'PlaylistID = '+IntToStr(dmMain.Playlists.FieldByName('PlaylistID').AsInteger);
    dmMain.PlaylistSongs.Filtered := True;
    while not dmMain.PlaylistSongs.Eof do
    begin
      dmMain.PlaylistSongs.Delete;
    end;
    dmMain.PlaylistSongs.Filtered := False;
    dmMain.PlaylistSongs.Filter := '';
    dmMain.Playlists.Delete;
  end;
end;

procedure TMainForm.pmAddAlbumToPlaylistClick(Sender: TObject);
begin
  AddAlbumToPlaylist(dmMain.dsqSongs.FieldByName('Album_ID').AsInteger, dmMain.Playlists.fieldbyname('PlaylistID').AsInteger);
end;

procedure TMainForm.ExportPlaylist(ExportFilename : String);
var Playlist : TStringList;
begin
  Playlist := TStringlist.create;
  dmMain.qPlaylistSongs.First;
  while not dmMain.qPlaylistSongs.Eof do
  begin
    Playlist.Add(dmMain.qPlaylistSongs.FieldByName('Filename').AsString);
    dmMain.qPlaylistSongs.Next;
  end;
  Playlist.SaveToFile(ExportFilename);
  Playlist.Free;
end;

procedure TMainForm.bExportPlaylistClick(Sender: TObject);
begin
  //Set up save dialog with playlist export settings
  SaveDialog.DefaultExt := '.m3u';
  SaveDialog.Filter := 'M3U Playlist (*.m3u)|*.m3u';
  SaveDialog.Title := 'Export Playlist As';
  SaveDialog.FileName := dmMain.Playlists.fieldbyname('Playlist_Name').AsString;
  if SaveDialog.Execute then ExportPlaylist(SaveDialog.FileName);
end;

procedure TMainForm.speYearKeyPress(Sender: TObject; var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TMainForm.speCatNumKeyPress(Sender: TObject; var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TMainForm.speTrackNumKeyPress(Sender: TObject; var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TMainForm.ev1TrackNoKeyPress(Sender: TObject; var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TMainForm.ev1YearKeyPress(Sender: TObject; var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TMainForm.ev2TrackNoKeyPress(Sender: TObject; var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TMainForm.ev2YearKeyPress(Sender: TObject; var Key: Char);
begin
 if ((ord(Key) > 57) or (ord(Key) < 48)) and not(ord(Key) = 8) then Key := chr(0);
end;

procedure TMainForm.tbxiRepCataloguesClick(Sender: TObject);
var FilterType : Integer;
begin
  if SaveDialog.Execute then
  begin
    FilterType := GetReportFilter;
    if FilterType = -1 then Exit;
    CreateHTMLStyleSheet(ExtractFilePath(SaveDialog.FileName)+'styles.css');
    CreateCataloguesHTMLFile(SaveDialog.FileName, ExtractFilePath(SaveDialog.FileName)+'styles.css', FilterType);
    if (FileExists(SaveDialog.FileName)) and (AutolaunchReport = 0) then
      ShellExecute(Handle, 'OPEN', PChar(SaveDialog.FileName), nil, nil, sw_shownormal);
  end;
end;

procedure TMainForm.CreateHTMLStyleSheet(CSSFilename : String);
var F: TextFile;
begin
  try
    AssignFile(F, CSSFilename);
    Rewrite(F);

    WriteLn(f,'body {font: x-small Verdana, Arial, Helvetica, sans-serif; background: #fff; margin: 1em; padding: 0em;}');
    WriteLn(f,'h3 {font-size: medium; font-weight: normal; color: #223; margin-bottom: 0.5em;}');
    WriteLn(f,'h4 {font-size: x-small; font-weight: bold;}');
    WriteLn(f,'a:link {color: #024;}');
    WriteLn(f,'a:visited {color: #257;}');
    WriteLn(f,'table {background-color: #93c7d7; table-layout: fixed; border-collapse: collapse;}');
    WriteLn(f,'table table {background-color: transparent; table-layout: fixed; width: 100%;}');
    WriteLn(f,'td {font-size: 70%; padding: 0.3em; background-color: #f5f9fa;}');
    WriteLn(f,'#r {text-align: right;}');
    WriteLn(f,'#h {background-color: #90c5d5; font-style: italic;}');
    WriteLn(f,'#f {background-color: #fdfeff;}');
    WriteLn(f,'#v {background-color: #f0f5f9; padding: 0;}');
    WriteLn(f,'#s {font-size: xx-small; font-style: italic; text-align: right; letter-spacing: 0.3ex;}');
    WriteLn(f,'#l {text-align: left;}');

  finally
    CloseFile(F);
  end;
end;

procedure TMainForm.tbxiRepArtistsClick(Sender: TObject);
var FilterType : Integer;
begin
  if SaveDialog.Execute then
  begin
    FilterType := GetReportFilter;
    if FilterType = -1 then Exit;
    CreateHTMLStyleSheet(ExtractFilePath(SaveDialog.FileName)+'styles.css');
    CreateArtistsHTMLFile(SaveDialog.FileName, ExtractFilePath(SaveDialog.FileName)+'styles.css', FilterType);
    if (FileExists(SaveDialog.FileName)) and (AutolaunchReport = 0) then
      ShellExecute(Handle, 'OPEN', PChar(SaveDialog.FileName), nil, nil, sw_shownormal);
  end;
end;

procedure TMainForm.tbxiRepAlbumsClick(Sender: TObject);
var FilterType : Integer;
begin
  if SaveDialog.Execute then
  begin
    FilterType := GetReportFilter;
    if FilterType = -1 then Exit;
    CreateHTMLStyleSheet(ExtractFilePath(SaveDialog.FileName)+'styles.css');
    CreateAlbumsHTMLFile(SaveDialog.FileName, ExtractFilePath(SaveDialog.FileName)+'styles.css', FilterType);
    if (FileExists(SaveDialog.FileName)) and (AutolaunchReport = 0) then
      ShellExecute(Handle, 'OPEN', PChar(SaveDialog.FileName), nil, nil, sw_shownormal);
  end;
end;

procedure TMainForm.TBXItem4Click(Sender: TObject);
var FilterType : Integer;
begin
  if SaveDialog.Execute then
  begin
    FilterType := GetReportFilter;
    if FilterType = -1 then Exit;
    CreateHTMLStyleSheet(ExtractFilePath(SaveDialog.FileName)+'styles.css');
    CreateFullAlbumHTMLFile(SaveDialog.FileName, ExtractFilePath(SaveDialog.FileName)+'styles.css', FilterType);
    if (FileExists(SaveDialog.FileName)) and (AutolaunchReport = 0) then
      ShellExecute(Handle, 'OPEN', PChar(SaveDialog.FileName), nil, nil, sw_shownormal);
  end;
end;

procedure TMainForm.DefaultStatusBarHint;
begin
//  StatusBar.Panels[1].Text := ' Filter Mode ';
  StatusBar.Panels[1].Text := '';
  StatusBar.Panels[0].ImageIndex := 0;
end;

procedure TMainForm.tbxiViewAlbumClick(Sender: TObject);
begin
  if tbxiViewAlbum.Checked = True then tbxiViewAlbum.Checked := False
    else tbxiViewAlbum.Checked := True;

  tbxtAlbum.Visible := tbxiViewAlbum.Checked;
  pmvqAlbum.Checked := tbxiViewAlbum.Checked;
end;

procedure TMainForm.pmMainGridPopup(Sender: TObject);
begin
 case SongsDbl of
  0 : begin
        pmMainPlay.Default := True;
        pmMainSongDetails.Default := False;
        pmMainAlbumDetails.Default := False;
        pmMainCatalogueDetails.Default := False;
      end;
  1 : begin
        pmMainPlay.Default := False;
        pmMainSongDetails.Default := True;
        pmMainAlbumDetails.Default := False;
        pmMainCatalogueDetails.Default := False;
      end;
  2 : begin
        pmMainPlay.Default := False;
        pmMainSongDetails.Default := False;
        pmMainAlbumDetails.Default := True;
        pmMainCatalogueDetails.Default := False;
      end;
  3 : begin
        pmMainPlay.Default := False;
        pmMainSongDetails.Default := False;
        pmMainAlbumDetails.Default := False;
        pmMainCatalogueDetails.Default := True;
      end;
 end;


  pmMainAlbumDetails.Enabled := (dmMain.dsqSongs.FieldByName('Album_Title').AsString <> '');
//  pmMainPlay.Enabled := FileExists(dmMain.dsqSongs.FieldByName('Filename').AsString);
end;

procedure TMainForm.SongsDblClick;
begin
 case SongsDbl of
  0 : begin
        pmMainPlay.Click;
      end;
  1 : begin
        pmMainSongDetails.Click;
      end;
  2 : begin
        pmMainAlbumDetails.Click;
      end;
  3 : begin
        pmMainCatalogueDetails.Click;
      end;
 end;
end;

procedure TMainForm.dbgSongsDblClick(Sender: TObject);
begin
  SongsDblClick;
end;

procedure TMainForm.pmTopMenuButtonLabelsClick(Sender: TObject);
var Reg : TRegistry;
    TextChoice : Integer;
begin
  if pmTopMenuButtonLabels.Checked = True then pmTopMenuButtonLabels.Checked := False
    else pmTopMenuButtonLabels.Checked := True;

  if pmTopMenuButtonLabels.Checked = True then TextChoice := 0 else TextChoice := 1;

  ShowIconText(TextChoice);

  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      WriteInteger('IconText', TextChoice);
      CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TMainForm.tbxiViewTitleClick(Sender: TObject);
begin
  if tbxiViewTitle.Checked = True then tbxiViewTitle.Checked := False
    else tbxiViewTitle.Checked := True;

  tbxtTitle.Visible := tbxiViewTitle.Checked;
  pmvqTitle.Checked := tbxiViewTitle.Checked;
end;

procedure TMainForm.tbxiViewCatalogueNameClick(Sender: TObject);
begin
  if tbxiViewCatalogueName.Checked = True then tbxiViewCatalogueName.Checked := False
    else tbxiViewCatalogueName.Checked := True;

  tbxtCatalogueName.Visible := tbxiViewCatalogueName.Checked;
  pmvqCatalogueName.Checked := tbxiViewCatalogueName.Checked;
end;

procedure TMainForm.tbxiViewYearClick(Sender: TObject);
begin
  if tbxiViewYear.Checked = True then tbxiViewYear.Checked := False
    else tbxiViewYear.Checked := True;

  tbxtYear.Visible := tbxiViewYear.Checked;
  pmvqYear.Checked := tbxiViewYear.Checked;
end;

procedure TMainForm.tbxtYearClose(Sender: TObject);
begin
  tbxiViewYear.Checked := tbxtYear.Visible;
end;

procedure TMainForm.tbxtCatalogueNameClose(Sender: TObject);
begin
  tbxiViewCatalogueName.Checked := tbxtCatalogueName.Visible;
end;

procedure TMainForm.tbxtAlbumClose(Sender: TObject);
begin
  tbxiViewAlbum.Checked := tbxtAlbum.Visible;
end;

procedure TMainForm.tbxtTitleClose(Sender: TObject);
begin
  tbxiViewTitle.Checked := tbxtTitle.Visible;
end;

procedure TMainForm.SetTheme(ThemeNumber : Integer);
begin
  case ThemeNumber of
  0 : begin
        TBXSetTheme('Default');
      end;
  1 : begin
        TBXSetTheme('Acro');
      end;
  2 : begin
        TBXSetTheme('Nexos');
      end;
  3 : begin
        TBXSetTheme('Nexos2');
      end;
  4 : begin
        TBXSetTheme('Office11Adaptive');
      end;
  5 : begin
        TBXSetTheme('Office11XP');
      end;
  6 : begin
        TBXSetTheme('Office2003');
      end;
  7 : begin
        TBXSetTheme('OfficeC');
      end;
  8 : begin
        TBXSetTheme('OfficeK');
      end;
  9 : begin
        TBXSetTheme('OfficeXP');
      end;
  10 : begin
        TBXSetTheme('Roma');
      end;
  11 : begin
        TBXSetTheme('Stripes');
      end;
  12 : begin
        TBXSetTheme('Tristan');
      end;
  13 : begin
        TBXSetTheme('Tristan2');
      end;
  14 : begin
        TBXSetTheme('Wos');
      end;
  end;
end;

procedure TMainForm.tbxiRepCatFileLisingClick(Sender: TObject);
var FilterType : Integer;
begin
  if SaveDialog.Execute then
  begin
    FilterType := GetReportFilter;
    if FilterType = -1 then Exit;
    CreateHTMLStyleSheet(ExtractFilePath(SaveDialog.FileName)+'styles.css');
    CreateFilelistHTMLFile(SaveDialog.FileName, ExtractFilePath(SaveDialog.FileName)+'styles.css', FilterType);
    if (FileExists(SaveDialog.FileName)) and (AutolaunchReport = 0) then
      ShellExecute(Handle, 'OPEN', PChar(SaveDialog.FileName), nil, nil, sw_shownormal);
  end;
end;

procedure TMainForm.TBXISaveFilterClick(Sender: TObject);
var SaveName : string;
	MenuItem : TTBCustomItem;
begin
  if (dmMain.dsqSongs.Filtered = True) and (dmMain.dsqSongs.Filter <> '') then
  begin
    SaveName := SaveFilterAs;
    if SaveName = '' then Exit;
    //SaveName := 'Query ('+IntToStr(dmMain.dsqSongs.RecordCount)+' records) '+DateTimeToStr(now);
    dmMain.Querys.Open;
    dmMain.Querys.Insert;
    dmMain.Querys.FieldByName('Name').AsString := SaveName;
    dmMain.Querys.FieldByName('Filter').AsString := dmMain.dsqSongs.Filter;
    dmMain.Querys.Post;

	  MenuItem := AddMenuItem(mpQuery,dmMain.Querys.FieldByName('Name').AsString, RunSavedFilter);
	  MenuItem.Tag := dmMain.Querys.FieldByName('id').AsInteger; // Tag set to record id to allow identification in Method
    dmMain.Querys.Close;
  end;
end;

function TMainForm.CreateMenuItem(Caption : string; Method : TNotifyEvent ) : TTBCustomItem;
var
	MenuItem : TTBCustomItem;
begin
  MenuItem := TTBCustomItem.create( self );
  MenuItem.Caption := Caption;
  MenuItem.OnClick := Method;
  result := MenuItem;
end;

function TMainForm.AddMenuItem(MenuParent : TMenuParent; Caption : string; Method : TNotifyEvent ) : {TMenuItem} TTBCustomItem;
//Create and add a menu item to the parent specified and return MenuItem
begin
  Result := CreateMenuItem(Caption,Method);
  case MenuParent of
  mpQuery :
    begin
      TBXSIQuerys.add(Result);
//      TBXSIQuerys.visible := true;
    end;
  end;
end;

procedure TMainForm.AddFilterMenu(Sender : TObject; Method : TNotifyEvent);
var i, breaknum : Integer;
  	MenuItem : TTBCustomItem;
    SQLQuery : TDBISamQuery;
begin
  for I := TBXSIQuerys.Count -1 downto 3 do
  	TBXSIQuerys.Delete(I);

  BreakNum := Screen.Height div 17;
  SQLQuery := TDBISamQuery.Create(nil);
  SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
  SQLQuery.sql.Add(
    ' select * '+
    ' from querys '+
    ' order by name '
  );
  SQLQuery.Active := True;
  for	i := 1 to SQLQuery.RecordCount do
	begin
	  MenuItem := AddMenuItem(mpQuery, SQLQuery.FieldByName('Name').AsString, Method);
	  MenuItem.Tag := SQLQuery.FieldByName('id').AsInteger; // Tag set to record id to allow identification in Method
{    if (TBXSIQuerys.Count mod BreakNum) = 0 then
      MenuItem.Break := mbBarBreak;}
    SQLQuery.Next;
	end;
  SQLQuery.Free;
end;

procedure TMainForm.RunSavedFilter(Sender : TObject);
var Save_Cursor : TCursor;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourglass;    { Show hourglass cursor }
  StatusBar.Panels[1].text := 'Loading query...';
  dmMain.Querys.Open;

  if dmMain.Querys.Locate('id', TMenuItem(Sender).Tag, [loCaseInsensitive]) = True then
  begin

    dmMain.dsqSongs.filter := '';
    dmMain.dsqSongs.Filtered := False;
    dmMain.dsqSongs.Filter := dmMain.Querys.FieldByName('Filter').AsString;
    dmMain.dsqSongs.Filtered := True;
  //  tbApply.Enabled := QueryMode;
  //  tbCancel.Enabled := QueryMode;

    RefreshTotals;
    pcSongs.ActivePage := tsSongs;
    dbgSongs.SetFocus;

  end;
  dmMain.Querys.Close;
  DefaultStatusBarHint;
  Screen.Cursor := Save_Cursor;  { Always restore to normal }
end;

procedure TMainForm.TBXIDeleteFilterClick(Sender: TObject);
begin
  FiltersForm := TFiltersForm.create(nil);
  FiltersForm.ShowModal;
  FiltersForm.Free;
end;

procedure TMainForm.ToggleGui(Enabled : Boolean);
begin
//  tbxtFileMenu.Enabled := Enabled;
//  tbxtChanges.Enabled := Enabled;
//  tbxtNavigation.Enabled := Enabled;
//  tbxtMainMenu.Enabled := Enabled;
  TBXSIFile.Enabled := Enabled;
  TBXSIView.Enabled := Enabled;
  TBXSIReports.Enabled := Enabled;
  TBXSIQuerys.Enabled := Enabled;
  TBXSINavigation.Enabled := Enabled;
  TBXSIHelp.Enabled := Enabled;

  pcSongs.Enabled := Enabled;
  pcSongProperties.Enabled := Enabled;
  tsSongs.Enabled := Enabled;
  tsSongDetails.Enabled := Enabled;
  tsAlbumDetails.Enabled := Enabled;

  TBXDPTreeview.Enabled := Enabled;

  tbxiFilter.Enabled := Enabled;
  tbxiReset.Enabled := Enabled;
  tbxiAdd.Enabled := Enabled;
  tbxiDelete.Enabled := Enabled;
  tbxiSave.Enabled := Enabled;
  tbxiCancel.Enabled := Enabled;
  tbxiFirst.Enabled := Enabled;
  tbxiPrevious.Enabled := Enabled;
  tbxiNext.Enabled := Enabled;
  tbxiLast.Enabled := Enabled;
  tbxiNavFirst.Enabled := Enabled;
  tbxiNavPrevious.Enabled := Enabled;
  tbxiNavNext.Enabled := Enabled;
  tbxiNavLast.Enabled := Enabled;

  if (Enabled = True) and (pcSongs.ActivePage = tsSongs) then
  begin
    if (tbxtArtist.Visible and tbxeArtist.CanFocus) then tbxeArtist.SetFocus else
    if (tbxtTitle.Visible and tbxeTitle.Canfocus) then tbxeTitle.SetFocus else
    if (tbxtAlbum.Visible and tbxeAlbum.CanFocus) then tbxeAlbum.SetFocus else
    if (tbxtCatalogue.Visible and tbxcbCatName.CanFocus) then tbxcbCatName.SetFocus else
    if (tbxtCatalogueName.Visible and tbxeCatNo.CanFocus) then tbxeCatNo.SetFocus else
    if (tbxtGenre.Visible and tbxcbGenre.CanFocus) then tbxcbGenre.SetFocus else
    if (tbxtFileDetails.Visible and tbxeFilename.CanFocus) then tbxeFilename.SetFocus else
    if (tbxtTrack.Visible and tbxeTrackNo.CanFocus) then tbxeTrackNo.SetFocus else
    if (tbxtYear.Visible and tbxeYear.CanFocus) then tbxeYear.SetFocus;
  end;
end;

procedure TMainForm.StartupTimerTimer(Sender: TObject);
begin
  StartupTimer.Enabled := False;
  DefaultStatusBarHint;
  MainSQL(OrderBy);

  RefreshTotals;
end;

procedure TMainForm.pmQQArtistClick(Sender: TObject);
var ArtID : Integer;
    Save_Cursor:TCursor;
begin
  try
    ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    ArtID := dmMain.dsqSongs.FieldByName('Artist_ID').AsInteger;
    dmMain.dsqSongs.Filtered := False;
    if TBXDPTreeview.Visible then cbTreeFilter.Checked := False;
    dmMain.dsqSongs.Filter := 'Artist_ID = '+IntToStr(ArtID);
    dmMain.dsqSongs.Filtered := True;
    RefreshTotals;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TMainForm.pmQQCatalogueClick(Sender: TObject);
var CatID : Integer;
    Save_Cursor:TCursor;
begin
  try
    ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    CatID := dmMain.dsqSongs.FieldByName('Catalogue_ID').AsInteger;
    dmMain.dsqSongs.Filtered := False;
    if TBXDPTreeview.Visible then cbTreeFilter.Checked := False;
    dmMain.dsqSongs.Filter := 'Catalogue_ID = '+IntToStr(CatID);
    dmMain.dsqSongs.Filtered := True;
    RefreshTotals;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TMainForm.pmQQAlbumClick(Sender: TObject);
var AlbumID : Integer;
    Save_Cursor:TCursor;
begin
  try
    ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    AlbumID := dmMain.dsqSongs.FieldByName('Album_ID').AsInteger;
    dmMain.dsqSongs.Filtered := False;
    if TBXDPTreeview.Visible then cbTreeFilter.Checked := False;
    dmMain.dsqSongs.Filter := 'Album_ID = '+IntToStr(AlbumID);
    dmMain.dsqSongs.Filtered := True;
    RefreshTotals;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TMainForm.pmDelCatalogueClick(Sender: TObject);
var Save_Cursor:TCursor;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    ToggleGui(False);
    DeleteForm.DeleteCatalogue(dmMain.dsqSongs.FieldByName('Catalogue_ID').AsInteger);
    RefreshMp3List;
    DefaultStatusBarHint;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TMainForm.pmDelSongClick(Sender: TObject);
var Save_Cursor:TCursor;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    ToggleGui(False);
    DeleteForm.DeleteSong(dmMain.dsqSongs.FieldByName('ID').AsInteger);
    RefreshMp3List;
    DefaultStatusBarHint;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TMainForm.pmDelArtistClick(Sender: TObject);
var Save_Cursor:TCursor;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    ToggleGui(False);
    DeleteForm.DeleteArtistAndSongs(dmMain.dsqSongs.FieldByName('Artist_ID').AsInteger);
    RefreshMp3List;
    DefaultStatusBarHint;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TMainForm.pmDelAlbumClick(Sender: TObject);
var Save_Cursor:TCursor;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    ToggleGui(False);
    DeleteForm.DeleteAlbum(dmMain.dsqSongs.FieldByName('Album_ID').AsInteger);
    RefreshMp3List;
    DefaultStatusBarHint;
  finally
    ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TMainForm.StandardFilterTV;
var i, CatId, ArtId, AlbId : Integer;
  MyRecPtr: PMyRec;
  TreeViewIndex: LongInt;
  CatTN, AlbumTN, ArtistTN : TTreeNode;
  SQLQuery : TDBISamQuery;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    SQLQuery := TDBISamQuery.Create(nil);
    SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
    SQLQuery.sql.Add(
      ' select distinct c.id c_id, c.catalogue_name, a.id a_id, a.artist_name, al.id al_id, al.album_title, s.filename '+
      ' from catalogues c, artists a, songs s, albums al '+
      ' where s.catalogue_id = c.id '+
      ' and s.artist_id = a.id '+
      ' and a.artist_name is not null '+
      ' and al.id = s.album_id '+
      ' and al.album_title is not null '+
      ' order by c.catalogue_name, c.id, a.artist_name, al.album_title ');
    SQLQuery.Active := True;

    LockWindowUpdate(FilterTV.Handle);
    FilterTV.Items.Clear;
    CatId := 0;
    ArtId := 0;
    AlbId := 0;
    while not SQLQuery.Eof do
    begin
      if SQLQuery.FieldByName('c_id').AsInteger <> CatId then
      begin
        New(MyRecPtr);
        MyRecPtr^.CatId := SQLQuery.FieldByName('c_id').AsInteger;
        MyRecPtr^.ArtId := 0;
        MyRecPtr^.AlbId := 0;

        CatTN := FilterTV.Items.AddObject(nil, SQLQuery.FieldByName('catalogue_name').AsString, MyRecPtr);
        CatTN.ImageIndex := GetDriveTypeImageIndex(SQLQuery.FieldByName('filename').AsString);
        CatTN.SelectedIndex := GetDriveTypeImageIndex(SQLQuery.FieldByName('filename').AsString);

        if (SQLQuery.FieldByName('a_id').AsInteger <> ArtId) and (SQLQuery.FieldByName('artist_name').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := 0;

          ArtistTN := FilterTV.Items.AddChildObject(CatTN, SQLQuery.FieldByName('artist_name').AsString, MyRecPtr);
          ArtistTN.ImageIndex := 1;
          ArtistTN.SelectedIndex := 1;
        end;

        if (SQLQuery.FieldByName('al_id').AsInteger <> AlbId) and (SQLQuery.FieldByName('album_title').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := 0;//SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := SQLQuery.FieldByName('al_id').AsInteger;
          AlbumTN := FilterTV.Items.AddChildObject(ArtistTN, SQLQuery.FieldByName('album_title').AsString, MyRecPtr);
          AlbumTN.ImageIndex := 2;
          AlbumTN.SelectedIndex := 2;
        end;

      end else
      begin
        if (SQLQuery.FieldByName('a_id').AsInteger <> ArtId) and (SQLQuery.FieldByName('artist_name').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := 0;
          ArtistTN := FilterTV.Items.AddChildObject(CatTN, SQLQuery.FieldByName('artist_name').AsString, MyRecPtr);
          ArtistTN.ImageIndex := 1;
          ArtistTN.SelectedIndex := 1;
        end;

        if (SQLQuery.FieldByName('al_id').AsInteger <> AlbId) and (SQLQuery.FieldByName('album_title').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := 0;//SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := SQLQuery.FieldByName('al_id').AsInteger;
          AlbumTN := FilterTV.Items.AddChildObject(ArtistTN, SQLQuery.FieldByName('album_title').AsString, MyRecPtr);
          AlbumTN.ImageIndex := 2;
          AlbumTN.SelectedIndex := 2;
        end;

      end;
      CatId := SQLQuery.FieldByName('c_id').AsInteger;
      ArtId := SQLQuery.FieldByName('a_id').AsInteger;
      AlbId := SQLQuery.FieldByName('al_id').AsInteger;
      SQLQuery.Next;
    end;
  finally
    SQLQuery.Free;
    LockWindowUpdate(0);
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TMainForm.ArtistFilterTV;
var i, CatId, ArtId, AlbId : Integer;
  MyRecPtr: PMyRec;
  TreeViewIndex: LongInt;
  AlbumTN, ArtistTN : TTreeNode;
  SQLQuery : TDBISamQuery;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    SQLQuery := TDBISamQuery.Create(nil);
    SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
    SQLQuery.sql.Add(
      ' select distinct a.id a_id, a.artist_name, al.id al_id, al.album_title '+
      ' from artists a, songs s, albums al '+
      ' where s.artist_id = a.id '+
      ' and a.artist_name is not null '+
      ' and al.id = s.album_id '+
      ' and al.album_title is not null '+
      ' order by a.artist_name, al.album_title ');
    SQLQuery.Active := True;

    LockWindowUpdate(FilterTV.Handle);
    FilterTV.Items.Clear;
//    CatId := 0;
    ArtId := 0;
    AlbId := 0;
    while not SQLQuery.Eof do
    begin
      if SQLQuery.FieldByName('a_id').AsInteger <> ArtId then
      begin
        New(MyRecPtr);
        MyRecPtr^.CatId := 0;
        MyRecPtr^.ArtId := SQLQuery.FieldByName('a_id').AsInteger;
        MyRecPtr^.AlbId := 0;
        ArtistTN := FilterTV.Items.AddObject(nil, SQLQuery.FieldByName('artist_name').AsString, MyRecPtr);
        ArtistTN.ImageIndex := 1;
        ArtistTN.SelectedIndex := 1;

        if (SQLQuery.FieldByName('al_id').AsInteger <> AlbId) and (SQLQuery.FieldByName('album_title').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := 0;//SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := 0;//SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := SQLQuery.FieldByName('al_id').AsInteger;
          AlbumTN := FilterTV.Items.AddChildObject(ArtistTN, SQLQuery.FieldByName('album_title').AsString, MyRecPtr);
          AlbumTN.ImageIndex := 2;
          AlbumTN.SelectedIndex := 2;
        end;

      end else
      begin
        if (SQLQuery.FieldByName('al_id').AsInteger <> AlbId) and (SQLQuery.FieldByName('album_title').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := 0;//SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := 0;//SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := SQLQuery.FieldByName('al_id').AsInteger;
          AlbumTN := FilterTV.Items.AddChildObject(ArtistTN, SQLQuery.FieldByName('album_title').AsString, MyRecPtr);
          AlbumTN.ImageIndex := 2;
          AlbumTN.SelectedIndex := 2;
        end;

      end;
//      CatId := SQLQuery.FieldByName('c_id').AsInteger;
      ArtId := SQLQuery.FieldByName('a_id').AsInteger;
      AlbId := SQLQuery.FieldByName('al_id').AsInteger;
      SQLQuery.Next;
    end;
  finally
    SQLQuery.Free;
    LockWindowUpdate(0);
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TMainForm.AlphaArtistFilterTV;
var i, CatId, ArtId, AlbId : Integer;
  MyRecPtr: PMyRec;
  TreeViewIndex: LongInt;
  CatTN, AlbumTN, ArtistTN : TTreeNode;
  SQLQuery : TDBISamQuery;
  LastAlpha, CurrentAlpha : string;
begin
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    SQLQuery := TDBISamQuery.Create(nil);
    SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
    SQLQuery.sql.Add(
      ' select distinct a.id a_id, upper(substring(a.artist_name from 1 for 1)) as alph, '+
      ' a.artist_name, al.id al_id, al.album_title, s.catalogue_id c_id '+
      ' from artists a, songs s, albums al '+
      ' where s.artist_id = a.id '+
      ' and a.artist_name is not null '+
      ' and al.id = s.album_id '+
      ' and al.album_title is not null '+
      ' order by alph, a.artist_name, al.album_title ');
    SQLQuery.Active := True;

    LockWindowUpdate(FilterTV.Handle);
    FilterTV.Items.Clear;
    CatId := 0;
    ArtId := 0;
    AlbId := 0;
    LastAlpha := '';
    CurrentAlpha := '';
    while not SQLQuery.Eof do
    begin
      if not (SQLQuery.FieldByName('alph').AsString[1] in ['A'..'Z']) then CurrentAlpha := '#' else
        CurrentAlpha := SQLQuery.FieldByName('alph').AsString;

      if CurrentAlpha <> LastAlpha then
      begin
        New(MyRecPtr);
        MyRecPtr^.CatId := 0;
        MyRecPtr^.ArtId := 0;
        MyRecPtr^.AlbId := 0;
        if not (SQLQuery.FieldByName('alph').AsString[1] in ['A'..'Z']) then
          CatTN := FilterTV.Items.AddObject(nil, '#', MyRecPtr) else
          CatTN := FilterTV.Items.AddObject(nil, SQLQuery.FieldByName('alph').AsString, MyRecPtr);

        CatTN.ImageIndex := 0;
        CatTN.SelectedIndex := 0;

        if (SQLQuery.FieldByName('a_id').AsInteger <> ArtId) and (SQLQuery.FieldByName('artist_name').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := 0;//SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := 0;

          ArtistTN := FilterTV.Items.AddChildObject(CatTN, SQLQuery.FieldByName('artist_name').AsString, MyRecPtr);
          ArtistTN.ImageIndex := 1;
          ArtistTN.SelectedIndex := 1;
        end;

        if (SQLQuery.FieldByName('al_id').AsInteger <> AlbId) and (SQLQuery.FieldByName('album_title').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := 0;//SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := SQLQuery.FieldByName('al_id').AsInteger;
          AlbumTN := FilterTV.Items.AddChildObject(ArtistTN, SQLQuery.FieldByName('album_title').AsString, MyRecPtr);
          AlbumTN.ImageIndex := 2;
          AlbumTN.SelectedIndex := 2;
        end;

      end else
      begin
        if (SQLQuery.FieldByName('a_id').AsInteger <> ArtId) and (SQLQuery.FieldByName('artist_name').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := 0;//SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := 0;
          ArtistTN := FilterTV.Items.AddChildObject(CatTN, SQLQuery.FieldByName('artist_name').AsString, MyRecPtr);
          ArtistTN.ImageIndex := 1;
          ArtistTN.SelectedIndex := 1;
        end;

        if (SQLQuery.FieldByName('al_id').AsInteger <> AlbId) and (SQLQuery.FieldByName('album_title').AsString <> '') then
        begin
          New(MyRecPtr);
          MyRecPtr^.CatId := SQLQuery.FieldByName('c_id').AsInteger;
          MyRecPtr^.ArtId := 0;//SQLQuery.FieldByName('a_id').AsInteger;
          MyRecPtr^.AlbId := SQLQuery.FieldByName('al_id').AsInteger;
          AlbumTN := FilterTV.Items.AddChildObject(ArtistTN, SQLQuery.FieldByName('album_title').AsString, MyRecPtr);
          AlbumTN.ImageIndex := 2;
          AlbumTN.SelectedIndex := 2;
        end;

      end;
      CatId := SQLQuery.FieldByName('c_id').AsInteger;
      ArtId := SQLQuery.FieldByName('a_id').AsInteger;
      AlbId := SQLQuery.FieldByName('al_id').AsInteger;
      if not (SQLQuery.FieldByName('alph').AsString[1] in ['A'..'Z']) then LastAlpha := '#' else
        LastAlpha := SQLQuery.FieldByName('alph').AsString;
      SQLQuery.Next;
    end;
  finally
    SQLQuery.Free;
    LockWindowUpdate(0);
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TMainForm.ProcessFilterTV(FilterType : Integer);
begin
  case FilterType of
  0 : begin
        StandardFilterTV;
      end;
  1 : begin
        ArtistFilterTV;
      end;
  2 : begin
        AlphaArtistFilterTV;
      end;
  end;
end;

procedure TMainForm.tbxiFilterTreeBarClick(Sender: TObject);
begin
  if tbxiFilterTreeBar.Checked = True then tbxiFilterTreeBar.Checked := False
    else tbxiFilterTreeBar.Checked := True;

  TBXDPTreeview.Visible := tbxiFilterTreeBar.Checked;
  if TBXDPTreeview.Visible then ProcessFilterTV(TVFilterType);
end;

procedure TMainForm.TBXDPTreeviewClose(Sender: TObject);
begin
  tbxiFilterTreeBar.Checked := False;
end;

procedure TMainForm.FilterTVExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  Node.Selected := True;
end;

procedure TMainForm.DoTVFilter;
var CatId, ArtId, AlbId : Integer;
    ArtistFilter, Filter, Str : string;
begin
  try
    CatId := PMyRec(FilterTV.Selected.Data)^.CatId;
  except
    CatId := 0;
  end;
  try
    ArtId := PMyRec(FilterTV.Selected.Data)^.ArtId;
  except
    ArtId := 0;
  end;
  try
    AlbId := PMyRec(FilterTV.Selected.Data)^.AlbId;
  except
    AlbId := 0;
  end;

  if FilterTV.Items.Count > 0 then
  begin
    if cbTreeFilter.Checked = False then
    begin
      Filter := '';
      dmMain.dsqSongs.Filtered := False;
    end else
    begin

      Filter := '';
      dmMain.dsqSongs.Filtered := False;

      if ArtID > 0 then
      begin
        if Filter <> '' then Filter := Filter + ' AND ';
        Filter := Filter + 'Artist_ID = '+IntToStr(ArtID);
      end;
      if CatID > 0 then
      begin
        if Filter <> '' then Filter := Filter + ' AND ';
        Filter := Filter + 'Catalogue_ID = '+IntToStr(CatID);
      end;
      if AlbID > 0 then
      begin
        if Filter <> '' then Filter := Filter + ' AND ';
        Filter := Filter + 'Album_ID = '+IntToStr(AlbID);
      end;

      case TVFilterType of    //Add alphabetically sort , dont include the #
      0 : begin
          end;
      1 : begin
          end;
      2 : begin
            if (FilterTV.Items.Item[FilterTV.Selected.AbsoluteIndex].Level = 0) and
               (Copy(FilterTV.Items.Item[FilterTV.Selected.AbsoluteIndex].Text, 1, 1) <> '#') then
            begin
              Str := Copy(FilterTV.Items.Item[FilterTV.Selected.AbsoluteIndex].Text, 1, 1);
              if Filter <> '' then Filter := Filter + ' AND ';
              ArtistFilter := CheckLikeFilter('Artist_Name',Str+'*');
              Filter := Filter + ArtistFilter;
            end;
          end;
      end;

      if Filter <> '' then
      begin
      // MainSQL proc, do a new order by.

        dmMain.dsqSongs.Filter := Filter;
        dmMain.dsqSongs.Filtered := True;
      end;
    end;
    RefreshTotals;

  end;
end;

procedure TMainForm.cbTreeFilterClick(Sender: TObject);
begin
  DoTVFilter;
end;

procedure TMainForm.FilterTVMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var AnItem: TTreeNode;
 CatId, ArtId, AlbId : Integer;
begin
  AnItem := FilterTV.GetNodeAt(X, Y);
  if (Button = mbRight) then FilterTV.Items.Item[AnItem.AbsoluteIndex].Selected := True;

  if (AutoFilterBar = 0) then cbTreeFilter.Checked := True;
  DoTVFilter;
end;

procedure TMainForm.FilterTVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DoTVFilter;
end;

procedure TMainForm.pmtvCatalogueDetailsClick(Sender: TObject);
begin
  if PMyRec(FilterTV.Selected.Data)^.CatId > 0 then
  begin
    CatDetailsForm := TCatDetailsForm.create(self);
    CatDetailsForm.CatID := PMyRec(FilterTV.Selected.Data)^.CatId;
    CatDetailsForm.ShowModal;
    CatDetailsForm.Free;
  end;
end;

procedure TMainForm.pcSongsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := not ((pcSongs.ActivePage = tsProperties) and
     (ModifiedEntry = True) and (PropertiesIsLoading = False));
end;

procedure TMainForm.tbxiResetClick(Sender: TObject);
begin
  EnableFilterMode;
end;

procedure TMainForm.tbxiBlankFilterTextClick(Sender: TObject);
begin
  if tbxiBlankFilterText.Checked = True then
    tbxiBlankFilterText.Checked := False
  else tbxiBlankFilterText.Checked := True;
end;

end.
