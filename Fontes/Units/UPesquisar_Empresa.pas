unit UPesquisar_Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type

  TExecuteOnClose = procedure(idempresa,nmempresa: string) of Object;

  TFrm_pesquisar_empresa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qry: TFDQuery;
    DataSource1: TDataSource;
    Panel3: TPanel;
    edtbusca: TEdit;
    DBGrid1: TDBGrid;
    btn_fechar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qryIDEMPRESA: TIntegerField;
    qryNMEMPRESA: TStringField;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    FExecuteOnClose: TExecuteOnClose;

    procedure ListarBanco(busca: string);

  public
    { Public declarations }

    ExecuteOnClose: TExecuteOnClose;

  end;

var
  Frm_pesquisar_empresa: TFrm_pesquisar_empresa;

implementation

{$R *.dfm}

uses UDM;

{ TForm2 }

procedure TFrm_pesquisar_empresa.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_pesquisar_empresa.DBGrid1DblClick(Sender: TObject);
begin
   ExecuteOnClose(Datasource1.DataSet.FieldByName('idempresa').AsString,
                  Datasource1.DataSet.FieldByName('nmempresa').AsString);
  close;
end;

procedure TFrm_pesquisar_empresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Active := false;
  action := TCloseAction.caFree;
  Frm_pesquisar_empresa := nil;
end;

procedure TFrm_pesquisar_empresa.FormCreate(Sender: TObject);
begin
  qry.Active := true;
end;

procedure TFrm_pesquisar_empresa.FormShow(Sender: TObject);
begin
  edtbusca.Clear;
end;

procedure TFrm_pesquisar_empresa.ListarBanco(busca: string);
begin
   with Qry do
    begin
        Active := false;
        SQL.Clear;
        SQL.Add('select idempresa, nmempresa from cadempresa');
        SQL.Add('where nmempresa <> '''' ');
        if busca <> '' then
          begin
            SQL.Add('and nmempresa like :empresa');
            ParamByName('empresa').Value := '%' + busca + '%';
          end;
        SQL.Add('order by idempresa');
        Active := true;
    end;
end;

procedure TFrm_pesquisar_empresa.SpeedButton1Click(Sender: TObject);
begin
  listarbanco(edtbusca.Text);
end;

procedure TFrm_pesquisar_empresa.SpeedButton2Click(Sender: TObject);
begin
  edtbusca.Clear;
  edtbusca.SetFocus;
  listarbanco(edtbusca.Text);
end;

end.
