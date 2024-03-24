unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  FireDAC.Comp.Client, FireDAC.DApt, Vcl.ExtCtrls;

type
  TFrmLogin = class(TForm)
    pnl_login: TPanel;
    Label1: TLabel;
    ed_login: TEdit;
    Label2: TLabel;
    ed_senha: TEdit;
    btn_acessar: TButton;
    btn_sair: TButton;
    Label3: TLabel;
    Image1: TImage;
    procedure btn_acessarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UPrincipal, UDM, Ufuncoes, Data.DB;

procedure TFrmLogin.btn_acessarClick(Sender: TObject);
begin
  //---
  if Frm_Principal <> nil then
    frm_principal.Show;
  //---
  FrmLogin.Close;
end;

procedure TFrmLogin.btn_sairClick(Sender: TObject);
begin
  //-----
  Application.Terminate;
end;

procedure TFrmLogin.FormResize(Sender: TObject);
begin

  pnl_login.Top  := Round ( frmlogin.Height / 2 - pnl_login.Height / 2 );
  pnl_login.Left := Round ( frmlogin.Width / 2 - pnl_login.Width / 2 );

end;

end.
