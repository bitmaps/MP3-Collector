unit Reports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Dialogs,
  Forms, DB, DBISAMTb, StdCtrls;

  procedure CreateAlbumsHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
  procedure CreateFullAlbumHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
  procedure CreateArtistsHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
  procedure CreateCataloguesHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
  procedure CreateLyricsHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
  procedure CreateFilelistHTMLFile(HTMLFile, StyleSheet : string; FilterType : Integer);

var Save_Cursor:TCursor;

implementation

uses Main, datamod;

procedure CreateHeader(var F: TextFile; var StyleSheet : string; Title : String);
begin
  WriteLn(f, '<html>');
  WriteLn(f, '<head>');
  WriteLn(f, '	<title>'+Title+'</title>');
  if StyleSheet <> '' then
  begin
    StyleSheet := ExtractFileName(StyleSheet);
    WriteLn(f, '<link rel = stylesheet type = text/css href = '+StyleSheet+'>');
  end;
  WriteLn(f, '</head>');
  WriteLn(f, '<body>');
  WriteLn(f, '<a name = 1>');
  WriteLn(f, '<h3>'+Title+'</h3>');
  WriteLn(f, '</a>');
end;

procedure CreateFooter(var F: TextFile);
begin
  WriteLn(f, '<p id = s>Created using <a href = '+Homepage+'>'+ApplicationName+'</a></p>');
  WriteLn(f, '</body>');
  WriteLn(f, '</html>');
end;

procedure SetupProgressBar(var SQLQuery : TDBISamQuery);
begin
  MainForm.ToggleGui(False);
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourglass;    { Show hourglass cursor }
  MainForm.ProgressBar1.Visible := True;
  MainForm.StatusBar.Panels[1].Component := MainForm.ProgressBar1;
  MainForm.ProgressBar1.Max := SQLQuery.RecordCount;
  MainForm.ProgressBar1.Position := 1;
  SQLQuery.OnQueryProgress := dmMain.dsqSongsQueryProgress;
end;

procedure EndProgressBar;
begin
  MainForm.StatusBar.Panels[1].Component := nil;
  MainForm.ProgressBar1.Visible := False;
  Screen.Cursor := Save_Cursor;  { Always restore to normal }
  MainForm.ToggleGui(True);
end;

procedure CreateFilelistHTMLFile(HTMLFile, StyleSheet : string; FilterType : Integer);
var F: TextFile;
    ColourToggle : Boolean;
    BackgroundColor, MbFileSize : String;
    AlbumID, CatID, i, CatTotFiles, GrandTotFiles : Integer;
    MainStr, Filter : String;
    SQLQuery : TDBISamQuery;
    total, CatTotFilesize, GrandTotFilesize : Real;
