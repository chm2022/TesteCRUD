unit UFrm_funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, Strutils, WinInet,
  cFuncionarios,cEmpresas,
  uFuncoes,
  uFormat, Vcl.Mask;

type
  TFrm_funcionarios = class(TForm)
    ds_consulta: TDataSource;
    pnl_fundo: TPanel;
    pnl_principal: TPanel;
    pnl_consulta: TPanel;
    pnl_topo: TPanel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    pnl_edt_consulta: TPanel;
    edt_consulta: TEdit;
    pnl_cadastrar: TPanel;
    btn_cadastrar: TSpeedButton;
    pnl_cabecalho: TPanel;
    lbl_nome_central: TLabel;
    btn_fechar: TSpeedButton;
    CardPanel: TCardPanel;
    Card_lista: TCard;
    Card_dados: TCard;
    Panel1: TPanel;
    Label7: TLabel;
    ed_email: TEdit;
    Label6: TLabel;
    ed_celular: TEdit;
    ed_foneres: TEdit;
    Label5: TLabel;
    Label3: TLabel;
    ed_nrg: TEdit;
    ed_ncpf: TEdit;
    Label2: TLabel;
    ed_nmfunc: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    pnl_gravar: TPanel;
    btn_gravar: TSpeedButton;
    pnl_cancelar: TPanel;
    btn_cancelar: TSpeedButton;
    btn_limpar_pesquisa: TImage;
    ed_codempresa: TEdit;
    ed_nmempresa: TEdit;
    SpeedButton1: TSpeedButton;
    ed_dtnasc: TEdit;
    ed_ntitulo: TEdit;
    ed_ncnh: TEdit;
    cb_categoria: TComboBox;
    ed_dtvalidade_cnh: TEdit;
    ed_fonecontato: TEdit;
    ed_nmcontato: TEdit;
    ck_ativo_sn: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ed_ncep: TEdit;
    SpeedButton2: TSpeedButton;
    ed_endereco: TEdit;
    ed_numero: TEdit;
    ed_cidade: TEdit;
    ed_bairro: TEdit;
    ed_uf: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    ed_carttrab: TEdit;
    pnl_dbgrid: TPanel;
    pnl_Rodape: TPanel;
    lbl_excluir: TLabel;
    lbl_duplo_clique: TLabel;
    dbg_registros: TDBGrid;
    procedure FormResize(Sender: TObject);
    procedure dbg_registrosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbg_registrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_consultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_registrosTitleClick(Column: TColumn);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_cadastrarClick(Sender: TObject);
    procedure dbg_registrosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure btn_limpar_pesquisaClick(Sender: TObject);
    procedure ed_ncpfChange(Sender: TObject);
    procedure ed_nrgChange(Sender: TObject);
    procedure ed_foneresChange(Sender: TObject);
    procedure ed_celularChange(Sender: TObject);
    procedure ed_dtnascChange(Sender: TObject);
    procedure ed_dtvalidade_cnhChange(Sender: TObject);
    procedure ed_fonecontatoChange(Sender: TObject);
    procedure ed_ncepChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ed_ncepExit(Sender: TObject);
    procedure ed_ncepEnter(Sender: TObject);
    procedure ed_codempresaExit(Sender: TObject);
    procedure ed_codempresaEnter(Sender: TObject);
  private
    { Private declarations }

    procedure limpar_campos;
    //---
    procedure AjustarColunasGrid(const xDBGrid: TDBGrid);

    procedure SelecionarEmpresa(idempresa,nmempresa: string);
    procedure ConsultarCep(Cep: string);

  public
    { Public declarations }

    Funcionarios : TFuncionarios;
    Empresas     : TEmpresas;

  end;

var
  Frm_funcionarios: TFrm_funcionarios;

  vcod_func,vsigla,vcidade : integer;
  modo : string;

implementation

{$R *.dfm}

uses UDM, UPrincipal, UPesquisar_Empresa;

procedure TFrm_funcionarios.btn_gravarClick(Sender: TObject);
var
  msg_erro: string;
