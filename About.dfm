object AboutForm: TAboutForm
  Left = 406
  Top = 235
  BorderStyle = bsDialog
  Caption = 'About...'
  ClientHeight = 227
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 4
    Top = 183
    Width = 307
    Height = 5
    Shape = bsTopLine
  end
  object lWebsite: TLabel
    Left = 8
    Top = 199
    Width = 107
    Height = 13
    Caption = 'Mp3 Collector Website'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
    Visible = False
    OnClick = lWebsiteClick
  end
  object bClose: TButton
    Left = 232
    Top = 193
    Width = 75
    Height = 25
    Caption = '&Close'
    TabOrder = 0
    OnClick = bCloseClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 1
    object Bevel2: TBevel
      Left = 0
      Top = 20
      Width = 312
      Height = 9
      Align = alBottom
      Shape = bsBottomLine
    end
    object lProgramTitle: TLabel
      Left = 8
      Top = 7
      Width = 77
      Height = 13
      Caption = 'MP3 Collector'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lVersion: TLabel
      Left = 268
      Top = 7
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Version'
    end
  end
  object mThanks: TMemo
    Left = 5
    Top = 36
    Width = 302
    Height = 139
    Alignment = taCenter
    Enabled = False
    Lines.Strings = (
      'Coded & Created by Jeremy Mitchell'
      ''
      'Borland Delphi 5'
      'DBISAM - Elevate Software'
      'ID3v2 Tag - James Webb'
      'InfoPower - Woll2Woll Software'
      'PBFolderDialog - Poul Bak'
      'Toolbar2000 - Jordan Russell'
      'TBX - Alex Denisov'
      'TBX Themes - Roy Magne Klever')
    ReadOnly = True
    TabOrder = 2
  end
  object PJVersionInfo: TPJVersionInfo
    Left = 272
    Top = 139
  end
end