begin
  SQLQuery := TDBISamQuery.Create(nil);
  SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
  try
    AssignFile(F, HTMLFile);
    Rewrite(F);

    if length(Filter) > 0 then Filter := ' and '+Filter;
    SQLQuery.sql.Add(
      ' select songs.*, catalogues.catalogue_number, catalogues.catalogue_name, '+
      ' Artists.Artist_Name, Genres.Genre_Name, Albums.Album_Title '+
      ' from songs, catalogues, Artists '+
      ' LEFT OUTER JOIN Genres ON Songs.Genre_ID = Genres.ID '+
      ' LEFT OUTER JOIN Albums ON Songs.Album_ID = Albums.ID '+
      ' where songs.catalogue_id = catalogues.id '+
      ' and Songs.Artist_ID = Artists.ID '+
      ' order by catalogues.catalogue_number, songs.filename '
      );
    SQLQuery.Active := True;
    if (dmMain.dsqSongs.Filtered) and (FilterType = 0) then
    begin
      SQLQuery.FilterOptions := [];
      SQLQuery.Filter := dmMain.dsqSongs.Filter;
      SQLQuery.Filtered := True;
    end;
    SQLQuery.First;
    SetupProgressBar(SQLQuery);
    //Create header
    CreateHeader(f, StyleSheet, 'Catalogue File Listing');
    ColourToggle := True;

    CatID := SQLQuery.FieldByName('Catalogue_ID').AsInteger;
    CatTotFilesize := 0;
    CatTotFiles := 0;
    GrandTotFiles := 0;
    GrandTotFilesize := 0;

    ColourToggle := True;
    if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';

    WriteLn(f,'<table width = 100%>');
    WriteLn(f,'<tr><td id = h width = 40%><div id="l">Cat #: ');
    WriteLn(f,SQLQuery.FieldByName('catalogue_number').AsString );
    WriteLn(f,'</div></td><td id = h width = 60%><div id="l">Catalogue Name: ');
    WriteLn(f,SQLQuery.FieldByName('catalogue_name').AsString );
    WriteLn(f,'</div></td></tr></table>');

    total := (SQLQuery.FieldByName('Filesize').AsFloat / 1024) / 1024;
    MbFileSize := FormatFloat('0.00',Total)+' MB';
    CatTotFiles := CatTotFiles + 1;
    CatTotFilesize := CatTotFilesize + total;

    WriteLn(f, '<table width = 100%>');
    WriteLn(f, '<tr><td width = 80%><div id="l">Filename');
    WriteLn(f, '</div></td><td width = 20%><div id = l>Filesize');
    WriteLn(f, '</div></td></tr>');
    WriteLn(f,  '<tr><td'+BackgroundColor+' width = 80%><div id="l">'+
                 SQLQuery.FieldByName('Filename').AsString+
                '</div></td><td'+BackgroundColor+' width = 20%><div id = l>'+
                 MbFileSize+
                 '</div></td></tr>');

    for i:=0 to SQLQuery.RecordCount-2 do
    begin
      if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';
      MainForm.ProgressBar1.StepBy(1);
      application.ProcessMessages;
      SQLQuery.Next;

      MainStr := '<table width = 100%>' +
                 '<tr><td id = h width = 40%><div id="l">Cat #: '+
                 SQLQuery.FieldByName('catalogue_number').AsString+
                 '</div></td><td id = h width = 60%><div id="l">Catalogue Name: '+
                 SQLQuery.FieldByName('catalogue_name').AsString+
                 '</div></td></tr></table>';

     if (SQLQuery.FieldByName('catalogue_id').AsInteger = CatID) then
        begin
          total := (SQLQuery.FieldByName('Filesize').AsFloat / 1024) / 1024;
          MbFileSize := FormatFloat('0.00',Total)+' MB';
          CatTotFiles := CatTotFiles + 1;
          CatTotFilesize := CatTotFilesize + total;

          WriteLn(f,  '<tr><td'+BackgroundColor+' width = 80%><div id="l">'+
                       SQLQuery.FieldByName('Filename').AsString+
                      '</div></td><td'+BackgroundColor+' width = 20%><div id = l>'+
                       MbFileSize+
                       '</div></td></tr>');
        end else
        begin

          //Include total files and totalfilesize.
          WriteLn(f, ' <table width = 100%>');
          WriteLn(f,  '<tr><td'+BackgroundColor+' width = 80%><div id="l">'+
                       'Total files: '+IntToStr(CatTotFiles)+
                      '</div></td><td'+BackgroundColor+' width = 20%><div id = l>'+
                       FormatFloat('0.00',CatTotFilesize)+' MB'+
                       '</div></td></tr></table>');

          GrandTotFiles := GrandTotFiles + CatTotFiles;
          GrandTotFilesize := GrandTotFilesize + CatTotFilesize;

          ColourToggle := True;
          if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';

          WriteLn(f, '</table><p></p><p></p>');
          WriteLn(f, MainStr);
          CatTotFilesize := 0;
          CatTotFiles := 0;

          total := (SQLQuery.FieldByName('Filesize').AsFloat / 1024) / 1024;
          MbFileSize := FormatFloat('0.00',Total)+' MB';
          CatTotFiles := CatTotFiles + 1;
          CatTotFilesize := CatTotFilesize + total;

          WriteLn(f, '<table width = 100%>');
          WriteLn(f, '<tr><td width = 80%><div id="l">Filename');
          WriteLn(f, '</div></td><td width = 20%><div id = l>Filesize');
          WriteLn(f, '</div></td></tr>');
          WriteLn(f,  '<tr><td'+BackgroundColor+' width = 80%><div id="l">'+
                       SQLQuery.FieldByName('Filename').AsString+
                      '</div></td><td'+BackgroundColor+' width = 20%><div id = l>'+
                       MbFileSize+
                       '</div></td></tr>');
        end;

      CatID := SQLQuery.FieldByName('Catalogue_ID').AsInteger;
      ColourToggle := not ColourToggle;
    end;

    //Include total files and totalfilesize for last item.
    WriteLn(f, ' <table width = 100%>');
    WriteLn(f,  '<tr><td'+BackgroundColor+' width = 80%><div id="l">'+
                 'Total files: '+IntToStr(CatTotFiles)+
                '</div></td><td'+BackgroundColor+' width = 20%><div id = l>'+
                 FormatFloat('0.00',CatTotFilesize)+' MB'+
                 '</div></td></tr></table>');

    GrandTotFiles := GrandTotFiles + CatTotFiles;
    GrandTotFilesize := GrandTotFilesize + CatTotFilesize;

    WriteLn(f, ' <p></p><p></p><table width = 100%>');
    WriteLn(f,  '<tr><td id = h width = 80%><div id="l">'+
                 'Grand total files: '+IntToStr(GrandTotFiles)+
                '</div></td><td id = h width = 20%><div id = l>'+
                 FormatFloat('0.00',GrandTotFilesize)+' MB'+
                 '</div></td></tr></table>');

    //Create footer
    WriteLn(f, '</table>');
    CreateFooter(f);

  finally
    CloseFile(F);
    SQLQuery.Free;
    EndProgressBar;
  end;