begin
  //--
  funcionarios := TFuncionarios.Create(dm.conn);
  //---
  if validacampos([ed_codempresa, ed_nmfunc, ed_ncpf],3) then
    begin
      //----
      funcionarios.IDEMPRESA               := strtoint(ed_codempresa.Text);
      funcionarios.NMFUNCIONARIO           := ed_nmfunc.Text;
      funcionarios.NUCPF                   := ed_ncpf.Text;
      funcionarios.NURG                    := ed_nrg.Text;
      if ed_dtnasc.Text  <> '' then
        Funcionarios.DTNASCIMENTO          := StrToDate( ed_dtnasc.Text )
      else
        Funcionarios.DTNASCIMENTO          := 0;
      funcionarios.TXEMAIL                 := ed_email.Text;
      funcionarios.NUCARTEIRATRAB          := ed_carttrab.Text;
      funcionarios.NUTITULOELEITOR         := ed_ntitulo.Text;
      funcionarios.NUCARTEIRAMOTORISTA     := ed_ncnh.Text;
      if ed_dtvalidade_cnh.Text <> '' then
        Funcionarios.DTVALIDADECARTEIRAMOT := StrToDate( ed_dtvalidade_cnh.Text )
      else
        Funcionarios.DTVALIDADECARTEIRAMOT := 0;
      case cb_categoria.itemindex of
        0 : funcionarios.TPCATERORIA       := 'A';
        1 : funcionarios.TPCATERORIA       := 'B';
        2 : funcionarios.TPCATERORIA       := 'C';
        3 : funcionarios.TPCATERORIA       := 'D';
        4 : funcionarios.TPCATERORIA       := 'E';
      end;
      funcionarios.TLRESIDENCIAL           := ed_foneres.Text;
      funcionarios.TLCELULAR               := ed_celular.Text;
      funcionarios.TLCONTATO               := ed_fonecontato.Text;
      funcionarios.NMCONTATO               := ed_nmcontato.Text;
      funcionarios.DTCONTRATACAO           := date();
      funcionarios.DTCADASTRO              := date();
      funcionarios.STATIVO                 := 'S';
      funcionarios.NMENDERECO              := ed_endereco.Text;
      funcionarios.NUENDERECO              := ed_numero.Text;
      funcionarios.NMBAIRRO                := ed_bairro.Text;
      funcionarios.NUCEP                   := ed_ncep.text;
      funcionarios.IDCIDADE                := vcidade;
      funcionarios.IDUF                    := vsigla;
      //-- modo selecionado
      if modo = 'I' then
        begin
          //---
          with dm.qrymanut do
          begin
            Close;
            SQL.Clear;
            sql.Add('select nucpf from cadfuncionarios');
            sql.Add('where nucpf = :nucpf');
            parambyname('nucpf').AsString := ed_ncpf.text;
            open;
            if dm.qrymanut.RecordCount > 0 then
              begin
                if mensagem('VERIFICAR FUNCIONARIO',
                            'FUNCIONARIO JÁ POSSUI ENDEREÇO CADASTRADO DESATIVAR ?',
                            'CONFIRMA' ) then
                   begin
                     SQL.Clear;
                     sql.Add('update cadfuncionarios set stativo = ''N'' ');
                     sql.Add('where nucpf = :nucpf');
                     parambyname('nucpf').AsString := ed_ncpf.text;
                     execsql;
                   end;
              end;
          end;
          //---
          funcionarios.InserirFuncionarios(msg_erro);
        end
      else
        begin
         funcionarios.idfuncionario := vcod_func;
         funcionarios.AlterarFuncionarios(msg_erro);
        end;
      //---
      if msg_erro <> '' then
        begin
          Mensagem('CADASTRO EMPRESAS',
                   'NÃO FOI POSSÍVEL INSERIR OU ALTERAR O REGISTRO!'+
                    msg_erro,
                   'INFORMACAO');
          exit;
        end;
      //--
      DS_Consulta.DataSet.Refresh;
      //---
      cardpanel.ActiveCard := card_lista;
      //--
      pnl_topo.Visible      := true;
      btn_fechar.Enabled    := true;
      //---
      pnl_cadastrar.visible := true;
      pnl_gravar.Visible    := false;
      pnl_cancelar.Visible  := false;
    end;
end;

procedure TFrm_funcionarios.btn_fecharClick(Sender: TObject);
begin
  //---
  frm_principal.pnl_titulo.Enabled     := true;
  frm_principal.pnl_botoes_top.Enabled := true;
  frm_principal.pnl_menu.Enabled       := true;
  //---
  Close;
