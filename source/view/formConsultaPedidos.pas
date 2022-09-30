unit formConsultaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  HEdit, formConsultaClientes, Vcl.Mask, HMaskEdit, dataModuleConexaoBanco,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, formCadPedido, dataModulePedido,
  formBase, uPedido, uUtils;

type
  TfrmConsultaPedidos = class(TForm)
    pnFiltros: TPanel;
    pnRodape: TPanel;
    pnGrid: TPanel;
    btnCadastrar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnFinalizar: TSpeedButton;
    btnCarregar: TSpeedButton;
    pnData: TPanel;
    lblData: TLabel;
    lbl_edt_dtFinal: TLabel;
    pnCliente: TPanel;
    lblCliente: TLabel;
    btnPesquisarCliente: TSpeedButton;
    edt_nomeCliente: THedit;
    edt_codCliente: THedit;
    rgSituacao: TRadioGroup;
    rgTipo: TRadioGroup;
    edt_dtInicial: THMaskEdit;
    edt_dtFinal: THMaskEdit;
    queryPedidos: TFDQuery;
    dsPedidos: TDataSource;
    DBGrid1: TDBGrid;
    queryPedidosNROPEDIDO: TIntegerField;
    queryPedidosDATA: TDateField;
    queryPedidosDESC_SITUACAO: TStringField;
    queryPedidosSITUACAO: TIntegerField;
    queryPedidosDESC_TIPO: TStringField;
    queryPedidosTIPO: TStringField;
    queryPedidosQTDTOTAL: TFloatField;
    queryPedidosVALTOTAL: TFloatField;
    queryPedidosCODCLIENTE: TIntegerField;
    queryPedidosNOME_CLIENTE: TStringField;
    procedure btnPesquisarClienteClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure queryPedidosAfterScroll(DataSet: TDataSet);
    procedure queryPedidosAfterOpen(DataSet: TDataSet);
    procedure queryPedidosAfterClose(DataSet: TDataSet);
    procedure btnFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPedidos: TfrmConsultaPedidos;

implementation

{$R *.dfm}

procedure TfrmConsultaPedidos.btnCadastrarClick(Sender: TObject);
var
  _FormPedido: TFrmCadPedido;
  _DmPedido: TDmPedido;
begin
  try
    _DmPedido := TdmPedido.Create(self);
    _FormPedido := TfrmCadPedido.create(Self);
    _FormPedido.dm := _DmPedido;
    _FormPedido.FormStyle := fsNormal;
    _FormPedido.Visible := False;
    _FormPedido.TipoTela := ttInserir;
    _FormPedido.AjustarTela;
    _FormPedido.ShowModal;

    btnCarregar.Click;
  finally
    FreeAndNil(_FormPedido);
  end;
end;

procedure TfrmConsultaPedidos.btnCarregarClick(Sender: TObject);
var
  i, situacao: integer;
  tipo: string;
begin
  queryPedidos.Close;
  for I := 0 to queryPedidos.Params.Count-1 do begin
    queryPedidos.Params[i].Clear;
  end;

  if ((edt_dtInicial.Text <> '')  and (edt_dtInicial.Text <> '  /  /  ')) then begin
    queryPedidos.ParamByName('DT_INI').AsDate := StrToDate(edt_dtInicial.Text);
  end;

  if ((edt_dtFinal.Text <> '') and (edt_dtFinal.Text <> '  /  /  ')) then begin
    queryPedidos.ParamByName('DT_FIM').AsDate := StrToDate(edt_dtFinal.Text);
  end;

  if edt_codCliente.Text <> '' then begin
    queryPedidos.ParamByName('CODCLIENTE').AsString := edt_codCliente.Text;
  end;
  tipo := '';
  situacao := 0;

  situacao := rgSituacao.ItemIndex + 1;
  queryPedidos.ParamByName('SITUACAO').AsInteger := situacao;

  case rgTipo.ItemIndex of
    0: tipo := 'V';
    1: tipo := 'B';
    2: tipo := 'T';
  end;
  queryPedidos.ParamByName('TIPO').AsString := tipo;
  queryPedidos.Open;
end;

