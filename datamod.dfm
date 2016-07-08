object dmMain: TdmMain
  OldCreateOrder = False
  Left = 178
  Top = 188
  Height = 475
  Width = 544
  object DBISAMDatabase: TDBISAMDatabase
    EngineVersion = '3.24'
    Connected = True
    DatabaseName = 'MP3CAT'
    Directory = 'C:\Data\MP3 Collector\Tables'
    SessionName = 'Default'
    Left = 42
    Top = 29
  end
  object dsqAlbumTracks: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    FilterOptions = [foCaseInsensitive]
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    MaxRowCount = -1
    SQL.Strings = (
      'Select Songs.ID, Songs.Song_Title, Songs.Track_Number '
      'From Songs'
      'Where Songs.Artist_ID = :vArtistID'
      'and Songs.Album_ID = :vAlbumID'
      'Order By Songs.Track_Number')
    Params = <
      item
        DataType = ftInteger
        Name = 'vArtistID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vAlbumID'
        ParamType = ptUnknown
      end>
    OnQueryProgress = dsqAlbumTracksQueryProgress
    Left = 140
    Top = 98
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vArtistID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vAlbumID'
        ParamType = ptUnknown
      end>
    object dsqAlbumTracksSong_Title: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 41
      FieldName = 'Song_Title'
      Origin = 'Songs.Song_Title'
      Size = 100
    end
    object dsqAlbumTracksTrack_Number: TIntegerField
      DisplayLabel = 'Track #'
      DisplayWidth = 6
      FieldName = 'Track_Number'
      Origin = 'Songs.Track_Number'
    end
    object dsqAlbumTracksID: TIntegerField
      FieldName = 'ID'
      Origin = 'Songs.ID'
      Visible = False
    end
  end
  object dsdsqAlbumTracks: TDataSource
    DataSet = dsqAlbumTracks
    Left = 149
    Top = 93
  end
  object qTemp: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    MaxRowCount = -1
    Params = <>
    OnQueryProgress = qTempQueryProgress
    Left = 99
    Top = 187
  end
  object qPlaylistSongs: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    MaxRowCount = -1
    SQL.Strings = (
      'Select PlaylistSongs.* , Songs.Song_Title, Songs.Filename'
      'From PlaylistSongs, Songs'
      'Where Songs.ID = PlaylistSongs.SongID'
      'and PlaylistSongs.PlaylistID = :vPlaylistID'
      'Order by PlaylistSongs.ItemIndex')
    Params = <
      item
        DataType = ftInteger
        Name = 'vPlaylistID'
        ParamType = ptUnknown
      end>
    Left = 180
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vPlaylistID'
        ParamType = ptUnknown
      end>
    object qPlaylistSongsPlaylistID: TIntegerField
      FieldName = 'PlaylistID'
      Origin = 'PlaylistSongs.PlaylistID'
      Visible = False
    end
    object qPlaylistSongsPlaylistSongsID: TIntegerField
      FieldName = 'PlaylistSongsID'
      Origin = 'PlaylistSongs.PlaylistSongsID'
      Visible = False
    end
    object qPlaylistSongsSongID: TIntegerField
      FieldName = 'SongID'
      Origin = 'PlaylistSongs.SongID'
      Visible = False
    end
    object qPlaylistSongsSong_Title: TStringField
      DisplayLabel = 'Song Title'
      FieldName = 'Song_Title'
      Origin = 'Songs.Song_Title'
      Size = 100
    end
    object qPlaylistSongsItemIndex: TIntegerField
      FieldName = 'ItemIndex'
      Visible = False
    end
    object qPlaylistSongsFilename: TStringField
      FieldName = 'Filename'
      Visible = False
      Size = 200
    end
  end
  object dsqPlaylistSongs: TDataSource
    DataSet = qPlaylistSongs
    Left = 172
    Top = 171
  end
  object PlaylistSongs: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'PlaylistSongs'
    Left = 36
    Top = 179
  end
  object dsPlaylistSongs: TDataSource
    DataSet = PlaylistSongs
    Left = 30
    Top = 187
  end
  object Playlists: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    IndexName = 'iPlaylist_Name'
    TableName = 'Playlists'
    Left = 276
    Top = 163
    object PlaylistsPlaylistID: TAutoIncField
      FieldName = 'PlaylistID'
      Origin = 'Playlists.PlaylistID'
      Visible = False
    end
    object PlaylistsPlaylist_Name: TStringField
      DisplayLabel = 'Playlist Name'
      FieldName = 'Playlist_Name'
      Origin = 'Playlists.Playlist_Name'
      Size = 30
    end
  end
  object dsPlaylists: TDataSource
    DataSet = Playlists
    OnDataChange = dsPlaylistsDataChange
    Left = 268
    Top = 171
  end
  object Songs: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'Songs'
    Left = 114
    Top = 325
  end
  object dsSongs: TDataSource
    DataSet = Songs
    Left = 106
    Top = 333
  end
  object Genres: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'Genres'
    Left = 266
    Top = 317
  end
  object dsGenres: TDataSource
    DataSet = Genres
    Left = 258
    Top = 325
  end
  object Artists: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'Artists'
    Left = 186
    Top = 237
  end
  object dsArtists: TDataSource
    DataSet = Artists
    Left = 178
    Top = 245
  end
  object Albums: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'Albums'
    Left = 186
    Top = 317
  end
  object dsAlbums: TDataSource
    DataSet = Albums
    Left = 178
    Top = 325
  end
  object Catalogues: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'Catalogues'
    Left = 274
    Top = 237
  end
  object dsCatalogues: TDataSource
    DataSet = Catalogues
    Left = 266
    Top = 245
  end
  object dsqSongs: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    FilterOptions = [foCaseInsensitive]
    BeforeScroll = dsqSongsBeforeScroll
    AfterScroll = dsqSongsAfterScroll
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    MaxRowCount = -1
    SQL.Strings = (
      
        'Select Songs.ID, Songs.Song_Title, Songs.Track_Number, Songs.Yea' +
        'r, Songs.Filename, Songs.Filesize, Songs.Lyrics, Songs.Length, '
      '           Albums.ID Album_ID, Albums.Album_Title, '
      '           Artists.ID Artist_ID, Artists.Artist_Name, '
      '           Genres.Genre_Name, '
      
        '           Catalogues.ID Catalogue_ID, Catalogues.Catalogue_Name' +
        ', Catalogues.Catalogue_Number '
      ''
      'From Songs, Artists, Catalogues'
      ''
      'LEFT OUTER JOIN Genres ON Songs.Genre_ID = Genres.ID'
      'LEFT OUTER JOIN Albums ON Songs.Album_ID = Albums.ID'
      ''
      'Where Songs.Artist_ID = Artists.ID'
      'and Songs.Catalogue_ID = Catalogues.ID'
      
        'Order By Artists.Artist_Name, Albums.Album_Title, Songs.Song_Tit' +
        'le')
    Params = <>
    OnQueryProgress = dsqSongsQueryProgress
    Left = 50
    Top = 261
    object dsqSongsID: TIntegerField
      FieldName = 'ID'
      Origin = 'Songs.ID'
      Visible = False
    end
    object dsqSongsAlbum_ID: TIntegerField
      FieldName = 'Album_ID'
      Visible = False
    end
    object dsqSongsArtist_ID: TIntegerField
      FieldName = 'Artist_ID'
      Visible = False
    end
    object dsqSongsCatalogue_ID: TIntegerField
      FieldName = 'Catalogue_ID'
      Visible = False
    end
    object dsqSongsCatalogue_Number: TIntegerField
      DisplayLabel = 'Cat #'
      DisplayWidth = 5
      FieldName = 'Catalogue_Number'
      Origin = 'Catalogues.Catalogue_Number'
    end
    object dsqSongsArtist_Name: TStringField
      DisplayLabel = 'Artist'
      DisplayWidth = 30
      FieldName = 'Artist_Name'
      Origin = 'Artists.Artist_Name'
      Size = 100
    end
    object dsqSongsSong_Title: TStringField
      DisplayLabel = 'Title'
      DisplayWidth = 30
      FieldName = 'Song_Title'
      Origin = 'Songs.Song_Title'
      Size = 100
    end
    object dsqSongsAlbum_Title: TStringField
      DisplayLabel = 'Album'
      DisplayWidth = 25
      FieldName = 'Album_Title'
      Origin = 'Albums.Album_Title'
      Size = 100
    end
    object dsqSongsCatalogue_Name: TStringField
      DisplayLabel = 'Catalogue Name'
      DisplayWidth = 25
      FieldName = 'Catalogue_Name'
      Origin = 'Catalogues.Catalogue_Name'
      Size = 50
    end
    object dsqSongsGenre_Name: TStringField
      DisplayLabel = 'Genre'
      DisplayWidth = 20
      FieldName = 'Genre_Name'
      Origin = 'Genres.Genre_Name'
      Size = 30
    end
    object dsqSongsTrack_Number: TIntegerField
      DisplayLabel = 'Track #'
      DisplayWidth = 5
      FieldName = 'Track_Number'
      Origin = 'Songs.Track_Number'
    end
    object dsqSongsYear: TIntegerField
      DisplayWidth = 5
      FieldName = 'Year'
      Origin = 'Songs.Year'
    end
    object dsqSongsFilename: TStringField
      FieldName = 'Filename'
      Origin = 'Songs.Filename'
      Size = 200
    end
    object dsqSongsFilesize: TFloatField
      DisplayLabel = 'Filesize (MB)'
      DisplayWidth = 5
      FieldName = 'Filesize'
      Origin = 'Songs.Filesize'
      Visible = False
    end
    object dsqSongsLyrics: TMemoField
      FieldName = 'Lyrics'
      Origin = 'Songs.Lyrics'
      Visible = False
      BlobType = ftMemo
    end
    object dsqSongsLength: TStringField
      FieldName = 'Length'
      Origin = 'Songs.Length'
      Visible = False
      Size = 10
    end
  end
  object dsdsqSongs: TDataSource
    DataSet = dsqSongs
    OnDataChange = dsdsqSongsDataChange
    Left = 42
    Top = 272
  end
  object Querys: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'querys'
    Left = 272
    Top = 24
  end
  object dsQuerys: TDataSource
    DataSet = Querys
    Left = 264
    Top = 40
  end
end
