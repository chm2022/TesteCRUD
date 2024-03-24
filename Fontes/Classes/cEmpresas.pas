unit cEmpresas;

interface

 uses FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
      FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
      FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
      FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
      FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Vcl.Forms,
      FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.DBGrids,
      System.Variants, System.SysUtils;

type
  TEmpresas = Class
    Private
      FCONN           : TFDConnection;
      FTLCELULAR: string;
      FDTCADASTRO: Tdatetime;
      FIDEMPRESA: integer;
      FNUCNPJ: string;
      FDTEXCLUIDO: Tdatetime;
      FTXOBS: integer;
      FSTEXCLUIDO: string;
      FTLCOMERCIAL: string;
      FTXEMAIL: string;
      FNUINSCRICAO: string;
      FDTABERTURA: Tdatetime;
      FSTATIVO: string;
      FNMEMPRESA: string;

    Public

      property CONN          : TFDConnection read FCONN      write FCONN;
      property IDEMPRESA     : integer    read FIDEMPRESA    write FIDEMPRESA;
      property NMEMPRESA     : string     read FNMEMPRESA    write FNMEMPRESA;
      property NUCNPJ        : string     read FNUCNPJ       write FNUCNPJ ;
      property NUINSCRICAO   : string     read FNUINSCRICAO  write FNUINSCRICAO;
      property STATIVO       : string     read FSTATIVO      write FSTATIVO ;
      property DTCADASTRO    : Tdatetime  read FDTCADASTRO   write FDTCADASTRO ;
      property DTABERTURA    : Tdatetime  read FDTABERTURA   write FDTABERTURA;
      property TLCOMERCIAL   : string     read FTLCOMERCIAL  write FTLCOMERCIAL ;
      property TLCELULAR     : string     read FTLCELULAR    write  FTLCELULAR ;
      property TXOBS         : integer    read FTXOBS        write FTXOBS;
      property TXEMAIL       : string     read FTXEMAIL      write FTXEMAIL ;
      property STEXCLUIDO    : string     read FSTEXCLUIDO   write FSTEXCLUIDO ;
      property DTEXCLUIDO    : Tdatetime  read FDTEXCLUIDO   write  FDTEXCLUIDO;

      constructor create (Conn : TFDConnection );
      destructor Destroy; override;

      //----
      function ListarEmpresas(Texto: String): TFDQuery;
      function InserirEmpresas(out msg_erro: string): Boolean;
      function AlterarEmpresas(out msg_erro: string): Boolean;
      procedure ExcluirEmpresa(id_chave: integer);
      function ConsultarEmpresa( Texto: string ): TFDQuery;

      function Pesquisar(Value:integer):TEmpresas;

      //passa o campo para o index para ordenação
      procedure Ordena ( Query: TFDQuery; Coluna: TColumn);

  End;

var

  Qryconsulta : TFDQuery;

implementation

{ TClientes }

uses Ufuncoes, Vcl.Dialogs;

function TEmpresas.ListarEmpresas(Texto: String): TFDQuery;
var
  QryTeste : TFDQuery;
begin
  try
    FConn.Connected := False;
    FConn.Connected := True;

    QryTeste := TFDQuery.Create( Nil );
    QryTeste.Connection := Fconn;

    QryTeste.Close;
    QryTeste.SQL.Clear;
    QryTeste.SQL.Add('SELECT IDEMPRESA, NMEMPRESA, NUCNPJ, NUINSCRICAO,');
    QryTeste.SQL.Add('TLCOMERCIAL, TLCELULAR,TXEMAIL, STATIVO ');
    QryTeste.SQL.Add('FROM CADEMPRESA');
    QryTeste.Open;

  finally
    Result := QryTeste;
  end;
end;

function TEmpresas.InserirEmpresas(out msg_erro: string): Boolean;
var
  qryteste : TFDQuery;
begin
  //---
  try
     try
       qryteste := TFDQuery.Create(nil);
       qryteste.Connection := Fconn;

       with qryteste do
       begin
         Active := false;
         SQL.Clear;
         SQL.Add('INSERT INTO CADEMPRESA(IDEMPRESA, NMEMPRESA, NUCNPJ,');
         SQL.Add('NUINSCRICAO, STATIVO, DTCADASTRO, DTABERTURA,');
         SQL.Add('TLCOMERCIAL, TLCELULAR, TXEMAIL)');
         SQL.Add('VALUES(:IDEMPRESA, :NMEMPRESA, :NUCNPJ,');
         SQL.Add(':NUINSCRICAO, :STATIVO, :DTCADASTRO, :DTABERTURA,');
         SQL.Add(':TLCOMERCIAL, :TLCELULAR, :TXEMAIL)');
         ParamByName('IDEMPRESA').Value   := getid('IDEMPRESA','CADEMPRESA');
         ParamByName('NMEMPRESA').Value   := FNMEMPRESA;
         ParamByName('NUCNPJ').Value      := FNUCNPJ ;
         ParamByName('NUINSCRICAO').Value := FNUINSCRICAO;
         ParamByName('STATIVO').Value     := 'S';
         ParamByName('DTCADASTRO').Value  := date();
         ParamByName('DTABERTURA').Value  := date();
         ParamByName('TLCOMERCIAL').Value := FTLCOMERCIAL ;
         ParamByName('TLCELULAR').Value   := FTLCELULAR ;
         ParamByName('TXEMAIL').Value     := FTXEMAIL ;
         ExecSQL;
       end;
       //---
       Result := true;
       msg_erro := '';
     //---
     except on ex:exception do
       begin
         Result := False;
         msg_erro := 'Erro ao inserir no cadastro: ' + ex.Message;
       end;
     end;
  finally
     qryteste.Destroy;
  end;
