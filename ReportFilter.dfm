object ReportFilterForm: TReportFilterForm
  Left = 452
  Top = 338
  BorderStyle = bsDialog
  Caption = 'Report Selection'
  ClientHeight = 45
  ClientWidth = 174
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
  object bOk: TButton
    Left = 9
    Top = 11
    Width = 75
    Height = 25
    Caption = '&Current'
    ModalResult = 1
    TabOrder = 0
  end
  object bCancel: TButton
    Left = 90
    Top = 11
    Width = 75
    Height = 25
    Caption = '&All'
    ModalResult = 2
    TabOrder = 1
  end
end
