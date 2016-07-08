unit Settings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Registry, Mask, ToolEdit, DB, PBFolderDialog,
  RxCombos, CheckLst, EasyFileSearch, FileSearch, DBISAMTb;

type
  TSettingsForm = class(TForm)
    bOk: TButton;
    bCancel: TButton;
    PageControl1: TPageControl;
    tsFreeDB: TTabSheet;
    tsFilterBar: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    cbServerList: TComboBox;
    eDescription: TEdit;
    eProxy: TEdit;
    eEmailAddress: TEdit;
    bRefresh: TButton;
    cbProxyServer: TCheckBox;
    tsDatabase: TTabSheet;
    lbDirectory: TLabel;
    PBFolderDialog: TPBFolderDialog;
    ceDirectory: TComboEdit;
    bReset: TButton;
    tsReportOptions: TTabSheet;
    rgFilterPrompt: TRadioGroup;
    rgAutoLaunchRep: TRadioGroup;
    tsDisplay: TTabSheet;
    gbTheme: TGroupBox;
    cbTheme: TComboBox;
    rgFileMenuCaptions: TRadioGroup;
    rgAutoEnableFilterBar: TRadioGroup;
    tsCollectionGrid: TTabSheet;
    clbCollectionGrid: TCheckListBox;
    Label3: TLabel;
    rgDefaultFilter: TRadioGroup;
    gbFilterTree: TGroupBox;
    cbFilterDisplayStyle: TComboBox;
    gbDblClick: TGroupBox;
    cbSongsDblClock: TComboBox;
    rgAutoExpand: TRadioGroup;
    rgIconLayout: TRadioGroup;
    tsSpare: TTabSheet;
    cbConfirmSaves: TCheckBox;
    rgIncludeFilterBar: TRadioGroup;
    gbTransparency: TGroupBox;
    tbTransparency: TTrackBar;
    bOptimise: TButton;
    bRepair: TButton;
    Button1: TButton;
    EasyFileSearch: TEasyFileSearch;
    DBISAMTable1: TDBISAMTable;
    procedure cbProxyServerClick(Sender: TObject);
    procedure bRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure ceDirectoryButtonClick(Sender: TObject);
    procedure bResetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PBFolderDialogInitialized(Sender: TPBFolderDialog;
      DialogHandle: HWND);
    procedure bOptimiseClick(Sender: TObject);
    procedure EasyFileSearchFileFound(FileFound: TFileInformations);
    procedure DatabaseOperation(OpMode : string);
    procedure bRepairClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;
  OldPercent : Integer;
  TableList : TStringList;

implementation

uses Main, datamod;

{$R *.DFM}

procedure TSettingsForm.cbProxyServerClick(Sender: TObject);
begin
  eProxy.Enabled := cbProxyServer.Checked;
end;

procedure TSettingsForm.bRefreshClick(Sender: TObject);
begin
{  MainForm.CDDB.ServerAddr := cbServerList.Items.Text;
  MainForm.CDDB.ServerAdditionalAddr := '/~cddb/cddb.cgi';
//  MainForm.CDDB.ServerType := HTTP;
  MainForm.CDDB.ServerPort := eProxy.Text;
  MainForm.CDDB.http_sites;}
end;

procedure TSettingsForm.FormCreate(Sender: TObject);
var Reg : TRegistry;
 Info: TOSVersionInfo;
