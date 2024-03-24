unit cFuncionarios;

interface

 uses FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
      FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
      FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
      FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
      FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Vcl.Forms,
      FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.DBGrids, Vcl.Dialogs,
      System.Variants, System.SysUtils;

type
  TFuncionarios = Class
    Private
      FCONN                  : TFDConnection;
      FNMCONTATO             : string;
      FTLCELULAR             : string;
      FDTCADASTRO            : TDatetime;
      FIDEMPRESA             : integer;
      FNURG                  : string;
      FNMENDERECO            : string;
      FDTVALIDADECARTEIRAMOT : TDatetime;
      FIDCIDADE              : integer;
      FNUCPF                 : string;
      FNMFUNCIONARIO         : string;
      FNMBAIRRO              : string;
      FNUCEP                 : string;
      FTPCATERORIA           : string;
      FDTNASCIMENTO          : Tdatetime;
      FTXEMAIL               : string;
      FIDFUNCIONARIO         : integer;
      FDTCONTRATACAO         : TDatetime;
      FIDUF                  : integer;
      FTLRESIDENCIAL         : string;
      FTLCONTATO             : string;
      FNUCARTEIRAMOTORISTA   : string;
      FSTATIVO               : string;
      FNUCARTEIRATRAB        : string;
      FNUENDERECO            : string;
      FNUTITULOELEITOR       : string;

    Public

      property CONN                   : TFDConnection read FCONN                  write FCONN;
      property IDFUNCIONARIO          : integer       read FIDFUNCIONARIO         write FIDFUNCIONARIO;
      property IDEMPRESA              : integer       read FIDEMPRESA             write FIDEMPRESA;
      property NMFUNCIONARIO          : string        read FNMFUNCIONARIO         write FNMFUNCIONARIO;
      property NUCPF                  : string        read FNUCPF                 write FNUCPF;
      property NURG                   : string        read FNURG                  write FNURG;
      property DTNASCIMENTO           : Tdatetime     read FDTNASCIMENTO          write FDTNASCIMENTO;
      property TXEMAIL                : string        read FTXEMAIL               write FTXEMAIL;
      property NUCARTEIRATRAB         : string        read FNUCARTEIRATRAB        write FNUCARTEIRATRAB;
      property NUTITULOELEITOR        : string        read FNUTITULOELEITOR       write FNUTITULOELEITOR;
      property NUCARTEIRAMOTORISTA    : string        read FNUCARTEIRAMOTORISTA   write FNUCARTEIRAMOTORISTA;
      property TPCATERORIA            : string        read FTPCATERORIA           write FTPCATERORIA;
      property DTVALIDADECARTEIRAMOT  : TDatetime     read FDTVALIDADECARTEIRAMOT write FDTVALIDADECARTEIRAMOT;
      property TLRESIDENCIAL          : string        read FTLRESIDENCIAL         write FTLRESIDENCIAL;
      property TLCELULAR              : string        read FTLCELULAR             write FTLCELULAR;
      property TLCONTATO              : string        read FTLCONTATO             write FTLCONTATO;
      property NMCONTATO              : string        read FNMCONTATO             write FNMCONTATO;
      property DTCONTRATACAO          : TDatetime     read FDTCONTRATACAO         write FDTCONTRATACAO;
      property DTCADASTRO             : TDatetime     read FDTCADASTRO            write FDTCADASTRO;
      property STATIVO                : string        read FSTATIVO               write FSTATIVO;
      property NMENDERECO             : string        read FNMENDERECO            write FNMENDERECO;
      property NUENDERECO             : string        read FNUENDERECO            write FNUENDERECO;
      property NMBAIRRO               : string        read FNMBAIRRO              write FNMBAIRRO;
      property IDCIDADE               : integer       read FIDCIDADE              write FIDCIDADE;
      property IDUF                   : integer       read FIDUF                  write FIDUF;
      property NUCEP                  : string        read FNUCEP                 write FNUCEP;

      constructor create (Conn : TFDConnection );
      destructor Destroy; override;

      //----
      function ListarFuncionarios(Texto: String): TFDQuery;
      function InserirFuncionarios(out msg_erro: string): Boolean;
      function AlterarFuncionarios(out msg_erro: string): Boolean;
      procedure ExcluirFuncionarios(id_chave: integer);
      function ConsultarFuncionarios( Texto: string ): TFDQuery;
      //passa o campo para o index para ordenação
      procedure Ordena ( Query: TFDQuery; Coluna: TColumn);

  End;