procedure TfrmConsultaPedidos.btnEditarClick(Sender: TObject);
var
  _FormPedido: TFrmCadPedido;
  _DmPedido: TDmPedido;
begin
  if queryPedidosSITUACAO.AsInteger <> 1 then begin
    Exit;
  end;

  try
    _DmPedido := TdmPedido.Create(self);
    _FormPedido := TfrmCadPedido.create(Self);
    _FormPedido.FormStyle := fsNormal;
    _FormPedido.Visible := False;
    _FormPedido.dm := _DmPedido;
    _FormPedido.TipoTela := ttEditar;
    _FormPedido.nroPedido := queryPedidosNROPEDIDO.AsInteger;
    _FormPedido.AjustarTela;
    _FormPedido.ShowModal;

    btnCarregar.Click;
  finally
    FreeAndNil(_FormPedido);
  end;
end;

procedure TfrmConsultaPedidos.btnExcluirClick(Sender: TObject);
begin
  try
    dmConexaoBanco.conexaoBase.StartTransaction;
    TPedido.excluir(queryPedidosNROPEDIDO.AsInteger);
    dmConexaoBanco.conexaoBase.Commit;
  except
    on e: exception do begin
      dmConexaoBanco.conexaoBase.Rollback;
      TMessageBox.informar('Ocorreu um erro ao tentar deletar o registro: ' + sLineBreak + e.Message)
    end;
  end;
  btnCarregar.Click;
end;

procedure TfrmConsultaPedidos.btnFinalizarClick(Sender: TObject);
begin
  try
    dmConexaoBanco.conexaoBase.StartTransaction;
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQl.Clear;
    dmConexaoBanco.query.SQL.Add('update PEDIDOS set SITUACAO = 2 where NROPEDIDO = :PEDIDO');
    dmConexaoBanco.query.ParamByName('PEDIDO').AsInteger := queryPedidosNROPEDIDO.AsInteger;
    dmConexaoBanco.query.ExecSQL;
    dmConexaoBanco.conexaoBase.Commit;
  except
    on e: exception do begin
      dmConexaoBanco.conexaoBase.Rollback;
      TMessageBox.informar('Ocorreu um erro ao finalizar o pedido' + sLineBreak + e.Message);
    end;
  end;
  btnCarregar.Click;
end;

procedure TfrmConsultaPedidos.btnPesquisarClienteClick(Sender: TObject);
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
      dmConexaoBanco.query.Close;
      dmConexaoBanco.query.SQl.Clear;

      dmConexaoBanco.query.SQL.Add('select nome from clientes where CODCLIENTE = :CODCLIENTE ');
      dmConexaoBanco.query.ParamByName('CODCLIENTE').AsInteger := formConsCliente.ValueReturn;
      dmConexaoBanco.query.Open;

      edt_codCliente.Text := formConsCliente.ValueReturn;
      edt_nomeCliente.Text := dmConexaoBanco.query.FieldByName('NOME').AsString;
    end;
  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;

    FreeAndNil(formConsCliente);
  end;
end;

procedure TfrmConsultaPedidos.FormShow(Sender: TObject);
begin
  btnCarregar.Click;
end;

procedure TfrmConsultaPedidos.queryPedidosAfterClose(DataSet: TDataSet);
begin
  btnExcluir.Enabled := false;
  btnEditar.Enabled := False;
  btnFinalizar.Enabled := false;
end;

procedure TfrmConsultaPedidos.queryPedidosAfterOpen(DataSet: TDataSet);
begin
  btnEditar.Enabled := queryPedidosSITUACAO.AsInteger = 1;
  btnExcluir.Enabled := queryPedidos.RecordCount > 0;
  btnFinalizar.Enabled := Pos('ADM', UpperCase(dmConexaoBanco.UsuarioLogado)) > 0;
end;

procedure TfrmConsultaPedidos.queryPedidosAfterScroll(DataSet: TDataSet);
begin
  btnEditar.Enabled := queryPedidosSITUACAO.AsInteger = 1;
  btnFinalizar.Enabled := (Pos('ADM', UpperCase(dmConexaoBanco.UsuarioLogado)) > 0) and (queryPedidosSITUACAO.AsInteger = 1);
end;

end.
