unit dataModulePedido;

interface

uses
  System.SysUtils, System.Classes, dataModuleBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dataModuleConexaoBanco,
  uUtils, uPedido, Data.FMTBcd, Data.SqlExpr, Datasnap.DBClient;

type
  TdmPedido = class(TdmBase)
    queryCadastroNROPEDIDO: TIntegerField;
    queryCadastroDATA: TDateField;
    queryCadastroCODCLIENTE: TIntegerField;
    queryCadastroNOME_CLIENTE: TStringField;
    queryCadastroSITUACAO: TIntegerField;
    queryCadastroDATAENTREGA: TDateField;
    queryCadastroCODCPAGTO: TSmallintField;
    queryCadastroDESCRICAO_CPGTO: TStringField;
    queryCadastroCODFORMAPAGTO: TSmallintField;
    queryCadastroDESCRICAO_FORMAPAGTO: TStringField;
    queryCadastroQTDTOTAL: TFloatField;
    queryCadastroVALTOTAL: TFloatField;
    queryCadastroTIPO: TStringField;
    queryCadastroOBS: TStringField;
    queryProduto: TFDQuery;
    dsCadastro: TDataSource;
    dsProduto: TDataSource;
    queryProdutoNROPED_PRODS: TIntegerField;
    queryProdutoNROPEDIDO: TIntegerField;
    queryProdutoNROITEM: TIntegerField;
    queryProdutoCODPRODUTO: TStringField;
    queryProdutoDESCRICAO_PRODUTO: TStringField;
    queryProdutoQTDE: TFloatField;
    queryProdutoUN: TStringField;
    queryProdutoPRECO: TFloatField;
    queryProdutoPERCDESCONTO: TFloatField;
    queryProdutoVALDESCONTO: TFloatField;
    queryProdutoVALTOTAL: TFloatField;
    procedure queryCadastroCODCLIENTEValidate(Sender: TField);
    procedure queryCadastroCODCPAGTOValidate(Sender: TField);
    procedure queryCadastroCODFORMAPAGTOValidate(Sender: TField);
    procedure queryCadastroNewRecord(DataSet: TDataSet);
    procedure queryCadastroAfterClose(DataSet: TDataSet);
    procedure queryProdutoCODPRODUTOValidate(Sender: TField);
    procedure queryProdutoBeforePost(DataSet: TDataSet);
    procedure queryProdutoVALDESCONTOValidate(Sender: TField);
    procedure queryProdutoPRECOValidate(Sender: TField);
    procedure queryProdutoQTDEValidate(Sender: TField);
    procedure queryProdutoAfterPost(DataSet: TDataSet);
    procedure queryProdutoPERCDESCONTOValidate(Sender: TField);
  private
    FNroPedido: integer;
    procedure CalculaTotalValProduto;
    procedure TotalizaProduto;

    { Private declarations }
  public
    procedure Salvar; override;
    procedure Excluir; override;
    procedure ExcluirProduto;
    procedure SalvarProduto;
    { Public declarations }
  end;

var
  dmPedido: TdmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


procedure TdmPedido.CalculaTotalValProduto;
begin
  queryProdutoVALTOTAL.AsFloat := (queryProdutoQTDE.AsFloat * queryProdutoPRECO.AsFloat) - queryProdutoVALDESCONTO.AsCurrency;
end;

procedure TdmPedido.Excluir;
begin
  inherited;
  try
    dmConexaoBanco.conexaoBase.StartTransaction;
    TPedido.excluir(queryCadastroNROPEDIDO.AsInteger);
    dmConexaoBanco.conexaoBase.Commit;
  except
    on e: exception do begin
      dmConexaoBanco.conexaoBase.Rollback;
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TdmPedido.ExcluirProduto;
begin
  if queryProduto.RecordCount = 1 then begin
    raise Exception.Create('Não é possível excluir o produto pois o pedido irá ficar sem produto cadastrado!');
  end;

  TPedidoProduto.excluir(queryProdutoNROITEM.AsInteger);
end;

procedure TdmPedido.queryCadastroAfterClose(DataSet: TDataSet);
begin
  inherited;
  queryProduto.close;
end;

procedure TdmPedido.queryCadastroCODCLIENTEValidate(Sender: TField);
begin
  inherited;
  queryCadastroNOME_CLIENTE.Clear;

  if Sender.AsInteger = 0 then begin
    Exit;
  end;

  try
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;

    dmConexaoBanco.query.SQL.Add('select nome from clientes where CODCLIENTE = :CODCLIENTE');
    dmConexaoBanco.query.ParamByName('CODCLIENTE').AsInteger := sender.AsInteger;
    dmConexaoBanco.query.Open;

    if dmConexaoBanco.query.IsEmpty then begin
      TMessageBox.informar('Cliente não cadastrado');
      Abort;
    end;

    queryCadastroNOME_CLIENTE.AsString := dmConexaoBanco.query.FieldByName('NOME').AsString;
  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
  end;
end;