var
  Qryconsulta : TFDQuery;

implementation

{ TClientes }

uses Ufuncoes;

function TFuncionarios.ListarFuncionarios(Texto: String): TFDQuery;
var
  QryTeste : TFDQuery;
begin
  try
    FConn.Connected := False;
    FConn.Connected := True;
    //---
    QryTeste := TFDQuery.Create( Nil );
    QryTeste.Connection := Fconn;
    //---
    with qryteste do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select fun.idfuncionario, fun.idempresa, fun.nmfuncionario, emp.nmempresa,');
      SQL.Add('cid.nmcidade, uf.sgestado, fun.nucpf, fun.nucarteiramotorista, fun.tpcateroria,');
      SQL.Add('fun.dtvalidadecarteiramot, fun.tlcontato, fun.tlcelular, fun.tlresidencial,');
      SQL.Add('fun.nmcontato, fun.stativo, fun.nmendereco, fun.nuendereco, fun.nmbairro, fun.nucep,');
      SQL.Add('fun.nurg, fun.dtnascimento, fun.txemail, fun.nucarteiratrab, fun.nutituloeleitor ');
      SQL.Add('from cadfuncionarios fun');
      SQL.Add('inner join cadempresa emp on (fun.idempresa = emp.idempresa)');
      SQL.Add('inner join cadcidade cid on (fun.idcidade = cid.idcidade)');
      SQL.Add('inner join caduf uf on (fun.iduf = uf.iduf)');
      SQL.Add('order by fun.nmfuncionario asc');
      Open;
    end;
  finally
    Result := QryTeste;
  end;
end;

function TFuncionarios.InserirFuncionarios(out msg_erro: string): Boolean;
var
  qryteste : TFDQuery;
