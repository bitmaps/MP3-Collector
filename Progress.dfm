object ProgressForm: TProgressForm
  Left = 393
  Top = 320
  BorderStyle = bsNone
  Caption = 'ProgressForm'
  ClientHeight = 33
  ClientWidth = 216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 216
    Height = 33
    Align = alClient
    TabOrder = 0
    object ProgressBar: TProgressBar
      Left = 8
      Top = 8
      Width = 200
      Height = 17
      Min = 0
      Max = 100
      Smooth = True
      TabOrder = 0
    end
  end
end