end;

procedure CreateFullAlbumHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
var F: TextFile;
    ColourToggle : Boolean;
    BackgroundColor : String;
    AlbumID, CatID, i : Integer;
    MainStr, Filter : String;
    SQLQuery : TDBISamQuery;
begin
  SQLQuery := TDBISamQuery.Create(nil);
  SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
  try
    AssignFile(F, HTMLFile);
    Rewrite(F);

    if length(Filter) > 0 then Filter := ' and '+Filter;
    SQLQuery.sql.Add(
      ' select catalogues.catalogue_number, catalogues.catalogue_name, artists.artist_name, albums.album_title, songs.song_title,'+
      ' songs.catalogue_id, songs.artist_id, songs.album_id, songs.track_number, songs.length, genres.genre_name'+
      ' from songs, catalogues, artists, albums'+
      ' LEFT OUTER JOIN Genres ON songs.genre_id = genres.id'+
      ' where songs.artist_id = artists.id'+
      ' and songs.catalogue_id = catalogues.id'+
      ' and songs.album_id = albums.id'+
      ' and Artists.Artist_Name <> '''' '+
      ' and Albums.Album_Title <> '''' '+
      ' order by catalogues.catalogue_number, songs.catalogue_id, albums.album_title, songs.album_id, songs.track_number '
      );
    SQLQuery.Active := True;
    if (dmMain.dsqSongs.Filtered) and (FilterType = 0) then
    begin
      SQLQuery.FilterOptions := [];
      SQLQuery.Filter := dmMain.dsqSongs.Filter;
      SQLQuery.Filtered := True;
    end;
    //Create header
    CreateHeader(f, StyleSheet, 'Albums & Songs');

    ColourToggle := True;


    SQLQuery.First;
    SetupProgressBar(SQLQuery);

