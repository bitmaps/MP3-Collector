object DeleteForm: TDeleteForm
  Left = 471
  Top = 278
  BorderStyle = bsDialog
  Caption = 'Delete ...'
  ClientHeight = 149
  ClientWidth = 172
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
    Left = 6
    Top = 106
    Width = 163
    Height = 8
    Shape = bsTopLine
  end
  object bOk: TButton
    Left = 8
    Top = 117
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object bCancel: TButton
    Left = 89
    Top = 117
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object rbSong: TRadioButton
    Left = 21
    Top = 16
    Width = 77
    Height = 17
    Caption = 'Song'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object rbAlbum: TRadioButton
    Left = 21
    Top = 36
    Width = 77
    Height = 17
    Caption = 'Album'
    TabOrder = 3
  end
  object rbArtist: TRadioButton
    Left = 21
    Top = 56
    Width = 77
    Height = 17
    Caption = 'Artist'
    TabOrder = 4
  end
  object rbCatalogue: TRadioButton
    Left = 21
    Top = 76
    Width = 77
    Height = 17
    Caption = 'Catalogue'
    TabOrder = 5
  end
end
