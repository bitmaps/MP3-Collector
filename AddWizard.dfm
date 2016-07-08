object AddWizardForm: TAddWizardForm
  Left = 369
  Top = 314
  BorderStyle = bsDialog
  Caption = 'Add Wizard'
  ClientHeight = 267
  ClientWidth = 346
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
  object Bevel1: TBevel
    Left = 3
    Top = 227
    Width = 340
    Height = 6
    Shape = bsTopLine
  end
  object nb: TNotebook
    Left = 4
    Top = 6
    Width = 338
    Height = 219
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'MP3Directory'
      object Label3: TLabel
        Left = 5
        Top = 112
        Width = 81
        Height = 13
        Caption = 'Browse directory'
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 338
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object lDirectory: TLabel
          Left = 8
          Top = 5
          Width = 253
          Height = 13
          Caption = 'Please select source containing the mp3 files'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
      object cbIncludeSubFolders: TCheckBox
        Left = 4
        Top = 157
        Width = 129
        Height = 17
        Caption = 'Include sub directories'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object ceDirectory: TComboEdit
        Left = 4
        Top = 128
        Width = 331
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
        TabOrder = 1
        OnButtonClick = ceDirectoryButtonClick
        OnChange = ceDirectoryChange
      end
      object cbDuplicates: TCheckBox
        Left = 157
        Top = 157
        Width = 149
        Height = 17
        Caption = 'Update/replace duplicates'
        Checked = True
        State = cbChecked
        TabOrder = 3
        Visible = False
      end
      object cbSongLengths: TCheckBox
        Left = 4
        Top = 179
        Width = 221
        Height = 17
        Caption = 'Process song length (considerably slower)'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object DrivesPanel: TPanel
        Left = 2
        Top = 26
        Width = 335
        Height = 79
        BevelOuter = bvNone
        TabOrder = 6
      end
      object cbEject: TCheckBox
        Left = 4
        Top = 200
        Width = 221
        Height = 17
        Caption = 'Eject media after add (if supported)'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'CatalogueDetails'
      object lbCatID: TLabel
        Left = 4
        Top = 38
        Width = 12
        Height = 13
        Caption = '#:'
      end
      object lbCatName: TLabel
        Left = 82
        Top = 38
        Width = 31
        Height = 13
        Caption = 'Name:'
      end
      object Label4: TLabel
        Left = 4
        Top = 86
        Width = 32
        Height = 13
        Caption = 'Notes:'
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 338
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object lCatDetails: TLabel
          Left = 8
          Top = 5
          Width = 99
          Height = 13
          Caption = 'Catalogue Details'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
      object edCatalogueID: TEdit
        Left = 4
        Top = 54
        Width = 64
        Height = 21
        MaxLength = 5
        TabOrder = 1
        OnChange = edCatalogueIDChange
        OnKeyPress = edCatalogueIDKeyPress
      end
      object edCatalogueVolName: TEdit
        Left = 80
        Top = 54
        Width = 254
        Height = 21
        MaxLength = 50
        TabOrder = 2
        OnChange = edCatalogueVolNameChange
      end
      object mCatalogueNotes: TMemo
        Left = 4
        Top = 103
        Width = 330
        Height = 107
        TabOrder = 3
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Progress'
      object pDisplayInfo: TPanel
        Left = 0
        Top = 0
        Width = 338
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = clBtnShadow
        TabOrder = 0
        object lProgress: TLabel
          Left = 8
          Top = 5
          Width = 50
          Height = 13
          Caption = 'Progress'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
      object lbProgressItems: TListBox
        Left = 4
        Top = 33
        Width = 331
        Height = 179
        ItemHeight = 13
        TabOrder = 1
      end
    end
  end
  object bNext: TButton
    Left = 86
    Top = 237
    Width = 75
    Height = 25
    Caption = '&Next'
    TabOrder = 2
    OnClick = bNextClick
  end
  object bPrevious: TButton
    Left = 6
    Top = 237
    Width = 75
    Height = 25
    Caption = '&Previous'
    TabOrder = 3
    OnClick = bPreviousClick
  end
  object bClose: TButton
    Left = 266
    Top = 237
    Width = 75
    Height = 25
    Caption = '&Close'
    TabOrder = 4
    OnClick = bCloseClick
  end
  object MediaPlayer: TMediaPlayer
    Left = 48
    Top = 57
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 0
  end
  object EasyFileSearch1: TEasyFileSearch
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
      '*.mp3')
    RootPath = '.\'
    OnFileFound = EasyFileSearch1FileFound
    OnAcceptFile = EasyFileSearch1AcceptFile
    Left = 231
    Top = 189
  end
  object PBFolderDialog: TPBFolderDialog
    Flags = [ShowPath, HideNewFolderButton, ShowShared]
    OnInitialized = PBFolderDialogInitialized
    Titles.Strings = (
      'Please select the directory which holds the mp3 files.')
    Left = 296
    Top = 190
  end
  object Timer1: TTimer
    Left = 184
    Top = 232
  end
end
