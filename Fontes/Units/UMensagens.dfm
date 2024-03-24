object Frm_mensagens: TFrm_mensagens
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 281
  ClientWidth = 445
  Color = 15329769
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 445
    Height = 281
    Align = alClient
    ExplicitLeft = 200
    ExplicitTop = 192
    ExplicitWidth = 65
    ExplicitHeight = 65
  end
  object pnl_fundo: TPanel
    AlignWithMargins = True
    Left = 1
    Top = 1
    Width = 443
    Height = 279
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    BevelOuter = bvNone
    Color = 16514043
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      443
      279)
    object lbl_descricao: TLabel
      AlignWithMargins = True
      Left = 30
      Top = 93
      Width = 375
      Height = 21
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Voce est'#225' prestes a APAGAR esses DADOS. Continuar?'
      Color = 8011008
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4342340
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object lbl_titulo: TLabel
      AlignWithMargins = True
      Left = 18
      Top = 56
      Width = 118
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Apagar Dados ?'
      Color = 8011008
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object lbl_titulojanela: TLabel
      AlignWithMargins = True
      Left = 13
      Top = 3
      Width = 525
      Height = 34
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      AutoSize = False
      Caption = 'ATEN'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object pnl_botao_confirma: TPanel
      Left = 281
      Top = 226
      Width = 131
      Height = 36
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = 5482548
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object btn_sim: TSpeedButton
        Left = 0
        Top = 0
        Width = 131
        Height = 36
        Cursor = crHandPoint
        Align = alClient
        Caption = 'SIM'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btn_simClick
        ExplicitLeft = 5
        ExplicitTop = -8
      end
    end
    object pnl_cabecalho: TPanel
      Left = 0
      Top = 40
      Width = 775
      Height = 1
      BevelOuter = bvNone
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnl_botao_cancelar: TPanel
      Left = 132
      Top = 226
      Width = 131
      Height = 36
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12615680
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object btn_nao: TSpeedButton
        Left = 0
        Top = 0
        Width = 131
        Height = 36
        Cursor = crHandPoint
        Align = alClient
        Caption = 'N'#195'O'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4342340
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btn_naoClick
        ExplicitWidth = 140
        ExplicitHeight = 42
      end
    end
  end
end