//    ArtID := SQLQuery.FieldByName('ArtID').AsInteger;
    CatID := SQLQuery.FieldByName('catalogue_id').AsInteger;
    AlbumID := SQLQuery.FieldByName('album_id').AsInteger;
    ColourToggle := True;
    if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';

    WriteLn(f,'<table width = 100%>');
    WriteLn(f,'<tr><td id = h width = 40%><div id="l">Artist: ');
    WriteLn(f,SQLQuery.FieldByName('Artist_Name').AsString );
    WriteLn(f,'</div></td><td id = h width = 40%><div id="l">Album: ');
    WriteLn(f,SQLQuery.FieldByName('Album_Title').AsString );
    WriteLn(f,'</div></td><td id = h width = 20%><div id="l">Genre: ');
    WriteLn(f,SQLQuery.FieldByName('genre_name').AsString );
    WriteLn(f,'</div></td></tr></table>');
    WriteLn(f, '<table width = 100%>');
    WriteLn(f, '<tr><td width = 10%><div id="l">Track #');
    WriteLn(f, '</div></td><td width = 80%><div id = l>Song Title');
    WriteLn(f, '</div></td><td width = 10%><div id = l>Length');
    WriteLn(f, '</div></td></tr>');
    WriteLn(f,  '<tr><td'+BackgroundColor+' width = 10%><div id="l">'+
                 SQLQuery.FieldByName('Track_Number').AsString+
                '</div></td><td'+BackgroundColor+' width = 80%><div id = l>'+
                 SQLQuery.FieldByName('Song_Title').AsString+
                '</div></td><td'+BackgroundColor+' width = 10%><div id = l>'+
                 SQLQuery.FieldByName('Length').AsString+
                 '</div></td></tr>');

    for i:=0 to SQLQuery.RecordCount-2 do
    begin
      if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';
      MainForm.ProgressBar1.StepBy(1);
      application.ProcessMessages;
      SQLQuery.Next;
      MainStr :=    '<table width = 100%>'+
                    '<tr><td id = h width = 40%><div id="l">Artist: '+
                    SQLQuery.FieldByName('Artist_Name').AsString +
                    '</div></td><td id = h width = 40%><div id="l">Album: '+
                    SQLQuery.FieldByName('Album_Title').AsString +
                    '</div></td><td id = h width = 20%><div id="l">Genre: '+
                    SQLQuery.FieldByName('genre_name').AsString +
                    '</div></td></tr></table>';

     if ((SQLQuery.FieldByName('catalogue_id').AsInteger = CatID) and
        //(SQLQuery.FieldByName('ArtID').AsInteger = ArtID) and
        (SQLQuery.FieldByName('album_id').AsInteger = AlbumID)) then
        begin
          WriteLn(f,  '<tr><td'+BackgroundColor+' width = 10%><div id="l">'+
                       SQLQuery.FieldByName('Track_Number').AsString+
                      '</div></td><td'+BackgroundColor+' width = 80%><div id = l>'+
                       SQLQuery.FieldByName('Song_Title').AsString+
                      '</div></td><td'+BackgroundColor+' width = 10%><div id = l>'+
                       SQLQuery.FieldByName('Length').AsString+
                       '</div></td></tr>');
        end else
        begin
          ColourToggle := True;
          if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';
          WriteLn(f, '</table><p></p>');
          WriteLn(f, MainStr);
          WriteLn(f, '<table width = 100%>');
          WriteLn(f, '<tr><td width = 10%><div id="l">Track #');
          WriteLn(f, '</div></td><td width = 80%><div id = l>Song Title');
          WriteLn(f, '</div></td><td width = 10%><div id = l>Length');
          WriteLn(f, '</div></td></tr>');
          WriteLn(f,  '<tr><td'+BackgroundColor+' width = 10%><div id="l">'+
                       SQLQuery.FieldByName('Track_Number').AsString+
                      '</div></td><td'+BackgroundColor+' width = 80%><div id = l>'+
                       SQLQuery.FieldByName('Song_Title').AsString+
                      '</div></td><td'+BackgroundColor+' width = 10%><div id = l>'+
                       SQLQuery.FieldByName('Length').AsString+
                       '</div></td></tr>');
        end;

//      ArtID := SQLQuery.FieldByName('ArtID').AsInteger;
      CatID := SQLQuery.FieldByName('catalogue_id').AsInteger;
      AlbumID := SQLQuery.FieldByName('album_id').AsInteger;
      ColourToggle := not ColourToggle;
    end;

    //Create footer
    WriteLn(f, '</table>');
    CreateFooter(f);

  finally
    CloseFile(F);
    SQLQuery.Free;
    EndProgressBar;
  end;
