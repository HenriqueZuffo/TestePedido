program testePedido;

uses
  Vcl.Forms,
  formPrincipal in 'view\formPrincipal.pas' {frmPrincipal},
  dataModuleConexaoBanco in 'dataModule\dataModuleConexaoBanco.pas' {dmConexaoBanco: TDataModule},
  dataModuleBase in 'dataModule\dataModuleBase.pas' {dmBase: TDataModule},
  formBase in 'view\formBase.pas' {frmBase},
  uUtils in 'class\uUtils.pas',
  formConsultaBase in 'view\formConsultaBase.pas' {frmConsultaBase},
  formCadPedido in 'view\formCadPedido.pas' {frmCadPedido},
  uClasseBase in 'class\uClasseBase.pas',
  uPedido in 'class\uPedido.pas',
  dataModulePedido in 'dataModule\dataModulePedido.pas' {dmPedido: TDataModule},
  formCadProdutoPedido in 'view\formCadProdutoPedido.pas' {frmCadProdutoPedido},
  formConsultaProduto in 'view\formConsultaProduto.pas' {frmConsultaProduto},
  formConsultaClientes in 'view\formConsultaClientes.pas' {frmConsultaClientes},
  formConsultaCPagamento in 'view\formConsultaCPagamento.pas' {frmConsultaCPagamento};

{$R *.res}
var
  codUsuario: Integer;
  nomeUsuario: string;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexaoBanco, dmConexaoBanco);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
