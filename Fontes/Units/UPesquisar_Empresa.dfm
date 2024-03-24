object Frm_pesquisar_empresa: TFrm_pesquisar_empresa
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 437
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 639
    Height = 65
    Align = alTop
    Color = 4473924
    ParentBackground = False
    TabOrder = 0
    object btn_fechar: TSpeedButton
      AlignWithMargins = True
      Left = 598
      Top = 16
      Width = 30
      Height = 33
      Cursor = crHandPoint
      Hint = 'Sair '
      Margins.Left = 0
      Margins.Top = 15
      Margins.Right = 10
      Margins.Bottom = 15
      Align = alRight
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E1DEE6E1DE
        E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1
        DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6
        E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
        E6E1DE1C1C1BBAB6B4E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEBAB6B41C1C
        1BE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEBAB6B41C1C1BBAB6B4E6E1DEE6
        E1DEE6E1DEE6E1DEBAB6B41C1C1BBAB6B4E6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
        E6E1DEE6E1DEBAB6B41C1C1BBAB6B4E6E1DEE6E1DEBAB6B41C1C1BBAB6B4E6E1
        DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEBAB6B41C1C1BBA
        B6B4BAB6B41C1C1BBAB6B4E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
        E6E1DEE6E1DEE6E1DEE6E1DEBAB6B41C1C1B1C1C1BBAB6B4E6E1DEE6E1DEE6E1
        DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEBAB6B41C
        1C1B1C1C1BBAB6B4E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
        E6E1DEE6E1DEE6E1DEBAB6B41C1C1BBAB6B4BAB6B41C1C1BBAB6B4E6E1DEE6E1
        DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEBAB6B41C1C1BBAB6B4E6
        E1DEE6E1DEBAB6B41C1C1BBAB6B4E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
        E6E1DEBAB6B41C1C1BBAB6B4E6E1DEE6E1DEE6E1DEE6E1DEBAB6B41C1C1BBAB6
        B4E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE1C1C1BBAB6B4E6E1DEE6E1DEE6
        E1DEE6E1DEE6E1DEE6E1DEBAB6B41C1C1BE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
        E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1
        DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6
        E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE
        E6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1
        DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6
        E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DEE6E1DE}
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_fecharClick
      ExplicitLeft = 909
      ExplicitTop = 7
      ExplicitHeight = 27
    end
    object Label1: TLabel
      Left = 32
      Top = 6
      Width = 56
      Height = 17
      Caption = 'Pesquisar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 11
      Top = 21
      Width = 397
      Height = 33
      Margins.Left = 10
      Margins.Top = 20
      Margins.Bottom = 10
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        AlignWithMargins = True
        Left = 364
        Top = 3
        Width = 30
        Height = 27
        Align = alRight
        OnClick = SpeedButton1Click
        ExplicitLeft = 363
      end
      object SpeedButton2: TSpeedButton
        AlignWithMargins = True
        Left = 329
        Top = 3
        Width = 29
        Height = 27
        Align = alRight
        OnClick = SpeedButton2Click
        ExplicitTop = 4
      end
      object edtbusca: TEdit
        Left = 16
        Top = 5
        Width = 289
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 639
    Height = 372
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 637
      Height = 370
      Align = alClient
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDEMPRESA'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6250335
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'CODIGO'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NMEMPRESA'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6250335
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          Title.Caption = 'NOME DA EMPRESA'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -15
          Title.Font.Name = 'Segoe UI'
          Title.Font.Style = []
          Width = 500
          Visible = True
        end>
    end
  end
  object qry: TFDQuery
    Connection = DM.Conn
    SQL.Strings = (
      'select * from cadempresa')
    Left = 88
    Top = 153
    object qryIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNMEMPRESA: TStringField
      FieldName = 'NMEMPRESA'
      Origin = 'NMEMPRESA'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = qry
    Left = 88
    Top = 217
  end
end
