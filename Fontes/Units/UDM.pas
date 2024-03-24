unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client,System.IniFiles,Vcl.Forms,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, REST.Types,
  FireDAC.Comp.DataSet, REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope,
  ufuncoes,
  cConexao, FireDAC.DApt;

type
  TDM = class(TDataModule)
    Conn: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    MemTable: TFDMemTable;
    Qrymanut: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

    Conexao : TConexao;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Conexao := Tconexao.Create(Conn);
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Destroy;
end;

end.
