object PlaylistForm: TPlaylistForm
  Left = 425
  Top = 310
  BorderStyle = bsDialog
  Caption = 'New Playlist'
  ClientHeight = 94
  ClientWidth = 269
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
  object lbCatName: TLabel
    Left = 10
    Top = 6
    Width = 203
    Height = 13
    Caption = 'Please enter the name of the new playlist:'
  end
  object Bevel1: TBevel
    Left = 4
    Top = 54
    Width = 265
    Height = 6
    Shape = bsTopLine
  end
  object bOk: TButton
    Left = 111
    Top = 66
    Width = 75
    Height = 25
    Caption = '&Ok'
    Enabled = False
    ModalResult = 1
    TabOrder = 0
  end
  object bCancel: TButton
    Left = 192
    Top = 66
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object ePlaylistName: TEdit
    Left = 10
    Top = 22
    Width = 255
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 2
    OnChange = ePlaylistNameChange
  end
end
