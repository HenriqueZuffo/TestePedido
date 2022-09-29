unit formCadPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formBase, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, HDbEdit;

type
  TTipoTela = (ttInserir, ttEditar);

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
    pnProdutos: TPanel;
    pnObservacoes: TPanel;
    lbl_mm_Observacoes: TLabel;
    mm_Observacoes: TDBMemo;
    procedure mm_ObservacoesDblClick(Sender: TObject);
  private
    FTipoTela: TTipoTela;
    procedure SetTipoTela(const Value: TTipoTela);
    { Private declarations }
  public
    property TipoTela: TTipoTela read FTipoTela write SetTipoTela;
    { Public declarations }
  end;

var
  frmCadPedido: TfrmCadPedido;

implementation

{$R *.dfm}

{ TfrmCadPedido }

procedure TfrmCadPedido.mm_ObservacoesDblClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadPedido.SetTipoTela(const Value: TTipoTela);
begin
  FTipoTela := Value;
end;

end.
