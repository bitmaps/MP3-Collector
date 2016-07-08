object SettingsForm: TSettingsForm
  Left = 455
  Top = 250
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 316
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bOk: TButton
    Left = 166
    Top = 284
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object bCancel: TButton
    Left = 247
    Top = 284
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 6
    Top = 5
    Width = 316
    Height = 270
    ActivePage = tsFilterBar
    HotTrack = True
    TabOrder = 2
    OnChange = PageControl1Change
    object tsFilterBar: TTabSheet
      Caption = 'Filter Bar'
      ImageIndex = 1
      object rgAutoEnableFilterBar: TRadioGroup
        Left = 15
        Top = 7
        Width = 279
        Height = 52
        Caption = ' Automatically enable Filter Bar if clicked '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Yes'
          'No')
        TabOrder = 0
      end
      object gbFilterTree: TGroupBox
        Left = 15
        Top = 64
        Width = 279
        Height = 52
        Caption = ' Filter Bar display style '
        TabOrder = 1
        object cbFilterDisplayStyle: TComboBox
          Left = 13
          Top = 19
          Width = 254
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Catalogue'
            'Artist'
            'Alphabetical')
        end
      end
      object rgAutoExpand: TRadioGroup
        Left = 15
        Top = 121
        Width = 279
        Height = 52
        Caption = ' Auto expand on selection '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Yes'
          'No')
        TabOrder = 2
      end
      object rgIncludeFilterBar: TRadioGroup
        Left = 15
        Top = 178
        Width = 279
        Height = 52
        Caption = ' Include Filter Bar selection when filtering '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Yes'
          'No')
        TabOrder = 3
      end
    end
    object tsCollectionGrid: TTabSheet
      Caption = 'Collection Grid'
      ImageIndex = 6
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 266
        Height = 13
        Caption = 'Toggle the visibility of the columns in the collection grid.'
      end
      object clbCollectionGrid: TCheckListBox
        Left = 15
        Top = 32
        Width = 278
        Height = 139
        ItemHeight = 13
        Items.Strings = (
          'Cat #'
          'Artist'
          'Title'
          'Album'
          'Catalogue Name'
          'Genre'
          'Track #'
          'Year'
          'Filename'
          'Song Length'
          'Lyrics')
        TabOrder = 0
      end
      object gbDblClick: TGroupBox
        Left = 15
        Top = 178
        Width = 279
        Height = 52
        Caption = ' On double click do '
        TabOrder = 1
        object cbSongsDblClock: TComboBox
          Left = 13
          Top = 19
          Width = 254
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Play song'
            'Display song details'
            'Display album details'
            'Display catalogue details')
        end
      end
    end
    object tsDisplay: TTabSheet
      Caption = 'Display'
      ImageIndex = 5
      object gbTheme: TGroupBox
        Left = 15
        Top = 7
        Width = 279
        Height = 52
        Caption = ' Theme '
        TabOrder = 0
        object cbTheme: TComboBox
          Left = 13
          Top = 19
          Width = 254
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Default'
            'Acro'
            'Nexos'
            'Nexos2'
            'Office11Adaptive'
            'Office11XP'
            'Office2003'
            'OfficeC'
            'OfficeK'
            'OfficeXP'
            'Roma'
            'Stripes'
            'Tristan'
            'Tristan2'
            'Wos')
        end
      end
      object rgFileMenuCaptions: TRadioGroup
        Left = 15
        Top = 64
        Width = 279
        Height = 52
        Caption = ' Button captions '
        Columns = 2
        Items.Strings = (
          'Yes'
          'No')
        TabOrder = 1
      end
      object rgIconLayout: TRadioGroup
        Left = 15
        Top = 121
        Width = 279
        Height = 52
        Caption = ' File menu icon image layout '
        Columns = 2
        Items.Strings = (
          'Top'
          'Left')
        TabOrder = 2
      end
      object gbTransparency: TGroupBox
        Left = 15
        Top = 178
        Width = 279
        Height = 52
        Caption = ' Transparency '
        TabOrder = 3
        object tbTransparency: TTrackBar
          Left = 7
          Top = 17
          Width = 263
          Height = 27
          Max = 100
          Min = 1
          Orientation = trHorizontal
          Frequency = 1
          Position = 100
          SelEnd = 0
          SelStart = 0
          TabOrder = 0
          TickMarks = tmBottomRight
          TickStyle = tsNone
        end
      end
    end
    object tsReportOptions: TTabSheet
      Caption = 'Reports'
      ImageIndex = 4
      object rgFilterPrompt: TRadioGroup
        Left = 15
        Top = 7
        Width = 279
        Height = 52
        Caption = ' Prompt filter options '
        Columns = 2
        Items.Strings = (
          'Yes'
          'No')
        TabOrder = 0
      end
      object rgAutoLaunchRep: TRadioGroup
        Left = 15
        Top = 121
        Width = 279
        Height = 52
        Caption = ' Automatically launch report in browser '
        Columns = 2
        Items.Strings = (
          'Yes'
          'No')
        TabOrder = 2
      end
      object rgDefaultFilter: TRadioGroup
        Left = 15
        Top = 64
        Width = 279
        Height = 52
        Caption = ' Filter by default '
        Columns = 2
        Items.Strings = (
          'Yes'
          'No')
        TabOrder = 1
      end
    end
    object tsDatabase: TTabSheet
      Caption = 'Database'
      ImageIndex = 2
      object lbDirectory: TLabel
        Left = 8
        Top = 8
        Width = 96
        Height = 13
        Caption = 'Database directory:'
      end
      object ceDirectory: TComboEdit
        Left = 8
        Top = 24
        Width = 293
        Height = 21
        Glyph.Data = {
          D6020000424DD60200000000000036000000280000000F0000000E0000000100
          180000000000A0020000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4000000C8D0D400000000000000000000000000000000000000
          0000000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4000000
          000000808080808080808080808080808080808080808080808080000000C8D0
          D4C8D0D4C8D0D4000000C8D0D4000000FFFFFF00000080808080808080808080
          8080808080808080808080808080000000C8D0D4C8D0D4000000C8D0D4000000
          FFFFFFFFFFFF0000008080808080808080808080808080808080808080808080
          80000000C8D0D4000000C8D0D4000000FFFFFFFFFFFFFFFFFF00000000000000
          0000000000000000000000000000000000000000C8D0D4000000C8D0D4000000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C8D0D4C8D0
          D4C8D0D4C8D0D4000000C8D0D4000000FFFFFFFFFFFFFFFFFF00000000000000
          0000000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4
          000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D4000000000000000000C8D0D4C8D0D4000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000000000
          00C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8
          D0D4C8D0D4C8D0D4000000C8D0D4000000C8D0D4C8D0D4000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000000000C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
          D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000}
        NumGlyphs = 1
        TabOrder = 0
        OnButtonClick = ceDirectoryButtonClick
      end
      object bOptimise: TButton
        Left = 8
        Top = 81
        Width = 139
        Height = 25
        Caption = 'Optimise Tables'
        TabOrder = 1
        OnClick = bOptimiseClick
      end
      object bRepair: TButton
        Left = 8
        Top = 113
        Width = 139
        Height = 25
        Caption = 'Repair Tables'
        TabOrder = 2
        OnClick = bRepairClick
      end
      object Button1: TButton
        Left = 8
        Top = 145
        Width = 139
        Height = 25
        Caption = 'Empty Tables'
        TabOrder = 3
        OnClick = Button1Click
      end
    end
    object tsFreeDB: TTabSheet
      Caption = 'FreeDB'
      object Label1: TLabel
        Left = 13
        Top = 12
        Width = 32
        Height = 13
        Caption = 'Server'
      end
      object Label2: TLabel
        Left = 13
        Top = 60
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object Label4: TLabel
        Left = 13
        Top = 156
        Width = 65
        Height = 13
        Caption = 'Email address'
      end
      object cbServerList: TComboBox
        Left = 13
        Top = 28
        Width = 201
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
      object eDescription: TEdit
        Left = 13
        Top = 76
        Width = 201
        Height = 21
        TabOrder = 1
      end
      object eProxy: TEdit
        Left = 13
        Top = 124
        Width = 201
        Height = 21
        TabOrder = 2
      end
      object eEmailAddress: TEdit
        Left = 13
        Top = 172
        Width = 201
        Height = 21
        TabOrder = 3
      end
      object bRefresh: TButton
        Left = 223
        Top = 25
        Width = 75
        Height = 25
        Caption = '&Refresh'
        TabOrder = 4
        OnClick = bRefreshClick
      end
      object cbProxyServer: TCheckBox
        Left = 13
        Top = 104
        Width = 86
        Height = 17
        Caption = 'Proxy Server'
        TabOrder = 5
        OnClick = cbProxyServerClick
      end
    end
    object tsSpare: TTabSheet
      Caption = 'Spare'
      ImageIndex = 6
      object cbConfirmSaves: TCheckBox
        Left = 23
        Top = 184
        Width = 97
        Height = 17
        Caption = 'Confirm saves'
        TabOrder = 0
        Visible = False
      end
    end
  end
  object bReset: TButton
    Left = 6
    Top = 284
    Width = 75
    Height = 25
    Caption = '&Defaults'
    TabOrder = 3
    OnClick = bResetClick
  end
  object PBFolderDialog: TPBFolderDialog
    Flags = [ShowPath, ShowShared]
    OnInitialized = PBFolderDialogInitialized
    Titles.Strings = (
      'Please select the directory which holds the database files.')
    Left = 88
    Top = 282
  end
  object EasyFileSearch: TEasyFileSearch
    Version = 'TEasyFileSearch v1.02'
    SearchOptions = [okLookForAnyFile]
    FilterKind = []
    DateFilterFileAccess = dfakAnyFiles
    DateFilterKind = dfkSame
    DateFilterFirstDate = 37631
    DateFilterSecondDate = 37631
    SizeFilterKind = sfkSmallerOrEqualTo
    SizeFilterSize = 0
    ExcludedFiles.Strings = (
      '*.')
    FileNames.Strings = (
      '*.dat')
    RootPath = '.\'
    OnFileFound = EasyFileSearchFileFound
    Left = 120
    Top = 282
  end
  object DBISAMTable1: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    EngineVersion = '3.27'
    Left = 170
    Top = 221
  end
end
