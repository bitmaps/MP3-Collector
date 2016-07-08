object FiltersForm: TFiltersForm
  Left = 305
  Top = 239
  BorderStyle = bsDialog
  Caption = 'Please Select Filter To Delete'
  ClientHeight = 309
  ClientWidth = 385
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
    Top = 270
    Width = 376
    Height = 6
    Shape = bsTopLine
  end
  object bOk: TButton
    Left = 221
    Top = 279
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TButton
    Left = 302
    Top = 279
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object dbgSavedFilters: TwwDBGrid
    Left = 7
    Top = 8
    Width = 371
    Height = 255
    Selected.Strings = (
      'Name'#9'58'#9'Name'#9'F')
    IniAttributes.Enabled = True
    IniAttributes.SaveToRegistry = True
    IniAttributes.FileName = 'Software\MP3Collector'
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dmMain.dsQuerys
    MultiSelectOptions = [msoAutoUnselect]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgPerfectRowFit, dgTrailingEllipsis, dgShowCellHint]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    UseTFields = False
    PadColumnStyle = pcsPlain
  end
end