begin
  Info.dwOSVersionInfoSize := SizeOf(Info);
  GetVersionEx(Info);
  if (Info.dwPlatformId = VER_PLATFORM_WIN32_NT) and (Info.dwMajorVersion >= 5) then
  begin
    gbTransparency.Visible := True;
  end else
  begin
    gbTransparency.Visible := False;
  end;

  OldPercent := MainForm.Percents;
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);
  tsFreeDB.TabVisible := False; //Not finished yet
  tsSpare.TabVisible := False; //Not finished yet

  MainForm.StatusBar.Panels[0].ImageIndex := 8;
  MainForm.StatusBar.Panels[1].Text := 'Change program settings';

  cbConfirmSaves.Checked :=  not MainForm.ConfirmSave;

  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\'+ApplicationName+'\Configuration',true);
      try
        cbTheme.ItemIndex := ReadInteger('Theme');
      except
        cbTheme.ItemIndex := 0;
      end;
      try
        rgAutoExpand.ItemIndex := ReadInteger('AutoExpand');
      except
        rgAutoExpand.ItemIndex := 0;
      end;
      try
        cbFilterDisplayStyle.ItemIndex := ReadInteger('FilterDisplayStyle');
      except
        cbFilterDisplayStyle.ItemIndex := 0;
      end;
      try
        cbSongsDblClock.ItemIndex := ReadInteger('SongsDblClick');
      except
        cbSongsDblClock.ItemIndex := 0;
      end;
      try
        rgIncludeFilterBar.ItemIndex := ReadInteger('IncludeFilterbar');
      except
        rgIncludeFilterBar.ItemIndex := 0;
      end;
      try
        rgDefaultFilter.ItemIndex := ReadInteger('DefaultFilter');
      except
        rgDefaultFilter.ItemIndex := 0;
      end;
      try
        rgFilterPrompt.ItemIndex := ReadInteger('FilterPrompt');
      except
        rgFilterPrompt.ItemIndex := 0;
      end;
      try
        rgAutoEnableFilterBar.ItemIndex := ReadInteger('AutoFilterbar');
      except
        rgAutoEnableFilterBar.ItemIndex := 0;
      end;
      try
        rgAutoLaunchRep.ItemIndex := ReadInteger('AutoLaunchRep');
      except
        rgAutoLaunchRep.ItemIndex := 0;
      end;
      try
        rgIconLayout.ItemIndex := ReadInteger('IconLayout');
      except
        rgIconLayout.ItemIndex := 0;
      end;
      try
        rgFileMenuCaptions.ItemIndex := ReadInteger('IconText');
      except
        rgFileMenuCaptions.ItemIndex := 0;
      end;
      try
        tbTransparency.Position := ReadInteger('Transparency');
      except
        tbTransparency.Position := 100;
      end;
      CloseKey;
    end;
  finally
    Reg.Free;
  end;
  ceDirectory.Text := dmMain.DBISAMDatabase.Directory;
end;

procedure TSettingsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var Reg : TRegistry;
    Save_Cursor:TCursor;
