object NewDatabaseForm: TNewDatabaseForm
  Left = 380
  Top = 337
  BorderStyle = bsDialog
  Caption = 'New Database'
  ClientHeight = 151
  ClientWidth = 310
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
    Left = 6
    Top = 107
    Width = 298
    Height = 8
    Shape = bsTopLine
  end
  object lbDirectory: TLabel
    Left = 8
    Top = 56
    Width = 96
    Height = 13
    Caption = 'Database directory:'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 79
    Height = 13
    Caption = 'Database name:'
  end
  object bOk: TButton
    Left = 146
    Top = 119
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object bCancel: TButton
    Left = 227
    Top = 119
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object DirectoryEdit: TDirectoryEdit
    Left = 8
    Top = 72
    Width = 293
    Height = 21
    DialogKind = dkWin32
    DialogText = 'Please select the directory to hold the database files.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NumGlyphs = 1
    ParentFont = False
    TabOrder = 2
  end
  object eDatabaseName: TEdit
    Left = 8
    Top = 24
    Width = 292
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 3
  end
end
