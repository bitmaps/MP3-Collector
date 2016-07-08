object SaveFilterForm: TSaveFilterForm
  Left = 430
  Top = 314
  BorderStyle = bsDialog
  Caption = 'Save As...'
  ClientHeight = 79
  ClientWidth = 382
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
    Left = 3
    Top = 38
    Width = 376
    Height = 6
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 10
    Top = 12
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object bOk: TButton
    Left = 221
    Top = 47
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TButton
    Left = 302
    Top = 47
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object eName: TEdit
    Left = 47
    Top = 8
    Width = 330
    Height = 21
    MaxLength = 80
    TabOrder = 0
  end
end
