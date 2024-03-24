object Frm_empresas: TFrm_empresas
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 580
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_fundo: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 580
    Align = alClient
    BevelOuter = bvNone
    Color = 16053492
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Open Sans'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object pnl_principal: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 57
      Width = 965
      Height = 523
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object pnl_consulta: TPanel
        Left = 0
        Top = 0
        Width = 965
        Height = 523
        Align = alClient
        BevelOuter = bvNone
        Color = 16053492
        ParentBackground = False
        TabOrder = 0
        object pnl_topo: TPanel
          AlignWithMargins = True
          Left = 8
          Top = 0
          Width = 949
          Height = 77
          Margins.Left = 8
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object pnl_pesquisa: TPanel
            AlignWithMargins = True
            Left = 30
            Top = 15
            Width = 619
            Height = 52
            Margins.Left = 30
            Margins.Top = 15
            Margins.Right = 8
            Margins.Bottom = 10
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Label1: TLabel
              Left = 3
              Top = -4
              Width = 246
              Height = 17
              Caption = 'Pesquisar por Codigo ou Nome Empresa '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object pnl_edt_consulta: TPanel
              Left = 3
              Top = 17
              Width = 526
              Height = 30
              BevelKind = bkTile
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object btn_limpar_pesquisa: TImage
                AlignWithMargins = True
                Left = 494
                Top = 5
                Width = 18
                Height = 16
                Cursor = crHandPoint
                Hint = 'Limpar Pesquisa'
                Margins.Top = 5
                Margins.Right = 10
                Margins.Bottom = 5
                Align = alRight
                ParentShowHint = False
                Picture.Data = {
                  0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
                  001008060000001FF3FF61000000097048597300000EC400000EC401952B0E1B
                  000000CF4944415478DA9D933B0EC2301044BD888243A44D619F86960EF115E2
                  381488AFE868398D5DD072885488311864C5DED8C6D26895ECCC4BE27849B8A5
                  B5AE94520F91B18C319594F2ED25171EA25CA13520E7AE30BC33940D3482F746
                  F6C9B8B84303E809CD39880BEFA01ED440F5F70D262807D788425A61EB99C273
                  21CFC042D05BA06CDBE1DF1E7441A03E170E000C4470E1282002115CB814B002
                  609F04243E2180E46CA2AD27EFDE1290630048FCC631072939485148E951F621
                  0D11D5FF0C9385D883F51926AF913DCEBEF7053B4C9450C44D47FF0000000049
                  454E44AE426082}
                ShowHint = True
                OnClick = btn_limpar_pesquisaClick
                ExplicitLeft = 493
              end
              object edt_consulta: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 2
                Width = 438
                Height = 21
                Margins.Left = 10
                Margins.Top = 2
                Align = alLeft
                AutoSelect = False
                AutoSize = False
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnKeyDown = edt_consultaKeyDown
              end
            end
          end
          object pnl_cadastrar: TPanel
            AlignWithMargins = True
            Left = 786
            Top = 20
            Width = 123
            Height = 42
            Margins.Top = 20
            Margins.Right = 40
            Margins.Bottom = 15
            Align = alRight
            BevelOuter = bvNone
            Color = 11428864
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 12615680
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            object btn_cadastrar: TSpeedButton
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 117
              Height = 36
              Cursor = crHandPoint
              Align = alClient
              Caption = 'Cadastrar'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = btn_cadastrarClick
              ExplicitLeft = 5
              ExplicitTop = 0
              ExplicitWidth = 123
              ExplicitHeight = 32
            end
          end
        end
        object CardPanel_empresa: TCardPanel
          Left = 0
          Top = 77
          Width = 965
          Height = 446
          Align = alClient
          ActiveCard = Card_lista
          BevelOuter = bvNone
          Caption = 'CardPanel_empresa'
          TabOrder = 1
          object Card_lista: TCard
            Left = 0
            Top = 0
            Width = 965
            Height = 446
            Caption = 'Card_lista'
            CardIndex = 0
            TabOrder = 0
            object pnl_dbgrid: TPanel
              AlignWithMargins = True
              Left = 8
              Top = 8
              Width = 949
              Height = 438
              Margins.Left = 8
              Margins.Top = 8
              Margins.Right = 8
              Margins.Bottom = 0
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8668966
              Font.Height = -13
              Font.Name = 'Open Sans'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              object pnl_Rodape: TPanel
                Left = 0
                Top = 419
                Width = 949
                Height = 19
                Align = alBottom
                BevelOuter = bvNone
                Color = clWhite
                ParentBackground = False
                TabOrder = 0
                object lbl_excluir: TLabel
                  AlignWithMargins = True
                  Left = 30
                  Top = 5
                  Width = 202
                  Height = 14
                  Margins.Left = 30
                  Margins.Top = 5
                  Margins.Right = 0
                  Margins.Bottom = 0
                  Align = alLeft
                  Caption = '*** Aperte DEL ou DELETE para EXCLUIR'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 147
                  Font.Height = -11
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                  ExplicitHeight = 13
                end
                object lbl_duplo_clique: TLabel
                  AlignWithMargins = True
                  Left = 729
                  Top = 5
                  Width = 170
                  Height = 14
                  Margins.Left = 0
                  Margins.Top = 5
                  Margins.Right = 50
                  Margins.Bottom = 0
                  Align = alRight
                  Caption = '*** DUPLO CLIQUE  para ALTERAR'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = 12016384
                  Font.Height = -11
                  Font.Name = 'Segoe UI'
                  Font.Style = []
                  ParentFont = False
                  ExplicitHeight = 13
                end
              end
              object dbg_registros: TDBGrid
                AlignWithMargins = True
                Left = 10
                Top = 8
                Width = 929
                Height = 411
                Margins.Left = 10
                Margins.Top = 8
                Margins.Right = 10
                Margins.Bottom = 0
                TabStop = False
                Align = alClient
                BorderStyle = bsNone
                DataSource = ds_consulta
                DrawingStyle = gdsClassic
                FixedColor = clWhite
                GradientEndColor = 15329769
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 6118749
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = []
                Options = [dgTitles, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
                ParentFont = False
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = 6447714
                TitleFont.Height = -13
                TitleFont.Name = 'Segoe UI'
                TitleFont.Style = []
                OnDrawColumnCell = dbg_registrosDrawColumnCell
                OnDblClick = dbg_registrosDblClick
                OnKeyDown = dbg_registrosKeyDown
                OnTitleClick = dbg_registrosTitleClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'idempresa'
                    Title.Caption = '    Codigo'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nmempresa'
                    Title.Caption = 'Nome Empresa'
                    Width = 362
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nucnpj'
                    Title.Caption = 'CNPJ'
                    Width = 358
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'stativo'
                    Title.Caption = 'Status'
                    Visible = True
                  end>
              end
            end
          end
          object Card_dados: TCard
            Left = 0
            Top = 0
            Width = 965
            Height = 446
            Caption = 'Card_dados'
            CardIndex = 1
            TabOrder = 1
            object Panel1: TPanel
              AlignWithMargins = True
              Left = 8
              Top = 0
              Width = 949
              Height = 387
              Margins.Left = 8
              Margins.Top = 0
              Margins.Right = 8
              Margins.Bottom = 0
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object Label7: TLabel
                Left = 85
                Top = 249
                Width = 33
                Height = 16
                Caption = 'Email'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label6: TLabel
                Left = 318
                Top = 182
                Width = 40
                Height = 16
                Caption = 'Celular'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label5: TLabel
                Left = 86
                Top = 182
                Width = 78
                Height = 16
                Caption = 'Tel.Comercial'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 317
                Top = 103
                Width = 88
                Height = 16
                Caption = '* Insc.Estadual'
                Font.Charset = ANSI_CHARSET
                Font.Color = 4328927
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 88
                Top = 103
                Width = 60
                Height = 16
                Caption = '* N'#186' CNPJ'
                Font.Charset = ANSI_CHARSET
                Font.Color = 4328927
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 86
                Top = 32
                Width = 99
                Height = 16
                Caption = '* Nome Empresa'
                Font.Charset = ANSI_CHARSET
                Font.Color = 4328927
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object ed_email: TEdit
                Left = 86
                Top = 267
                Width = 397
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object ed_celular: TEdit
                Left = 316
                Top = 199
                Width = 167
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
                OnChange = ed_celularChange
              end
              object ed_fonecom: TEdit
                Left = 85
                Top = 199
                Width = 156
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
                OnChange = ed_fonecomChange
              end
              object ed_ninsc_est: TEdit
                Left = 316
                Top = 121
                Width = 167
                Height = 24
                Hint = '** INSC.ESTADUAL **'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
                OnChange = ed_ninsc_estChange
              end
              object ed_ncnpj: TEdit
                Left = 85
                Top = 121
                Width = 156
                Height = 24
                Hint = '** CNPJ **'
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnChange = ed_ncnpjChange
              end
              object ed_nempresa: TEdit
                Left = 85
                Top = 51
                Width = 500
                Height = 24
                Hint = '** Nome Empresa'
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
            end
            object Panel2: TPanel
              AlignWithMargins = True
              Left = 8
              Top = 390
              Width = 949
              Height = 53
              Margins.Left = 8
              Margins.Right = 8
              Align = alBottom
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              DesignSize = (
                949
                53)
              object pnl_gravar: TPanel
                AlignWithMargins = True
                Left = 668
                Top = 7
                Width = 123
                Height = 40
                Margins.Top = 20
                Margins.Right = 10
                Margins.Bottom = 10
                Anchors = [akTop, akRight, akBottom]
                BevelOuter = bvNone
                Color = 4359168
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12615680
                Font.Height = -20
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
                Visible = False
                object btn_gravar: TSpeedButton
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 117
                  Height = 34
                  Cursor = crHandPoint
                  Align = alClient
                  Caption = 'OK'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btn_gravarClick
                  ExplicitLeft = 0
                  ExplicitTop = -2
                  ExplicitWidth = 123
                  ExplicitHeight = 72
                end
              end
              object pnl_cancelar: TPanel
                AlignWithMargins = True
                Left = 802
                Top = 7
                Width = 123
                Height = 40
                Margins.Top = 20
                Margins.Bottom = 10
                Anchors = [akTop, akRight, akBottom]
                BevelOuter = bvNone
                Color = 4670679
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 12615680
                Font.Height = -20
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 1
                Visible = False
                object btn_cancelar: TSpeedButton
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 117
                  Height = 34
                  Cursor = crHandPoint
                  Align = alClient
                  Caption = 'Cancelar'
                  Flat = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = 'Segoe UI'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = btn_cancelarClick
                  ExplicitLeft = 0
                  ExplicitWidth = 123
                  ExplicitHeight = 37
                end
              end
            end
          end
        end
      end
    end
    object pnl_cabecalho: TPanel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 949
      Height = 41
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object lbl_nome_central: TLabel
        Left = 21
        Top = 10
        Width = 76
        Height = 20
        Caption = 'EMPRESAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8011008
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_fechar: TSpeedButton
        AlignWithMargins = True
        Left = 914
        Top = 5
        Width = 30
        Height = 31
        Cursor = crHandPoint
        Hint = 'Sair '
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Flat = True
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
    end
  end
  object ds_consulta: TDataSource
    Left = 40
    Top = 494
  end
end
