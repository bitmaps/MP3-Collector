object MergeDocumentsForm: TMergeDocumentsForm
  Left = 413
  Top = 287
  BorderStyle = bsDialog
  Caption = 'Merge Documents'
  ClientHeight = 283
  ClientWidth = 413
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
  object bRun: TButton
    Left = 166
    Top = 256
    Width = 75
    Height = 25
    Caption = '&Run'
    TabOrder = 2
    OnClick = bRunClick
  end
  object bClose: TButton
    Left = 337
    Top = 256
    Width = 75
    Height = 25
    Caption = '&Close'
    TabOrder = 3
    OnClick = bCloseClick
  end
  object bNew: TButton
    Left = 6
    Top = 256
    Width = 75
    Height = 25
    Caption = '&New'
    TabOrder = 0
    OnClick = bNewClick
  end
  object bDelete: TButton
    Left = 86
    Top = 256
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 1
    OnClick = bDeleteClick
  end
  object dbgMergeDocuments: TwwDBGrid
    Left = 6
    Top = 8
    Width = 406
    Height = 241
    Selected.Strings = (
      'MergeName'#9'25'#9'Report Name'
      'MergeTemplate'#9'250'#9'Merge Template')
    IniAttributes.Enabled = True
    IniAttributes.SaveToRegistry = True
    IniAttributes.FileName = 'MP3Collector'
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsdsqMergeDocs
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit, dgTrailingEllipsis]
    TabOrder = 4
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object dsdsqMergeDocs: TDataSource
    DataSet = dsqMergeDocs
    Left = 261
    Top = 258
  end
  object dsqMergeDocs: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    MaxRowCount = -1
    SQL.Strings = (
      'Select * '
      'From Merge'
      'Order By MergeName')
    Params = <>
    Left = 269
    Top = 250
    object dsqMergeDocsID: TIntegerField
      FieldName = 'ID'
      Origin = 'Merge.ID'
      Visible = False
    end
    object dsqMergeDocsMergeName: TStringField
      DisplayLabel = 'Report Name'
      DisplayWidth = 25
      FieldName = 'MergeName'
      Origin = 'Merge.MergeName'
      Size = 50
    end
    object dsqMergeDocsMergeQuery: TIntegerField
      DisplayLabel = 'Report Query'
      FieldName = 'MergeQuery'
      Origin = 'Merge.MergeQuery'
      Visible = False
    end
    object dsqMergeDocsMergeTemplate: TStringField
      DisplayLabel = 'Merge Template'
      FieldName = 'MergeTemplate'
      Origin = 'Merge.MergeTemplate'
      Size = 250
    end
  end
  object DataSource1: TDataSource
    Left = 96
    Top = 112
  end
  object Merge: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    TableName = 'Merge'
    Left = 104
    Top = 104
  end
end