end;

procedure TFrm_funcionarios.btn_cancelarClick(Sender: TObject);
begin
  //--
  ed_codempresa.OnExit := nil;
  //---
  cardpanel.ActiveCard := card_lista;
  //---
  pnl_topo.Visible      := true;
  btn_fechar.Enabled    := true;
  //---
  pnl_cadastrar.visible := true;
  pnl_gravar.Visible    := false;
  pnl_cancelar.Visible  := false;
end;

procedure TFrm_funcionarios.AjustarColunasGrid(const xDBGrid: TDBGrid);
var
  I, TotalWidht, VarWidth, QtdTotalColuna : Integer;
  xColumn : TColumn;
begin
  //---
  ShowScrollBar( xDBGrid.Handle,SB_Vert, True );
  //---
  For I := 0 to xDBGrid.FieldCount - 1 do
  begin
    //---
    if ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'idfuncionario' ) or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'nmfuncionario' ) or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'nmempresa' ) or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'nucpf')or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'nmcidade')or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'sgestado' ) then
      xDBGrid.Fields[I].Tag := 30
    else
      xDBGrid.Fields[I].Tag := 0;
  end;
  //---
  TotalWidht := 0;
  QtdTotalColuna := 0;
  //---
  for I := 0 to -1 + xDBGrid.Columns.Count do
  begin
    TotalWidht := TotalWidht + xDBGrid.Columns[I].Width;
    if xDBGrid.Columns[I].Field.Tag <> 0 then
      Inc(QtdTotalColuna);
  end;
  //---
  if dgColLines in xDBGrid.Options then
    TotalWidht := TotalWidht + xDBGrid.Columns.Count;
  //---
  VarWidth :=  xDBGrid.ClientWidth - TotalWidht;
  //---
  if QtdTotalColuna > 0 then
    VarWidth := varWidth div QtdTotalColuna;
  //---
  for I := 0 to -1 + xDBGrid.Columns.Count do
  begin
    xColumn := xDBGrid.Columns[I];
    //---
    if xColumn.Field.Tag <> 0 then
    begin
      xColumn.Width := xColumn.Width + VarWidth;
      //---
      if xColumn.Width < xColumn.Field.Tag then
        xColumn.Width := xColumn.Field.Tag;
    end;
  end;
end;

procedure TFrm_funcionarios.btn_cadastrarClick(Sender: TObject);
begin
  //---
  pnl_topo.Visible      := false;
  btn_fechar.Enabled    := false;
  //---
  pnl_cadastrar.visible := false;
  pnl_gravar.Visible    := true;
  pnl_cancelar.Visible  := true;
  //--- Inclusao
  modo := 'I';
  //---
  cardpanel.ActiveCard := card_dados;
  //----
  limpar_campos;

  ed_codempresa.SetFocus;
end;

