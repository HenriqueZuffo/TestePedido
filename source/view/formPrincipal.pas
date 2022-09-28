unit formPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.DBCtrls, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    pnGeral: TPanel;
    MainMenu1: TMainMenu;
    Pedido1: TMenuItem;
    pnRodape: TPanel;
    lbl_usuarioLogado: TLabel;
    procedure Pedido1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  dataModuleConexaoBanco;

{$R *.dfm}
{ TfrmPrincipal }

{ TfrmPrincipal }

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  lbl_usuarioLogado.Caption := Format('Usuário logado: %s - %s',
    [dmConexaoBanco.codUsuarioLogado, dmConexaoBanco.usuarioLogado]);
end;

procedure TfrmPrincipal.Pedido1Click(Sender: TObject);
begin
  ShowMessage('Teste');
end;

end.
