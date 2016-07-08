object CatDetailsForm: TCatDetailsForm
  Left = 355
  Top = 283
  BorderStyle = bsDialog
  Caption = 'Catalogue Details'
  ClientHeight = 287
  ClientWidth = 424
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
  object lbCatID: TLabel
    Left = 8
    Top = 6
    Width = 12
    Height = 13
    Caption = '#:'
  end
  object lbCatName: TLabel
    Left = 86
    Top = 6
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object Label4: TLabel
    Left = 8
    Top = 110
    Width = 32
    Height = 13
    Caption = 'Notes:'
  end
  object Label1: TLabel
    Left = 351
    Top = 6
    Width = 35
    Height = 13
    Caption = 'Added:'
  end
  object Bevel1: TBevel
    Left = 5
    Top = 243
    Width = 415
    Height = 6
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 8
    Top = 54
    Width = 41
    Height = 13
    Caption = 'Serial #:'
  end
  object Label3: TLabel
    Left = 127
    Top = 54
    Width = 68
    Height = 13
    Caption = 'Volume Name:'
  end
  object edCatalogueID: TEdit
    Left = 8
    Top = 22
    Width = 64
    Height = 21
    MaxLength = 5
    TabOrder = 0
    OnChange = edCatalogueIDChange
  end
  object edCatalogueVolName: TEdit
    Left = 84
    Top = 22
    Width = 255
    Height = 21
    MaxLength = 50
    TabOrder = 1
    OnChange = edCatalogueVolNameChange
  end
  object mCatalogueNotes: TMemo
    Left = 8
    Top = 127
    Width = 407
    Height = 107
    TabOrder = 2
    OnChange = mCatalogueNotesChange
  end
  object bUpdate: TButton
    Left = 261
    Top = 253
    Width = 75
    Height = 25
    Caption = '&Update'
    TabOrder = 3
    OnClick = bUpdateClick
  end
  object bClose: TButton
    Left = 341
    Top = 253
    Width = 75
    Height = 25
    Caption = '&Close'
    TabOrder = 4
    OnClick = bCloseClick
  end
  object edCatCreatedDate: TEdit
    Left = 351
    Top = 22
    Width = 64
    Height = 21
    Color = clBtnFace
    MaxLength = 5
    ReadOnly = True
    TabOrder = 5
    OnChange = edCatCreatedDateChange
  end
  object edSerial: TEdit
    Left = 8
    Top = 70
    Width = 103
    Height = 21
    Color = clBtnFace
    MaxLength = 5
    ReadOnly = True
    TabOrder = 6
    OnChange = edCatalogueIDChange
  end
  object edVolumeName: TEdit
    Left = 125
    Top = 70
    Width = 214
    Height = 21
    Color = clBtnFace
    MaxLength = 50
    ReadOnly = True
    TabOrder = 7
    OnChange = edCatalogueVolNameChange
  end
  object dsqCatalogues: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MP3CAT'
    EngineVersion = '3.24'
    MaxRowCount = -1
    SQL.Strings = (
      'Select *'
      'From Catalogues'
      'Where Id = :vCatId')
    Params = <
      item
        DataType = ftInteger
        Name = 'vCatId'
        ParamType = ptUnknown
      end>
    Left = 6
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'vCatId'
        ParamType = ptUnknown
      end>
    object dsqCataloguesID: TIntegerField
      FieldName = 'ID'
      Origin = 'Catalogues.ID'
    end
    object dsqCataloguesCatalogue_Number: TIntegerField
      FieldName = 'Catalogue_Number'
      Origin = 'Catalogues.Catalogue_Number'
    end
    object dsqCataloguesCatalogue_Name: TStringField
      FieldName = 'Catalogue_Name'
      Origin = 'Catalogues.Catalogue_Name'
      Size = 50
    end
    object dsqCataloguesCreated_Date: TDateField
      FieldName = 'Created_Date'
      Origin = 'Catalogues.Created_Date'
    end
    object dsqCataloguesComments: TMemoField
      FieldName = 'Comments'
      Origin = 'Catalogues.Comments'
      BlobType = ftMemo
    end
    object dsqCataloguesSerial: TStringField
      FieldName = 'Serial'
      Origin = 'Catalogues.Serial'
      Size = 30
    end
    object dsqCataloguesVolume_Name: TStringField
      FieldName = 'Volume_Name'
      Origin = 'Catalogues.Volume_Name'
      Size = 30
    end
  end
end
