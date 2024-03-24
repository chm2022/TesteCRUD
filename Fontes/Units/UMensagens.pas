unit UMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrm_mensagens = class( TForm )
    pnl_fundo: TPanel;
    lbl_descricao: TLabel;
    pnl_botao_confirma: TPanel;
    btn_sim: TSpeedButton;
    lbl_titulo: TLabel;
    pnl_cabecalho: TPanel;
    pnl_botao_cancelar: TPanel;
    btn_nao: TSpeedButton;
    Shape1: TShape;
    lbl_titulojanela: TLabel;
    procedure btn_naoClick(Sender: TObject);
    procedure btn_simClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    sTitulo, sMensagem, sTipo : String;
    bRespostaMensagem :boolean;
  end;

var
  Frm_mensagens: TFrm_mensagens;


implementation

{$R *.dfm}

uses ufuncoes;

procedure TFrm_mensagens.btn_simClick(Sender: TObject);
begin
  bRespostaMensagem := True;
  Close;
end;

procedure TFrm_mensagens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    btn_simClick( Self )
  else
  if key = VK_ESCAPE then
    btn_naoClick( Self );
end;

procedure TFrm_mensagens.FormShow(Sender: TObject);
begin
  bRespostaMensagem      := False;
  lbl_titulo.Caption     := sTitulo;
  lbl_descricao.Caption  := sMensagem;
  //----
  if sTipo = 'CONFIRMA' then
    begin
      pnl_botao_cancelar.visible := true;
      btn_nao.visible := true;
      btn_sim.Caption := 'Sim';
    end;
  if sTipo = 'DELETAR' then
    begin
      pnl_botao_cancelar.visible := true;
      btn_nao.visible := true;
      btn_sim.Caption := 'Sim';
    end;
  if sTipo = 'ERRO' then
    begin
      pnl_botao_cancelar.visible := false;
      btn_nao.visible := false;
      btn_sim.Caption := 'OK';
    end;
  if sTipo = 'SUCESSO' then
    begin
      pnl_botao_cancelar.visible := false;
      btn_nao.visible := false;
      btn_sim.Caption := 'OK';
    end;
  if sTipo = 'INFORMACAO' then
    begin
      pnl_botao_cancelar.visible := false;
      btn_nao.visible := false;
      btn_sim.Caption := 'OK';
    end;
end;

procedure TFrm_mensagens.btn_naoClick(Sender: TObject);
begin
  bRespostaMensagem := False;
  Close;
end;

end.
