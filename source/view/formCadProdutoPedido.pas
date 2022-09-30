unit formCadProdutoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, HDbEdit, dataModulePedido, uUtils,
  formConsultaProduto;

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
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnPesquisarClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutoPedido: TfrmCadProdutoPedido;

implementation

{$R *.dfm}

procedure TfrmCadProdutoPedido.btnCancelarClick(Sender: TObject);
begin
  TdmPedido(self.Dm).queryProduto.cancel;
  self.close;
end;

procedure TfrmCadProdutoPedido.btnConfirmarClick(Sender: TObject);
begin
  if TMessageBox.confirmar('Deseja salvar este registro?', moNao, miPergunta) = moNao then Exit;

  try
     TdmPedido(self.Dm).SalvarProduto;
  except
    on e: exception do begin
      TMessageBox.informar('Ocorreu um erro ao tentar salvar o registro: ' + slineBreak + e.Message);
      abort;
    end;
  end;
  TMessageBox.informar('Registro salvo com sucesso');
  self.close;
end;

procedure TfrmCadProdutoPedido.btnExcluirClick(Sender: TObject);
begin
  if TMessageBox.confirmar('Deseja excluir este registro?', moNao, miPergunta) = moNao then Exit;

  try
    TdmPedido(self.Dm).ExcluirProduto;
  except
    on e: exception do begin
      TMessageBox.informar('Ocorreu um erro ao tentar excluir o registro: ' + slineBreak + e.Message);
      abort;
    end;
  end;

  TMessageBox.informar('Registro excluído com sucesso');
  self.close;
end;

procedure TfrmCadProdutoPedido.btnPesquisarClienteClick(Sender: TObject);
var
  FormConsultaProd: TFrmConsultaProduto;
begin
  inherited;
  FormConsultaProd := TFrmConsultaProduto.Create(Self);
  try
    FormConsultaProd.formStyle := fsNormal;
    FormConsultaProd.Visible := false;
    FormConsultaProd.ShowModal;

    if FormConsultaProd.ValueReturn <> '' then begin
      TdmPedido(self.Dm).queryProdutoCODPRODUTO.AsString := FormConsultaProd.ValueReturn;
    end;
  finally
    FreeAndNil(FormConsultaProd);
  end;
end;

procedure TfrmCadProdutoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited
end;

procedure TfrmCadProdutoPedido.FormDestroy(Sender: TObject);
begin
  //inherited;

end;

end.
