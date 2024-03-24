unit UFrm_empresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage,
  cEmpresas,
  uFuncoes,
  uFormat;

type
  TFrm_empresas = class(TForm)
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
    CardPanel_empresa: TCardPanel;
    Card_lista: TCard;
    Card_dados: TCard;
    Panel1: TPanel;
    Label7: TLabel;
    ed_email: TEdit;
    Label6: TLabel;
    ed_celular: TEdit;
    ed_fonecom: TEdit;
    Label5: TLabel;
    Label3: TLabel;
    ed_ninsc_est: TEdit;
    ed_ncnpj: TEdit;
    Label2: TLabel;
    ed_nempresa: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    pnl_gravar: TPanel;
    btn_gravar: TSpeedButton;
    pnl_cancelar: TPanel;
    btn_cancelar: TSpeedButton;
    btn_limpar_pesquisa: TImage;
    pnl_dbgrid: TPanel;
    pnl_Rodape: TPanel;
    dbg_registros: TDBGrid;
    lbl_excluir: TLabel;
    lbl_duplo_clique: TLabel;
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
    procedure ed_ncnpjChange(Sender: TObject);
    procedure ed_ninsc_estChange(Sender: TObject);
    procedure ed_fonecomChange(Sender: TObject);
    procedure ed_celularChange(Sender: TObject);
  private
    { Private declarations }

    procedure limpar_campos;
    //---
    procedure AjustarColunasGrid(const xDBGrid: TDBGrid);

  public
    { Public declarations }

    empresas : TEmpresas;

  end;

var
  Frm_empresas: TFrm_empresas;

  vcod_empresa : integer;
  modo : string;

implementation

{$R *.dfm}

uses UDM, UPrincipal;

procedure TFrm_empresas.btn_gravarClick(Sender: TObject);
var
  msg_erro: string;
begin
  //--
  empresas := TEmpresas.Create(dm.conn);
  //---
  if validacampos([ed_nempresa, ed_ncnpj, ed_ninsc_est],3) then
    begin
      //----
      empresas.NMEMPRESA   := ed_nempresa.Text;
      empresas.NUCNPJ      := ed_ncnpj.Text;
      empresas.NUINSCRICAO := ed_ninsc_est.Text;
      empresas.TLCOMERCIAL := ed_fonecom.Text;
      empresas.TLCELULAR   := ed_celular.Text;
      empresas.TXEMAIL     := ed_email.Text;

      //-- modo selecionado
      if modo = 'I' then
        empresas.InserirEmpresas(msg_erro)
      else
        begin
          empresas.idempresa := vcod_empresa;
          empresas.AlterarEmpresas(msg_erro);
        end;
      //---
      if msg_erro <> '' then
        begin
          Mensagem('CADASTRO EMPRESAS',
                   'NÃO FOI POSSÍVEL INSERIRO OU ALTERAR O REGISTRO!'+
                    msg_erro,
                   'INFORMACAO');
          exit;
        end;
      //--
      DS_Consulta.DataSet.Refresh;
      //---
      cardpanel_empresa.ActiveCard := card_lista;
      //--
      pnl_topo.Visible      := true;
      btn_fechar.Enabled    := true;
      //---
      pnl_cadastrar.visible := true;
      pnl_gravar.Visible    := false;
      pnl_cancelar.Visible  := false;
    end;
end;

procedure TFrm_empresas.btn_fecharClick(Sender: TObject);
begin
  //---
  frm_principal.pnl_titulo.Enabled     := true;
  frm_principal.pnl_botoes_top.Enabled := true;
  frm_principal.pnl_menu.Enabled       := true;
  //---
  Close;
end;

procedure TFrm_empresas.btn_cancelarClick(Sender: TObject);
begin
  //---
  cardpanel_empresa.ActiveCard := card_lista;
  //---
  pnl_topo.Visible      := true;
  btn_fechar.Enabled    := true;
  //---
  pnl_cadastrar.visible := true;
  pnl_gravar.Visible    := false;
  pnl_cancelar.Visible  := false;
end;

procedure TFrm_empresas.AjustarColunasGrid(const xDBGrid: TDBGrid);
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
    if ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'idempresa' ) or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'nmempresa' ) or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'nucnpj')or
       ( lowerCase( xDBGrid.Fields[I].FieldName ) = 'stativo' ) then
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

procedure TFrm_empresas.btn_cadastrarClick(Sender: TObject);
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
  cardpanel_empresa.ActiveCard := card_dados;
  //----
  limpar_campos;

  ed_nempresa.SetFocus;

end;

