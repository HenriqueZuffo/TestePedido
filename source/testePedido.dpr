program testePedido;

uses
  Vcl.Forms,
  formPrincipal in 'view\formPrincipal.pas' {frmPrincipal},
  dataModuleConexaoBanco in 'dataModule\dataModuleConexaoBanco.pas' {dmConexaoBanco: TDataModule},
  dataModuleBase in 'dataModule\dataModuleBase.pas' {dmBase: TDataModule},
  formBase in 'view\formBase.pas' {frmBase},
  uUtils in 'class\uUtils.pas',
  formConsultaBase in 'view\formConsultaBase.pas' {frmConsultaBase};

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