procedure TFrm_funcionarios.dbg_registrosDblClick(Sender: TObject);
begin
  //---
  if ( not (dbg_registros.DataSource.DataSet.IsEmpty )) then
    begin
      //---
      pnl_topo.visible      := false;
      btn_fechar.Enabled    := false;
      //---
      pnl_cadastrar.visible := false;
      pnl_gravar.Visible    := true;
      pnl_cancelar.Visible  := true;
      //-- Alteração
      modo := 'A';
      //---
      cardpanel.ActiveCard := card_dados;
      //---
      vcod_func                    := dbg_registros.DataSource.DataSet.FieldByName('IDFUNCIONARIO').AsInteger;
      ed_codempresa.text           := formatfloat('0000',dbg_registros.DataSource.DataSet.FieldByName('IDEMPRESA').Asinteger);
      ed_nmempresa.text            := dbg_registros.DataSource.DataSet.FieldByName('nmempresa').AsString;
      ed_nmfunc.text               := dbg_registros.DataSource.DataSet.FieldByName('NMFUNCIONARIO').AsString;
      ed_ncpf.text                 := dbg_registros.DataSource.DataSet.FieldByName('NUCPF').AsString;
      ed_nrg.text                  := dbg_registros.DataSource.DataSet.FieldByName('NURG').AsString;
      if datetostr(dbg_registros.DataSource.DataSet.FieldByName('DTNASCIMENTO').Asdatetime) = '30/12/1899' then
        ed_dtnasc.text             := ''
      else
         ed_dtnasc.text            := datetostr(dbg_registros.DataSource.DataSet.FieldByName('DTNASCIMENTO').Asdatetime);
      ed_email.text                := dbg_registros.DataSource.DataSet.FieldByName('TXEMAIL').AsString;
      ed_carttrab.text             := dbg_registros.DataSource.DataSet.FieldByName('NUCARTEIRATRAB').AsString;
      ed_ntitulo.text              := dbg_registros.DataSource.DataSet.FieldByName('NUTITULOELEITOR').AsString;
      ed_ncnh.text                 := dbg_registros.DataSource.DataSet.FieldByName('NUCARTEIRAMOTORISTA').AsString;
      if datetostr(dbg_registros.DataSource.DataSet.FieldByName('DTVALIDADECARTEIRAMOT').Asdatetime) = '30/12/1899' then
        ed_dtvalidade_cnh.text     := ''
      else
        ed_dtvalidade_cnh.text     := datetostr(dbg_registros.DataSource.DataSet.FieldByName('DTVALIDADECARTEIRAMOT').Asdatetime);
      case AnsiIndexStr(UpperCase(dbg_registros.DataSource.DataSet.FieldByName('TPCATERORIA').AsString), ['A','B','C','D','E']) of
        0 : cb_categoria.ItemIndex := 0;
        1 : cb_categoria.ItemIndex := 1;
        2 : cb_categoria.ItemIndex := 2;
        3 : cb_categoria.ItemIndex := 3;
        4 : cb_categoria.ItemIndex := 4;
      end;
      ed_foneres.text              := dbg_registros.DataSource.DataSet.FieldByName('TLRESIDENCIAL').AsString;
      ed_celular.text              := dbg_registros.DataSource.DataSet.FieldByName('TLCELULAR').AsString;
      ed_fonecontato.text          := dbg_registros.DataSource.DataSet.FieldByName('TLCONTATO').AsString;
      ed_nmcontato.text            := dbg_registros.DataSource.DataSet.FieldByName('NMCONTATO').AsString;
      ed_numero.text               := dbg_registros.DataSource.DataSet.FieldByName('NUENDERECO').AsString;
      ed_ncep.text                 := dbg_registros.DataSource.DataSet.FieldByName('NUCEP').AsString;
      //---
      consultarCep(ed_ncep.Text);
    end;
end;

procedure TFrm_funcionarios.dbg_registrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //---
  AjustaDrawColumnCell( dbg_registros, Rect, DataCol, Column, State );
end;

procedure TFrm_funcionarios.dbg_registrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_DELETE ) then
  begin
    //---
    if not ( dbg_registros.DataSource.DataSet.IsEmpty ) then
    begin
        //---
        funcionarios.ExcluirFuncionarios( dbg_registros.DataSource.DataSet.FieldByName('idfuncionario').AsInteger);
        //--
        DS_Consulta.DataSet.Refresh;
    end;
    //---
    AjustarColunasGrid( dbg_registros );
    AjustaTamanhoLinha( dbg_registros ,50);
  end;
end;

procedure TFrm_funcionarios.dbg_registrosTitleClick(Column: TColumn);
var
  I: Integer;
begin
  //---
  if dbg_registros.DataSource.DataSet.Active then
  begin
    //---
    PintarTituloColunaGrid( dbg_registros, Column );
    //---
    funcionarios.Ordena( ( ds_consulta.DataSet as TFDQuery ) , Column );
    //---
    AjustaTamanhoLinha( dbg_registros ,50);
  end;
end;

procedure TFrm_funcionarios.edt_consultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //---
  if ( ( Key = VK_DOWN ) OR ( Key = VK_UP ) ) and ( dbg_registros.DataSource.DataSet <> nil ) then
  begin
    //---
    if dbg_registros.Visible and not dbg_registros.DataSource.DataSet.IsEmpty then
      dbg_registros.DataSource.DataSet.Next;

    dbg_registros.SetFocus;

    Key := 0;
  end;
  //---
  if Key = VK_RETURN then
  begin
    //---
    ds_consulta.DataSet := funcionarios.ConsultarFuncionarios( edt_consulta.Text );
    //---
    dbg_registrosTitleClick( dbg_registros.Columns[1] );
    //---
    AjustarColunasGrid( dbg_registros );
    AjustaTamanhoLinha( dbg_registros , 50 );
  end;
