unit tables;

interface

   procedure CreateTables(CreateDatabaseName: string);

implementation

{$IFDEF WIN32}
{$IFDEF VER150}
uses Forms, Classes, DB, DBISAMTb, SysUtils, Variants;
{$ENDIF}
{$IFDEF VER140}
uses Forms, Classes, DB, DBISAMTb, SysUtils, Variants;
{$ENDIF}
{$IFDEF VER130}
uses Forms, Classes, DB, DBISAMTb, SysUtils;
{$ENDIF}
{$ENDIF}

procedure CreateTables(CreateDatabaseName: string);
var
   TableToCreate: TDBISAMTable;
   StopWords: TStrings;
begin
   TableToCreate:=TDBISAMTable.Create(Application);
   try
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='albums';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('ID',ftAutoInc,0,False);
            Add('Artist_ID',ftInteger,0,False);
            Add('Album_Title',ftString,100,False);
            Add('Album_Notes',ftMemo,0,False);
            Add('Album_Cover',ftBlob,0,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','ID',[ixPrimary,ixUnique]);
            Add('iAlbum_Title','Album_Title',[ixCaseInsensitive]);
            Add('iAlbumAndArtist','ID;Artist_ID',[]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'ID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(2,'Artist_ID',ftInteger,0,False,'','','','',fcNoChange);
               Add(3,'Album_Title',ftString,100,False,'','','','',fcNoChange);
               Add(4,'Album_Notes',ftMemo,0,False,'','','','',fcNoChange);
               Add(5,'Album_Cover',ftBlob,0,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','ID',[ixPrimary,ixUnique],icNone);
               Add('iAlbum_Title','Album_Title',[ixCaseInsensitive],icFull);
               Add('iAlbumAndArtist','ID;Artist_ID',[],icFull);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','Albums',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='artists';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('ID',ftAutoInc,0,False);
            Add('Artist_Name',ftString,100,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','ID',[ixPrimary,ixUnique]);
            Add('iArtist_Name','Artist_Name',[ixCaseInsensitive]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'ID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(2,'Artist_Name',ftString,100,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','ID',[ixPrimary,ixUnique],icNone);
               Add('iArtist_Name','Artist_Name',[ixCaseInsensitive],icFull);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','Artist Table',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='catalogues';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('ID',ftAutoInc,0,False);
            Add('Catalogue_Number',ftInteger,0,False);
            Add('Catalogue_Name',ftString,50,False);
            Add('Created_Date',ftDate,0,False);
            Add('Comments',ftMemo,0,False);
            Add('Serial',ftString,30,False);
            Add('Volume_Name',ftString,30,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','ID',[ixPrimary,ixUnique]);
            Add('iCatalogue_Number','Catalogue_Number',[]);
            Add('iCatalogue_Name','Catalogue_Name',[ixCaseInsensitive]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'ID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(2,'Catalogue_Number',ftInteger,0,False,'','','','',fcNoChange);
               Add(3,'Catalogue_Name',ftString,50,False,'','','','',fcNoChange);
               Add(4,'Created_Date',ftDate,0,False,'','','','',fcNoChange);
               Add(5,'Comments',ftMemo,0,False,'','','','',fcNoChange);
               Add(6,'Serial',ftString,30,False,'','','','',fcNoChange);
               Add(7,'Volume_Name',ftString,30,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','ID',[ixPrimary,ixUnique],icNone);
               Add('iCatalogue_Number','Catalogue_Number',[],icFull);
               Add('iCatalogue_Name','Catalogue_Name',[ixCaseInsensitive],icFull);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='genres';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('ID',ftAutoInc,0,False);
            Add('Genre_Name',ftString,30,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','ID',[ixPrimary,ixUnique]);
            Add('iGenre_Name','Genre_Name',[ixCaseInsensitive]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'ID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(2,'Genre_Name',ftString,30,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','ID',[ixPrimary,ixUnique],icNone);
               Add('iGenre_Name','Genre_Name',[ixCaseInsensitive],icFull);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='playlists';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('PlaylistID',ftAutoInc,0,False);
            Add('Playlist_Name',ftString,30,False);
            Add('ItemCount',ftInteger,0,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','PlaylistID',[ixPrimary,ixUnique]);
            Add('iPlaylist_Name','Playlist_Name',[]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'PlaylistID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(2,'Playlist_Name',ftString,30,False,'','','','',fcNoChange);
               Add(3,'ItemCount',ftInteger,0,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','PlaylistID',[ixPrimary,ixUnique],icNone);
               Add('iPlaylist_Name','Playlist_Name',[],icFull);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='playlistsongs';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('PlaylistID',ftInteger,0,False);
            Add('PlaylistSongsID',ftAutoInc,0,False);
            Add('SongID',ftInteger,0,False);
            Add('ItemIndex',ftInteger,0,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','PlaylistSongsID',[ixPrimary,ixUnique]);
            Add('iItemIndex','ItemIndex',[]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'PlaylistID',ftInteger,0,False,'','','','',fcNoChange);
               Add(2,'PlaylistSongsID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(3,'SongID',ftInteger,0,False,'','','','',fcNoChange);
               Add(4,'ItemIndex',ftInteger,0,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','PlaylistSongsID',[ixPrimary,ixUnique],icNone);
               Add('iItemIndex','ItemIndex',[],icFull);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='querys';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('ID',ftAutoInc,0,False);
            Add('Name',ftString,80,False);
            Add('Filter',ftMemo,0,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','ID',[ixPrimary,ixUnique]);
            Add('iName','Name',[]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'ID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(2,'Name',ftString,80,False,'','','','',fcNoChange);
               Add(3,'Filter',ftMemo,0,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','ID',[ixPrimary,ixUnique],icNone);
               Add('iName','Name',[],icFull);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','Saved Querys',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='songs';
         Exclusive:=True;
         with FieldDefs do
            begin
            Clear;
            Add('ID',ftAutoInc,0,False);
            Add('Artist_ID',ftLargeInt,0,False);
            Add('Album_ID',ftLargeInt,0,False);
            Add('Genre_ID',ftLargeInt,0,False);
            Add('Catalogue_ID',ftLargeInt,0,False);
            Add('Song_Title',ftString,100,False);
            Add('Track_Number',ftInteger,0,False);
            Add('Year',ftInteger,0,False);
            Add('Filename',ftString,200,False);
            Add('Filesize',ftFloat,0,False);
            Add('Lyrics',ftMemo,0,False);
            Add('Length',ftString,10,False);
            end;
         with IndexDefs do
            begin
            Clear;
            Add('','ID',[ixPrimary,ixUnique]);
            Add('iArtistID','Artist_ID',[]);
            Add('iAlbumID','Album_ID',[]);
            Add('iCatalogueID','Catalogue_ID',[]);
            Add('iGenreID','Genre_ID',[]);
            end;
         if not Exists then
            begin
            CreateTable;
            with RestructureFieldDefs do
               begin
               Clear;
               Add(1,'ID',ftAutoInc,0,False,'','','','',fcNoChange);
               Add(2,'Artist_ID',ftLargeInt,0,False,'','','','',fcNoChange);
               Add(3,'Album_ID',ftLargeInt,0,False,'','','','',fcNoChange);
               Add(4,'Genre_ID',ftLargeInt,0,False,'','','','',fcNoChange);
               Add(5,'Catalogue_ID',ftLargeInt,0,False,'','','','',fcNoChange);
               Add(6,'Song_Title',ftString,100,False,'','','','',fcNoChange);
               Add(7,'Track_Number',ftInteger,0,False,'','','','',fcNoChange);
               Add(8,'Year',ftInteger,0,False,'','','','',fcNoChange);
               Add(9,'Filename',ftString,200,False,'','','','',fcNoChange);
               Add(10,'Filesize',ftFloat,0,False,'','','','',fcNoChange);
               Add(11,'Lyrics',ftMemo,0,False,'','','','',fcNoChange);
               Add(12,'Length',ftString,10,False,'','','','',fcNoChange);
               end;
            with RestructureIndexDefs do
               begin
               Clear;
               Add('','ID',[ixPrimary,ixUnique],icNone);
               Add('iArtistID','Artist_ID',[],icNone);
               Add('iAlbumID','Album_ID',[],icNone);
               Add('iCatalogueID','Catalogue_ID',[],icNone);
               Add('iGenreID','Genre_ID',[],icNone);
               end;
            StopWords:=TStringList.Create;
            try
               with StopWords do
                  begin
                  Add('A');
                  Add('AN');
                  Add('AND');
                  Add('BE');
                  Add('FOR');
                  Add('HOW');
                  Add('IN');
                  Add('IS');
                  Add('IT');
                  Add('OF');
                  Add('ON');
                  Add('OR');
                  Add('THAT');
                  Add('THE');
                  Add('THIS');
                  Add('TO');
                  Add('WAS');
                  Add('WHAT');
                  Add('WHEN');
                  Add('WHICH');
                  Add('WHY');
                  Add('WILL');
                  end;
               RestructureTable(0,0,1,0,False,'','Songs',512,-1,'',StopWords,
                     #1+#2+#3+#4+#5+#6+#7+#8+#9+#10+#11+#12+#13
                     +#14+#15+#16+#17+#18+#19+#20+#21+#22+#23
                     +#24+#25+#26+#27+#28+#29+#30+#31+#32+'*+'+
                     ',-./:;<=>\`',
                     '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_ab'+
                     'cdefghijklmnopqrstuvwxyz€‚ƒ„…†‡ˆ‰Š‹Œ'+
                     '‘’“”•–—˜™š›œŸ ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·'+
                     '¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß'+
                     'àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüış',
                     True);
            finally
               StopWords.Free;
            end;
            end;
         end;
   finally
      TableToCreate.Free;
   end;
end;

end.
