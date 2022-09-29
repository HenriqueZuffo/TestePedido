unit formCadProdutoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, HDbEdit, dataModulePedido;

type
  TfrmCadProdutoPedido = class(TfrmBase)
    pnPedido: TPanel;
    lbl_edt_NroPedido: TLabel;
    edt_NroPedido: THDbEdit;
    pnNroItem: TPanel;
    lbl_edt_NroItem: TLabel;
    edt_NroItem: THDbEdit;
    pnProduto: TPanel;
    lblProduto: TLabel;
    btnPesquisarCliente: TSpeedButton;
    edt_NomeProduto: THDbEdit;
    edt_CodProduto: THDbEdit;
    pnQtde: TPanel;
    lbl_edt_Qtde: TLabel;
    edt_Qtde: THDbEdit;
    pnPreco: TPanel;
    lbl_edt_Preco: TLabel;
    edt_Preco: THDbEdit;
    pnPercDesconto: TPanel;
    lbl_edt_PercDesconto: TLabel;
    edt_PercDesconto: THDbEdit;
    pnValDesconto: TPanel;
    lbl_edt_ValDesconto: TLabel;
    edt_ValDesconto: THDbEdit;
    pnTotal: TPanel;
    lbl_edt_Total: TLabel;
    edt_Total: THDbEdit;
    edt_Un: THDbEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutoPedido: TfrmCadProdutoPedido;

implementation

{$R *.dfm}

end.