procedure TFrm_empresas.dbg_registrosDblClick(Sender: TObject);
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
      cardpanel_empresa.ActiveCard := card_dados;
      //---
      vcod_empresa      := dbg_registros.DataSource.DataSet.FieldByName('idempresa').AsInteger;
      ed_nempresa.Text  := dbg_registros.DataSource.DataSet.FieldByName('nmempresa').AsString;
      ed_ncnpj.Text     := dbg_registros.DataSource.DataSet.FieldByName('nucnpj').Asstring;
      ed_ninsc_est.Text := dbg_registros.DataSource.DataSet.FieldByName('nuinscricao').AsString;
      ed_fonecom.Text   := dbg_registros.DataSource.DataSet.FieldByName('tlcomercial').AsString;
      ed_celular.Text   := dbg_registros.DataSource.DataSet.FieldByName('tlcelular').AsString;
      ed_email.Text     := dbg_registros.DataSource.DataSet.FieldByName('txemail').AsString;
    end;
end;

procedure TFrm_empresas.dbg_registrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  //---
  AjustaDrawColumnCell( dbg_registros, Rect, DataCol, Column, State );
end;

procedure TFrm_empresas.dbg_registrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_DELETE ) then
  begin
    //---
    if not ( dbg_registros.DataSource.DataSet.IsEmpty ) then
    begin
        //---
        empresas.ExcluirEmpresa( dbg_registros.DataSource.DataSet.FieldByName('idempresa').AsInteger);
        //--
        DS_Consulta.DataSet.Refresh;
    end;
    //---
    AjustarColunasGrid( dbg_registros );
    AjustaTamanhoLinha( dbg_registros ,50);
  end;
end;

procedure TFrm_empresas.dbg_registrosTitleClick(Column: TColumn);
var
  I: Integer;
begin
  //---
  if dbg_registros.DataSource.DataSet.Active then
  begin
    //---
    PintarTituloColunaGrid( dbg_registros, Column );
    //---
    empresas.Ordena( ( ds_consulta.DataSet as TFDQuery ) , Column );
    //---
    AjustaTamanhoLinha( dbg_registros ,50);
  end;
end;

procedure TFrm_empresas.edt_consultaKeyDown(Sender: TObject;
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
    ds_consulta.DataSet := empresas.ConsultarEmpresa( edt_consulta.Text );
    //---
    dbg_registrosTitleClick( dbg_registros.Columns[1] );
    //---
    AjustarColunasGrid( dbg_registros );
    AjustaTamanhoLinha( dbg_registros , 50 );
  end;
end;

procedure TFrm_empresas.ed_celularChange(Sender: TObject);
begin
  Formatar(ed_celular, TFormato.Celular);
end;

procedure TFrm_empresas.ed_fonecomChange(Sender: TObject);
begin
  Formatar(ed_fonecom, TFormato.Personalizado, '(##)####-####');
end;

procedure TFrm_empresas.ed_ncnpjChange(Sender: TObject);
begin
  Formatar(ed_ncnpj, TFormato.CNPJ);
end;

procedure TFrm_empresas.ed_ninsc_estChange(Sender: TObject);
begin
  Formatar(ed_ninsc_est, TFormato.InscricaoEstadual, 'SP');
end;

procedure TFrm_empresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //-- liberar form da memoria
  empresas.Destroy;
  FreeAndNil(Frm_empresas);
end;

procedure TFrm_empresas.FormCreate(Sender: TObject);
begin
  //---
  empresas := TEmpresas.create(DM.Conn);
  //---
  cardpanel_empresa.ActiveCard := card_lista;
end;

procedure TFrm_empresas.FormResize(Sender: TObject);
begin
  //---
  pnl_pesquisa.Left := Round( pnl_fundo.Width/2 - pnl_pesquisa.Width/2 );
end;

procedure TFrm_empresas.FormShow(Sender: TObject);
var
  qryteste: TFDQuery;
begin
  //---
  ds_consulta.DataSet := empresas.listarempresas('');
  AjustarColunasGrid( dbg_registros );
  AjustaTamanhoLinha( dbg_registros , 50 );
end;

procedure TFrm_empresas.btn_limpar_pesquisaClick(Sender: TObject);
begin
  edt_consulta.Clear;
  //---
  ds_consulta.DataSet := empresas.listarempresas('');
  //---
  AjustarColunasGrid( dbg_registros );
  AjustaTamanhoLinha( dbg_registros , 50 );
end;

procedure TFrm_empresas.limpar_campos;
begin
  ed_nempresa.Clear;
  ed_ncnpj.Clear;
  ed_ninsc_est.Clear;
  ed_fonecom.Clear;
  ed_celular.Clear;
  ed_email.Clear;
end;

end.
