unit formPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage,
  formBase, formConsultaPedidos;

type
  TfrmPrincipal = class(TForm)
    pnGeral: TPanel;
    MainMenu1: TMainMenu;
    Pedido1: TMenuItem;
    pnRodape: TPanel;
    procedure Pedido1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  dataModuleConexaoBanco, formCadPedido, dataModulePedido;

{$R *.dfm}
{ TfrmPrincipal }

{ TfrmPrincipal }

procedure TfrmPrincipal.Pedido1Click(Sender: TObject);
begin
  if frmConsultaPedidos = nil then begin
    frmConsultaPedidos := TFrmConsultaPedidos.Create(Self);
  end;

  frmConsultaPedidos.Show;
end;

end.
