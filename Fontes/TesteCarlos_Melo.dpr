program TesteCarlos_Melo;

uses
  Vcl.Forms,
  Windows,
  UPrincipal in 'Units\UPrincipal.pas' {Frm_principal},
  UDM in 'Units\UDM.pas' {DM: TDataModule},
  UnitLogin in 'Units\UnitLogin.pas' {FrmLogin},
  cConexao in 'Classes\cConexao.pas',
  Ufuncoes in 'Units\Ufuncoes.pas',
  UMensagens in 'Units\UMensagens.pas' {Frm_mensagens},
  UFundo_form in 'Units\UFundo_form.pas' {Frm_fundo_form},
  UFrm_funcionarios in 'Cadastros\UFrm_funcionarios.pas' {Frm_funcionarios},
  cFuncionarios in 'Classes\cFuncionarios.pas',
  uFormat in 'Units\uFormat.pas',
  UFrm_empresas in 'Cadastros\UFrm_empresas.pas' {Frm_empresas},
  cEmpresas in 'Classes\cEmpresas.pas',
  UPesquisar_Empresa in 'Units\UPesquisar_Empresa.pas' {Frm_pesquisar_empresa};

{$R *.res}

var
  Handle: THandle;

begin
  //---
  Handle := FindWindow('TFrm_principal', nil);
  //---
  if Handle <> 0 then
   begin
    //--Se o programa ja estiver aberto
    Mensagem('ACESSO AO SISTEMA',
             'SISTEMA JÁ ESTA ABERTO E SERA ATIVADO.',
             'INFORMACAO' );
    SetForegroundWindow(Handle);
    ShowWindow(Handle, SW_SHOW);
  end
else
  begin

    Application.Initialize;
    Application.MainFormOnTaskbar := True;

    Application.CreateForm(TDM, DM);
  //---
    if DM.Conexao.fnc_conectar_banco then
      begin
        //-- abre o form login
        frmlogin := Tfrmlogin.Create(Nil);
        frmlogin.ShowModal;
        //--
        Application.CreateForm( Tfrm_principal, frm_principal );
        //---
        Application.CreateForm( Tfrm_fundo_form, frm_fundo_form );
        //-- Esconde o form login
        frmlogin.Hide;
        frmlogin.Free;
        //-- executa a aplicacao
        Application.Run;
      end
    else
      begin
        //---
        Mensagem('Conectar ao Banco de Dados',
                 'Não foi possivel conectar ao banco de dados, possivel causa: '+
                 dm.Conexao.MsgErro,
                 'INFORMACAO');
        //---
        Application.Terminate;
      end;
  end;
end.
