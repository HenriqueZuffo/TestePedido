unit formCadPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, HDbEdit, Data.DB, Vcl.Grids, Vcl.DBGrids,
  formCadProdutoPedido, dataModulePedido, uPedido, formConsultaClientes;

type
  TfrmCadPedido = class(TfrmBase)
    pnTopGeral: TPanel;
    pnPedido: TPanel;
    lbl_edt_NroPedido: TLabel;
    edt_NroPedido: THDbEdit;
    pnData: TPanel;
    lbl_edt_Data: TLabel;
    edt_Data: THDbEdit;
    pnCliente: TPanel;
    lblCliente: TLabel;
    edt_NomeCliente: THDbEdit;
    edt_CodCliente: THDbEdit;
    btnPesquisarCliente: TSpeedButton;
    pnDataEntrega: TPanel;
    lbl_edtDtEntrega: TLabel;
    edt_edtDtEntrega: THDbEdit;
    pnFormaPagamento: TPanel;
    lbl_formaPagamento: TLabel;
    btnPesquisarFormaPagamento: TSpeedButton;
    edt_nomeFormaPagamento: THDbEdit;
    edt_codFormaPagamento: THDbEdit;
    pnCPagamento: TPanel;
    lbl_cPagamento: TLabel;
    btnPesquisarCPagamento: TSpeedButton;
    edt_NomeCPagamento: THDbEdit;
    edt_codCPagamento: THDbEdit;
    pnQtdTotal: TPanel;
    lbl_edt_qtdTotal: TLabel;
    edt_qtdTotal: THDbEdit;
    pnVlrTotal: TPanel;
    lbl_edt_VlrTotal: TLabel;
    edt_VlrTotal: THDbEdit;
    rgSituacao: TRadioGroup;
    rgTipo: TRadioGroup;
    pnObservacoes: TPanel;
    lbl_mm_Observacoes: TLabel;
    mm_Observacoes: TDBMemo;
    gbProdutos: TGroupBox;
    pnProdutos: TPanel;
    dbgridProdutos: TDBGrid;
    pnBotoesGrid: TPanel;
    btnExcluirProduto: TSpeedButton;
    btnEditarProduto: TSpeedButton;
    btnIncluirProduto: TSpeedButton;
    procedure btnIncluirProdutoClick(Sender: TObject);
    procedure btnEditarProdutoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnPesquisarClienteClick(Sender: TObject);
  private
    FNroPedido: integer;
    { Private declarations }
  public
    property nroPedido: integer read FNroPedido write FNroPedido;
    procedure AjustarTela;
    { Public declarations }
  end;

var
  frmCadPedido: TfrmCadPedido;

implementation

{$R *.dfm}

{ TfrmCadPedido }


procedure TfrmCadPedido.AjustarTela;
begin
  if Self.TipoTela = ttEditar then begin
    TPedido.buscarPedido(nroPedido, TdmPedido(self.Dm).queryCadastro);
    TPedidoProduto.BuscarProdutos(nroPedido, TdmPedido(self.Dm).queryProduto);
  end else if Self.TipoTela = ttInserir then begin
    TdmPedido(self.Dm).queryCadastro.Open;
    TdmPedido(self.Dm).queryCadastro.EmptyDataSet;
    TdmPedido(self.Dm).queryCadastro.Append;

    TdmPedido(self.Dm).queryProduto.Open;
    TdmPedido(self.Dm).queryProduto.EmptyDataSet;
  end;
end;

procedure TfrmCadPedido.btnConfirmarClick(Sender: TObject);
begin
  if not (TdmPedido(Self.Dm).queryCadastro.State in [dsEdit, dsInsert]) then
    TdmPedido(Self.Dm).queryCadastro.Edit;

  TdmPedido(Self.Dm).queryCadastroSITUACAO.AsInteger := rgSituacao.ItemIndex + 1;
  case rgTipo.ItemIndex of
    0: TdmPedido(Self.Dm).queryCadastroTIPO.AsString := 'V';
    1: TdmPedido(Self.Dm).queryCadastroTIPO.AsString := 'B';
    2: TdmPedido(Self.Dm).queryCadastroTIPO.AsString := 'T';
  end;
  inherited;
end;

procedure TfrmCadPedido.btnEditarProdutoClick(Sender: TObject);
var
  FormProduto: TFrmCadProdutoPedido;
begin
  inherited;
  try
    TdmPedido(Self.dm).queryProduto.edit;

    FormProduto := TFrmCadProdutoPedido.Create(Self);
    FormProduto.Dm := Self.Dm;
    FormProduto.formStyle := fsNormal;
    FormProduto.visible := False;

    FormProduto.ShowModal;
  finally
    FreeAndNil(formProduto);
  end;
end;

procedure TfrmCadPedido.btnIncluirProdutoClick(Sender: TObject);
var
  FormProduto: TFrmCadProdutoPedido;
begin
  inherited;
  try
    TdmPedido(Self.dm).queryProduto.Append;

    FormProduto := TFrmCadProdutoPedido.Create(Self);
    FormProduto.Dm := Self.Dm;
    FormProduto.formStyle := fsNormal;
    FormProduto.visible := False;

    FormProduto.ShowModal;
  finally
    FreeAndNil(formProduto);
  end;
end;

procedure TfrmCadPedido.btnPesquisarClienteClick(Sender: TObject);
var
  formConsCliente: TfrmConsultaClientes;
begin
  inherited;
  formConsCliente := TfrmConsultaClientes.Create(Self);
  try
    formConsCliente.FormStyle := fsNormal;
    formConsCliente.Visible := false;
    formConsCliente.ShowModal;

    if formConsCliente.ValueReturn > 0 then begin
      if not (TdmPedido(Self.Dm).queryCadastro.State in [dsEdit, dsInsert]) then
        TdmPedido(Self.Dm).queryCadastro.Edit;

      TdmPedido(Self.dm).queryCadastroCODCLIENTE.AsInteger := formConsCliente.ValueReturn;
    end;
  finally
    FreeAndNil(formConsCliente);
  end;
end;

end.
