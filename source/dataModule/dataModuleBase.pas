unit dataModuleBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmBase = class(TDataModule)
    queryCadastro: TFDQuery;
  private
    { Private declarations }
  public
    procedure Salvar; virtual; abstract;
    procedure Excluir; virtual; abstract;
    { Public declarations }
  end;

var
  dmBase: TdmBase;

implementation

uses
  dataModuleConexaoBanco;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