procedure TdmPedido.queryCadastroCODCPAGTOValidate(Sender: TField);
begin
  inherited;
  queryCadastroDESCRICAO_CPGTO.Clear;

  if Sender.AsInteger = 0 then begin
    Exit;
  end;

  try
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;

    dmConexaoBanco.query.SQL.Add('select descricao from cpagto where CODCPAGTO = :CODCPAGTO');
    dmConexaoBanco.query.ParamByName('CODCPAGTO').AsInteger := sender.AsInteger;
    dmConexaoBanco.query.Open;

    if dmConexaoBanco.query.IsEmpty then begin
      TMessageBox.informar('C. Pagamento não cadastrado');
      Abort;
    end;

    queryCadastroDESCRICAO_CPGTO.AsString := dmConexaoBanco.query.FieldByName('DESCRICAO').AsString;
  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
  end;
end;

procedure TdmPedido.queryCadastroCODFORMAPAGTOValidate(Sender: TField);
begin
  inherited;
  queryCadastroDESCRICAO_FORMAPAGTO.Clear;

  if Sender.AsInteger = 0 then begin
    Exit;
  end;

  try
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;

    dmConexaoBanco.query.SQL.Add('select descricao from formapagto where CODFORMAPAGTO = :CODFORMAPAGTO');
    dmConexaoBanco.query.ParamByName('CODFORMAPAGTO').AsInteger := sender.AsInteger;
    dmConexaoBanco.query.Open;

    if dmConexaoBanco.query.IsEmpty then begin
      TMessageBox.informar('Forma Pagamento não cadastrado');
      Abort;
    end;

    queryCadastroDESCRICAO_FORMAPAGTO.AsString := dmConexaoBanco.query.FieldByName('DESCRICAO').AsString;
  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
  end;
end;

procedure TdmPedido.queryCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  queryCadastroDATA.AsDateTime := dmConexaoBanco.GetDataServer;
  queryCadastroDATAENTREGA.AsDateTime := dmConexaoBanco.GetDataServer + 7;
  queryCadastroNROPEDIDO.AsInteger := 0;
  queryCadastroSITUACAO.AsInteger := 1;
  queryCadastroTIPO.AsString := 'V';
end;

procedure TdmPedido.queryProdutoAfterPost(DataSet: TDataSet);
begin
  inherited;
  TotalizaProduto;
end;

procedure TdmPedido.queryProdutoBeforePost(DataSet: TDataSet);
begin
  inherited;
  CalculaTotalValProduto;

  if queryProdutoNROPEDIDO.IsNull then begin
    queryProdutoNROPEDIDO.AsInteger := queryCadastroNROPEDIDO.AsInteger;
  end;

  if queryProdutoNROPED_PRODS.IsNull then begin
    queryProdutoNROPED_PRODS.AsInteger := 0;
  end;

  if queryProdutoNROITEM.IsNull then begin
    queryProdutoNROITEM.AsInteger := 0;
  end;
end;

procedure TdmPedido.queryProdutoCODPRODUTOValidate(Sender: TField);
begin
  inherited;
  if Sender.AsString = '' then begin
    queryProdutoDESCRICAO_PRODUTO.Clear;
    queryProdutoUN.Clear;
    queryProdutoPRECO.Clear;
    Exit;
  end;

  try
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add('select PRODUTO, UN, PRECOVENDA from PRODUTOS where TRIM(CODPRODUTO) = TRIM(:CODPRODUTO) and SITUACAO = ''A'' ');
    dmConexaoBanco.query.ParamByName('CODPRODUTO').AsString := Sender.AsString;
    dmConexaoBanco.query.Open;


    if dmConexaoBanco.query.IsEmpty then begin
      TMessageBox.informar('Produto não cadastrado ou não está ativo!');
      abort;
    end;

    queryProdutoDESCRICAO_PRODUTO.AsString := dmConexaoBanco.query.FieldByName('PRODUTO').AsString;
    queryProdutoUN.AsString := dmConexaoBanco.query.FieldByName('UN').AsString;
    queryProdutoPRECO.AsFloat := dmConexaoBanco.query.FieldByName('PRECOVENDA').AsFloat;
  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
  end;
end;

procedure TdmPedido.queryProdutoPERCDESCONTOValidate(Sender: TField);
begin
  inherited;
  queryProdutoVALDESCONTO.AsFloat := getValorByPercentual(queryProdutoQTDE.AsFloat * queryProdutoPRECO.AsFloat, Sender.AsFloat);
end;

procedure TdmPedido.queryProdutoPRECOValidate(Sender: TField);
begin
  inherited;
  CalculaTotalValProduto;
end;

procedure TdmPedido.queryProdutoQTDEValidate(Sender: TField);
begin
  inherited;
  CalculaTotalValProduto;
end;

procedure TdmPedido.queryProdutoVALDESCONTOValidate(Sender: TField);
begin
  inherited;
  CalculaTotalValProduto;

  try
    queryProdutoPERCDESCONTO.OnValidate := nil;
    queryProdutoPERCDESCONTO.AsFloat := getPercentualByValor(queryProdutoQTDE.AsFloat * queryProdutoPRECO.AsFloat, Sender.AsFloat);
  finally
    queryProdutoPERCDESCONTO.OnValidate := queryProdutoPERCDESCONTOValidate;
  end;