end;

procedure TFrm_funcionarios.ed_celularChange(Sender: TObject);
begin
  Formatar(ed_celular, TFormato.Celular);
end;

procedure TFrm_funcionarios.ed_codempresaEnter(Sender: TObject);
begin
  ed_codempresa.OnExit := ed_codempresaExit;
end;

procedure TFrm_funcionarios.ed_codempresaExit(Sender: TObject);
begin
  try
    //--
    empresas.Pesquisar(strtoint(ed_codempresa.Text));
    ed_nmempresa.Text := empresas.NMEMPRESA;
  except
    Mensagem('CADASTRO FUNCIONARIOS',
             'CODIGO EMPRESA INVALIDO.. VERIFIQUE !!!',
             'INFORMACAO');
    abort;
  end;
end;

procedure TFrm_funcionarios.ed_dtnascChange(Sender: TObject);
begin
  Formatar(ed_dtnasc, TFormato.Dt);
end;

procedure TFrm_funcionarios.ed_dtvalidade_cnhChange(Sender: TObject);
begin
  Formatar(ed_dtvalidade_cnh, TFormato.Dt);
end;

procedure TFrm_funcionarios.ed_fonecontatoChange(Sender: TObject);
begin
  Formatar(ed_fonecontato, TFormato.Celular);
end;

procedure TFrm_funcionarios.ed_foneresChange(Sender: TObject);
begin
  Formatar(ed_foneres, TFormato.Personalizado, '(##)####-####');
end;

procedure TFrm_funcionarios.ed_ncepChange(Sender: TObject);
begin
  Formatar(ed_ncep, TFormato.CEP);
end;

procedure TFrm_funcionarios.ed_ncepEnter(Sender: TObject);
begin
  ed_ncep.OnExit := ed_ncepExit;
end;

procedure TFrm_funcionarios.ed_ncepExit(Sender: TObject);
var
   flags : DWORD;
begin
  //-- verifica se o cep digitado esta ok
  if Somente_Numeros(ed_nCEP.Text).Length <> 8 then
    begin
      Mensagem('CADASTRO FUNCIONARIOS',
               'CEP INVALIDO.. VERIFIQUE !!!',
               'INFORMACAO');
      ed_ncep.Clear;
      ed_ncep.SetFocus;
      abort;
    end;
  // verifica se está conectado a internet
  if not InternetGetConnectedState(@flags, 0) then
    begin
      ed_endereco.Clear;
      ed_numero.Clear;
      ed_bairro.Clear;
      ed_cidade.Clear;
      ed_uf.Clear;
      ed_endereco.SetFocus;
    end
  else
    ConsultarCEP(ed_nCEP.Text);
end;

procedure TFrm_funcionarios.ed_ncpfChange(Sender: TObject);
begin
  Formatar(ed_ncpf, TFormato.CPF);
end;

procedure TFrm_funcionarios.ed_nrgChange(Sender: TObject);
begin
  Formatar(ed_nrg, TFormato.Personalizado, '##.###.###-#');;
end;

procedure TFrm_funcionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //-- liberar form da memoria
  funcionarios.Destroy;
  Empresas.Destroy;
  FreeAndNil(Frm_funcionarios);
end;

procedure TFrm_funcionarios.FormCreate(Sender: TObject);
begin
  //---
  funcionarios := TFuncionarios.create(DM.Conn);
  Empresas     := TEmpresas.create(DM.Conn);
  //---
  cardpanel.ActiveCard := card_lista;
end;

procedure TFrm_funcionarios.FormResize(Sender: TObject);
begin
  //---
  pnl_pesquisa.Left := Round( pnl_fundo.Width/2 - pnl_pesquisa.Width/2 );
end;

procedure TFrm_funcionarios.FormShow(Sender: TObject);
var
  qryteste: TFDQuery;
begin
  //---
  ds_consulta.DataSet := funcionarios.listarfuncionarios('');

  AjustarColunasGrid( dbg_registros );
  AjustaTamanhoLinha( dbg_registros , 50 );
end;

