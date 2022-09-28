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

end.
