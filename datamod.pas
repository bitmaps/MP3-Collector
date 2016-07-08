unit datamod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBISAMTb, Db;

type
  TdmMain = class(TDataModule)
    DBISAMDatabase: TDBISAMDatabase;
    dsqAlbumTracks: TDBISAMQuery;
    dsqAlbumTracksSong_Title: TStringField;
    dsqAlbumTracksTrack_Number: TIntegerField;
    dsqAlbumTracksID: TIntegerField;
    dsdsqAlbumTracks: TDataSource;
    qTemp: TDBISAMQuery;
    qPlaylistSongs: TDBISAMQuery;
    qPlaylistSongsPlaylistID: TIntegerField;
    qPlaylistSongsPlaylistSongsID: TIntegerField;
    qPlaylistSongsSongID: TIntegerField;
    qPlaylistSongsSong_Title: TStringField;
    qPlaylistSongsItemIndex: TIntegerField;
    qPlaylistSongsFilename: TStringField;
    dsqPlaylistSongs: TDataSource;
    PlaylistSongs: TDBISAMTable;
    dsPlaylistSongs: TDataSource;
    Playlists: TDBISAMTable;
    PlaylistsPlaylistID: TAutoIncField;
    PlaylistsPlaylist_Name: TStringField;
    dsPlaylists: TDataSource;
    Songs: TDBISAMTable;
    dsSongs: TDataSource;
    Genres: TDBISAMTable;
    dsGenres: TDataSource;
    Artists: TDBISAMTable;
    dsArtists: TDataSource;
    Albums: TDBISAMTable;
    dsAlbums: TDataSource;
    Catalogues: TDBISAMTable;
    dsCatalogues: TDataSource;
    dsqSongs: TDBISAMQuery;
    dsqSongsID: TIntegerField;
    dsqSongsCatalogue_Number: TIntegerField;
    dsqSongsArtist_Name: TStringField;
    dsqSongsSong_Title: TStringField;
    dsqSongsAlbum_Title: TStringField;
    dsqSongsCatalogue_Name: TStringField;
    dsqSongsGenre_Name: TStringField;
    dsqSongsTrack_Number: TIntegerField;
    dsqSongsYear: TIntegerField;
    dsqSongsFilename: TStringField;
    dsqSongsFilesize: TFloatField;
    dsqSongsLyrics: TMemoField;
    dsqSongsLength: TStringField;
    dsdsqSongs: TDataSource;
    Querys: TDBISAMTable;
    dsQuerys: TDataSource;
    dsqSongsAlbum_ID: TIntegerField;
    dsqSongsArtist_ID: TIntegerField;
    dsqSongsCatalogue_ID: TIntegerField;
    procedure dsdsqSongsDataChange(Sender: TObject; Field: TField);
    procedure dsqSongsAfterScroll(DataSet: TDataSet);
    procedure dsqSongsBeforeScroll(DataSet: TDataSet);
    procedure dsPlaylistsDataChange(Sender: TObject; Field: TField);
    procedure dsqSongsQueryProgress(Sender: TObject; PercentDone: Word;
      var AbortQuery: Boolean);
    procedure qTempQueryProgress(Sender: TObject; PercentDone: Word;
      var AbortQuery: Boolean);
    procedure dsqAlbumTracksQueryProgress(Sender: TObject;
      PercentDone: Word; var AbortQuery: Boolean);
    procedure dsqArtistsQueryProgress(Sender: TObject; PercentDone: Word;
      var AbortQuery: Boolean);
    procedure dsqCataloguesQueryProgress(Sender: TObject;
      PercentDone: Word; var AbortQuery: Boolean);
    function SongsTotal : Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

uses Main;

{$R *.DFM}

function TdmMain.SongsTotal : Integer;
begin
  Result := 0;
  qTemp.Active := False;
  qTemp.sql.Clear;
  qTemp.SQL.Add('select count(*) cnt from songs');
  qTemp.Active := True;
  Result := qTemp.FieldByName('cnt').AsInteger;
  qTemp.Active := False;
end;

procedure TdmMain.dsdsqSongsDataChange(Sender: TObject; Field: TField);
begin
//  MainForm.SongDetailsHint;
end;

procedure TdmMain.dsqSongsAfterScroll(DataSet: TDataSet);
begin
  MainForm.RefreshAlbumDetails;
  MainForm.dbgSongs.SelectRecord;
end;

procedure TdmMain.dsqSongsBeforeScroll(DataSet: TDataSet);
begin
  MainForm.dbgSongs.UnselectRecord;
  if ModifiedEntry = True then
  begin
//    ConfirmSaveEntry;
  end;
end;

procedure TdmMain.dsPlaylistsDataChange(Sender: TObject; Field: TField);
begin
  MainForm.RefreshPlaylistSongs;
end;

procedure TdmMain.dsqSongsQueryProgress(Sender: TObject; PercentDone: Word;
  var AbortQuery: Boolean);
begin
  if MainForm.ProgressBar1.Visible then
    MainForm.ProgressBar1.Position := PercentDone;

  Application.ProcessMessages;
end;

procedure TdmMain.qTempQueryProgress(Sender: TObject; PercentDone: Word;
  var AbortQuery: Boolean);
begin
  if MainForm.ProgressBar1.Visible then
    MainForm.ProgressBar1.Position := PercentDone;

  Application.ProcessMessages;
end;

procedure TdmMain.dsqAlbumTracksQueryProgress(Sender: TObject;
  PercentDone: Word; var AbortQuery: Boolean);
begin
  if MainForm.ProgressBar1.Visible then
    MainForm.ProgressBar1.Position := PercentDone;

  Application.ProcessMessages;
end;

procedure TdmMain.dsqArtistsQueryProgress(Sender: TObject;
  PercentDone: Word; var AbortQuery: Boolean);
begin
  if MainForm.ProgressBar1.Visible then
    MainForm.ProgressBar1.Position := PercentDone;

  Application.ProcessMessages;
end;

procedure TdmMain.dsqCataloguesQueryProgress(Sender: TObject;
  PercentDone: Word; var AbortQuery: Boolean);
begin
  if MainForm.ProgressBar1.Visible then
    MainForm.ProgressBar1.Position := PercentDone;

  Application.ProcessMessages;
end;

end.