end;

function TEmpresas.AlterarEmpresas(out msg_erro: string): Boolean;
var
  qryteste : TFDQuery;
begin
  //---
  try
    try
      qryteste := TFDQuery.Create(nil);
      qryteste.Connection := Fconn;
      //---
      with qryteste do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('UPDATE CADEMPRESA SET NMEMPRESA = :NMEMPRESA, NUCNPJ = :NUCNPJ,');
        SQL.Add('NUINSCRICAO = :NUINSCRICAO, STATIVO = :STATIVO,');
        SQL.Add('TLCOMERCIAL = :TLCOMERCIAL, TLCELULAR = :TLCELULAR, TXEMAIL = :TXEMAIL');
        SQL.Add('WHERE IDEMPRESA = :IDEMPRESA');
        ParamByName('IDEMPRESA').Value   := FIDEMPRESA;
        ParamByName('NMEMPRESA').Value   := FNMEMPRESA;
        ParamByName('NUCNPJ').Value      := FNUCNPJ ;
        ParamByName('NUINSCRICAO').Value := FNUINSCRICAO;
        ParamByName('STATIVO').Value     := 'S';
        ParamByName('TLCOMERCIAL').Value := FTLCOMERCIAL ;
        ParamByName('TLCELULAR').Value   := FTLCELULAR ;
        ParamByName('TXEMAIL').Value     := FTXEMAIL ;
        ExecSQL;
      end;
      //---
      Result := true;
      msg_erro := '';
    //---
    except on ex:exception do
      begin
        Result := False;
        msg_erro := 'Erro ao alterar o cadastro: ' + ex.Message;
      end;
    end;
  finally
    qryteste.destroy;
  end;
end;

function TEmpresas.ConsultarEmpresa(Texto: string): TFDQuery;
begin
  try
    FConn.Connected := false;
    FConn.Connected := true;
    //---
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('SELECT IDEMPRESA, NMEMPRESA, NUCNPJ, NUINSCRICAO,');
    QryConsulta.SQL.Add('TLCOMERCIAL, TLCELULAR,TXEMAIL, STATIVO ');
    QryConsulta.SQL.Add('FROM CADEMPRESA ');
    QryConsulta.SQL.Add('WHERE IDEMPRESA LIKE :p_texto OR NMEMPRESA LIKE :p_texto ');
    QryConsulta.ParamByName('p_texto').AsString := '%' + Texto + '%';
    QryConsulta.Open;
  Finally
    Result := QryConsulta;
  end;
end;

constructor TEmpresas.create(Conn: TFDConnection);
begin
  FConn  := Conn;
  //---
  QryConsulta            := TFDQuery.Create(nil);
  QryConsulta.Connection := FConn;
end;

destructor TEmpresas.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

procedure TEmpresas.Ordena(Query: TFDQuery; Coluna: TColumn);
begin
  //---
  if Query.IndexFieldNames = Coluna.FieldName then
    Query.IndexFieldNames := Coluna.FieldName + ':D'
  else
    Query.IndexFieldNames := Coluna.FieldName;
  Query.First;
end;

function TEmpresas.Pesquisar(Value: integer): TEmpresas;
var
 qry : TFDQuery;
begin
  //---
  qry := TFDQuery.Create(nil);
  qry.Connection := FConn;
  //---
  with qry do
  begin
    SQL.Text := 'Select idempresa,nmempresa from cadempresa where idempresa = :idempresa';
    ParamByName('idempresa').AsInteger := value;
    Open;
    if not qry.IsEmpty then
      begin
        FNMEMPRESA := qry.FieldByName('nmempresa').Value;
      end
    else
      begin
       mensagem('PESQUISA EMPRESA',
                'CODIGO EMPRESA NÃO CADASTRADO.',
                'INFORMACAO');
       abort;
      end;
  end;

end;

procedure TEmpresas.ExcluirEmpresa(id_chave: integer);
begin
  //---
  if mensagem('EXCLUIR REGISTRO',
              'DESEJA EXCLUIR ESSE REGISTRO ?',
              'DELETAR' ) then
    begin
      FConn.ExecSQL('DELETE FROM CADEMPRESA WHERE IDEMPRESA = :id_chave',[id_chave]);
    end;
end;

end.