begin
  //---
  Result:= False;
  msg_Erro  := '';

  try
     try
       //---
       qryteste := TFDQuery.Create(nil);
       qryteste.Connection := Fconn;
       //---
       with qryteste do
       begin
         Close;
         SQL.Clear;
         SQL.Add('INSERT INTO CADFUNCIONARIOS(IDFUNCIONARIO, IDEMPRESA, NMFUNCIONARIO,');
         SQL.Add('NUCPF, NURG, DTNASCIMENTO, TXEMAIL, NUCARTEIRATRAB, NUTITULOELEITOR,');
         SQL.Add('NUCARTEIRAMOTORISTA, TPCATERORIA, DTVALIDADECARTEIRAMOT,');
         SQL.Add('TLRESIDENCIAL, TLCELULAR, TLCONTATO, NMCONTATO, DTCONTRATACAO,');
         SQL.Add('DTCADASTRO, STATIVO, NMENDERECO, NUENDERECO, NMBAIRRO,');
         SQL.Add('IDCIDADE, IDUF, NUCEP)');
         SQL.Add('VALUES(:IDFUNCIONARIO, :IDEMPRESA, :NMFUNCIONARIO, :NUCPF, :NURG,');
         SQL.Add(':DTNASCIMENTO, :TXEMAIL, :NUCARTEIRATRAB, :NUTITULOELEITOR,');
         SQL.Add(':NUCARTEIRAMOTORISTA, :TPCATERORIA, :DTVALIDADECARTEIRAMOT,');
         SQL.Add(':TLRESIDENCIAL, :TLCELULAR, :TLCONTATO, :NMCONTATO, :DTCONTRATACAO,');
         SQL.Add(':DTCADASTRO, :STATIVO, :NMENDERECO, :NUENDERECO, :NMBAIRRO,');
         SQL.Add(':IDCIDADE, :IDUF, :NUCEP)');
         ParamByName('IDFUNCIONARIO').Value            := getid('IDFUNCIONARIO','CADFUNCIONARIOS');
         ParamByName('IDEMPRESA').Value                := FIDEMPRESA;
         ParamByName('NMFUNCIONARIO').Value            := FNMFUNCIONARIO ;
         ParamByName('NUCPF').Value                    := FNUCPF;
         ParamByName('NURG').Value                     := FNURG;
         if DTNASCIMENTO = 0 then
           ParamByName('DTNASCIMENTO').Value           := null
         else
           ParamByName('DTNASCIMENTO').AsDate          := FDTNASCIMENTO;
         ParamByName('TXEMAIL').Value                  := FTXEMAIL;
         ParamByName('NUCARTEIRATRAB').Value           := FNUCARTEIRATRAB ;
         ParamByName('NUTITULOELEITOR').Value          := FNUTITULOELEITOR ;
         ParamByName('NUCARTEIRAMOTORISTA').Value      := FNUCARTEIRAMOTORISTA ;
         ParamByName('TPCATERORIA').Value              := FTPCATERORIA ;
         if DTVALIDADECARTEIRAMOT = 0 then
           ParamByName('DTVALIDADECARTEIRAMOT').Value  := null
         else
           ParamByName('DTVALIDADECARTEIRAMOT').AsDate := FDTVALIDADECARTEIRAMOT;
         ParamByName('TLRESIDENCIAL').Value            := FTLRESIDENCIAL ;
         ParamByName('TLCELULAR').Value                := FTLCELULAR ;
         ParamByName('TLCONTATO').Value                := FTLCONTATO ;
         ParamByName('NMCONTATO').Value                := FNMCONTATO ;
         ParamByName('DTCONTRATACAO').Value            := FDTCONTRATACAO;
         ParamByName('DTCADASTRO').Value               := FDTCADASTRO;
         ParamByName('STATIVO').Value                  := FSTATIVO;
         ParamByName('NMENDERECO').Value               := FNMENDERECO ;
         ParamByName('NUENDERECO').Value               := FNUENDERECO ;
         ParamByName('NMBAIRRO').Value                 := FNMBAIRRO ;
         ParamByName('IDCIDADE').Value                 := FIDCIDADE;
         ParamByName('IDUF').Value                     := FIDUF;
         ParamByName('NUCEP').Value                    := FNUCEP;
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

function TFuncionarios.AlterarFuncionarios(out msg_erro: string): Boolean;
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
        SQL.Add('UPDATE CADFUNCIONARIOS SET IDEMPRESA = :IDEMPRESA, NMFUNCIONARIO = :NMFUNCIONARIO,');
        SQL.Add('NUCPF = :NUCPF, NURG = :NURG, DTNASCIMENTO = :DTNASCIMENTO, TXEMAIL = :TXEMAIL, NUCARTEIRATRAB = :NUCARTEIRATRAB, ');
        SQL.Add('NUTITULOELEITOR = :NUTITULOELEITOR, NUCARTEIRAMOTORISTA = :NUCARTEIRAMOTORISTA, TPCATERORIA = :TPCATERORIA,');
        SQL.Add('DTVALIDADECARTEIRAMOT = :DTVALIDADECARTEIRAMOT, TLRESIDENCIAL = :TLRESIDENCIAL, TLCELULAR = :TLCELULAR,');
        SQL.Add('TLCONTATO = :TLCONTATO, NMCONTATO = :NMCONTATO, NMENDERECO = :NMENDERECO, NUENDERECO = :NUENDERECO,');
        SQL.Add('NMBAIRRO = :NMBAIRRO, NUCEP = :NUCEP, IDCIDADE = :IDCIDADE, IDUF = :IDUF');
        SQL.Add('WHERE IDFUNCIONARIO = :IDFUNCIONARIO');
        ParamByName('IDEMPRESA').Value                := FIDEMPRESA;
        ParamByName('NMFUNCIONARIO').Value            := FNMFUNCIONARIO ;
        ParamByName('NUCPF').Value                    := FNUCPF;
        ParamByName('NURG').Value                     := FNURG;
        if DTNASCIMENTO = 0 then
          ParamByName('DTNASCIMENTO').Value           := null
        else
          ParamByName('DTNASCIMENTO').AsDate          := FDTNASCIMENTO;
        ParamByName('TXEMAIL').Value                  := FTXEMAIL;
        ParamByName('NUCARTEIRATRAB').Value           := FNUCARTEIRATRAB ;
        ParamByName('NUTITULOELEITOR').Value          := FNUTITULOELEITOR ;
        ParamByName('NUCARTEIRAMOTORISTA').Value      := FNUCARTEIRAMOTORISTA ;
        ParamByName('TPCATERORIA').Value              := FTPCATERORIA ;
        if DTVALIDADECARTEIRAMOT = 0 then
          ParamByName('DTVALIDADECARTEIRAMOT').Value  := null
        else
          ParamByName('DTVALIDADECARTEIRAMOT').AsDate := FDTVALIDADECARTEIRAMOT;
        ParamByName('TLRESIDENCIAL').Value            := FTLRESIDENCIAL ;
        ParamByName('TLCELULAR').Value                := FTLCELULAR ;
        ParamByName('TLCONTATO').Value                := FTLCONTATO ;
        ParamByName('NMCONTATO').Value                := FNMCONTATO ;
        ParamByName('NMENDERECO').Value               := FNMENDERECO ;
        ParamByName('NUENDERECO').Value               := FNUENDERECO ;
        ParamByName('NMBAIRRO').Value                 := FNMBAIRRO ;
        ParamByName('NUCEP').Value                    := FNUCEP;
        ParamByName('IDCIDADE').Value                 := FIDCIDADE;
        ParamByName('IDUF').Value                     := FIDUF;
        ParamByName('IDFUNCIONARIO').Value            := FIDFUNCIONARIO;
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

