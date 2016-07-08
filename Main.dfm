object MainForm: TMainForm
  Left = 163
  Top = 121
  Width = 765
  Height = 552
  Caption = 'Mp3 Collector'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object StatusBar: TfcStatusBar
    Left = 0
    Top = 505
    Width = 757
    Height = 20
    Images = ImageList16x16
    Panels = <
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = -1
        Name = 'Glyph'
        Style = psGlyph
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '19'
      end
      item
        Component = ProgressBar1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Name = 'Hints'
        Style = psControl
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '300'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Name = 'SongTotal'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '130'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Name = 'Mode'
        Tag = 0
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaVCenter
        Width = '100'
      end>
    SimplePanel = False
    StatusBarText.CapsLock = 'Caps'
    StatusBarText.Overwrite = 'Overwrite'
    StatusBarText.NumLock = 'Num'
    StatusBarText.ScrollLock = 'Scroll'
    object ProgressBar1: TProgressBar
      Left = 22
      Top = 3
      Width = 296
      Height = 16
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 64
    Width = 757
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pcSongs: TPageControl
      Left = 132
      Top = 7
      Width = 618
      Height = 427
      ActivePage = tsSongs
      Align = alClient
      HotTrack = True
      Images = ImageList16x16
      TabOrder = 0
      OnChange = pcSongsChange
      OnChanging = pcSongsChanging
      object tsSongs: TTabSheet
        Caption = 'Collection'
        ImageIndex = 20
        object tbdSongsTop: TTBDock
          Left = 0
          Top = 0
          Width = 610
          Height = 79
          BoundLines = [blBottom]
          FixAlign = True
          PopupMenu = pmQueryToolbar
          object tbxtArtist: TTBXToolbar
            Left = 0
            Top = 0
            Caption = 'Artist'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 0
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 0
            OnClose = tbxtArtistClose
            object TBXLabelItem1: TTBXLabelItem
              Caption = ' Artist '
            end
            object TBControlItem1: TTBControlItem
              Control = tbxeArtist
            end
            object tbxeArtist: TEdit
              Left = 33
              Top = 0
              Width = 190
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object tbxtCatalogue: TTBXToolbar
            Left = 0
            Top = 52
            Caption = 'Catalogue'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 0
            DockRow = 2
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 3
            OnClose = tbxtCatalogueClose
            object TBXLabelItem4: TTBXLabelItem
              Caption = ' Cat # '
            end
            object TBControlItem2: TTBControlItem
              Control = tbxeCatNo
            end
            object tbxeCatNo: TEdit
              Left = 32
              Top = 0
              Width = 60
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object tbxtGenre: TTBXToolbar
            Left = 315
            Top = 52
            Caption = 'Genre'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 308
            DockRow = 2
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 5
            OnClose = tbxtGenreClose
            object TBXLabelItem6: TTBXLabelItem
              Caption = ' Genre '
            end
            object TBControlItem8: TTBControlItem
              Control = tbxcbGenre
            end
            object tbxcbGenre: TComboBox
              Left = 37
              Top = 0
              Width = 150
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              ItemHeight = 14
              TabOrder = 0
            end
          end
          object tbxtTrack: TTBXToolbar
            Left = 459
            Top = 0
            Caption = 'Track'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 447
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 8
            OnClose = tbxtTrackClose
            object TBXLabelItem7: TTBXLabelItem
              Caption = ' Track # '
            end
            object TBControlItem3: TTBControlItem
              Control = tbxeTrackNo
            end
            object tbxeTrackNo: TEdit
              Left = 43
              Top = 0
              Width = 50
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object tbxtFileDetails: TTBXToolbar
            Left = 237
            Top = 26
            Caption = 'Filename'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 216
            DockRow = 1
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 6
            OnClose = tbxtFileDetailsClose
            object TBXLabelItem9: TTBXLabelItem
              Caption = ' Filename '
            end
            object TBControlItem4: TTBControlItem
              Control = tbxeFilename
            end
            object tbxeFilename: TEdit
              Left = 49
              Top = 0
              Width = 310
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object tbxtAlbum: TTBXToolbar
            Left = 0
            Top = 26
            Caption = 'Album'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 0
            DockRow = 1
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 2
            OnClose = tbxtAlbumClose
            object TBXLabelItem3: TTBXLabelItem
              Caption = ' Album '
            end
            object TBControlItem5: TTBControlItem
              Control = tbxeAlbum
            end
            object tbxeAlbum: TEdit
              Left = 37
              Top = 0
              Width = 190
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object tbxtTitle: TTBXToolbar
            Left = 233
            Top = 0
            Caption = 'Title'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 192
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 1
            OnClose = tbxtTitleClose
            object TBXLabelItem2: TTBXLabelItem
              Caption = ' Title '
            end
            object TBControlItem6: TTBControlItem
              Control = tbxeTitle
            end
            object tbxeTitle: TEdit
              Left = 26
              Top = 0
              Width = 190
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
          object tbxtCatalogueName: TTBXToolbar
            Left = 102
            Top = 52
            Caption = 'Cat Name'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 96
            DockRow = 2
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 4
            OnClose = tbxtCatalogueNameClose
            object TBXLabelItem5: TTBXLabelItem
              Caption = ' Cat Name '
            end
            object TBControlItem9: TTBControlItem
              Control = tbxcbCatName
            end
            object tbxcbCatName: TComboBox
              Left = 53
              Top = 0
              Width = 150
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              ItemHeight = 14
              TabOrder = 0
            end
          end
          object tbxtYear: TTBXToolbar
            Left = 512
            Top = 52
            Caption = 'Year'
            DefaultDock = tbdSongsTop
            DockMode = dmCannotFloat
            DockPos = 494
            DockRow = 2
            ProcessShortCuts = True
            SystemFont = False
            TabOrder = 7
            OnClose = tbxtYearClose
            object TBXLabelItem8: TTBXLabelItem
              Caption = ' Year '
            end
            object TBControlItem7: TTBControlItem
              Control = tbxeYear
            end
            object tbxeYear: TEdit
              Left = 31
              Top = 0
              Width = 50
              Height = 22
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
            end
          end
        end
        object dbgSongs: TwwDBGrid
          Left = 7
          Top = 79
          Width = 596
          Height = 310
          MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly, mDisableDialog]
          IniAttributes.Enabled = True
          IniAttributes.SaveToRegistry = True
          IniAttributes.FileName = 'Software\MP3Collector'
          IniAttributes.Delimiter = ';;'
          ExportOptions.ExportType = wwgetHTML
          ExportOptions.Options = [esoShowHeader, esoShowTitle, esoDblQuoteFields, esoBestColFit, esoShowAlternating]
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = []
          Align = alClient
          DataSource = dmMain.dsdsqSongs
          MultiSelectOptions = [msoAutoUnselect]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgPerfectRowFit, dgTrailingEllipsis, dgShowCellHint]
          ParentShowHint = False
          PopupMenu = pmMainGrid
          ShowHint = True
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = True
          OnTitleButtonClick = dbgSongsTitleButtonClick
          OnDblClick = dbgSongsDblClick
          PadColumnStyle = pcsPlain
        end
        object tbdSongsBottom: TTBDock
          Left = 0
          Top = 389
          Width = 610
          Height = 9
          PopupMenu = pmQueryToolbar
          Position = dpBottom
        end
        object TBXMultiDock1: TTBXMultiDock
          Left = 0
          Top = 79
          Width = 7
          Height = 310
          Position = dpLeft
        end
        object TBXMultiDock2: TTBXMultiDock
          Left = 603
          Top = 79
          Width = 7
          Height = 310
          Position = dpRight
        end
      end
      object tsProperties: TTabSheet
        Caption = 'Properties'
        ImageIndex = 19
        object pcSongProperties: TPageControl
          Left = 0
          Top = 0
          Width = 610
          Height = 398
          ActivePage = tsSongDetails
          Align = alClient
          HotTrack = True
          TabOrder = 0
          OnChange = pcSongPropertiesChange
          object tsSongDetails: TTabSheet
            Caption = 'Mp3 Details'
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 355
              Height = 369
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object gbsSongs: TGroupBox
                Left = 6
                Top = 6
                Width = 345
                Height = 157
                Caption = ' Mp3 '
                TabOrder = 0
                object Label2: TLabel
                  Left = 18
                  Top = 53
                  Width = 19
                  Height = 14
                  Caption = 'Title'
                end
                object Label3: TLabel
                  Left = 18
                  Top = 77
                  Width = 30
                  Height = 14
                  Caption = 'Album'
                end
                object Label6: TLabel
                  Left = 18
                  Top = 125
                  Width = 30
                  Height = 14
                  Caption = 'Genre'
                end
                object Label9: TLabel
                  Left = 18
                  Top = 101
                  Width = 36
                  Height = 14
                  Caption = 'Track #'
                end
                object Label10: TLabel
                  Left = 146
                  Top = 101
                  Width = 24
                  Height = 14
                  Caption = 'Year'
                end
                object Label1: TLabel
                  Left = 18
                  Top = 29
                  Width = 26
                  Height = 14
                  Caption = 'Artist'
                end
                object speSong: TEdit
                  Left = 71
                  Top = 48
                  Width = 257
                  Height = 22
                  TabOrder = 1
                  OnChange = speSongChange
                end
                object speAlbum: TEdit
                  Left = 71
                  Top = 72
                  Width = 257
                  Height = 22
                  TabOrder = 2
                  OnChange = speAlbumChange
                end
                object speTrackNum: TEdit
                  Left = 71
                  Top = 96
                  Width = 46
                  Height = 22
                  TabOrder = 3
                  OnChange = speTrackNumChange
                  OnKeyPress = speTrackNumKeyPress
                end
                object speYear: TEdit
                  Left = 178
                  Top = 96
                  Width = 46
                  Height = 22
                  TabOrder = 4
                  OnChange = speYearChange
                  OnKeyPress = speYearKeyPress
                end
                object speArtist: TEdit
                  Left = 71
                  Top = 24
                  Width = 257
                  Height = 22
                  TabOrder = 0
                  OnChange = speArtistChange
                end
                object spcbGenres: TComboBox
                  Left = 71
                  Top = 119
                  Width = 154
                  Height = 22
                  ItemHeight = 14
                  Sorted = True
                  TabOrder = 5
                  OnChange = spcbGenresChange
                end
              end
              object gbsCatalogue: TGroupBox
                Left = 6
                Top = 169
                Width = 345
                Height = 81
                Caption = ' Catalogue '
                TabOrder = 1
                object Label5: TLabel
                  Left = 10
                  Top = 50
                  Width = 78
                  Height = 14
                  Caption = 'Catalogue Name'
                end
                object Label4: TLabel
                  Left = 26
                  Top = 26
                  Width = 57
                  Height = 14
                  Caption = 'Catalogue #'
                end
                object speCatNum: TEdit
                  Left = 100
                  Top = 20
                  Width = 64
                  Height = 22
                  TabOrder = 0
                  OnChange = speCatNumChange
                  OnKeyPress = speCatNumKeyPress
                end
                object spcbCatName: TComboBox
                  Left = 100
                  Top = 43
                  Width = 168
                  Height = 22
                  ItemHeight = 14
                  TabOrder = 1
                  OnChange = spcbCatNameChange
                end
              end
              object gbsFile: TGroupBox
                Left = 6
                Top = 257
                Width = 345
                Height = 80
                Caption = ' File '
                TabOrder = 2
                object Label7: TLabel
                  Left = 13
                  Top = 25
                  Width = 42
                  Height = 14
                  Caption = 'Filename'
                end
                object Label8: TLabel
                  Left = 13
                  Top = 49
                  Width = 21
                  Height = 14
                  Caption = 'Size'
                end
                object Label30: TLabel
                  Left = 205
                  Top = 49
                  Width = 33
                  Height = 14
                  Caption = 'Length'
                end
                object speFilename: TEdit
                  Left = 66
                  Top = 20
                  Width = 262
                  Height = 22
                  Color = clBtnFace
                  ReadOnly = True
                  TabOrder = 0
                end
                object speSize: TEdit
                  Left = 66
                  Top = 44
                  Width = 70
                  Height = 22
                  Color = clBtnFace
                  ReadOnly = True
                  TabOrder = 1
                end
                object speLength: TEdit
                  Left = 258
                  Top = 44
                  Width = 70
                  Height = 22
                  Color = clBtnFace
                  ReadOnly = True
                  TabOrder = 2
                end
              end
              object bCopyID3v2: TButton
                Left = 6
                Top = 347
                Width = 105
                Height = 25
                Caption = 'Copy to ID3v2'
                Enabled = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 3
              end
              object bCopyID3v1: TButton
                Left = 120
                Top = 347
                Width = 105
                Height = 25
                Caption = 'Copy to ID3v1'
                Enabled = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 4
              end
            end
            object Panel6: TPanel
              Left = 355
              Top = 0
              Width = 247
              Height = 369
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 1
              object GroupBox3: TGroupBox
                Left = 6
                Top = 6
                Width = 235
                Height = 357
                Align = alClient
                Caption = ' Lyrics '
                TabOrder = 0
                object Panel7: TPanel
                  Left = 2
                  Top = 16
                  Width = 231
                  Height = 339
                  Align = alClient
                  BevelOuter = bvNone
                  BorderWidth = 8
                  TabOrder = 0
                  object mLyrics: TMemo
                    Left = 8
                    Top = 8
                    Width = 215
                    Height = 323
                    Align = alClient
                    ScrollBars = ssBoth
                    TabOrder = 0
                    OnChange = mLyricsChange
                  end
                end
              end
            end
          end
          object tsAlbumDetails: TTabSheet
            Caption = 'Album Details'
            ImageIndex = 2
            object GroupBox1: TGroupBox
              Left = 6
              Top = 72
              Width = 345
              Height = 280
              Anchors = [akLeft, akTop, akBottom]
              Caption = ' Track Listing '
              TabOrder = 1
              object dbgAlbumTracks: TwwDBGrid
                Left = 15
                Top = 24
                Width = 314
                Height = 238
                Selected.Strings = (
                  'Song_Title'#9'41'#9'Title'
                  'Track_Number'#9'6'#9'Track #')
                IniAttributes.Enabled = True
                IniAttributes.SaveToRegistry = True
                IniAttributes.FileName = 'Software\MP3Collector'
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Anchors = [akLeft, akTop, akBottom]
                DataSource = dmMain.dsdsqAlbumTracks
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgShowCellHint]
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Arial'
                TitleFont.Style = []
                TitleLines = 1
                TitleButtons = False
                UseTFields = False
                OnDblClick = dbgAlbumTracksDblClick
                OnMouseDown = dbgAlbumTracksMouseDown
                PadColumnStyle = pcsPlain
              end
            end
            object GroupBox2: TGroupBox
              Left = 6
              Top = 6
              Width = 345
              Height = 57
              Caption = ' Album Title '
              TabOrder = 0
              object eAlbumAlbumName: TEdit
                Left = 16
                Top = 20
                Width = 314
                Height = 22
                TabOrder = 0
                OnChange = eAlbumAlbumNameChange
              end
            end
          end
          object tsMP3Details: TTabSheet
            Caption = 'Tag Details'
            ImageIndex = 1
            object gbID3v1: TGroupBox
              Left = 6
              Top = 5
              Width = 275
              Height = 165
              Caption = ' ID3v1 '
              TabOrder = 0
              object Label11: TLabel
                Left = 10
                Top = 67
                Width = 26
                Height = 14
                Caption = 'Artist'
              end
              object Label12: TLabel
                Left = 10
                Top = 43
                Width = 19
                Height = 14
                Caption = 'Title'
              end
              object Label13: TLabel
                Left = 10
                Top = 91
                Width = 30
                Height = 14
                Caption = 'Album'
              end
              object Label14: TLabel
                Left = 112
                Top = 115
                Width = 30
                Height = 14
                Caption = 'Genre'
              end
              object Label15: TLabel
                Left = 181
                Top = 19
                Width = 36
                Height = 14
                Caption = 'Track #'
              end
              object Label16: TLabel
                Left = 10
                Top = 115
                Width = 24
                Height = 14
                Caption = 'Year'
              end
              object Label17: TLabel
                Left = 10
                Top = 139
                Width = 44
                Height = 14
                Caption = 'Comment'
              end
              object ev1Title: TEdit
                Left = 63
                Top = 38
                Width = 203
                Height = 22
                TabOrder = 2
                OnChange = speArtistChange
              end
              object ev1Artist: TEdit
                Left = 63
                Top = 62
                Width = 203
                Height = 22
                TabOrder = 3
                OnChange = speSongChange
              end
              object ev1Album: TEdit
                Left = 63
                Top = 86
                Width = 203
                Height = 22
                TabOrder = 4
                OnChange = speAlbumChange
              end
              object ev1Genre: TEdit
                Left = 146
                Top = 110
                Width = 120
                Height = 22
                TabOrder = 6
              end
              object ev1TrackNo: TEdit
                Left = 226
                Top = 14
                Width = 40
                Height = 22
                TabOrder = 1
                OnChange = speTrackNumChange
                OnKeyPress = ev1TrackNoKeyPress
              end
              object ev1Year: TEdit
                Left = 63
                Top = 110
                Width = 40
                Height = 22
                TabOrder = 5
                OnChange = speYearChange
                OnKeyPress = ev1YearKeyPress
              end
              object ev1Comment: TEdit
                Left = 63
                Top = 134
                Width = 203
                Height = 22
                TabOrder = 7
              end
              object cbIDV3v1: TCheckBox
                Left = 63
                Top = 17
                Width = 78
                Height = 17
                Caption = 'IDV3v1 Tag'
                TabOrder = 0
              end
            end
            object gbID3v2: TGroupBox
              Left = 292
              Top = 5
              Width = 318
              Height = 331
              Caption = ' ID3v2 '
              TabOrder = 1
              object Label18: TLabel
                Left = 10
                Top = 67
                Width = 26
                Height = 14
                Caption = 'Artist'
              end
              object Label19: TLabel
                Left = 10
                Top = 43
                Width = 19
                Height = 14
                Caption = 'Title'
              end
              object Label20: TLabel
                Left = 10
                Top = 91
                Width = 30
                Height = 14
                Caption = 'Album'
              end
              object Label21: TLabel
                Left = 122
                Top = 115
                Width = 30
                Height = 14
                Caption = 'Genre'
              end
              object Label22: TLabel
                Left = 223
                Top = 19
                Width = 36
                Height = 14
                Caption = 'Track #'
              end
              object Label23: TLabel
                Left = 10
                Top = 115
                Width = 24
                Height = 14
                Caption = 'Year'
              end
              object Label24: TLabel
                Left = 10
                Top = 139
                Width = 44
                Height = 14
                Caption = 'Comment'
              end
              object Label25: TLabel
                Left = 10
                Top = 188
                Width = 49
                Height = 14
                Caption = 'Composer'
              end
              object Label26: TLabel
                Left = 10
                Top = 212
                Width = 52
                Height = 14
                Caption = 'Orig. Artist'
              end
              object Label27: TLabel
                Left = 10
                Top = 236
                Width = 46
                Height = 14
                Caption = 'Copyright'
              end
              object Label28: TLabel
                Left = 10
                Top = 260
                Width = 20
                Height = 14
                Caption = 'URL'
              end
              object Label29: TLabel
                Left = 10
                Top = 284
                Width = 57
                Height = 14
                Caption = 'Encoded by'
              end
              object ev2Title: TEdit
                Left = 73
                Top = 38
                Width = 235
                Height = 22
                TabOrder = 2
                OnChange = speArtistChange
              end
              object ev2Artist: TEdit
                Left = 73
                Top = 62
                Width = 235
                Height = 22
                TabOrder = 3
                OnChange = speSongChange
              end
              object ev2Album: TEdit
                Left = 73
                Top = 86
                Width = 235
                Height = 22
                TabOrder = 4
                OnChange = speAlbumChange
              end
              object ev2Genre: TEdit
                Left = 156
                Top = 110
                Width = 152
                Height = 22
                TabOrder = 6
              end
              object ev2TrackNo: TEdit
                Left = 268
                Top = 14
                Width = 40
                Height = 22
                TabOrder = 1
                OnChange = speTrackNumChange
                OnKeyPress = ev2TrackNoKeyPress
              end
              object ev2Year: TEdit
                Left = 73
                Top = 110
                Width = 40
                Height = 22
                TabOrder = 5
                OnChange = speYearChange
                OnKeyPress = ev2YearKeyPress
              end
              object cbIDV3v2: TCheckBox
                Left = 73
                Top = 17
                Width = 78
                Height = 17
                Caption = 'IDV3v2 Tag'
                TabOrder = 0
              end
              object mv2Comment: TMemo
                Left = 73
                Top = 134
                Width = 235
                Height = 47
                TabOrder = 7
              end
              object ev2Composer: TEdit
                Left = 73
                Top = 184
                Width = 235
                Height = 22
                TabOrder = 8
                OnChange = speAlbumChange
              end
              object ev2OrigArtist: TEdit
                Left = 73
                Top = 208
                Width = 235
                Height = 22
                TabOrder = 9
                OnChange = speAlbumChange
              end
              object ev2Copyright: TEdit
                Left = 73
                Top = 232
                Width = 235
                Height = 22
                TabOrder = 10
                OnChange = speAlbumChange
              end
              object ev2URL: TEdit
                Left = 73
                Top = 256
                Width = 235
                Height = 22
                TabOrder = 11
                OnChange = speAlbumChange
              end
              object ev2EncodedBy: TEdit
                Left = 73
                Top = 280
                Width = 235
                Height = 22
                TabOrder = 12
                OnChange = speAlbumChange
              end
            end
            object gbMPEG: TGroupBox
              Left = 6
              Top = 176
              Width = 275
              Height = 160
              Caption = ' MPEG Details '
              TabOrder = 2
            end
            object bmp3CopyID3v2: TButton
              Left = 6
              Top = 347
              Width = 105
              Height = 25
              Caption = 'Copy to ID3v2'
              Enabled = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 3
            end
            object bmp3CopyID3v1: TButton
              Left = 292
              Top = 347
              Width = 105
              Height = 25
              Caption = 'Copy to ID3v1'
              Enabled = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
            end
          end
        end
      end
      object tsPlaylist: TTabSheet
        Caption = 'Playlist Editor'
        ImageIndex = -1
        object Splitter1: TSplitter
          Left = 193
          Top = 0
          Width = 3
          Height = 398
          Cursor = crHSplit
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 193
          Height = 398
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 193
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label31: TLabel
              Left = 7
              Top = 4
              Width = 42
              Height = 14
              Caption = 'Playlists:'
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 367
            Width = 193
            Height = 31
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object bNewPlaylist: TButton
              Left = 4
              Top = 4
              Width = 52
              Height = 25
              Caption = '&New'
              TabOrder = 0
              OnClick = bNewPlaylistClick
            end
            object bDeletePlaylist: TButton
              Left = 61
              Top = 4
              Width = 52
              Height = 25
              Caption = '&Delete'
              TabOrder = 1
              OnClick = bDeletePlaylistClick
            end
            object bExportPlaylist: TButton
              Left = 118
              Top = 4
              Width = 52
              Height = 25
              Caption = '&Export'
              TabOrder = 2
              OnClick = bExportPlaylistClick
            end
          end
          object dbgPlaylists: TwwDBGrid
            Left = 0
            Top = 22
            Width = 193
            Height = 345
            IniAttributes.Enabled = True
            IniAttributes.SaveToRegistry = True
            IniAttributes.FileName = 'Software\MP3Collector'
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dmMain.dsPlaylists
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgPerfectRowFit, dgTrailingEllipsis]
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            PadColumnStyle = pcsPlain
          end
        end
        object Panel8: TPanel
          Left = 196
          Top = 0
          Width = 414
          Height = 398
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 414
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label32: TLabel
              Left = 7
              Top = 4
              Width = 34
              Height = 14
              Caption = 'Songs:'
            end
          end
          object Panel12: TPanel
            Left = 0
            Top = 367
            Width = 414
            Height = 31
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
          end
          object dbgPlaylistSongs: TwwDBGrid
            Left = 0
            Top = 22
            Width = 414
            Height = 345
            IniAttributes.Enabled = True
            IniAttributes.SaveToRegistry = True
            IniAttributes.FileName = 'Software\MP3Collector'
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dmMain.dsqPlaylistSongs
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgPerfectRowFit, dgTrailingEllipsis]
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            PadColumnStyle = pcsPlain
          end
        end
      end
    end
    object TBXMDMainRight: TTBXMultiDock
      Left = 750
      Top = 7
      Width = 7
      Height = 427
      Position = dpRight
    end
    object TBXMDMainBottom: TTBXMultiDock
      Left = 0
      Top = 434
      Width = 757
      Height = 7
      Position = dpBottom
    end
    object TBXMDMainLeft: TTBXMultiDock
      Left = 0
      Top = 7
      Width = 132
      Height = 427
      Position = dpLeft
      object TBXDPTreeview: TTBXDockablePanel
        Left = 0
        Top = 0
        Caption = 'Filter Bar'
        DefaultDock = TBXMDMainLeft
        DockMode = dmCannotFloat
        DockPos = 0
        FloatingWidth = 128
        FloatingHeight = 128
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        SupportedDocks = [dkStandardDock, dkMultiDock]
        TabOrder = 0
        OnClose = TBXDPTreeviewClose
        object FilterTV: TTreeView
          Left = 0
          Top = 22
          Width = 128
          Height = 369
          Align = alClient
          AutoExpand = True
          HideSelection = False
          Indent = 35
          ReadOnly = True
          RightClickSelect = True
          TabOrder = 0
          OnExpanding = FilterTVExpanding
          OnKeyUp = FilterTVKeyUp
          OnMouseDown = FilterTVMouseDown
        end
        object Panel13: TPanel
          Left = 0
          Top = 0
          Width = 128
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object cbTreeFilter: TCheckBox
            Left = 12
            Top = 3
            Width = 77
            Height = 17
            Caption = 'Enable Filter'
            TabOrder = 0
            OnClick = cbTreeFilterClick
          end
        end
      end
    end
    object TBXMDMainTop: TTBXMultiDock
      Left = 0
      Top = 0
      Width = 757
      Height = 7
    end
  end
  object tbdTop: TTBDock
    Left = 0
    Top = 0
    Width = 757
    Height = 64
    PopupMenu = pmTopToolbar
    object tbxtFileMenu: TTBXToolbar
      Left = 98
      Top = 24
      AutoResize = False
      Caption = 'File Menu'
      CloseButton = False
      DefaultDock = tbdTop
      DockMode = dmCannotFloat
      DockPos = -15
      DockRow = 1
      Images = ImageList16x16
      Options = [tboImageAboveCaption]
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = False
      SystemFont = False
      TabOrder = 0
      object tbxiAdd: TTBXItem
        Caption = 'Add'
        Hint = 'Add new mp3 catalogue'
        ImageIndex = 4
        Images = ImageList16x16
        MaskOptions = [tboImageAboveCaption]
        Options = [tboImageAboveCaption, tboSameWidth, tboShowHint]
        OnClick = tbxiAddClick
      end
      object tbxiDelete: TTBXItem
        Caption = 'Delete'
        Hint = 'Deleted selected song, album, artist, or catalogue'
        ImageIndex = 5
        Options = [tboSameWidth]
        OnClick = tbxiDeleteClick
      end
    end
    object tbxtMainMenu: TTBXToolbar
      Left = 0
      Top = 0
      Caption = 'Main Menu'
      CloseButton = False
      DockMode = dmCannotFloat
      DockPos = -7
      FullSize = True
      Images = ImageList16x16
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      Stretch = True
      SystemFont = False
      TabOrder = 1
      object TBXSIFile: TTBXSubmenuItem
        Caption = 'File'
        object tbxiFileFilter: TTBXItem
          Caption = 'Filter'
          ImageIndex = 0
          Images = ImageList16x16
          ShortCut = 16454
          OnClick = tbxiFilterClick
        end
        object tbxiFileReset: TTBXItem
          Caption = 'Reset'
          ImageIndex = 18
          Images = ImageList16x16
          ShortCut = 16466
        end
        object tbxiFileAdd: TTBXItem
          Caption = 'Add'
          ImageIndex = 4
          Images = ImageList16x16
          ShortCut = 16449
          OnClick = tbxiAddClick
        end
        object tbxiFileDelete: TTBXItem
          Caption = 'Delete'
          ImageIndex = 5
          Images = ImageList16x16
          ShortCut = 16452
          OnClick = tbxiDeleteClick
        end
        object TBXSeparatorItem5: TTBXSeparatorItem
        end
        object tbxiDatabaseOptions: TTBXItem
          Caption = 'Database Options'
          Images = ImageList16x16
          Visible = False
        end
        object tbxiFileExit: TTBXItem
          Caption = 'Exit'
          Hint = 'Exit Mp3 Collector'
          ImageIndex = 7
          Images = ImageList16x16
          Options = [tboShowHint]
          OnClick = tbxiFileExitClick
        end
      end
      object TBXSIView: TTBXSubmenuItem
        Caption = 'View'
        object tbxiFilterTreeBar: TTBXItem
          Caption = 'Filter Bar'
          OnClick = tbxiFilterTreeBarClick
        end
        object TBXSeparatorItem1: TTBXSeparatorItem
        end
        object tbxiViewAlbum: TTBXItem
          Caption = 'Album'
          OnClick = tbxiViewAlbumClick
        end
        object tbxiViewArtist: TTBXItem
          Caption = 'Artist'
          OnClick = tbxiViewArtistClick
        end
        object tbxiViewCatalogue: TTBXItem
          Caption = 'Catalogue #'
          OnClick = tbxiViewCatalogueClick
        end
        object tbxiViewCatalogueName: TTBXItem
          Caption = 'Catalogue Name'
          OnClick = tbxiViewCatalogueNameClick
        end
        object tbxiViewGenre: TTBXItem
          Caption = 'Genre'
          OnClick = tbxiViewGenreClick
        end
        object tbxiViewFilename: TTBXItem
          Caption = 'Filename'
          OnClick = tbxiViewFilenameClick
        end
        object tbxiViewTitle: TTBXItem
          Caption = 'Title'
          OnClick = tbxiViewTitleClick
        end
        object tbxiViewTrack: TTBXItem
          Caption = 'Track #'
          OnClick = tbxiViewTrackClick
        end
        object tbxiViewYear: TTBXItem
          Caption = 'Year'
          OnClick = tbxiViewYearClick
        end
        object TBXSeparatorItem3: TTBXSeparatorItem
        end
        object tbxiSettings: TTBXItem
          Caption = 'Settings'
          Hint = 'Change program settings'
          ImageIndex = 8
          Images = ImageList16x16
          OnClick = tbxiSettingsClick
        end
      end
      object TBXSIReports: TTBXSubmenuItem
        Caption = 'Reports'
        object tbxiRepCatalogues: TTBXItem
          Caption = 'Catalogues'
          OnClick = tbxiRepCataloguesClick
        end
        object tbxiRepArtists: TTBXItem
          Caption = 'Artists'
          OnClick = tbxiRepArtistsClick
        end
        object tbxiRepAlbumsFull: TTBXItem
          Caption = 'Albums && Songs'
          OnClick = TBXItem4Click
        end
        object tbxiRepAlbums: TTBXItem
          Caption = 'Albums'
          OnClick = tbxiRepAlbumsClick
        end
        object tbxiRepAlbumLyrics: TTBXItem
          Caption = 'Album Lyrics'
          OnClick = tbxiRepAlbumLyricsClick
        end
        object tbxiRepCatFileLising: TTBXItem
          Caption = 'Catalogue File Listing'
          OnClick = tbxiRepCatFileLisingClick
        end
      end
      object TBXSINavigation: TTBXSubmenuItem
        Caption = 'Navigation'
        object tbxiNavFirst: TTBXItem
          Caption = 'First'
          ImageIndex = 12
          Images = ImageList16x16
          OnClick = tbxiFirstClick
        end
        object tbxiNavPrevious: TTBXItem
          Caption = 'Previous'
          ImageIndex = 13
          Images = ImageList16x16
          OnClick = tbxiPreviousClick
        end
        object tbxiNavNext: TTBXItem
          Caption = 'Next'
          ImageIndex = 14
          Images = ImageList16x16
          OnClick = tbxiNextClick
        end
        object tbxiNavLast: TTBXItem
          Caption = 'Last'
          ImageIndex = 15
          Images = ImageList16x16
          OnClick = tbxiLastClick
        end
        object TBXSeparatorItem4: TTBXSeparatorItem
        end
        object tbxiDbSave: TTBXItem
          Caption = 'Save'
          ImageIndex = 2
          Images = ImageList16x16
          ShortCut = 16467
          OnClick = tbxiSaveClick
        end
        object tbxiDbCancel: TTBXItem
          Caption = 'Cancel'
          ImageIndex = 3
          Images = ImageList16x16
          OnClick = tbxiCancelClick
        end
      end
      object TBXSIQuerys: TTBXSubmenuItem
        Caption = 'Filters'
        object TBXISaveFilter: TTBXItem
          Caption = 'Save Filter'
          OnClick = TBXISaveFilterClick
        end
        object TBXIDeleteFilter: TTBXItem
          Caption = 'Delete Filter'
          OnClick = TBXIDeleteFilterClick
        end
        object TBXSeparatorItem2: TTBXSeparatorItem
        end
      end
      object TBXSIHelp: TTBXSubmenuItem
        Caption = 'Help'
        object tbxiHomepage: TTBXItem
          Caption = 'Home Page'
          Hint = 'Visit Mp3 Collector on the web'
          ImageIndex = 9
          Images = ImageList16x16
          OnClick = tbxiHomepageClick
        end
        object tbxiAbout: TTBXItem
          Caption = 'About'
          Hint = 'Display program information about Mp3 Collector'
          ImageIndex = 6
          Images = ImageList16x16
          OnClick = tbxiAboutClick
        end
      end
    end
    object tbxtChanges: TTBXToolbar
      Left = 188
      Top = 24
      Caption = 'Changes'
      DockMode = dmCannotFloat
      DockPos = 119
      DockRow = 1
      Options = [tboImageAboveCaption]
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = False
      SystemFont = False
      TabOrder = 2
      object tbxiSave: TTBXItem
        Caption = 'Save'
        Hint = 'Save amended song details'
        ImageIndex = 2
        Images = ImageList16x16
        Options = [tboSameWidth, tboShowHint]
        OnClick = tbxiSaveClick
      end
      object tbxiCancel: TTBXItem
        Caption = 'Cancel'
        Hint = 'Cancel amended song details'
        ImageIndex = 3
        Images = ImageList16x16
        Options = [tboSameWidth, tboShowHint]
        OnClick = tbxiCancelClick
      end
    end
    object tbxtNavigation: TTBXToolbar
      Left = 284
      Top = 24
      Caption = 'Navigator'
      DockMode = dmCannotFloat
      DockPos = 200
      DockRow = 1
      Images = ImageList16x16
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = False
      SystemFont = False
      TabOrder = 3
      object tbxiFirst: TTBXItem
        Caption = 'First'
        Hint = 'Go to first song'
        ImageIndex = 12
        Options = [tboImageAboveCaption, tboSameWidth, tboShowHint]
        OnClick = tbxiFirstClick
      end
      object tbxiPrevious: TTBXItem
        Caption = 'Previous'
        Hint = 'Go to previous song'
        ImageIndex = 13
        Options = [tboImageAboveCaption, tboSameWidth, tboShowHint]
        OnClick = tbxiPreviousClick
      end
      object tbxiNext: TTBXItem
        Caption = 'Next'
        Hint = 'Go to next song'
        ImageIndex = 14
        Options = [tboImageAboveCaption, tboSameWidth, tboShowHint]
        OnClick = tbxiNextClick
      end
      object tbxiLast: TTBXItem
        Caption = 'Last'
        Hint = 'Go to last song'
        ImageIndex = 15
        Options = [tboImageAboveCaption, tboSameWidth, tboShowHint]
        OnClick = tbxiLastClick
      end
    end
    object tbxtQueryMenu: TTBXToolbar
      Left = 0
      Top = 24
      AutoResize = False
      Caption = 'File Menu'
      CloseButton = False
      DefaultDock = tbdTop
      DockMode = dmCannotFloat
      DockPos = -15
      DockRow = 1
      Images = ImageList16x16
      Options = [tboImageAboveCaption]
      ParentShowHint = False
      ProcessShortCuts = True
      ShowHint = False
      SystemFont = False
      TabOrder = 4
      object tbxiFilter: TTBXSubmenuItem
        Caption = 'Filter'
        DropdownCombo = True
        Hint = 'Filter collection using current filter criteria'
        ImageIndex = 0
        Images = ImageList16x16
        Options = [tboImageAboveCaption, tboSameWidth, tboShowHint]
        OnClick = tbxiFilterClick
        object tbxiBlankFilterText: TTBXItem
          Caption = 'Clear filter text'
          OnClick = tbxiBlankFilterTextClick
        end
      end
      object tbxiReset: TTBXItem
        Caption = 'Reset'
        Hint = 'Reset all filters'
        ImageIndex = 18
        Images = ImageList16x16
        MaskOptions = [tboImageAboveCaption]
        Options = [tboImageAboveCaption, tboSameWidth, tboShowHint]
        OnClick = tbxiResetClick
      end
    end
  end
  object ImageList16x16: TImageList
    Left = 602
    Top = 378
    Bitmap = {
      494C010115001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001001000000000000030
      000000000000000000000000000000000000000000008C318C318C318C318C31
      8C318C318C318C318C318C318C318C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000035A035AE259E255E255C155
      C151C151A051A04DA04D804D804D8C318C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000045E2C7F035EF37F4D7F4D7F4D7F
      4D7F4D7F4D7F4D7F4D7F876AF37F804D8C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000245E2C7F245EF37F8F7F8F7FEA76
      EA76EA76EA768F7F8F7FA86EF37F804D8C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000024622C7F4562F37FB07FEA76394A
      FB3DFB3D754EEA76B07FC972F37FA04D8C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000025622C7F6666F37F4D7F754E7E6F
      1D631D631D63754EEA76EA76F37FA04D8C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000045624D7F6666F37F4D7F754E1D63
      7E6F1D63754E754EEA760B7FF37FA0518C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000045628F7F6666FF7FFF7F1D63FF5E
      1D637E6F7E6F1D63FF7F907FFF7FC1518C310000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004666B07F6666666666666666FB3D
      CC18CC189831CC18035E035A035A035A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006666D27FD17FD17FD17FD17FD17F
      FF7FFF7FFF7FAC14FF7FE2558C318C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006666FF7FF37FF37FF37FF37FFF7F
      245E045E035A3325035AE259752D8C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000006666FF7FFF7FFF7FFF7F2562
      00000000000098318C31D56EAC148C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666666466645620000
      000000000000AC148C35752D752D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003325AC14AC148C31000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003325AC14752D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000752DAC1400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000EF3D29256B2D00000000
      0000000000000000000000000000000000000000A56AC66EA46A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FAA7E4349634D634D634D6351
      6351634D634D4349434943452341A97EFF7F0000D5399631B5350B216B2D0000
      0000000000001042104210420000000000000000A56A7377B07F0973A46A8362
      8362836200000000000000000000000000000000000000000000104210421042
      104210421042000000000000000000000000FF7F6351A35DC365C365C365C365
      C365C365C365C365A361A35D6351223DFF7FF63D31255229B7355D4A0B21CE39
      00000000EF3D10426B2D2925AD35000000000000A56AEA72F37FF27F6E7B6E7B
      6E7B6E7B0973A46A836200000000000000000000000000000000104200000000
      000018631863000000000000000000000000FF7F8355C365E36DE36DE371E371
      237E237E237E237EE36DA36183554345FF7F742D9631953130259531D6396B2D
      00001042F75EF75E3967734E0821CE3900000000A56AEA72F57FD17FB17FB17F
      B17F6E7B6E7B6E7B0977A46A0000000000000000000000000000104200000000
      000018631863000000000000000000000000FF7FA361E36D03760376FF7F237E
      757F757F757F237E0376C365A35D4349FF7F1B421F63BF56D9393025D839AD35
      EF3D524A734E18633967396731464A2900000000A56AA56A7577D27FD27FB17F
      B17FB17FB17F6E7B6E7B09770000000000000000000000000000104200000000
      000018631863000000000000000000000000FF7FC365E371237E237EFF7FFF7F
      FF7FFF7FFF7F757F0376C369A361634DFF7FFD5EBF771F633C46102194316B2D
      4A296C2DD439B035F75E18633967292510420000A56A6E7BA56AF37FD17FD17F
      D17FB17FB17FB17F6E7B6E7B8362000000000000000000000000000010420000
      000018630000000000000000000000000000FF7FE36D237E237E237EFF7FFF7F
      237E237E237EFF7FE371C369C3656351FF7F0000FD5E5D4AB835742D9135E759
      29256C2DCF39D039B0351863F75EAD35AD350000A56AD27FA56A7577B47BB47B
      D47FB17FB17FB17F6E7B6E7BE772000000000000000000000000000000001042
      186300000000000000000000000000000000FF7FE371237E237E237EFF7FFF7F
      FF7F237E237E0376E36DC365C3658355FF7F00000000000000001842AA45C97E
      0821CE39B55610426D2DD65AF75E1042EF3D0000A56AF37F6E7BA56A83628362
      83627577D17FB07FB07F6E7B6E7B836200000000000000000000000000000000
      186300000000000000000000000000000000FF7F0376237E237E237E237E237E
      237E237E0376E371C369C365C3658355FF7F00000000000000001A42A941F27F
      CA3929251863524A4B29524AD65ACE39EF3D0000A56AF37FD27F6E7B6E7B6E7B
      6D7BA56A7577B07FB07FB07FB27F866A00000000000000000000000000000000
      000018630000000000000000000000000000FF7F237E447E447E237E237E237E
      037AFF7FFF7FFF7FC365C365C3658355FF7F00000000000000003B46CD3D2C4E
      0D6F072129258C316B2DEF3D524AAD3500000000A56AF37FD27FD27FD27FD27F
      6E7B6E7BA56A8362856A856A856A836200000000000000000000104200000000
      000000001863000000000000000000000000FF7F237E877E877E447EFF7F237E
      237E0376FF7FFF7FC369C365C3658355FF7F00000000000038465A4A6C2DEE1C
      E84DED45E71C29256B2D8C318C31000000000000A56AF87FF27FF37FFA7FFA7F
      B17FB27F6E7B6E7BA36E00000000000000000000000000000000104200000000
      000018630000000000000000000000000000FF7F447EAA7EA97E657E757FFF7F
      FF7FFF7FFF7FFF7FE36DC365C3658355FF7F000000000000794EF73D762D1121
      8E31000000001042CE3931460000000000000000A46A7377F87FF87F7377A36A
      8362836283628362836600000000000000000000000000000000104200000000
      000018631863000000000000000000000000FF7F877EED7EAA7E877E667E757F
      757F757F237EFF7F0376E36DC3658355FF7F000000000000384633259831752D
      00000000000000000000000000000000000000000000C66EA56A836283620000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FA97E107FED7EAA7EA97E877E
      667E657E447E437E237E0376C365634DFF7F000000000000594AEF1C742D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      104210421042104200000000000000000000FF7F757FA97E667E447E237E237E
      237E237E0376E371E36DC365A35DCC7EFF7F0000000000003846144200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F7C2A0E090E090E090E090F09
      0F090E090E090E090E09ED08EC085C26FF7FFF7FD042C209C30DC30DC30DE30D
      E30DE209E209E105E105E001C001CF3EFF7FFF7FD042C209C30DC30DC30DE30D
      E30DE209E209E105E105E001C001CF3EFF7FFF7F7C2A0E090E090E090E090F09
      0F090E090E090E090E09ED08EC085C26FF7FFF7F0F09520D740D740D740D740D
      740D740D740D740D730D520D0F09CB08FF7FFF7F020A24124516461A461A4516
      65166412830E830E820A81064002A001FF7FFF7F020A24124516461A461A4516
      65166412830E830E820A81064002A001FF7FFF7F0F09520D740D740D740D740D
      740D740D740D740D530D520D0F09CB08FF7FFF7F310D740D9C3696119611B711
      D911D911FD4AFF7F9611730D3009ED08FF7FFF7F230E4516671E671E671E871E
      89265453FF7F8926861A830E6002E001FF7FFF7F230E4516671E671E671EFF7F
      54538926892689268516830E6002E001FF7FFF7F310D740D96119611FF7FFD4A
      D911D911D911D91196111B1A3009ED08FF7FFF7F730D9611FF7FB811B811D911
      D911FD4AFF7FFF7FB711740D520D0E09FF7FFF7F4412671E8822882288228926
      5453FF7FFF7F8926871E84128106E105FF7FFF7F4412671E882288228822FF7F
      FF7F545389268926871E84128106E105FF7FFF7F530D9611B811B811FF7FFF7F
      FD4AD911D911D911B711FF7F520D0E09FF7FFF7F740DB711FF7FDA11D911D911
      FD4AFF7FFF7FFF7FB711950D730D0E09FF7FFF7F4516682289268A2A89265453
      FF7FFF7FFF7F8926871E8412820A0106FF7FFF7F4516682289268A2A8926FF7F
      FF7FFF7F54538926871E8412820A0106FF7FFF7F740DB711D911DA11FF7FFF7F
      FF7FFD4AD911D911B711FF7F530D0E09FF7FFF7F9611D911FF7FD911D911FD4A
      FF7FFF7FFF7FFF7FB711950D740D0F09FF7FFF7F661A89268A2A89265453FF7F
      FF7FFF7FFF7F8926871E8412830E020AFF7FFF7F661A89268A2A89268926FF7F
      FF7FFF7FFF7F5453871E8412830E020AFF7FFF7F9611D911DA11D911FF7FFF7F
      FF7FFF7FFD4AD911B711FF7F740D0F09FF7FFF7FB711DA11FF7FD911FD4AFF7F
      FF7FFF7FFF7FFF7F9611740D740D3009FF7FFF7F68228A2A89265453FF7FFF7F
      FF7FFF7FFF7F8822861A64126412030EFF7FFF7F68228A2A892689268926FF7F
      FF7FFF7FFF7FFF7F545364126412030EFF7FFF7FB711DA11D911D911FF7FFF7F
      FF7FFF7FFF7FFD4A9611FF7F740D3009FF7FFF7FB811FA11FF7FD911FD4AFF7F
      FF7FFF7FFF7FFF7F950D740D740D3009FF7FFF7F88228A2A8A2A5453FF7FFF7F
      FF7FFF7FFF7F671E651664126412E411FF7FFF7F88228A2A8A2A89268926FF7F
      FF7FFF7FFF7FFF7F545364126412E411FF7FFF7FB811FA11DA11D911FF7FFF7F
      FF7FFF7FFF7FFD4A950DFF7F740D3009FF7FFF7FDA111B1AFF7FFA11D911FD4A
      FF7FFF7FFF7FFF7F740D740D740D3009FF7FFF7F8A2AAB2EAB2E8A2A5453FF7F
      FF7FFF7FFF7F671E461A45164516E411FF7FFF7F8A2AAB2EAB2E8A2A8926FF7F
      FF7FFF7FFF7F5453461A45164516E411FF7FFF7FDA111B1AFB15FA11FF7FFF7F
      FF7FFF7FFD4A9611740DFF7F740D3009FF7FFF7FDA113B22FF7F1B1AFB15FA11
      FD4AFF7FFF7FFF7F950D740D740D3009FF7FFF7F8A2ACD36CD36AB2EAA2A5453
      FF7FFF7FFF7F671E461A45164516E411FF7FFF7F8A2ACD36CD36AB2EAA2AFF7F
      FF7FFF7F5453671E461A45164516E411FF7FFF7FDA113B223B221B1AFF7FFF7F
      FF7FFD4AB7119611950DFF7F740D3009FF7FFF7FFB157C2AFF7F1B1AFB15FB15
      FA11FD4AFF7FFF7F9611740D740D3009FF7FFF7FAB2EEF3EEE3AAC32AB2EAB2E
      5453FF7FFF7F6822671E461A461AE411FF7FFF7FAB2EEF3EEE3AAC32AB2EFF7F
      FF7F545368226822671E461A461AE411FF7FFF7FFB157C2A5C261B1AFF7FFF7F
      FD4AD911B811B7119611FF7F740D3009FF7FFF7F3B229C369C363B221B1E1B1A
      1B1AFB15FD4AFF7FB8119611740D3009FF7FFF7FCD361147EF3ECD36CC32AC32
      AC325453FF7F89268822671E461AE411FF7FFF7FCD361147EF3ECD36CC32FF7F
      5453AB2E8A2A89268822671E461AE411FF7FFF7F3B229C367C2A3B22FF7FFD4A
      1B1AFB15D911D911B8111B1A740D3009FF7FFF7F5C26DD429C367C2A5C263B22
      1B1E1B1AFB15FB15D911B811740D0E09FF7FFF7FEE3A334F1147EF3EEE3ACD36
      CC32AC32AB2EAA2A89268822461AC30DFF7FFF7FEE3A334F1147EF3EEE3ACD36
      CC32AC32AB2EAA2A89268822461AC30DFF7FFF7F5C26DD429C367C2A5C263B22
      1B1E1B1AFB15FB15D911B811740D0E09FF7FFF7F3E535C261B1EFB15DA11DA11
      D911D911B811B7119611740D520D9C32FF7FFF7F765BEE3ACC32AB2E8A2A8A2A
      8926892688226822671E461A2412F146FF7FFF7F765BEE3ACC32AB2E8A2A8A2A
      8926892688226822671E461A2412F146FF7FFF7F3E535C261B1EFB15DA11DA11
      D911D911B811B7119611740D520D9C32FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F535F535F535
      F535000000000000000000000000000000000000000016421642164216421642
      164216421642164216421642164216420000000000000000000000000000CE39
      4A294A292925CE39000000000000000000000000000000000000000000000000
      000000000E4E004500000000000000000000000000000000F5359B3E1D4B1C53
      DB46F535F535F535F535000000000000000000000000984EBF6B9E637E5F7E5B
      5D575E533D4F3D4B3D4B3D4B5E4F16420000000000000000000000001042524A
      F75E1863F75E8C3129250000000000000000000000000000000000000000C455
      C3554541E559856A6545404981510000000000000000F535DB46DD3E1D4F5D5B
      3D53783A2F255129F535F535F5350000000000000000984EBF6B186318631863
      1863186318631863186318633D4F164200000000000000000000AD359452734E
      524A9452B556186318634A29000000000000000000000000000000000000A96E
      C87281514566A66EA15542624266000000000000F535FC4A1D47DD3E1D539E67
      5E5778422F252F25993EFD469A42F535000000000000B852BF73A5144B251A5F
      7E5F5D573D4F3D4F3D4F3D4B3D4F164200000000000000000000314610429452
      F75E1863F75EB5561863B5564A29000000000000000000000000000044492562
      E976E876C872A66E856E836A426200458A41F5353E4F5E4B1D47DD3E3E57BF6F
      9F6399462F252F25993EFD46DB42F535000000000000B852DF734B2508218A31
      1A5F7E5B5D573D4F3D4F3D4F3D4B164200000000000000006B2DCE3910421042
      EF3DF75E18633967F75E186339674A290000000000000000000000002449A872
      0A7BE976EC72094EC35142664262A0518449F5355E4F5E4B1E47DE3A3E57DF77
      BF6FB94E0E212F25993EFD46DB42F535000000000000D956FF7B1863CA3DE855
      43357129D85A1863186318633D4F164200000000000000002925CE39CE396F2D
      B3356C2D734E39673967B55618634A291042000000000000000000000D730A77
      E9760D777B6FAD356539426241666266AC5EF5355E4F5F4BFC4A964A3E57FF7B
      DF771B5B922D50259942FD46DB42F535000000000000DA56FF7FDF77CA3DC849
      F239D81971291A5F5D575D575D5716420000000000008D3129254A296D2DD239
      F33DF53DF53D94521863F75EB5569452292500000000000000000000241E875A
      E9760D777B6FAD35A63D836A636663660000F5355F4B3A538A72047AB06EFF77
      DF77DF739E671C531C4FFC4ADB42F535000000000000FA5AFF7FDF7BDF77CF3D
      FE42BE2ED81D71291A5F5D575D5716420000000000000B21082129256C2DAD35
      AE35D239F43DEF3D1863186394521863292500008C2E210AE0014716272BA64E
      C86E0C6B5A6B8C31A83D856A856A00000000F5351363C87EA67E667E037EF07A
      FF77DF77BF6F9E675D5B1D4FDB46F43D000000000000FA5AFF7F18631863F539
      5F571F479D2ED81D7129D85A1A5F574A00000000B235D239E71C2925EF3D524A
      3146CE39AD354C2994521863D65A3967AD35000065166937C41AA316272B831E
      832EC822D84E4A29D1318862636600000000687A887EA87EC87E877E457E037E
      117BFF77DF77BF6F9F631B5B324AF341000000000000FB5AFF7FFF7FFF7FDF7B
      F5395F571F47BE2ED81971291A5FB85600002F251642584AE71C08211042B556
      9452EF3DAD354C293146D65AB5563967AD350000260E6937893B472F272B0523
      E41A830E440E0D22000000000000000000000000687E887EA87EC87E877E457E
      037E117BFF77FF775A6BEE55CF4900000000000000001B5BFF7FFF7FFF7FFF7F
      DF7BF5395F571F479D2EB61D7129D85A00005029DA5A9E73524A082108213967
      F75E3146CE3929253146734E734EF75EAD35871EC41A893B893B4E43CE424312
      820E820E61064A160000000000000000000000000000687A887EA87EA87E877E
      457E037E127F3673A95DAA51000000000000000000001C5BFF7F186318631863
      18631863F5395F575352A67A4054004C0000D2391A63DE7B3967E71C0821D65A
      D65A3146CE394A29EF3D524A1042D65A4A299253CD4BAA3F69375A6B9452E415
      4106810A820E0E3300000000000000000000000000000000887EA87EC87EA87E
      667E457E037EA67186610000000000000000000000001C5BFF7FFF7FFF7FFF7F
      FF7FFF7FFF7BF5396976A268A2684054004C000091315A6B39670821C6180821
      E71C082129258C31AD35CE39EF3D6B2D000000004833693769375A6B94526722
      E41A830E89160000000000000000000000000000000000000000887EA87EC87E
      A77E477AC358476D00000000000000000000000000003D5FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F5C6760602D7EA27DA268000000000000B656D65AEF3DE71C0821
      082129254A298C318C31AD35EF3D6B2D0000000000008B3F6937396731464B26
      EA260C33000000000000000000000000000000000000000000000000887EA87E
      000000004348276D00000000000000000000000000001C5BDF7BDF77DF77DF77
      DF77DF77DF773C67583E60606060000000000000000000000000000000000821
      E71C082129254A296B2D6B2D29250000000000000000000048339646AE31D126
      C416000000000000000000000000000000000000000000000000000000000000
      00000000634C276D00000000000000000000000000001C5B3D5B3D5B3D5B3D5B
      1C5B1C5B3D5BFA5A173E00000000000000000000000000000000000000000000
      CE39E71C0821292529258C310000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000734EAD354A29
      2925292529254A29734E00000000000000000000000000000000000000000000
      913108210000000000000000000000000000000000000000000000000000AD42
      04160416AD420000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000B5563C637D6B9E6B
      9E6B7D6B7D6BF95A6B2DCE39734E000000000000000000000000913193319731
      B735082100000000000000000000000000000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000195F9E6BDE7B9C73D952
      BA4A1B5FDD7BBE777D6B113EAD35734E00000000000091319331B835BA35BA35
      B835082193319331933193319331933100000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000005C679E6FFE7F79423609971D
      BA4E78115711BA4EFE7F7E6BCF35CE390000000000009331BA35BA35BA35B935
      B8350821F83D3B465E4A9E529E52933100000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000007D6BFE7FF82D3709580D984A
      FF7F5B3A370936097942FE7F7D6B6B2D734E000000009331BA35BA35DA39DA39
      B939082140024002400240029E52933100000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E73DE7BBA4A370999199915B91D
      3B3699159919781536091B5FBE73744A8C31000000009331DA39DA39DB39DB39
      DA39082140024002400240029E52933100000000AD4204160416041604160416
      7247C72A04160416041604160416AD42000000000D6280508050805080508050
      80508050805080508050805080500D620000BE73DE7B98197815B91979113936
      9E6FB91D78119919580DF829FE7F3B634A29000000009331FC3DFC3DFC3D1C42
      DA39082140020002000200029E529331000000008C32C72AC72AC72AC72AC72A
      C72AC72AC72AC72AC72AC72AC72A0416000000008050527AA070A070A070A070
      A070A070A070A070A070A070A07080500000BE737D6B78119919991979111836
      FF7FBD4A3809991999157815BE777D6B4A290000000093311E461D425D4A7F6F
      3B46082100020002800180019E529331000000008C3272477247724772477247
      7247C72A724772477247724772470416000000008050167FF37EF37ED37ED37E
      D37E2C7A2C7A2C7A2C7AAA79AA7980500000BE737E6779119919991999155811
      D952FF7F7C3E580D99157815BE777D6B4A290000000093311E461D427E4EFF7F
      3B4608213F57DE42DE42DE429E52933100000000AD428C328C328C328C328C32
      7247C72A04160416041604160416AD42000000000D6280508050805080508050
      80508050805080508050805080500D620000BE73BE73BB19BA1999157811580D
      37093B63FF7FDA217911B91DDF7B7D6BAD350000000093313E463E463E463E46
      FB4108213F575F5F5F5F5F5F9E52933100000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E73FF7F7E369C1539369D6FFA29
      D7007A3EFF7F3B32590D7C3AFF7F1B5FB5560000000093313E465E4A5E4A3E46
      1C4208213F575F5F5F5F5F5F9E52933100000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BE73BE77BF6F3F261B2EFD7FFF7F
      FC52FE7FFD7FDC1DDC1DBF779E6F744A00000000000093313E465F4A5F4A5E4A
      3C4608213F575F5F5F5F5F5F9E52933100000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000007D6BFF7FBF67DF3ABD429D6F
      DD7B9D6F9E3E3F267F67FF7F7D6B396300000000000093313E465F4A7F4E5F4A
      3C4608213F575F5F5F5F5F5F9E52933100000000000000000000000000008C32
      7247C72A04160000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000BE777D6BFF7FFF7FDF637F57
      3F4B3F4B5F57DF7BFF7F7D6B39630000000000000000933193317C4E5F4A7F4E
      3D4A08213F575F5F5F5F5F5F9E5293310000000000000000000000000000AD42
      8C328C32AD420000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BE777D6B9E73FF7FFF7F
      FF7FFF7FFF7F9D6F7D6B7B6F00000000000000000000000000009331D6391A42
      3B46082193319331933193319331933100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000BE73DE77BE77BE77
      BE77BE77BE77BE77BE7300000000000000000000000000000000000000009331
      9331082100000000000000000000000000000000893D574A0000000000000000
      000000000000000000000000000000000000000000000000000000000000752D
      752D1C631C631C63386338633863752DD218000000000000000035017801D729
      0000000000000000000000000000000000000000000000000000000000000000
      00000000D7297801350100000000000000006D622372E951584A000000000000
      0000000000000000000000000000000000003646712D712D712D712D712DF739
      782D1C63F31CD6393863DE7BDE7B782DD2180000000000005609990178017619
      0000000000000000000000000000000000000000000000000000000000000000
      000000007619780199015609000000000000C97ECA7E2476E951584A00000000
      00000000000000000000000000000000000036465F535F535F535F535F53F739
      782D5846F31C33251C631863DE7B782DD2180000000076119901980176190000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007619980199017611000000000000CA7ECA7E0372E951584A0000
      00000000000000000000000000000000000036465F535F535F535F535F53F739
      782D58465846975297521C633863782DD2180000183298019901761100000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007611990198011832000000000000CA7EC97E2372E951574A
      00000000000000000000000000000000000036467E637E637E637E637E63F739
      5525762D782D782D782D782D782D782DD2180000360199013501000000001832
      7701770177017701770177017701350100000000350177017701770177017701
      770177011832000000003501990136010000000000000000CA7EC97E046EAB39
      0000F539984EDA52994E000000000000000036467E637E637E6310420000F739
      5525DF7BDF7BDF7BDF7BDF7BDF7B782DD218183298019801000000000000B721
      98019901990199019901B901DA015601000000005601DA01B901990199019901
      99019801B7210000000079429801980118320000000000000000EA7E56775446
      76469E67FF6BFF6BFF6B7C5FB952000000003646BE6FBE6F104210001F00F739
      5525DF7BDF7BDF7BDF7BFF7BDF7B782DD2185609990135010000000000000000
      79427942794214099901DA01FB017701000000007701FB01DA01990114097942
      79427942000000000000000035019901560900000000000000000000D95ADA52
      BF63FF6BFF6BFF6BFF6FFF77DE77364600003646BE6FBE6F10021F001002F739
      5525DF7BDF7BDF7BDF7BFF7BDF7B782DD21836019901D8210000000000000000
      0000000018329901DB0199011C0298010000000098011C029901DB0199011832
      000000000000000000000000D821990136010000000000000000000058467E5B
      5E53DF67FF6BFF6FFF77FF7BFF7F5B5F00003646DF77DF77100218631863F739
      5525DF7BDF7BFF7BFF7BFF7BDF7B782DD21836019901D8210000000000000000
      0000F729B901FB01560156095E0299010000000099015E0256095601FB01B901
      F72900000000000000000000D8219901360100000000000000000000FB529F57
      3E4BDF67FF6FFF73FF7BFF7BFF77BE6B784A3646DF77DF77100218631002F739
      55255A6BD95AD95AD95AD95A5A6B5525D2185609990136010000000000000000
      9719B9011C025601000019227F06B90500000000B9057F061922000056011C02
      B90197190000000000000000360199015609000000000000000000001C577F57
      FD429E5BFF6BFF6FFF73FF73FF6FDE6BB84E3646DF77DF771863100210421F00
      000210021863DF77B756F4390000000000001832980198015609383AF8295701
      FC011C029809000000001926BF1AD91100000000D911BF1A1926000000009809
      1C02FC015701F829383A560998019801183200000000000000000000FB569F5B
      FD423E4BBF63FF6FFF6FFF6FFF6FBE6B984E3646FF7FFF7FFF7F186310021002
      10021863FF7FFF7FB756163A000000000000000035099801B901DA01FB011C02
      FC017611000000000000F829FF32F91D00000000F91DFF32F829000000000000
      7611FC011C02FB01DA01B90198013509000000000000000000000000784ABF63
      BF635E533E4F9E5BDF67DF6BFF6B7C5F00003646FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F364636463646364600000000000000000000B7217701B901B9019809
      794200000000000000000000182E593E00000000593E182E0000000000000000
      000079429809B901B9017701B721000000000000000000000000000000001B57
      FF7FDF773E4BFD423E4F9F5BDF63774600003646FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F3646DD36174200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FA5EBE6BBF639F579F5B7E5BB94E000000003646FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7F36461742000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B94AB94EFB52FB5200000000000000003646364636463646364636463646
      3646364617420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00C0010000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000000000001000000000000
      000100000000000081C1000000000000C3C3000000000000FFC3000000000000
      FFC7000000000000FFCF000000000000FFFFFFFF8001C7FF8FFFE00F000083C7
      807FF01F00000183800FF71F000001018007F71F000000018007F71F00000000
      8003FB3F000080008003FC7F0000F0008001FC7F0000F0008001FA3F0000F001
      8001F51F0000E003800FF21F0000E0C7800FF71F0000E1FFC3FFF01F0000E3FF
      FFFFE00F0000E7FFFFFFFFFF8001FFFF80018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008001800180018001FFFFF0FFC001FC1FFF9FE00FC001F80F
      FC03C003C001F007FC038001C001F003F8000001C001E001F8000001C001E000
      F8000001C001C000F8010001C001C00080030001C001800080030001C0010000
      801F8003C0010000001FC007C0010000001FE00FC0008001803FF01FC001C001
      C07FF99FC003FC03E0FFFF9FC00FFE07FFFFFFFFF00FFE7FFC3FFFFFE003F07F
      FC3FFFFFC001C001FC3FFFFF8001C001FC3FFFFF8000C001FC3FFFFF0000C001
      800180010000C001800180010000C001800180010000C001800180010000C001
      FC3FFFFF0000C001FC3FFFFF0001C001FC3FFFFF8001C001FC3FFFFF8003C001
      FC3FFFFFC007F001FFFFFFFFE00FFC7F9FFFFC00F1FFFF8F0FFF0000E1FFFF87
      07FF0000C3FFFFC383FF000087FFFFE1C1FF00008C018031E10F00001C018030
      F00300001E018078F80100001F8181F8F80100001F0180F8F80000001E118878
      F800000700318C00F800000780718E01F8010007C0F99F03FC01000FFFFFFFFF
      FE03001FFFFFFFFFFF0F003FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.html'
    Filter = 'HTML (*.html)|*.html'
    Title = 'Export As'
    Left = 541
    Top = 378
  end
  object TBXSwitcher: TTBXSwitcher
    Theme = 'Default'
    FlatMenuStyle = fmsEnable
    Left = 632
    Top = 378
  end
  object EasyFileSearch: TEasyFileSearch
    Version = 'TEasyFileSearch v1.02'
    SearchOptions = []
    FilterKind = []
    DateFilterFileAccess = dfakAnyFiles
    DateFilterKind = dfkSame
    DateFilterFirstDate = 37647
    DateFilterSecondDate = 37647
    SizeFilterKind = sfkSmallerOrEqualTo
    SizeFilterSize = 0
    FileNames.Strings = (
      '*.*')
    RootPath = '.\'
    OnStatistics = EasyFileSearchStatistics
    Left = 572
    Top = 378
  end
  object pmMainGrid: TPopupMenu
    Images = ImageList16x16
    OnPopup = pmMainGridPopup
    Left = 542
    Top = 347
    object pmMainPlay: TMenuItem
      Caption = 'Play'
      Default = True
      ImageIndex = 19
      OnClick = pmMainPlayClick
    end
    object PlaylistBreak: TMenuItem
      Caption = '-'
    end
    object pmAddSongToPlaylist: TMenuItem
      Caption = 'Add Song To Playlist'
      OnClick = pmAddSongToPlaylistClick
    end
    object pmAddAlbumToPlaylist: TMenuItem
      Caption = 'Add Album To Playlist'
      OnClick = pmAddAlbumToPlaylistClick
    end
    object pmAddAllToPlaylist: TMenuItem
      Caption = 'Add All To Playlist'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmMainQuickQuery: TMenuItem
      Caption = 'Quick Filter'
      ImageIndex = 0
      object pmQQArtist: TMenuItem
        Caption = 'Artist'
        OnClick = pmQQArtistClick
      end
      object pmQQAlbum: TMenuItem
        Caption = 'Album'
        OnClick = pmQQAlbumClick
      end
      object pmQQCatalogue: TMenuItem
        Caption = 'Catalogue'
        OnClick = pmQQCatalogueClick
      end
    end
    object pmMainSongDetails: TMenuItem
      Caption = 'Song Details'
      OnClick = pmMainSongDetailsClick
    end
    object pmMainAlbumDetails: TMenuItem
      Caption = 'Album Details'
      OnClick = pmMainAlbumDetailsClick
    end
    object pmMainCatalogueDetails: TMenuItem
      Caption = 'Catalogue Details'
      OnClick = pmMainCatalogueDetailsClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmMainDelete: TMenuItem
      Caption = 'Delete'
      ImageIndex = 5
      OnClick = pmMainDeleteClick
      object pmDelCatalogue: TMenuItem
        Caption = 'Catalogue'
        OnClick = pmDelCatalogueClick
      end
      object pmDelSong: TMenuItem
        Caption = 'Song'
        OnClick = pmDelSongClick
      end
      object pmDelArtist: TMenuItem
        Caption = 'Artist'
        OnClick = pmDelArtistClick
      end
      object pmDelAlbum: TMenuItem
        Caption = 'Album'
        OnClick = pmDelAlbumClick
      end
    end
  end
  object pmTopToolbar: TPopupMenu
    Left = 472
    Top = 32
    object pmTopMenuButtonLabels: TMenuItem
      Caption = 'Button Captions'
      OnClick = pmTopMenuButtonLabelsClick
    end
  end
  object pmQueryToolbar: TPopupMenu
    Left = 779
    Top = 155
    object pmvqAlbum: TMenuItem
      Caption = 'Album'
      OnClick = tbxiViewAlbumClick
    end
    object pmvqArtist: TMenuItem
      Caption = 'Artist'
      OnClick = tbxiViewArtistClick
    end
    object pmvqCatalogue: TMenuItem
      Caption = 'Catalogue #'
      OnClick = tbxiViewCatalogueClick
    end
    object pmvqCatalogueName: TMenuItem
      Caption = 'Catalogue Name'
      OnClick = tbxiViewCatalogueNameClick
    end
    object pmvqGenre: TMenuItem
      Caption = 'Genre'
      OnClick = tbxiViewGenreClick
    end
    object pmvqFilename: TMenuItem
      Caption = 'Filename'
      OnClick = tbxiViewFilenameClick
    end
    object pmvqTitle: TMenuItem
      Caption = 'Title'
      OnClick = tbxiViewTitleClick
    end
    object pmvqTrack: TMenuItem
      Caption = 'Track #'
      OnClick = tbxiViewTrackClick
    end
    object pmvqYear: TMenuItem
      Caption = 'Year'
      OnClick = tbxiViewYearClick
    end
  end
  object fpMain: TFormPlacement
    IniSection = 'MP3Collector'
    MinMaxInfo.MinTrackHeight = 496
    MinMaxInfo.MinTrackWidth = 615
    UseRegistry = True
    Left = 572
    Top = 347
  end
  object StartupTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = StartupTimerTimer
    Left = 633
    Top = 347
  end
  object ImageList32x32: TImageList
    Height = 32
    Width = 32
    Left = 602
    Top = 347
    Bitmap = {
      494C010106000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000006000000001001000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042104210421042104210421042104210421042104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104210421042104210421042104210421042104210421042104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042FF7FE07F1863E07F1863E07F1863E07F1863E07F10420000
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FE07F1863E07F1863E07F1863E07F1863E07F1863E07F10420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042FF7FE07F1863E07F1863E07F1863E07F1863E07F186300001042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7F1863E07F1863E07F1863E07F1863E07F1863E07F186310420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042FF7F1863E07F1863E07F1863E07F1863E07F1863104200001042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FE07F1863E07F1863E07F1863E07F1863E07F1863E07F10420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7F1863E07F1863E07F1863E07F1863E07F1863E07F000010421042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7F1863E07F1863E07F1863E07F1863E07F1863E07F186310420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1042000018631042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FE07F1863E07F1863E07F1863E07F1863E07F1863E07F10420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001042104210421042104210421042104210421042104210421042E07F1042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7F1863E07F1863E07F1863E07F1863E07F1863E07F186310420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042FF7F1863E07F1863E07F1863E07F1863E07F1863E07F18631042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FE07F1863E07F1863E07F1863E07F1863E07F1863E07F10420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042FF7FE07F1863E07F1863E07F1863FF7FFF7FFF7FFF7FFF7F1042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042FF7F1863E07F1863E07F1863FF7F104210421042104210421042
      0000000000000000000000000000000000000000000000000000000000000000
      00001042E07F1863E07F1863E07F1863E07F1042104210421042104210420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042FF7FFF7FFF7FFF7FFF7F1042000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001042E07F1863E07F1863E07F10420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104210421042104210420000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000010421042104200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000524AEF3D524A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000010428C3129254A29AD351042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000314629252925E71C08216B2DEF3D524A00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000010424A29C618734EF13D4B29E71C29256B2D10420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003146CE3929254A29B556F85E774ED0390921E71C29258C31524A
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000031462925EF3DD65AEF3D5A6B4B29F03DD039AF35092108214A29
      CE39000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000CE396B2D6B2D6B2D6B2DCE390000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000031468C314A29524A11421042B5569652774E9952DA5A34468E31E71C0821
      6B2DEF3D00000000000000000000000000000000000000000000000000000000
      0000CE394A2910423967104210426B2D39678D319452B55631463346B0358D31
      E71C29256B2D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000CE396B2D6B2D6B2D6B2D6B2D
      6B2D6B2D6B2D6B2D6B2DC055C051C051C051C055A05108216B2D6B2D6B2D6B2D
      6B2D6B2D6B2D6B2D6B2D6B2D6B2D6B2D00000000000000000000000000003146
      6B2DAD35B5567B6F5A6B8C311042945295521242CF3997529752F95EDB5A1342
      2925E71C4A29AD35524A00000000000000000000000000000000000000008C31
      6B2D94525A6B7B6F5A6B1863F75E4A29F75E6C2D39673967D65AD65AB556534A
      F13DAF352A2508214A29CE390000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008410841084108410841084108410
      84108410841084108410A26E0577E56EE56E0577E05584108410841084108410
      841084108410841084108410841008210000000000000000000010426B2D1042
      39677B6F5A6B5A6B39671863EF3D524A534AAE3500002104841000000821F13D
      FA5E774EAF35082129256B2D10420000000000000000000000008C31CE39D65A
      7B6F5A6B5A6B39671863F75EF75E4A29B556CE39CF39CF3994525A6B5A6BF75E
      18639452754EAF358E31E71C2925AD3500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000734E945294529452945294529452
      94529452945294529452A46A4E77B07F8F7F4D7B015A94529452945294529452
      94529452945294529452945284100821000000000000CE398C3194525A6B7B6F
      5A6B396739671863F75ED65ACE3931463146CE39CF392A258410000000000000
      C6181B63FC5EFC5E554A4B2908216B2D734E000000003146314639677B6F5A6B
      5A6B39671863F75ED75AD65AB5564A29F75EAD35AD35CF39F03DF03DF03DD65A
      5A6B7B6F3967396794521242B035082131460000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000734EDF6FDF6FDF6FDF73DF73DF6F
      DF6FDF6FDF73DF73DF73A66A9777D97FD87F957B235EDF6FDF6FDF6FDF6FDF6F
      DF6FDF6FDF6FDF6FDF6FDF6F84106B2D00000000104294527B6F7B6F5A6B3967
      39671863F75ED65AD65AB556EF3DB556F75ECE39AD35CE398D31000000000000
      4208A514CF39DA5AFC5E1E63BA560821524A0000B556D65A734E5A6B39673967
      1863F75ED65AD65AB556D65A5A6B1863524AD65AB5563146AE35CF39F13D1242
      F13D3246F85E9C739C737B6F1142082131460000000000000000000000000000
      0000000000000000000000003146EF3D082108214A29CE390000000000000000
      000000000000000000000000000000000000734E734E734E734E734E734E734E
      734E734E734E734E734EC96EBB77FF7FFF7FBA7B425E734E734E734E734E734E
      734E734E734E734E734E734E734E00000000B556F75E31465A6B396718631863
      F75ED65AB556B556F75E7B6FBD7794528C31734EF75E9452EF3DAE352A258510
      11426D2DA6148D31B956DB5AFD5E0821524A0000B5565A6B186339671863F75E
      D65AD65AB55618639C73BD779C737B6F1863734E524A3146D65AB556524AEF3D
      F13D12423446F13D744ED75AD039082131460000000000000000000000000000
      000000000000000031466B2D4A293146744EF13D2A25E71C29256B2D31460000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000846AC86EC96EA66AA56AA86A00000000000000000000
      000000000000000000000000000000000000B5565A6B39671863F75EF75ED65A
      B556D65A5A6BBD77BD779C737B6F7B6F5A6B734EAD358C31524AD65A9452F03D
      F03D12422A25554AD139482135460821524A0000B5561863F85EF75ED65AB556
      F75E5A6BBD77BD779C739C739C739C735A6B186339675A6BF75E524A3146D65A
      B556534A1142124234462519CC2D082131460000000000000000000000000000
      0000000031464A298C31524A7B6F5A6B9552AF352A25AF356D2D082108214A29
      CE39314600000000000000000000000000000000000000000000000000000000
      000000000000000000000000734EDF73945284104A2900000000000000000000
      000000000000000000000000000000000000B5561863F75EF75ED65AD65A3967
      9C73BD77BD77BD7718631863396739675A6B5A6B7B6F3967734E8C318C31524A
      D65A94521042F13DAE35872E2B250821524A0000B556F75ED65AD65A3967BD77
      BD77BD77BD77BD77BD777B6FD65A9452734E524AB556F75E39675A6B7B6F3967
      9452734ED65AB556744EAB2D8B29292531460000000000000000000000003146
      CE394A29EF3D39677B6F0821F75E1042AE358D31C618C618C6188E316D2D8D31
      E71C29256B2D1042000000000000000000000000000000000000000000000000
      000000000000000000000000524A7D671042630C082100000000000000000000
      000000000000000000000000000000000000B556D65AD65A18637B6FBD77DE7B
      DE7BBD77BD77F75E194252294F29AD353146D65A18635A6B5A6B7B6F7B6F9452
      CE39AD35524AD65A9452F03DF23D4A29524A0000B55618637B6FDE7BDE7BDE7B
      DE7BDE7BDE7B7B6F3146F03D96523B671963B6561042CF39B556F75E18635A6B
      7B6F7B6F396794521042D65A524A31460000000000000000000031468C316B2D
      94525A6B7B6F5A6B734E8C31AD35524A744E6C2D29258C31AD35AD35AD358D31
      F13D6D2D2A2508214A29CE393146000000000000000000000000000000000000
      000000000000000000000000AD35CF35C6184208630C8C310000000000000000
      00000000000000000000000000000000000094523967BD77DE7BFF7FFF7FDE7B
      DE7BDE7BDE7B18637F4E99319931D1399C739452314610429452186339675A6B
      7B6F7B6F9452AD35AD35524A524A9452000000000000F75E1863BD77FF7FFF7F
      FF7FDE7BF75EF03DFB5E7F6F9F739F73BF77DF7BDF7B5B6B1042B5567B6F7B6F
      7B6F7B6F396794523146734E0000000000000000000031466B2DEF3DF75E7B6F
      5A6BF75EEF3D8C31524AD65AD65AB55631464A2929258C31AD35CE39EF3D1042
      EF3D2925AF35B0358E31082129258C31524A0000000000000000000000000000
      000000000000000000006B2D29253146744EF13D2925E71C29256B2D00000000
      0000000000000000000000000000000000000000945218631863BD77FF7FFF7F
      FF7FDE7BDE7B18639F5299319931B0351B63FC5E9D739C73D65A3146F03D3146
      F75E3967F75E524A945294520000000000000000000000000000D65AD65A1863
      39673967F03D3E675F6B7F6F7F6F9F739F73BF77DF7BFF7FFF7F734E734E1863
      734E734ED65A00000000000000000000000000001042734E39677B6F1863734E
      AD35EF3DB556F75ED65AB5569452D65A94524A2929258C31AD35CE39EF3D1042
      CE39C618C6180821774EFD5E564A0821524A0000000000000000000000000000
      0000000000004A298C31524A7B6F5A6B9552AF352A25AF356D2D082108214A29
      CE3900000000000000000000000000000000000000000000000094529452D65A
      5A6BFF7FFF7F18639F52993199316E2D1742772DBC56DE7B9C737B6F794E3025
      52290D2129250000000000000000000000000000000000000000000000000000
      D65AAD351D633F675F6B5F6B7F6F7F6F9F739F73BF77FF7FFF7FFF7F31462925
      AD350000000000000000000000000000000031461863524AB5561042EF3D734E
      F75ED65AD65AB556D65A5A6BBD777B6F10423967B55610428C318C31EF3D1042
      CE39C618C618C618554ADC5AFD5E0821524A0000000000000000000000000000
      CE394A29EF3D39677B6F0821F75E1042AE358D31C618C618C6188E316D2D8D31
      E71C29256B2D0000000000000000000000000000000000000000000000000000
      9452D65AF75E31469F52993199318F31D43936259A52FF7FDE7B9C739A523025
      9931993129250000000000000000000000000000000000000000000000000000
      524A97525F6B3F673F675F6B5F6B7F6F7F6F9F73DF7BFF7FFF7FFF7FDE7BAD35
      4A2900000000000000000000000000000000B556524AEF3D524AF75EF75ED65A
      B556D65A18639C73BD779C737B6F7B6F7B6F7B6F5A6B5A6B5A6BD65A3146AD35
      8C312925E71CC61813429852DA5A0821524A000000000000000000008C316B2D
      94525A6B7B6F5A6B734E8C31AD35524A744E6C2D29258C31AD35AD35AD358D31
      F13D6D2D2A2508214A29CE390000000000000000000000000000000000000000
      0000000000003967BF5699319931B0351742152137469C73FF7FDE7BBB563025
      9931993129250000000000000000000000000000000000000000000000000000
      CE395E6B5F6B5F6B3F673F675F6B5F6F5F737F6FFF7FFF7FFF7FFF7FFF7FD65A
      4A29F03D0000000000000000000000000000B556D65AF75EF75ED65AD65A1863
      7B6FBD77BD779C739C735A6B3967186339673967F75EF75EF75EF75EB556F85E
      B6561142CF396D2DF03D554A774E0821524A0000000000006B2DEF3DF75E7B6F
      5A6BF75EEF3D8C31524AD65AD65AB55631464A2929258C31AD35CE39EF3D1042
      EF3D2925AF35B0358E31082129258C3100000000000000000000000000000000
      0000000000003967BF5699319931D139594AF31CD43918639C73FF7FBC563025
      9931993129250000000000000000000000000000000000000000000000003346
      534A7F6F7F6F5F6B5F6B3F677F777F7F3F7F7F7FFF7FFF7FFF7FFF7FFF7F9E73
      8C316B2D0000000000000000000000000000B556D65AD65A18635A6B9C737B6F
      9C739C737B6F39675A6B9C73DE7BFF7FFF7FDE7BBD779C737B6FBD77DE7BFF7F
      9C733C673C67D75AB556334634462925524A00001042734E39677B6F1863734E
      AD35EF3DB556F75ED65AB5569452D65A94524A2929258C31AD35CE39EF3D1042
      CE39C618C6180821774EFD5E564A0821CE390000000000000000000000000000
      0000000000003967BF5699319931B0351B6338463646945218639C73DC5A3025
      9931993129250000000000000000000000000000000000000000000000003346
      96529F737F6F7F6F5F6B9F73BF7F1D6BB85A5D73DF7FFF7FDF7B7F6F3F673F67
      12424A29F03D000000000000000000000000D65A39679C739C739C735A6B9452
      3967BD77BD777B6F9C73BD77DE7BFF7FFF7FDE7BBD779C737B6FBD77DE7BFF7F
      DE7BBD775D6B5B6B1042734E314631460000D65A1863524AB5561042EF3D734E
      F75ED65AD65AB556D65A5A6BBD777B6F10423967B55610428C318C31EF3D1042
      CE39C618C618C618554ADC5AFD5E0821CE390000000000000000000000000000
      0000000000003967DF5A993199312B25734E1863DE7B1863945218639A523025
      9931993129250000000000000000000000000000000000000000000000003346
      3B679F739F737F6F7F6FBF7B9F77AD35AD35CE397D73DF7B3F673F673F673F67
      764E4A29F03D00000000000000000000000000001863F75E1863DE7B9452CE39
      08212925CE39B5567B6FBD77DE7BFF7FFF7FDE7BBD779C737B6FBD77DE7BFF7F
      DE7B9C73B656734E31460000000000000000B556524AEF3D524AF75EF75ED65A
      B556D65A18639C73BD779C737B6F7B6F7B6F7B6F5A6B5A6B5A6BD65A3146AD35
      8C312925E71CC61813429852DA5A0821CE390000000000000000000000000000
      0000000000003967DF5A9931993199319731532930258F318D31AD35D4392E25
      9931993129250000000000000000000000000000000000000000000000003346
      DB5A3F673F673F673F67DF7B1B676B2D6B2DEF3DFB62DF7F3F673F673F673F67
      98526B2DF03D00000000000000000000000000000000000000003967D65AD65A
      5A6B18633146B5567B6FBD77DE7BFF7FFF7FDE7BBD779C737B6FBD777B6FF75E
      D65AD65A0000000000000000000000000000B556D65AF75EF75ED65AD65A1863
      7B6FBD77BD779C739C735A6B3967186339673967F75EF75EF75EF75EB556F85E
      B6561142CF396D2DF03D554A774E0821CE390000000000000000000000000000
      0000000000003967FF5E993199315129742D98319931993199319731742D3025
      9931993129250000000000000000000000000000000000000000000000003346
      764E3F673F673F673F67BF77BF7BCE394A298C313C67DF7B5F6B7F6F7F6F7F6F
      B7566B2DF03D0000000000000000000000000000000000000000000000000000
      0000D65AD65AD65A3967BD77DE7BFF7FFF7FDE7B9C73D65A9452B55600000000
      000000000000000000000000000000000000B556D65AD65A18635A6B9C737B6F
      9C739C737B6F39675A6B9C73DE7BFF7FFF7FDE7BBD779C737B6FBD77DE7BFF7F
      9C733C673C67D75AB556334634462925CE390000000000000000000000000000
      0000000000003967FF5E993199316E2D1863734E3246D139712D5229742D9931
      9931993129250000000000000000000000000000000000000000000000000000
      33463F673F677F6FBF77FF7FBF7F7D77764EFB62BF7F9F735F6B5F6B7F6F7F6F
      96526B2DF03D0000000000000000000000000000000000000000000000000000
      00000000000000000000D65AD65AF75EF75ED65AD65A00000000000000000000
      000000000000000000000000000000000000D65A39679C739C739C735A6B9452
      3967BD77BD777B6F9C73BD77DE7BFF7FFF7FDE7BBD779C737B6FBD77DE7BFF7F
      DE7BBD775D6B5B6B1042734E3146314600000000000000000000000000000000
      0000000000003967FF5E99319931B03539677B6F9C73DE7BFF7FBD7739678C31
      9931993129250000000000000000000000000000000000000000000000000000
      CF399F73FF7FFF7FFF7FFF7FDF7F7F7F3F7F7F7FBF7B5F6B3F675F6B5F6B7F6F
      3246AD3500000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000D65AF75E1863DE7B9452CE39
      08212925CE39B5567B6FBD77DE7BFF7FFF7FDE7BBD779C737B6FBD77DE7BFF7F
      DE7B9C73B656734E314600000000000000000000000000000000000000000000
      00000000000039671F6399319931B0355A6B39671863D65AF75ED65A5A6B734E
      9931993129250000000000000000000000000000000000000000000000000000
      33461863FF7FFF7FFF7FFF7FFF7F9F777F737F735F6B5F6B3F673F675F6B5F6B
      AD35CC2D00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D65AD65AD65A
      5A6B18633146B5567B6FBD77DE7BFF7FFF7FDE7BBD779C737B6FBD777B6FF75E
      D65AD65A00000000000000000000000000000000000000000000000000000000
      00000000000039671F6399319931B0353967D65AF75ED65AF75E39679C73524A
      9931993129250000000000000000000000000000000000000000000000000000
      0000EF3DDE7BFF7FFF7FFF7FFF7F9F739F737F6F7F6F5F6B5F6B3F673F67B856
      AD35000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D65AD65AD65A3967BD77DE7BFF7FFF7FDE7B9C73D65A9452B55600000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039673F6799319931B0353967B556F75E18637B6F18639C73524A
      9931993129250000000000000000000000000000000000000000000000000000
      0000524A734EFF7FFF7FFF7FDF7BBF779F739F737F6F7F6F5F6B5F6B1E63AD35
      524A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D65AD65AF75EF75ED65AD65A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000039673F6799319931B0359C739C739C735A6B5A6B18635A6B524A
      9931993129250000000000000000000000000000000000000000000000000000
      00000000524A734EFF7FFF7FDF7BBF77BF779F739F737F6F7F6F3E67F03D524A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000001B63FD5E784E7B6F18639C73DE7BBD77BD77BD77BD77524A
      99319931CE390000000000000000000000000000000000000000000000000000
      0000000000009452524ABD77DF7BDF7BBF77BF779F739F733D67F03D524A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000007B6FBD779C739C73FF7F754E
      BC56384600000000000000000000000000000000000000000000000000000000
      00000000000000000000EF3D734E39673B673B671963534ACE39000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000524A524A734E524A00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFE000FFFF8001FF0000000000000000FFC000FFFF0001FF0000000000000000
      FFC000FFFF0001FF0000000000000000FF8000FFFF0001FF0000000000000000
      FF8000FFFF0001FF0000000000000000FF0000FFFF0001FF0000000000000000
      FF0000FFFF0001FF0000000000000000FF0000FFFF0001FF0000000000000000
      FF8000FFFF0001FF0000000000000000FF8000FFFF0001FF0000000000000000
      FF8001FFFF0003FF0000000000000000FFC07FFFFF80FFFF0000000000000000
      FFE0FFFFFFC1FFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF0000000000000000
      FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFE3FFFFFFFFFFFFFFFFFFF
      FFFE3FFFFFFC0FFFFFFFFFFFFFFFFFFFFFF807FFFFF003FFFFFFFFFFFFFFFFFF
      FFC001FFFFC000FFFFFFFFFFFFF81FFFFF00007FFF00003FFFFFFFFF80000001
      FC00000FFC000007FFFFFFFF00000001F0000003F0000001FFFFFFFF00000001
      C0000000C0000000FFFFFFFF000000018000000080000000FFF81FFF00000003
      0000000080000000FFE003FFFFF03FFF0000000080000000FF80007FFFF83FFF
      0000000080000000FC00001FFFF83FFF0000000080000001F0000003FFF81FFF
      00000001C0000007C0000000FFF007FF80000007F000003F80000000FFC000FF
      F000003FFE0000FF00000000FE00003FFE00003FFE0000FF00000000F8000007
      FFC0003FFE00007F00000000E0000001FFC0003FFC00007F0000000080000000
      FFC0003FFC00003F0000000100000000FFC0003FFC00003F8000000F00000000
      FFC0003FFC00003FF000007F00000000FFC0003FFC00003FFF0007FF00000000
      FFC0003FFE00003FFFF03FFF00000001FFC0003FFE00007FFFFFFFFF8000000F
      FFC0003FFE00007FFFFFFFFFF000007FFFC0003FFF0000FFFFFFFFFFFF0007FF
      FFC0003FFF0000FFFFFFFFFFFFF03FFFFFC0003FFF8001FFFFFFFFFFFFFFFFFF
      FFE0003FFFC003FFFFFFFFFFFFFFFFFFFFFF807FFFF00FFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFC3FFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
