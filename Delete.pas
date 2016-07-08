unit Delete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TDeleteForm = class(TForm)
    Bevel1: TBevel;
    bOk: TButton;
    bCancel: TButton;
    rbSong: TRadioButton;
    rbAlbum: TRadioButton;
    rbArtist: TRadioButton;
    rbCatalogue: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DeleteSong(SongID : Integer);
    procedure DeleteArtist(ArtistID : Integer);
    procedure DeleteAlbum(AlbumID : Integer);
    procedure DeleteCatalogue(CatalogueID : Integer);
    procedure DeleteArtistAndSongs(ArtistID : Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DeleteForm: TDeleteForm;

implementation

uses Main, datamod;

{$R *.DFM}

procedure TDeleteForm.DeleteArtistAndSongs(ArtistID : Integer);
var OldIndex : String;
    Save_Cursor:TCursor;
begin
  try
//    MainForm.ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    MainForm.StatusBar.Panels[1].Text := 'Deleting artist and relating songs';
    MainForm.StatusBar.Panels[0].ImageIndex := 5;
    if dmMain.Artists.Locate('ID', ArtistID, []) then
    begin
      dmMain.Artists.Delete;
    end;

    OldIndex := dmMain.Songs.IndexName;
    dmMain.Songs.IndexName := 'iArtistID';
    //Delete relating songs
    dmMain.Songs.SetRange([ArtistID], [ArtistID]);
    while not dmMain.Songs.Eof do
    begin
      dmMain.Songs.Delete;
    end;
    dmMain.Songs.CancelRange;
    dmMain.Songs.IndexName := OldIndex;
  finally
//    MainForm.ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TDeleteForm.DeleteArtist(ArtistID : Integer);
begin
  if dmMain.Artists.Locate('ID', ArtistID, []) then
  begin
    dmMain.Artists.Delete;
  end;
end;

procedure TDeleteForm.DeleteSong(SongID : Integer);
var    Save_Cursor:TCursor;
begin
  try
//    MainForm.ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    MainForm.StatusBar.Panels[1].Text := 'Deleting song';
    MainForm.StatusBar.Panels[0].ImageIndex := 5;
    if dmMain.Songs.Locate('ID', SongID, []) then
    begin
      dmMain.Songs.Delete;
    end;
  finally
//    MainForm.ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TDeleteForm.DeleteAlbum(AlbumID : Integer);
var OldIndex : String;
    ArtistsStr : TStringlist;
    i : integer;
    Save_Cursor:TCursor;
begin
  try
//    MainForm.ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;
    MainForm.StatusBar.Panels[1].Text := 'Deleting album';
    MainForm.StatusBar.Panels[0].ImageIndex := 5;
    OldIndex := dmMain.Songs.IndexName;
    dmMain.Songs.IndexName := 'iAlbumID';
    //Delete relating songs
    dmMain.Songs.SetRange([AlbumID], [AlbumID]);
    ArtistsStr := TStringlist.Create;
    while not dmMain.Songs.Eof do
    begin
      if ArtistsStr.IndexOf(IntToStr(dmMain.Songs.FieldByName('Artist_ID').AsInteger)) = -1 then
        ArtistsStr.Add(IntToStr(dmMain.Songs.FieldByName('Artist_ID').AsInteger));

      dmMain.Songs.Delete;
    end;
    dmMain.Songs.CancelRange;

    dmMain.Songs.IndexName := 'iArtistID';
    for i:=0 to ArtistsStr.count -1 do
    begin
      dmMain.Songs.SetRange([ArtistsStr.Strings[i]], [ArtistsStr.Strings[i]]);
      if dmMain.Songs.RecordCount = 0 then DeleteArtist(StrToInt(ArtistsStr.Strings[i]));
  //    MainForm.Songs.CancelRange;
    end;
    dmMain.Songs.CancelRange;
    ArtistsStr.Free;
    dmMain.Songs.IndexName := OldIndex;

    //Delete album
    if dmMain.Albums.Locate('ID', AlbumID, []) then
      dmMain.Albums.Delete;
  finally
//    MainForm.ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TDeleteForm.DeleteCatalogue(CatalogueID : Integer);
var OldIndex : String;
    ArtistsStr : TStringlist;
    i : integer;
    Save_Cursor:TCursor;
begin
  try
//    MainForm.ToggleGui(False);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourglass;

    MainForm.StatusBar.Panels[1].Text := 'Deleting catalogue';
    MainForm.StatusBar.Panels[0].ImageIndex := 5;

    OldIndex := dmMain.Songs.IndexName;
    dmMain.Songs.IndexName := 'iCatalogueID';
    //Delete relating songs
    ArtistsStr := TStringlist.Create;
    dmMain.Songs.SetRange([CatalogueID], [CatalogueID]);
    while not dmMain.Songs.Eof do
    begin
      if ArtistsStr.IndexOf(IntToStr(dmMain.Songs.FieldByName('Artist_ID').AsInteger)) = -1 then
        ArtistsStr.Add(IntToStr(dmMain.Songs.FieldByName('Artist_ID').AsInteger));

      dmMain.Songs.Delete;
    end;
    dmMain.Songs.CancelRange;

    dmMain.Songs.IndexName := 'iArtistID';
    for i:=0 to ArtistsStr.count -1 do
    begin
      dmMain.Songs.SetRange([ArtistsStr.Strings[i]], [ArtistsStr.Strings[i]]);
      if dmMain.Songs.RecordCount = 0 then DeleteArtist(StrToInt(ArtistsStr.Strings[i]));
    end;
    dmMain.Songs.CancelRange;

    dmMain.Songs.IndexName := OldIndex;
    ArtistsStr.Free;

    //Delete catalogue
    if dmMain.Catalogues.Locate('ID', CatalogueID, []) then
      dmMain.Catalogues.Delete;

  finally
//    MainForm.ToggleGui(True);
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TDeleteForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if modalresult = mrOk then
  begin
    if rbSong.Checked then DeleteSong(dmMain.dsqSongs.FieldByName('ID').AsInteger);
    if rbAlbum.Checked then DeleteAlbum(dmMain.dsqSongs.FieldByName('Album_ID').AsInteger);
    if rbArtist.Checked then DeleteArtistAndSongs(dmMain.dsqSongs.FieldByName('Artist_ID').AsInteger);
    if rbCatalogue.Checked then DeleteCatalogue(dmMain.dsqSongs.FieldByName('Catalogue_ID').AsInteger);
    MainForm.RefreshMp3List;
  end;
  MainForm.ToggleGui(True);
  MainForm.DefaultStatusBarHint;
end;

procedure TDeleteForm.FormCreate(Sender: TObject);
begin
  if MainForm.Percents <> 100 then
    MainForm.SetTransparentForm(Handle, (255 * MainForm.Percents) div 100);

  bOk.Enabled := (dmMain.Songs.recordcount > 0);
  MainForm.StatusBar.Panels[0].ImageIndex := 5;
  MainForm.StatusBar.Panels[1].Text := 'Delete ...';
  MainForm.ToggleGui(False);
end;

procedure TDeleteForm.FormShow(Sender: TObject);
begin
  DeleteForm.Font := MainForm.Font;
end;

end.
