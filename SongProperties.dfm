object SongPropertiesForm: TSongPropertiesForm
  Left = 379
  Top = 257
  BorderStyle = bsDialog
  Caption = 'Song Properties'
  ClientHeight = 363
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 6
    Top = 6
    Width = 341
    Height = 323
    ActivePage = tsCatalogueEntry
    TabOrder = 0
    object tsCatalogueEntry: TTabSheet
      Caption = 'Catalogue Details'
      object Label1: TLabel
        Left = 10
        Top = 23
        Width = 26
        Height = 13
        Caption = 'Artist'
      end
      object Label2: TLabel
        Left = 10
        Top = 47
        Width = 24
        Height = 13
        Caption = 'Song'
      end
      object Label3: TLabel
        Left = 10
        Top = 71
        Width = 29
        Height = 13
        Caption = 'Album'
      end
      object Label4: TLabel
        Left = 10
        Top = 167
        Width = 60
        Height = 13
        Caption = 'Catalogue #'
      end
      object Label5: TLabel
        Left = 10
        Top = 191
        Width = 79
        Height = 13
        Caption = 'Catalogue Name'
      end
      object Label6: TLabel
        Left = 10
        Top = 119
        Width = 29
        Height = 13
        Caption = 'Genre'
      end
      object Label7: TLabel
        Left = 10
        Top = 239
        Width = 42
        Height = 13
        Caption = 'Filename'
      end
      object Label8: TLabel
        Left = 10
        Top = 263
        Width = 19
        Height = 13
        Caption = 'Size'
      end
      object Label9: TLabel
        Left = 10
        Top = 95
        Width = 37
        Height = 13
        Caption = 'Track #'
      end
      object Label10: TLabel
        Left = 170
        Top = 95
        Width = 22
        Height = 13
        Caption = 'Year'
      end
      object eArtist: TEdit
        Left = 63
        Top = 16
        Width = 257
        Height = 21
        TabOrder = 0
      end
      object eSong: TEdit
        Left = 63
        Top = 40
        Width = 257
        Height = 21
        TabOrder = 1
      end
      object eAlbum: TEdit
        Left = 63
        Top = 64
        Width = 257
        Height = 21
        TabOrder = 2
      end
      object eCatNum: TEdit
        Left = 98
        Top = 160
        Width = 64
        Height = 21
        TabOrder = 6
      end
      object eCatName: TEdit
        Left = 98
        Top = 184
        Width = 168
        Height = 21
        TabOrder = 7
      end
      object eGenre: TEdit
        Left = 63
        Top = 112
        Width = 257
        Height = 21
        TabOrder = 5
      end
      object eFilename: TEdit
        Left = 63
        Top = 232
        Width = 257
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 8
      end
      object eSize: TEdit
        Left = 63
        Top = 256
        Width = 70
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 9
      end
      object eTrackNum: TEdit
        Left = 63
        Top = 88
        Width = 64
        Height = 21
        TabOrder = 3
      end
      object eYear: TEdit
        Left = 202
        Top = 88
        Width = 64
        Height = 21
        TabOrder = 4
      end
    end
    object ID3v1x: TTabSheet
      Caption = 'ID3v1'
      ImageIndex = 1
      object Label11: TLabel
        Left = 10
        Top = 23
        Width = 26
        Height = 13
        Caption = 'Artist'
      end
      object Label12: TLabel
        Left = 10
        Top = 47
        Width = 24
        Height = 13
        Caption = 'Song'
      end
      object Label13: TLabel
        Left = 10
        Top = 71
        Width = 29
        Height = 13
        Caption = 'Album'
      end
      object Label14: TLabel
        Left = 10
        Top = 95
        Width = 37
        Height = 13
        Caption = 'Track #'
      end
      object Label15: TLabel
        Left = 170
        Top = 95
        Width = 22
        Height = 13
        Caption = 'Year'
      end
      object Label16: TLabel
        Left = 10
        Top = 119
        Width = 29
        Height = 13
        Caption = 'Genre'
      end
      object Edit1: TEdit
        Left = 63
        Top = 16
        Width = 257
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 63
        Top = 40
        Width = 257
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 63
        Top = 64
        Width = 257
        Height = 21
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 63
        Top = 88
        Width = 64
        Height = 21
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 63
        Top = 112
        Width = 257
        Height = 21
        TabOrder = 4
      end
      object Edit6: TEdit
        Left = 202
        Top = 88
        Width = 64
        Height = 21
        TabOrder = 5
      end
    end
    object tsID3v2: TTabSheet
      Caption = 'ID3v2'
      ImageIndex = 2
      object Label17: TLabel
        Left = 10
        Top = 23
        Width = 26
        Height = 13
        Caption = 'Artist'
      end
      object Label18: TLabel
        Left = 10
        Top = 47
        Width = 24
        Height = 13
        Caption = 'Song'
      end
      object Label19: TLabel
        Left = 10
        Top = 71
        Width = 29
        Height = 13
        Caption = 'Album'
      end
      object Label20: TLabel
        Left = 10
        Top = 95
        Width = 37
        Height = 13
        Caption = 'Track #'
      end
      object Label21: TLabel
        Left = 170
        Top = 95
        Width = 22
        Height = 13
        Caption = 'Year'
      end
      object Label22: TLabel
        Left = 10
        Top = 119
        Width = 29
        Height = 13
        Caption = 'Genre'
      end
      object Edit7: TEdit
        Left = 63
        Top = 16
        Width = 257
        Height = 21
        TabOrder = 0
      end
      object Edit8: TEdit
        Left = 63
        Top = 40
        Width = 257
        Height = 21
        TabOrder = 1
      end
      object Edit9: TEdit
        Left = 63
        Top = 64
        Width = 257
        Height = 21
        TabOrder = 2
      end
      object Edit10: TEdit
        Left = 63
        Top = 88
        Width = 64
        Height = 21
        TabOrder = 3
      end
      object Edit11: TEdit
        Left = 63
        Top = 112
        Width = 257
        Height = 21
        TabOrder = 4
      end
      object Edit12: TEdit
        Left = 202
        Top = 88
        Width = 64
        Height = 21
        TabOrder = 5
      end
    end
  end
  object bSave: TButton
    Left = 191
    Top = 337
    Width = 75
    Height = 25
    Caption = '&Save'
    TabOrder = 1
    OnClick = bSaveClick
  end
  object bClose: TButton
    Left = 272
    Top = 337
    Width = 75
    Height = 25
    Caption = '&Close'
    TabOrder = 2
    OnClick = bCloseClick
  end
end