end;

procedure CreateLyricsHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
var F: TextFile;
    SQLQuery : TDBISamQuery;
    j : Integer;
    StrList : TStringList;
begin
  SQLQuery := TDBISamQuery.Create(nil);
  SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
  StrList := TStringList.Create;
  try
    AssignFile(F, HTMLFile);
    Rewrite(F);
    SQLQuery.Fields.Clear;
    SQLQuery.sql.Clear;
    SQLQuery.Sql.Add(
       ' Select Songs.ID, Songs.Song_Title, Songs.Track_Number, Songs.Year, Songs.Filename, Songs.Filesize, '+
       ' Songs.Lyrics, Songs.Album_ID, Songs.Artist_ID, Songs.Catalogue_ID, Albums.Album_Title, '+
       ' Artists.Artist_Name, Genres.Genre_Name, Catalogues.Catalogue_Name, Catalogues.Catalogue_Number '+
       ' From Songs, Artists, Catalogues '+
       ' LEFT OUTER JOIN Genres ON Songs.Genre_ID = Genres.ID '+
       ' LEFT OUTER JOIN Albums ON Songs.Album_ID = Albums.ID '+
       ' Where Songs.Artist_ID = Artists.ID '+
       ' and Songs.Catalogue_ID = Catalogues.ID '+
       ' and Artists.Artist_Name <> '''' '+
  //     'and Albums.Album_Title <> '''' '+
       ' and Songs.Lyrics <> '''' '+
       ' Order By Artists.Artist_Name, Albums.Album_Title, Songs.Track_Number'
       );
    SQLQuery.Active := True;

    if (dmMain.dsqSongs.Filtered) and (FilterType = 0) then
    begin
      SQLQuery.FilterOptions := [];
      SQLQuery.Filter := dmMain.dsqSongs.Filter;
      SQLQuery.Filtered := True;
    end;

    SQLQuery.First;

    //Create header
    CreateHeader(f, StyleSheet, 'Lyrics');
    SetupProgressBar(SQLQuery);

    while not SQLQuery.Eof do
    begin
      MainForm.ProgressBar1.StepBy(1);
      application.ProcessMessages;
      WriteLn(f, '<table width = 100%>');
      WriteLn(f, '<tr><td id = h width = 20%>Artist: '+SQLQuery.FieldByName('Artist_Name').AsString +
                 '</td><td id = h width = 35%>Song: '+SQLQuery.FieldByName('Song_Title').AsString+
                 '</td><td id = h width = 35%>Album: '+SQLQuery.FieldByName('Album_Title').AsString +
                 '</td><td id = h width = 10%>Track #: '+SQLQuery.FieldByName('Track_Number').AsString +
                 '</td></tr>');
      WriteLn(f, '</table>');
      WriteLn(f, '<table width = 100%>');

      StrList.Text := SQLQuery.FieldByName('Lyrics').AsString;

      for j:= 0 to StrList.Count-1 do
      begin
        WriteLn(f, '<tr ><td id = f><div id="l">'+
                   StrList.Strings[j]+
                   '</div></td></tr>');
      end;

      WriteLn(f, '</table>');
      WriteLn(f, '<p></p>');

      SQLQuery.Next;
    end;

    //Create footer
    CreateFooter(f);

  finally
    CloseFile(F);
    SQLQuery.Free;
    StrList.Free;
    EndProgressBar;
  end;
end;

procedure CreateCataloguesHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
var F: TextFile;
    ColourToggle : Boolean;
    BackgroundColor : String;
    SQLQuery : TDBISamQuery;
begin
  SQLQuery := TDBISamQuery.Create(nil);
  SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
  try
    AssignFile(F, HTMLFile);
    Rewrite(F);
    SQLQuery.Fields.Clear;
    SQLQuery.sql.Clear;
    SQLQuery.Sql.Add(
      ' SELECT distinct id, Catalogue_Number, Catalogue_Name, Created_Date, Serial, Volume_Name '+
      ' FROM Catalogues '
    );

    if (dmMain.dsqSongs.Filtered) and (FilterType = 0) then
    begin
      SQLQuery.Sql.Add(
        ' where Catalogues.id in (Select Catalogues.id '+
        ' From Songs, Artists, Catalogues '+
        ' LEFT OUTER JOIN Genres ON Songs.Genre_ID = Genres.ID '+
        ' LEFT OUTER JOIN Albums ON Songs.Album_ID = Albums.ID '+
        ' Where Songs.Artist_ID = Artists.ID '+
        ' and Songs.Catalogue_ID = Catalogues.ID '+
        ' and '+dmMain.dsqSongs.Filter +')'
      );
    end;

    SQLQuery.Sql.Add(' ORDER BY Catalogues.Catalogue_Number');
    SQLQuery.Active := True;
    SQLQuery.First;

    SetupProgressBar(SQLQuery);
    CreateHeader(f, StyleSheet, 'Catalogues');

    WriteLn(f, '<table width = 100%>');
    WriteLn(f, '<tr><td id = h width = 16%>Catalogue #</td><td id = h width = 60%>Catalogue Name</td><td id = h width = 24%>Created</td></tr>');
    ColourToggle := True;

    while not SQLQuery.Eof do
    begin
      MainForm.ProgressBar1.StepBy(1);
      application.ProcessMessages;
      if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';

      WriteLn(f, '<tr><td'+BackgroundColor+'><div id="l">'+
                 IntToStr(SQLQuery.FieldByName('Catalogue_Number').AsInteger) +
                 '</div></td><td'+BackgroundColor+'><div id = l>'+
                 SQLQuery.FieldByName('Catalogue_Name').AsString +
                 '</div></td><td'+BackgroundColor+'><div id = l>'+
                 DateToStr(SQLQuery.FieldByName('Created_Date').AsDateTime) +
                 '</div></td></tr>');
      ColourToggle := not ColourToggle;
      SQLQuery.Next;
    end;

    //Create footer
    WriteLn(f, '</table>');
    CreateFooter(f);

  finally
    CloseFile(F);
    SQLQuery.Free;
    EndProgressBar;
  end;
end;

procedure CreateArtistsHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
var F: TextFile;
    ColourToggle : Boolean;
    BackgroundColor : String;
    SQLQuery : TDBISamQuery;
begin
  SQLQuery := TDBISamQuery.Create(nil);
  SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
  try
    AssignFile(F, HTMLFile);
    Rewrite(F);
    SQLQuery.Fields.Clear;
    SQLQuery.sql.Clear;
    SQLQuery.Sql.Add(
      ' SELECT distinct Artists.* '+
      ' FROM Artists '+
      ' Where Artists.Artist_Name <> '''' '
    );

    if (dmMain.dsqSongs.Filtered) and (FilterType = 0) then
    begin
      SQLQuery.Sql.Add(
        ' and artists.id in (Select artists.id '+
        ' From Songs, Artists, Catalogues '+
        ' LEFT OUTER JOIN Genres ON Songs.Genre_ID = Genres.ID '+
        ' LEFT OUTER JOIN Albums ON Songs.Album_ID = Albums.ID '+
        ' Where Songs.Artist_ID = Artists.ID '+
        ' and Songs.Catalogue_ID = Catalogues.ID '+
        ' and '+dmMain.dsqSongs.Filter +')'
      );
    end;

    SQLQuery.Sql.Add('ORDER BY Artists.Artist_Name');
    SQLQuery.Active := True;
    SQLQuery.First;
    SetupProgressBar(SQLQuery);

    //Create header
    CreateHeader(f, StyleSheet, 'Artists');

    WriteLn(f, '<table width = 100%>');
    WriteLn(f, '<tr><td id = h width = 100%>Artist</td></tr>');
    ColourToggle := True;

    while not SQLQuery.Eof do
    begin
      MainForm.ProgressBar1.StepBy(1);
      application.ProcessMessages;
      if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';

      WriteLn(f, '<tr><td'+BackgroundColor+'><div id="l">'+
                 SQLQuery.FieldByName('Artist_Name').AsString +
                 '</div></td></tr>');
      ColourToggle := not ColourToggle;
      SQLQuery.Next;
    end;

    //Create footer
    WriteLn(f, '</table>');
    CreateFooter(f);

  finally
    CloseFile(F);
    SQLQuery.Free;
    EndProgressBar;
  end;
