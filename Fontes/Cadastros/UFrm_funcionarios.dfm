object Frm_funcionarios: TFrm_funcionarios
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 617
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
    Height = 617
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
      Height = 560
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
        Height = 560
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
        object CardPanel: TCardPanel
          Left = 0
          Top = 77
          Width = 965
          Height = 483
          Align = alClient
          ActiveCard = Card_lista
          BevelOuter = bvNone
          Caption = 'CardPanel'
          TabOrder = 1
          object Card_lista: TCard
            Left = 0
            Top = 0
            Width = 965
            Height = 483
            Caption = 'Card_lista'
            CardIndex = 0
            TabOrder = 0
            object pnl_dbgrid: TPanel
              AlignWithMargins = True
              Left = 8
              Top = 8
              Width = 949
              Height = 475
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
              ExplicitLeft = 16
              object pnl_Rodape: TPanel
                Left = 0
                Top = 456
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
                Height = 448
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
                    FieldName = 'idfuncionario'
                    Title.Caption = '  CODIGO'
                    Width = 61
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nmfuncionario'
                    Title.Caption = 'NOME FUNCIONARIO'
                    Width = 249
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nmempresa'
                    Title.Caption = 'NOME DA EMPRESA'
                    Width = 227
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nucpf'
                    Title.Caption = 'CPF'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nmcidade'
                    Title.Caption = 'CIDADE'
                    Width = 165
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'sgestado'
                    Title.Caption = 'ESTADO'
                    Width = 54
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'stativo'
                    Title.Caption = 'STATUS'
                    Width = 53
                    Visible = True
                  end>
              end
            end
          end
          object Card_dados: TCard
            Left = 0
            Top = 0
            Width = 965
            Height = 483
            Caption = 'Card_dados'
            CardIndex = 1
            TabOrder = 1
            object Panel1: TPanel
              AlignWithMargins = True
              Left = 8
              Top = 0
              Width = 949
              Height = 424
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
                Left = 47
                Top = 282
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
                Left = 184
                Top = 231
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
                Left = 47
                Top = 231
                Width = 87
                Height = 16
                Caption = 'Tel.Residencial'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label3: TLabel
                Left = 193
                Top = 122
                Width = 46
                Height = 16
                Caption = '* N'#186' RG'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label2: TLabel
                Left = 47
                Top = 122
                Width = 53
                Height = 16
                Caption = '* N'#186' CPF'
                Font.Charset = ANSI_CHARSET
                Font.Color = 4328927
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label4: TLabel
                Left = 49
                Top = 69
                Width = 114
                Height = 16
                Caption = '* Nome Funcionario'
                Font.Charset = ANSI_CHARSET
                Font.Color = 4328927
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object SpeedButton1: TSpeedButton
                Left = 150
                Top = 31
                Width = 30
                Height = 28
                OnClick = SpeedButton1Click
              end
              object Label8: TLabel
                Left = 328
                Top = 122
                Width = 57
                Height = 16
                Caption = 'DT. Nasc.'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label9: TLabel
                Left = 460
                Top = 122
                Width = 95
                Height = 16
                Caption = 'N'#186' Cart.Trabalho'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label10: TLabel
                Left = 640
                Top = 122
                Width = 90
                Height = 16
                Caption = 'N'#186' Titulo Eleitor'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label11: TLabel
                Left = 49
                Top = 177
                Width = 45
                Height = 16
                Caption = 'N'#186' CNH'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label12: TLabel
                Left = 326
                Top = 177
                Width = 55
                Height = 16
                Caption = 'Categoria'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label13: TLabel
                Left = 460
                Top = 177
                Width = 80
                Height = 16
                Caption = 'Validade CNH'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label14: TLabel
                Left = 326
                Top = 231
                Width = 69
                Height = 16
                Caption = 'Tel. Contato'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label15: TLabel
                Left = 460
                Top = 231
                Width = 83
                Height = 16
                Caption = 'Nome Contato'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label16: TLabel
                Left = 49
                Top = 14
                Width = 88
                Height = 16
                Caption = '* Cod.Empresa'
                Font.Charset = ANSI_CHARSET
                Font.Color = 4328927
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label17: TLabel
                Left = 205
                Top = 14
                Width = 52
                Height = 16
                Caption = 'Empresa'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object SpeedButton2: TSpeedButton
                Left = 139
                Top = 349
                Width = 30
                Height = 28
              end
              object Label18: TLabel
                Left = 47
                Top = 333
                Width = 27
                Height = 16
                Caption = 'CEP'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label19: TLabel
                Left = 201
                Top = 333
                Width = 55
                Height = 16
                Caption = 'Endere'#231'o'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label20: TLabel
                Left = 706
                Top = 333
                Width = 14
                Height = 16
                Caption = 'N'#186
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label21: TLabel
                Left = 47
                Top = 384
                Width = 40
                Height = 16
                Caption = 'Cidade'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label22: TLabel
                Left = 379
                Top = 384
                Width = 34
                Height = 16
                Caption = 'Bairro'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label23: TLabel
                Left = 706
                Top = 384
                Width = 17
                Height = 16
                Caption = 'UF'
                Font.Charset = ANSI_CHARSET
                Font.Color = 6908265
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object ed_email: TEdit
                Left = 47
                Top = 301
                Width = 685
                Height = 24
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object ed_celular: TEdit
                Left = 182
                Top = 250
                Width = 108
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
                OnChange = ed_celularChange
              end
              object ed_foneres: TEdit
                Left = 47
                Top = 250
                Width = 98
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
                OnChange = ed_foneresChange
              end
              object ed_nrg: TEdit
                Left = 194
                Top = 141
                Width = 96
                Height = 24
                Hint = '** RG **'
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                OnChange = ed_nrgChange
              end
              object ed_ncpf: TEdit
                Left = 48
                Top = 141
                Width = 110
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
                TabOrder = 4
                OnChange = ed_ncpfChange
              end
              object ed_nmfunc: TEdit
                Left = 47
                Top = 88
                Width = 586
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
                TabOrder = 2
              end
              object ed_codempresa: TEdit
                Left = 47
                Top = 32
                Width = 94
                Height = 26
                Alignment = taCenter
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -15
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                OnEnter = ed_codempresaEnter
                OnExit = ed_codempresaExit
              end
              object ed_nmempresa: TEdit
                Left = 201
                Top = 33
                Width = 531
                Height = 24
                TabStop = False
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object ed_dtnasc: TEdit
                Left = 326
                Top = 141
                Width = 83
                Height = 24
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                OnChange = ed_dtnascChange
              end
              object ed_ntitulo: TEdit
                Left = 638
                Top = 141
                Width = 94
                Height = 24
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                MaxLength = 12
                ParentFont = False
                TabOrder = 8
                OnChange = ed_nrgChange
              end
              object ed_ncnh: TEdit
                Left = 48
                Top = 195
                Width = 242
                Height = 24
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                MaxLength = 15
                ParentFont = False
                TabOrder = 9
                OnChange = ed_nrgChange
              end
              object cb_categoria: TComboBox
                Left = 326
                Top = 195
                Width = 57
                Height = 25
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ItemIndex = 0
                ParentFont = False
                TabOrder = 10
                Text = 'A'
                Items.Strings = (
                  'A'
                  'B'
                  'C'
                  'D'
                  'E')
              end
              object ed_dtvalidade_cnh: TEdit
                Left = 460
                Top = 195
                Width = 83
                Height = 24
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
                OnChange = ed_dtvalidade_cnhChange
              end
              object ed_fonecontato: TEdit
                Left = 326
                Top = 250
                Width = 106
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
                OnChange = ed_fonecontatoChange
              end
              object ed_nmcontato: TEdit
                Left = 460
                Top = 250
                Width = 272
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
                OnChange = ed_foneresChange
              end
              object ck_ativo_sn: TCheckBox
                Left = 668
                Top = 91
                Width = 51
                Height = 17
                TabStop = False
                Caption = 'Ativo'
                Font.Charset = ANSI_CHARSET
                Font.Color = 5131854
                Font.Height = -13
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object ed_ncep: TEdit
                Left = 47
                Top = 351
                Width = 83
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 17
                OnChange = ed_ncepChange
                OnEnter = ed_ncepEnter
                OnExit = ed_ncepExit
              end
              object ed_endereco: TEdit
                Left = 198
                Top = 351
                Width = 463
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object ed_numero: TEdit
                Left = 695
                Top = 351
                Width = 37
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                MaxLength = 4
                ParentFont = False
                TabOrder = 19
              end
              object ed_cidade: TEdit
                Left = 46
                Top = 402
                Width = 304
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 20
              end
              object ed_bairro: TEdit
                Left = 375
                Top = 402
                Width = 286
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                TabOrder = 21
              end
              object ed_uf: TEdit
                Left = 695
                Top = 402
                Width = 37
                Height = 24
                CharCase = ecUpperCase
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                MaxLength = 2
                ParentFont = False
                TabOrder = 22
              end
              object ed_carttrab: TEdit
                Left = 460
                Top = 141
                Width = 150
                Height = 24
                Color = clWhite
                Font.Charset = ANSI_CHARSET
                Font.Color = 6118749
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = []
                MaxLength = 12
                ParentFont = False
                TabOrder = 7
              end
            end
            object Panel2: TPanel
              AlignWithMargins = True
              Left = 8
              Top = 427
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
                  ExplicitLeft = 2
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
        Width = 113
        Height = 20
        Caption = 'FUNCIONARIOS'
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
    Left = 48
    Top = 486
  end
end