procedure TFrm_funcionarios.btn_limpar_pesquisaClick(Sender: TObject);
begin
  edt_consulta.Clear;
  //---
  ds_consulta.DataSet := funcionarios.listarfuncionarios('');
  //---
  AjustarColunasGrid( dbg_registros );
  AjustaTamanhoLinha( dbg_registros , 50 );
end;

procedure TFrm_funcionarios.limpar_campos;
begin
  ed_codempresa.Clear;
  ed_nmempresa.Clear;
  ed_nmfunc.clear;
  ed_ncpf.clear;
  ed_nrg.clear;
  ed_dtnasc.clear;
  ed_email.clear;
  ed_carttrab.clear;
  ed_ntitulo.clear;
  ed_ncnh.clear;
  ed_dtvalidade_cnh.clear;
  cb_categoria.ItemIndex := -1;
  ed_foneres.clear;
  ed_celular.clear;
  ed_fonecontato.clear;
  ed_nmcontato.clear;
  ed_endereco.clear;
  ed_numero.clear;
  ed_bairro.clear;
  ed_cidade.Clear;
  ed_ncep.clear;
end;

procedure TFrm_funcionarios.SelecionarEmpresa(idempresa,
  nmempresa: string);
begin
  //---
  ed_codempresa.text := formatfloat('0000',strtoint(idempresa));
  ed_nmempresa.text  := nmempresa;
end;

procedure TFrm_funcionarios.SpeedButton1Click(Sender: TObject);
begin
  //--
  if NOT Assigned(Frm_pesquisar_empresa) then
        Application.CreateForm(TFrm_pesquisar_empresa, Frm_pesquisar_empresa);
  //--
  Frm_pesquisar_empresa.ExecuteOnClose := SelecionarEmpresa;
  Frm_pesquisar_empresa.showmodal
end;

procedure TFrm_funcionarios.ConsultarCep(Cep: string);
begin
  //======= Pesquisa CEP com RESTRequest ============================
  //-- pesquisa no viacep e devolve em json
  dm.RESTRequest1.Resource := Somente_Numeros(ed_nCEP.Text) + '/json';
  dm.RESTRequest1.Execute;
  //-- verifica o retorno da pesquisa
  if dm.RESTRequest1.Response.StatusCode = 200 then
    begin
      //-- se o cep não for encontrado
      if dm.RESTRequest1.Response.Content.IndexOf('erro') > 0 then
        begin
          ShowMessage('CEP não encontrado');
          ed_ncep.SetFocus;
        end
      else
        begin
          with dm.MemTable do
          begin
            //-- dados retornado
            ed_endereco.Text    := FieldByName('logradouro').AsString;
            ed_bairro.Text      := FieldByName('bairro').AsString;
            ed_cidade.Text      := tiraAcentos(FieldByName('localidade').AsString);
            ed_uf.text          := FieldByName('uf').AsString;
          end;
          //---
          with dm.qrymanut do
          begin
            close;
            SQL.Clear;
            SQL.Add('select caduf.iduf, caduf.nmestado, caduf.sgestado,');
            SQL.Add('cadcidade.idcidade, cadcidade.nmcidade');
            SQL.Add('from cadcidade');
            SQL.Add('inner join caduf on (cadcidade.iduf = caduf.iduf)');
            SQL.Add('where (caduf.sgestado = :sgestado) and  (cadcidade.nmcidade = :nmcidade)');
            parambyname('sgestado').asstring := ed_uf.Text;
            parambyname('nmcidade').asstring := ed_cidade.Text;
            open;
            //---
            if dm.Qrymanut.RecordCount > 0 then
              begin
                vcidade := dm.Qrymanut.FieldByName('idcidade').Asinteger;
                vsigla  := dm.Qrymanut.FieldByName('iduf').Asinteger;
              end
            else
              begin
                showmessage('Dados da Cidade não encontrado');
                //-- Incluir uma rotina para cadastrar a cidade e
                //   estado que não esteja no banco de dados
                //-- opcao para sair do cadastro
                ed_ncep.SetFocus;
                ed_ncep.Clear;
                ed_endereco.clear;
                ed_bairro.clear;
                ed_cidade.clear;
                ed_uf.clear;
                abort;
              end;
          end;
        end;
    end
  else
    //-- se retorno statuscode diferente de 200
    begin
      ShowMessage('Erro ao consultar CEP');
      ed_ncep.SetFocus;
    end;
end;

end.
