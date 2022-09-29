unit dataModuleConexaoBanco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmConexaoBanco = class(TDataModule)
    conexaoBase: TFDConnection;
    query: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FUsuarioLogado: string;
    FcodUsuarioLogado: integer;
    { Private declarations }
  public
    property codUsuarioLogado: integer read FcodUsuarioLogado write FcodUsuarioLogado;
    property usuarioLogado: string read FUsuarioLogado write FUsuarioLogado;
    function GetDataServer: TDate;
    { Public declarations }

  end;

var
  dmConexaoBanco: TdmConexaoBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmConexaoBanco.DataModuleCreate(Sender: TObject);
begin
  conexaoBase.Connected := false;
  conexaoBase.Open;
end;

function TdmConexaoBanco.GetDataServer: TDate;
begin
  try
    query.close;
    query.SQL.Clear;
    query.SQL.Add('SELECT current_date FROM RDB$DATABASE');
    query.Open;

    Result := query.Fields[0].AsDateTime;
  finally
    query.Close;
    query.sql.Clear;
  end;
end;

end.