begin
  if modalresult = mrOk then
  begin
    dmMain.dsqSongsCatalogue_Number.Visible := clbCollectionGrid.Checked[0];
    dmMain.dsqSongsArtist_Name.Visible := clbCollectionGrid.Checked[1];
    dmMain.dsqSongsSong_Title.Visible := clbCollectionGrid.Checked[2];
    dmMain.dsqSongsAlbum_Title.Visible := clbCollectionGrid.Checked[3];
    dmMain.dsqSongsCatalogue_Name.Visible := clbCollectionGrid.Checked[4];
    dmMain.dsqSongsGenre_Name.Visible := clbCollectionGrid.Checked[5];
    dmMain.dsqSongsTrack_Number.Visible := clbCollectionGrid.Checked[6];
    dmMain.dsqSongsYear.Visible := clbCollectionGrid.Checked[7];
    dmMain.dsqSongsFilename.Visible := clbCollectionGrid.Checked[8];
    dmMain.dsqSongsLength.Visible := clbCollectionGrid.Checked[9];
    dmMain.dsqSongsLyrics.Visible := clbCollectionGrid.Checked[10];
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    MainForm.ConfirmSave := not cbConfirmSaves.Checked;
    MainForm.SongsDbl := cbSongsDblClock.ItemIndex;
    if cbFilterDisplayStyle.ItemIndex <> MainForm.TVFilterType then
    begin
      MainForm.TVFilterType := cbFilterDisplayStyle.ItemIndex;
      MainForm.ProcessFilterTV(cbFilterDisplayStyle.ItemIndex);
    end;

    Reg := TRegistry.Create;
    try
      with Reg do
      begin
        RootKey := HKEY_CURRENT_USER;
        OpenKey('Software\'+ApplicationName+'\Configuration',true);
        WriteInteger('AutoLaunchRep', rgAutoLaunchRep.ItemIndex);
        WriteInteger('FilterPrompt', rgFilterPrompt.ItemIndex);
        WriteInteger('AutoFilterBar', rgAutoEnableFilterBar.ItemIndex);
        WriteInteger('IncludeFilterbar', rgIncludeFilterBar.ItemIndex);
        WriteInteger('DefaultFilter', rgDefaultFilter.ItemIndex);
        WriteInteger('SongsDblClick', cbSongsDblClock.ItemIndex);
        WriteInteger('Theme', cbTheme.ItemIndex);
        WriteInteger('IconLayout', rgIconLayout.ItemIndex);
        WriteInteger('IconText', rgFileMenuCaptions.ItemIndex);
        WriteString('DatabasePath', ceDirectory.Text);
        WriteInteger('FilterDisplayStyle', cbFilterDisplayStyle.ItemIndex);
        WriteInteger('Transparency', tbTransparency.Position);
        WriteInteger('AutoExpand', rgAutoExpand.ItemIndex);
        CloseKey;
      end;
    finally
      Reg.Free;
    end;

    MainForm.SetTheme(cbTheme.itemindex);
    MainForm.IconLayout(rgIconLayout.ItemIndex);
    MainForm.ShowIconText(rgFileMenuCaptions.ItemIndex);
    MainForm.pmTopMenuButtonLabels.Checked := (rgFileMenuCaptions.ItemIndex = 0);
    MainForm.AutoFilterBar := rgAutoEnableFilterBar.ItemIndex;
    MainForm.Percents := tbTransparency.Position;
    case rgIncludeFilterBar.ItemIndex of
      0 : MainForm.UseFilterBar := True;
      1 : MainForm.UseFilterBar := False;
    end;
    case rgAutoExpand.ItemIndex of
      0 : MainForm.FilterTV.AutoExpand := True;
      1 : MainForm.FilterTV.AutoExpand := False;
    end;
    if ceDirectory.Text <> dmMain.DBISAMDatabase.Directory then
    begin
      MainForm.SetupDatabase(ceDirectory.Text);
      MainForm.OpenTables;
      MainForm.RefreshMp3List;
    end;
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
  MainForm.StatusBar.Panels[0].ImageIndex := -1;
  MainForm.StatusBar.Panels[1].Text := '';
  if tbTransparency.Position <> OldPercent then
    MainForm.SetTransparentForm(MainForm.Handle, (255 * MainForm.Percents) div 100);
end;

procedure TSettingsForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tsFilterbar then
    MainForm.StatusBar.Panels[1].Text := 'Change filterbar settings' else
  if PageControl1.ActivePage = tsCollectionGrid then
    MainForm.StatusBar.Panels[1].Text := 'Change collection grid settings' else
  if PageControl1.ActivePage = tsDisplay then
    MainForm.StatusBar.Panels[1].Text := 'Change display settings' else
  if PageControl1.ActivePage = tsDatabase then
    MainForm.StatusBar.Panels[1].Text := 'Change catalogue database path' else
  if PageControl1.ActivePage = tsReportOptions then
    MainForm.StatusBar.Panels[1].Text := 'Change reporting options';
end;

procedure TSettingsForm.ceDirectoryButtonClick(Sender: TObject);
begin
  PBFolderDialog.folder := ceDirectory.Text;
  if PBFolderDialog.Execute then ceDirectory.Text := PBFolderDialog.Folder;
end;

procedure TSettingsForm.bResetClick(Sender: TObject);
var Reg : TRegistry;
 i : Integer;
begin
  cbSongsDblClock.ItemIndex := 0;
  rgIconLayout.ItemIndex := 0;
  rgFileMenuCaptions.ItemIndex := 0;
  cbTheme.ItemIndex := 0;
  rgFilterPrompt.ItemIndex := 0;
  rgDefaultFilter.ItemIndex := 0;
  rgAutoLaunchRep.ItemIndex := 0;
  rgAutoEnableFilterBar.ItemIndex := 0;
  rgIncludeFilterBar.ItemIndex := 0;
  cbFilterDisplayStyle.ItemIndex := 0;
  tbTransparency.Position := 100;
  for i:=0 to clbCollectionGrid.Items.Count-1 do
  begin
    clbCollectionGrid.Checked[i] := True;
  end;
  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_CURRENT_USER;
      DeleteKey('Software\MP3Collector');
      CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TSettingsForm.FormShow(Sender: TObject);
begin
  SettingsForm.Font := MainForm.Font;
  clbCollectionGrid.Checked[0] := dmMain.dsqSongsCatalogue_Number.Visible;
  clbCollectionGrid.Checked[1] := dmMain.dsqSongsArtist_Name.Visible;
  clbCollectionGrid.Checked[2] := dmMain.dsqSongsSong_Title.Visible;
  clbCollectionGrid.Checked[3] := dmMain.dsqSongsAlbum_Title.Visible;
  clbCollectionGrid.Checked[4] := dmMain.dsqSongsCatalogue_Name.Visible;
  clbCollectionGrid.Checked[5] := dmMain.dsqSongsGenre_Name.Visible;
  clbCollectionGrid.Checked[6] := dmMain.dsqSongsTrack_Number.Visible;
  clbCollectionGrid.Checked[7] := dmMain.dsqSongsYear.Visible;
  clbCollectionGrid.Checked[8] := dmMain.dsqSongsFilename.Visible;
  clbCollectionGrid.Checked[9] := dmMain.dsqSongsLength.Visible;
  clbCollectionGrid.Checked[10] := dmMain.dsqSongsLyrics.Visible;
end;

procedure TSettingsForm.PBFolderDialogInitialized(Sender: TPBFolderDialog;
  DialogHandle: HWND);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(PBFolderDialog.DialogHandle, (255 * MainForm.Percents) div 100);
end;

procedure TSettingsForm.DatabaseOperation(OpMode : string);
var i : Integer;
    Table : TDBISAMTable;
    Save_Cursor:TCursor;
begin
  EasyFileSearch.FileNames.Clear;
  EasyFileSearch.FileNames.Add('*.dat');
  EasyFileSearch.RootPath := dmMain.DBISAMDatabase.Directory;
  try
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    MainForm.ProgressBar1.Visible := True;
    MainForm.StatusBar.Panels[1].Text := '';
    MainForm.StatusBar.Panels[1].Component := MainForm.ProgressBar1;
    MainForm.ProgressBar1.Position := 1;
    MainForm.ProgressBar1.Step := 1;
    TableList := TStringlist.Create;
    Table := TDBISAMTable.Create(nil);
    Table.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
    EasyFileSearch.Search;
    MainForm.CloseTables;
    dmMain.DBISAMDatabase.Connected := False;
    MainForm.ProgressBar1.Max := TableList.Count;
    for i:=0 to TableList.Count-1 do
    begin
      Table.TableName := TableList.Strings[i];
      if (OpMode = 'Repair') then Table.RepairTable(True) else
      if (OpMode = 'Empty') then Table.EmptyTable else
      if (OpMode = 'Optimise') then Table.OptimizeTable('', True);
      Table.Close;
      MainForm.ProgressBar1.StepIt;
    end;
    dmMain.DBISAMDatabase.Connected := True;
    MainForm.OpenTables;
    dmMain.dsqSongs.Active := True;
    dmMain.dsqAlbumTracks.Active := True;
    MainForm.RefreshTotals;
    if (OpMode = 'Empty') then
      if MainForm.TBXDPTreeview.Visible then MainForm.ProcessFilterTV(MainForm.TVFilterType);

//    MainForm.RefreshGenreLists;
//  MainForm.RefreshCatalogueLists;
  finally
    Table.Free;
    TableList.Free;
    MainForm.StatusBar.Panels[1].Component := nil;
    MainForm.ProgressBar1.Visible := False;
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
    MainForm.ToggleGui(True);
//    MessageDlg('Operation complete.', mtInformation, [mbOK], 0);
  end;
end;

procedure TSettingsForm.EasyFileSearchFileFound(
  FileFound: TFileInformations);
begin
  TableList.Add(FileFound.Path+FileFound.Name);
end;

procedure TSettingsForm.bOptimiseClick(Sender: TObject);
begin
  DatabaseOperation('Optimise');
end;

procedure TSettingsForm.bRepairClick(Sender: TObject);
begin
  DatabaseOperation('Repair');
end;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
  DatabaseOperation('Empty');
end;

end.
