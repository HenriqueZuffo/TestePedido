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
    pnCampos: TPanel;
    lbl_edt_NroPedido: TLabel;
    edt_NroPedido: THDbEdit;
    Panel1: TPanel;
    lbl_edt_Data: TLabel;
    edt_Data: THDbEdit;
    Panel2: TPanel;
    lblCliente: TLabel;
    edt_NomeCliente: THDbEdit;
    edt_CodCliente: THDbEdit;
    btnPesquisarCliente: TSpeedButton;
    rgSituacao: TDBRadioGroup;
    Panel3: TPanel;
    lbl_edtDtEntrega: TLabel;
    edt_edtDtEntrega: THDbEdit;
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

procedure TfrmCadPedido.SetTipoTela(const Value: TTipoTela);
begin
  FTipoTela := Value;
end;

end.
