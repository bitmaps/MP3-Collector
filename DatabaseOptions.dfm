object DatabaseForm: TDatabaseForm
  Left = 298
  Top = 255
  BorderStyle = bsDialog
  Caption = 'Database Options'
  ClientHeight = 267
  ClientWidth = 490
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
    Left = 5
    Top = 227
    Width = 479
    Height = 7
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 236
    Height = 13
    Caption = 'Please select the database you would like to use.'
  end
  object bOk: TButton
    Left = 328
    Top = 236
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object bCancel: TButton
    Left = 408
    Top = 236
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 29
    Width = 473
    Height = 189
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    ColWidths = (
      162
      283)
  end
  object bNew: TButton
    Left = 8
    Top = 236
    Width = 75
    Height = 25
    Caption = '&New'
    TabOrder = 3
    OnClick = bNewClick
  end
  object bDelete: TButton
    Left = 88
    Top = 236
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 4
  end
end