function TFuncionarios.ConsultarFuncionarios(Texto: string): TFDQuery;
begin
  try
    FConn.Connected := false;
    FConn.Connected := true;
    //---
    with qryconsulta do
    begin
      SQL.Clear;
      SQL.Add('select fun.idfuncionario, fun.idempresa, fun.nmfuncionario, emp.nmempresa,');
      SQL.Add('cid.nmcidade, uf.sgestado, fun.nucpf, fun.nucarteiramotorista, fun.tpcateroria,');
      SQL.Add('fun.dtvalidadecarteiramot, fun.tlcontato, fun.tlcelular, fun.tlresidencial,');
      SQL.Add('fun.nmcontato, fun.stativo, fun.nmendereco, fun.nuendereco, fun.nmbairro, fun.nucep,');
      SQL.Add('fun.nurg, fun.dtnascimento, fun.txemail, fun.nucarteiratrab, fun.nutituloeleitor ');
      SQL.Add('from cadfuncionarios fun');
      SQL.Add('inner join cadempresa emp on (fun.idempresa = emp.idempresa)');
      SQL.Add('inner join cadcidade cid on (fun.idcidade = cid.idcidade)');
      SQL.Add('inner join caduf uf on (fun.iduf = uf.iduf)');
      SQL.Add('where IDFUNCIONARIO LIKE :p_texto OR ');
      SQL.Add('NMFUNCIONARIO LIKE :p_texto OR NMEMPRESA LIKE :p_texto ');
      ParamByName('p_texto').AsString := '%' + Texto + '%';
      Open;
    end;
  Finally
    Result := QryConsulta;
  end;
end;

constructor TFuncionarios.create(Conn: TFDConnection);
begin
  FConn  := Conn;
  //---
  QryConsulta            := TFDQuery.Create(nil);
  QryConsulta.Connection := FConn;
end;

destructor TFuncionarios.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

procedure TFuncionarios.Ordena(Query: TFDQuery; Coluna: TColumn);
begin
  //---
  if Query.IndexFieldNames = Coluna.FieldName then
    Query.IndexFieldNames := Coluna.FieldName + ':D'
  else
    Query.IndexFieldNames := Coluna.FieldName;
  Query.First;
end;

procedure TFuncionarios.ExcluirFuncionarios(id_chave: integer);
begin
  //---
  if mensagem('EXCLUIR REGISTRO',
              'DESEJA EXCLUIR ESSE REGISTRO ?',
              'DELETAR' ) then
    begin
      FConn.ExecSQL('DELETE FROM CADFUNCIONARIOS WHERE IDFUNCIONARIO = :id_chave',[id_chave]);
    end;
end;

end.
