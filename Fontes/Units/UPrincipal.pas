unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.AppEvnts,Vcl.Buttons, Vcl.ExtCtrls,
  UFundo_form, UFrm_empresas;

type
  TFrm_principal = class(TForm)
    ApplicationEvents: TApplicationEvents;
    pnl_titulo: TPanel;
    Panel2: TPanel;
    pnl_botoes_top: TPanel;
    pnl_principal: TPanel;
    Label1: TLabel;
    ed_usu_logado: TLabel;
    Label3: TLabel;
    pnl_foto: TPanel;
    img_usuario: TImage;
    pnl_menu: TPanel;
    pnl_btn_1: TPanel;
    btn_1: TSpeedButton;
    pnl_btn_2: TPanel;
    btn_2: TSpeedButton;
    pnl_btn_3: TPanel;
    btn_3: TSpeedButton;
    pnl_btn_4: TPanel;
    btn_4: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEventsModalBegin(Sender: TObject);
    procedure ApplicationEventsModalEnd(Sender: TObject);
    procedure btn_4Click(Sender: TObject);
    procedure pnl_tituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_3Click(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  Frm_principal: TFrm_principal;

implementation

{$R *.dfm}

uses UDM, UnitLogin, UFrm_funcionarios;

procedure TFrm_principal.ApplicationEventsModalBegin(Sender: TObject);
begin
  frm_fundo_form.Show;
end;

procedure TFrm_principal.ApplicationEventsModalEnd(Sender: TObject);
begin
  frm_fundo_form.Hide;
end;

procedure TFrm_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := TCloseAction.cafree;
  frm_principal := nil;
end;

procedure TFrm_principal.FormShow(Sender: TObject);
var
  rgn : HRGN;
  dc : HDC;
begin
  rgn := CreateRoundRectRgn(0, 0, Img_usuario.Width, Img_usuario.Height, 40,45);
  dc := GetDC(Pnl_foto.Handle);
  SetWindowRgn(Pnl_foto.Handle, rgn, true);
  ReleaseDC(Pnl_foto.Handle, dc);
  DeleteObject(rgn);
end;

procedure TFrm_principal.pnl_tituloMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $f012;
begin
  //---
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
  //--
  Frm_Principal.WindowState := wsmaximized;
end;

procedure TFrm_principal.btn_1Click(Sender: TObject);
begin
  //--
  pnl_titulo.Enabled     := false;
  pnl_botoes_top.Enabled := false;
  pnl_menu.Enabled       := false;
  //--
  application.CreateForm(TFrm_empresas,Frm_empresas);
  if assigned(pnl_principal) then
    begin
      Frm_empresas.parent      := pnl_principal;
      Frm_empresas.Align       := alclient;
      Frm_empresas.BorderStyle := bsnone;
    end;
  //---
  Frm_empresas.Show;
end;

procedure TFrm_principal.btn_2Click(Sender: TObject);
begin
  //--
  pnl_titulo.Enabled     := false;
  pnl_botoes_top.Enabled := false;
  pnl_menu.Enabled       := false;
  //--
  application.CreateForm(TFrm_funcionarios,Frm_funcionarios);
  if assigned(pnl_principal) then
    begin
      Frm_funcionarios.parent      := pnl_principal;
      Frm_funcionarios.Align       := alclient;
      Frm_funcionarios.BorderStyle := bsnone;
    end;
  //---
  Frm_funcionarios.Show;
end;

procedure TFrm_principal.btn_3Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_principal.btn_4Click(Sender: TObject);
begin
  //-- Verifica se o Form esta aberto se aberto esconde
  if frm_principal <> nil then
    frm_principal.hide;
  //--- Mostra o form de login
  application.createform(Tfrmlogin, Frmlogin);
  frmlogin.Show;
end;

end.
