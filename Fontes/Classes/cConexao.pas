unit cConexao;

interface

uses
  System.IniFiles, Vcl.Forms, System.SysUtils, FireDAC.Stan.Intf,
  FireDAC.Comp.Client, Data.DB, Vcl.Dialogs;

Type
  TConexao = Class
  private
    FConexao: TFDConnection;
    FServidor: String;
    FSenha: String;
    FBase: String;
    FLogin: String;
    FPorta: String;
    FMsgErro : String;
    FDrvBanco: String;

  public
    constructor Create(NomeConexao : TFDConnection);
    destructor Destroy; override;

    function fnc_conectar_banco: boolean;
    procedure GravarArquivoIni;
    Function LerArquivoIni: boolean;

    property Conexao : TFDConnection read FConexao write FConexao;
    property Servidor : String read FServidor write FServidor;
    property Base     : String read FBase write FBase;
    property Login    : String read FLogin write FLogin;
    property Senha    : String read FSenha write FSenha;
    property Porta    : String read FPorta write FPorta;
    property DrvBanco : String read FDrvBanco write FDrvBanco;
    property MsgErro  : String read FMsgErro write FMsgErro;

  End;

implementation

uses ufuncoes;

{ TConexao }

constructor TConexao.Create(NomeConexao: TFDConnection);
begin
  FConexao := NomeConexao;
end;

destructor TConexao.Destroy;
begin
  Fconexao.connected := false;
  inherited;
end;

function TConexao.fnc_conectar_banco: boolean;
begin
  Result := true;
  //--
  FConexao.Params.Clear;
  //---
  if not LerArquivoIni then
    begin
      result := false;
      FMsgerro := 'O arquivo de Configuração não foi encontrado!';
    end
  else
    begin
      FConexao.Params.Add('Server='+ FServidor );
      FConexao.Params.Add('Database='+ FBase);
      FConexao.Params.Add('port='+ FPorta);
      FConexao.Params.Add('DriverID='+ FDrvBanco);
      FConexao.Params.Add('user_name='+ FLogin);
      FConexao.Params.Add('password='+ FSenha);
      try
        //tenta realizar a conexao
        FConexao.Connected := True;
      Except
        //se der erro ao tentar conectar retorna o erro e result = false
        on e: Exception do
        begin
          FMsgErro := e.Message;
          Result   := False;
        end;
      end;
    end;
end;

procedure TConexao.GravarArquivoIni;
var
  IniFile : String ;
  Ini     : TIniFile ;
begin
  //PROCEDIMENTO QUE GRAVA AS CONFIGURACOES DO SERVIDOR NO ARQUIVO INI
  IniFile := ChangeFileExt( Application.ExeName, '.ini') ;
  //CRIA O ARQUIVO INI
  Ini     := TIniFile.Create( IniFile );
  //--
  try
    Ini.WriteString( 'Configuracao','Servidor' , FServidor );
    Ini.WriteString( 'Configuracao','Base', FBase );
    Ini.WriteString( 'Configuracao','Porta' , FPorta);
    Ini.WriteString( 'Configuracao','Driver' , FDrvBanco);
    Ini.WriteString( 'Acesso','Login', FLogin );
    Ini.WriteString( 'Acesso','Senha', Codifica('C',FSenha));
  finally
     Ini.Free ;
  end;
end;

Function TConexao.LerArquivoIni: boolean;
var
  IniFile : String ;
  Ini     : TIniFile ;
begin
  //PROCEDIMENTO QUE GRAVA AS CONFIGURACOES DO SERVIDOR NO ARQUIVO INI
  IniFile := ChangeFileExt( Application.ExeName, '.ini') ;
  //CRIA O ARQUIVO INI
  Ini     := TIniFile.Create( IniFile );
  //--
  if not fileexists(inifile) then
    result := false
  else
    begin
      try
        //---
        FServidor := Ini.ReadString( 'Configuracao','Servidor', '' );
        FBase     := Ini.ReadString( 'Configuracao','Base', '' );
        FPorta    := Ini.ReadString( 'Configuracao','Porta', '' );
        FDrvBanco := Ini.ReadString( 'Configuracao','Driver', '' );
        FLogin    := Ini.ReadString( 'Acesso','Login', '' );
        FSenha    := Ini.ReadString( 'Acesso','Senha', '' );
        FSenha    := Codifica('D', FSenha);
      finally
        result := true;
        Ini.Free ;
      end;
    end;
end;

end.