end;

procedure CreateAlbumsHTMLFile(HTMLFile, StyleSheet : String; FilterType : Integer);
var F: TextFile;
    ColourToggle : Boolean;
    BackgroundColor : String;
    SQLQuery : TDBISamQuery;
begin
  SQLQuery := TDBISamQuery.Create(nil);
  SQLQuery.DatabaseName := dmMain.DBISAMDatabase.DatabaseName;
  try
    AssignFile(F, HTMLFile);
    Rewrite(F);
    SQLQuery.Fields.Clear;
    SQLQuery.sql.Clear;
    SQLQuery.Sql.Add(
      ' Select distinct Albums.Album_Title, Artists.Artist_Name,Genres.Genre_Name, Songs.Artist_ID, '+
      ' Songs.Album_ID, Songs.Catalogue_ID, Catalogues.Catalogue_Name, Catalogues.Catalogue_Number '+
      ' From Songs, Artists, Catalogues '+
      ' LEFT OUTER JOIN Genres ON Songs.Genre_ID = Genres.ID '+
      ' LEFT OUTER JOIN Albums ON Songs.Album_ID = Albums.ID '+
      ' Where Songs.Artist_ID = Artists.ID '+
      ' and Songs.Catalogue_ID = Catalogues.ID '+
      ' and Artists.Artist_Name <> '''' '+
      ' and Albums.Album_Title <> '''' '+
      ' Order By Artists.Artist_Name, Albums.Album_Title'
      );
    SQLQuery.Active := True;
    if (dmMain.dsqSongs.Filtered) and (FilterType = 0) then
    begin
      SQLQuery.FilterOptions := [];
      SQLQuery.Filter := dmMain.dsqSongs.Filter;
      SQLQuery.Filtered := True;
    end;
    SQLQuery.First;
    SetupProgressBar(SQLQuery);

    //Create header
    CreateHeader(f, StyleSheet, 'Albums');
    WriteLn(f, '<table width = 100%>');
    WriteLn(f, '<tr><td id = h width = 25%>Artist</td>'+
               '<td id = h width = 35%>Album</td>'+
               '<td id = h width = 10%>Genre</td>'+
               '<td id = h width = 10%>Catalogue #</td>'+
               '<td id = h width = 10%>Catalogue Name</td></tr>');
    ColourToggle := True;

    while not SQLQuery.Eof do
    begin
      MainForm.ProgressBar1.StepBy(1);
      application.ProcessMessages;
      if ColourToggle then BackgroundColor := ' id = f ' else BackgroundColor := '';

      WriteLn(f, '<tr><td'+BackgroundColor+'><div id="l">'+
                 SQLQuery.FieldByName('Artist_Name').AsString +
                 '</div></td><td'+BackgroundColor+'><div id = l>'+
                 SQLQuery.FieldByName('Album_Title').AsString +
                 '</div></td><td'+BackgroundColor+'><div id = l>'+
                 SQLQuery.FieldByName('Genre_Name').AsString+
                 '</div></td><td'+BackgroundColor+'><div id = l>'+
                 IntToStr(SQLQuery.FieldByName('Catalogue_Number').AsInteger)+
                 '</div></td><td'+BackgroundColor+'><div id = l>'+
                 SQLQuery.FieldByName('Catalogue_Name').AsString+
                 '</div></td></tr>');

      ColourToggle := not ColourToggle;
      SQLQuery.Next;
    end;

    //Create footer
    WriteLn(f, '</table>');
    CreateFooter(f);

  finally
    CloseFile(F);
    SQLQuery.Free;
    EndProgressBar;
  end;
end;

end.