end;

procedure TdmPedido.Salvar;
var
  pedido: TPedido;
  produtos: TPedidoProduto;
begin
  inherited;
  if (queryCadastro.State in [dsEdit, dsInsert]) then
    queryCadastro.Post;

  if (queryProduto.State in [dsEdit, dsInsert]) then
    queryProduto.Post;

  if queryProduto.RecordCount <= 0 then begin
    raise Exception.Create('Para salvar o pedido é necessário informar os produtos!');
  end;

  pedido := nil;
  try
    pedido := TPedido.Create;

    pedido.nropedido := queryCadastroNROPEDIDO.AsInteger;
    pedido.data := queryCadastroDATA.AsDateTime;
    pedido.codcliente := queryCadastroCODCLIENTE.AsInteger;
    pedido.situacao := queryCadastroSITUACAO.AsInteger;
    pedido.dataEntrega := queryCadastroDATAENTREGA.AsDateTime;
    pedido.codcpagto := queryCadastroCODCPAGTO.AsInteger;
    pedido.codformapagto := queryCadastroCODFORMAPAGTO.AsInteger;
    pedido.qtdetotal := queryCadastroQTDTOTAL.AsFloat;
    pedido.valtotal := queryCadastroVALTOTAL.AsFloat;
    pedido.tipo := queryCadastroTIPO.AsString;
    pedido.obs := queryCadastroOBS.AsString;

    queryProduto.DisableControls;
    queryProduto.First;
    while not queryProduto.Eof do begin
      produtos := TPedidoProduto.Create;

      produtos.nroped_prods := queryProdutoNROPED_PRODS.AsInteger;
      produtos.nropedido := queryProdutoNROPEDIDO.AsInteger;
      produtos.nroitem := queryProdutoNROITEM.AsInteger;
      produtos.codproduto := queryProdutoCODPRODUTO.AsString;
      produtos.qtde := queryProdutoQTDE.AsFloat;
      produtos.un := queryProdutoUN.AsString;
      produtos.preco := queryProdutoPRECO.AsFloat;
      produtos.percdesconto := queryProdutoPERCDESCONTO.AsFloat;
      produtos.valdesconto := queryProdutoVALDESCONTO.AsFloat;
      produtos.valtotal := queryProdutoVALTOTAL.AsFloat;

      pedido.Produtos.Add(produtos);

      queryProduto.Next;
    end;

    try
      dmConexaoBanco.conexaoBase.StartTransaction;
      pedido.Salvar;
      dmConexaoBanco.conexaoBase.Commit;
    except
      on e: exception do begin
        dmConexaoBanco.conexaoBase.Rollback;
        raise Exception.Create(e.Message);
      end;
    end;

  finally
    if pedido <> nil then begin
      FreeAndNil(pedido);
    end;
  end;
end;

procedure TdmPedido.SalvarProduto;
var
  produto: TPedidoProduto;
begin
  if queryCadastroNROPEDIDO.AsInteger > 0 then begin
    produto := TPedidoProduto.Create;
    try
      produto.nroped_prods := queryProdutoNROPED_PRODS.AsInteger;
      produto.nropedido := queryProdutoNROPEDIDO.AsInteger;
      produto.nroitem := queryProdutoNROITEM.AsInteger;
      produto.codproduto := queryProdutoCODPRODUTO.AsString;
      produto.qtde := queryProdutoQTDE.AsFloat;
      produto.un := queryProdutoUN.AsString;
      produto.preco := queryProdutoPRECO.AsFloat;
      produto.percdesconto := queryProdutoPERCDESCONTO.AsFloat;
      produto.valdesconto := queryProdutoVALDESCONTO.AsFloat;
      produto.valtotal := queryProdutoVALTOTAL.AsFloat;

      try
        dmConexaoBanco.conexaoBase.StartTransaction;
        produto.Salvar;
        dmConexaoBanco.conexaoBase.Commit;
      except
        on e: exception do begin
          dmConexaoBanco.conexaoBase.Rollback;
          raise Exception.Create('Ocorreu um erro ao tentar salvar o produto: ' + sLineBreak + e.Message);
        end;
      end;
    finally
      FreeAndNil(produto);
    end;
  end else begin
    queryProduto.Post;
  end;

end;

procedure TdmPedido.TotalizaProduto;
var
  oldBookMark: TBookmark;
  valTotal, qtdeTotal: double;
begin
  try
    oldBookMark := queryProduto.Bookmark;
    queryProduto.DisableControls;

    valTotal := 0;
    qtdeTotal := 0;

    queryProduto.First;
    while not queryProduto.Eof do begin
      valTotal := valTotal + queryProdutoVALTOTAL.AsFloat;
      qtdeTotal := qtdeTotal + queryProdutoQTDE.AsFloat;

      queryProduto.Next;
    end;

    queryCadastro.Edit;
    queryCadastroVALTOTAL.AsFloat := valTotal;
    queryCadastroQTDTOTAL.AsFloat := qtdeTotal;
    queryCadastro.Post;
  finally
    queryProduto.GotoBookmark(oldBookMark);
    queryProduto.EnableControls;
  end;
end;

end.
