unit uPedido;


interface

uses
  uClasseBase, dataModuleConexaoBanco, uUtils, System.Generics.Collections, FireDAC.Comp.Client,
  System.DateUtils;


type
  TTipoExclusaoProduto = (tpProduto, tpPedido);

  TPedidoProduto = class(TBase)
  private
    FUn: string;
    FNroPedido: integer;
    FPercdesconto: double;
    FPreco: double;
    FValdesconto: double;
    FNroitem: integer;
    FQtde: double;
    FValtotal: double;
    FCodproduto: string;
    Fnroped_prods: integer;

  public
    property nroped_prods: integer read Fnroped_prods write Fnroped_prods;
    property nropedido: integer read FNroPedido write FNroPedido;
    property nroitem: integer read FNroitem write FNroitem;
    property codproduto: string read FCodproduto write FCodproduto;
    property qtde: double read FQtde write FQtde;
    property un: string read FUn write FUn;
    property preco: double read FPreco write FPreco;
    property percdesconto: double read FPercdesconto write FPercdesconto;
    property valdesconto: double read FValdesconto write FValdesconto;
    property valtotal: double read FValtotal write FValtotal;

    procedure Salvar; override;
    class procedure excluir(const codigo: integer; tipoExclusao: TTipoExclusaoProduto = tpProduto); overload;
    class procedure BuscarProdutos(const nroPedido: Integer; query: TFDQuery);
    function Validar: string;
  end;

  TPedido = class(TBase)
  private
    FObs: string;
    FCodCliente: integer;
    FNroPedido: integer;
    FDataEntrega: TDate;
    FCodcpagto: integer;
    FSituacao: integer;
    FValtotal: double;
    FTipo: string;
    FData: TDate;
    FQtdetotal: double;
    FCodformapagto: integer;
    FProdutos: TList<TPedidoProduto>;

  public

    property nropedido: integer read FNroPedido write FNroPedido;
    property data: TDate read FData write FData;
    property codcliente: integer read FCodCliente write FCodCliente;
    property situacao: integer read FSituacao write FSituacao;
    property dataEntrega: TDate read FDataEntrega write FDataEntrega;
    property codcpagto: integer read FCodcpagto write FCodcpagto;
    property codformapagto: integer read FCodformapagto write FCodformapagto;
    property qtdetotal: double read FQtdetotal write FQtdetotal;
    property valtotal: double read FValtotal write FValtotal;
    property tipo: string read FTipo write FTipo;
    property obs: string read FObs write FObs;

    property Produtos: TList<TPedidoProduto> read FProdutos write FProdutos;

    procedure Salvar; override;
    class procedure excluir(const codigo: integer); override;
    class procedure buscarPedido(const nroPedido: integer; query: TFDQuery);
    function Validar: string;

    constructor Create;
    destructor destroy;


  end;


implementation

uses
  System.SysUtils;


{ TPedido }

class procedure TPedido.buscarPedido(const nroPedido: integer; query: TFDQuery);
const _Query = 'SELECT P.NROPEDIDO, '+//
               '       P.DATA,'+//
               '       P.CODCLIENTE,'+//
               '       C.NOME AS NOME_CLIENTE,'+//
               '       P.SITUACAO,'+//
               '       P.DATAENTREGA,'+//
               '       P.CODCPAGTO,'+//
               '       pgto.DESCRICAO AS descricao_cpgto,'+//
               '       P.CODFORMAPAGTO,'+//
               '       f.DESCRICAO AS descricao_formapagto,'+//
               '       P.QTDTOTAL,'+//
               '       P.VALTOTAL,'+//
               '       P.TIPO,'+//
               '       P.OBS'+//
               '  FROM PEDIDOS P'+//
               '  JOIN CLIENTES C ON C.CODCLIENTE = P.CODCLIENTE'+//
               '  JOIN CPAGTO pgto ON pgto.CODCPAGTO = p.CODCPAGTO'+//
               '  LEFT JOIN FORMAPAGTO f ON f.CODFORMAPAGTO = p.CODFORMAPAGTO'+//
               ' WHERE p.NROPEDIDO = :NROPEDIDO';
begin
  try
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add(_Query);
    dmConexaoBanco.query.ParamByName('NROPEDIDO').AsInteger := nroPedido;
    dmConexaoBanco.query.Open;

    dmConexaoBanco.query.First;
    while not dmConexaoBanco.query.Eof do begin
      query.Append;
      query.FieldByName('NROPEDIDO').AsInteger := dmConexaoBanco.query.FieldByName('NROPEDIDO').AsInteger;
      query.FieldByName('DATA').AsDateTime := dmConexaoBanco.query.FieldByName('DATA').AsDateTime;
      query.FieldByName('CODCLIENTE').AsInteger := dmConexaoBanco.query.FieldByName('CODCLIENTE').AsInteger;
      query.FieldByName('NOME_CLIENTE').AsString := dmConexaoBanco.query.FieldByName('NOME_CLIENTE').AsString;
      query.FieldByName('SITUACAO').AsInteger := dmConexaoBanco.query.FieldByName('SITUACAO').AsInteger;
      query.FieldByName('DATAENTREGA').AsDateTime := dmConexaoBanco.query.FieldByName('DATAENTREGA').AsDateTime;
      query.FieldByName('CODCPAGTO').AsInteger := dmConexaoBanco.query.FieldByName('CODCPAGTO').AsInteger;
      query.FieldByName('descricao_cpgto').AsString := dmConexaoBanco.query.FieldByName('descricao_cpgto').AsString;
      query.FieldByName('CODFORMAPAGTO').AsInteger := dmConexaoBanco.query.FieldByName('CODFORMAPAGTO').AsInteger;
      query.FieldByName('descricao_formapagto').AsString := dmConexaoBanco.query.FieldByName('descricao_formapagto').AsString;
      query.FieldByName('QTDTOTAL').AsFloat := dmConexaoBanco.query.FieldByName('QTDTOTAL').AsFloat;
      query.FieldByName('VALTOTAL').AsFloat := dmConexaoBanco.query.FieldByName('VALTOTAL').AsFloat;
      query.FieldByName('TIPO').AsString := dmConexaoBanco.query.FieldByName('TIPO').AsString;
      query.FieldByName('OBS').AsString := dmConexaoBanco.query.FieldByName('OBS').AsString;
      query.post;

      dmConexaoBanco.query.Next;
    end;
  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
  end;
end;

constructor TPedido.Create;
begin
  Produtos := TList<TPedidoProduto>.Create;
end;

destructor TPedido.destroy;
begin
  FreeAndNil(Produtos);
end;

class procedure TPedido.excluir(const codigo: integer);
const deletePedido = 'delete from PEDIDOS where nropedido = :pedido';
begin
  inherited;
  try
    TPedidoProduto.excluir(codigo, tpPedido);

    dmConexaoBanco.query.close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add(deletePedido);
    dmConexaoBanco.query.ParamByName('PEDIDO').AsInteger := codigo;
    dmConexaoBanco.query.ExecSQL;
  except
    on e: exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TPedido.Salvar;
const insertOrUpdate = '	UPDATE or INSERT INTO PEDIDOS ' + 
	                     ' (NROPEDIDO, DATA, CODCLIENTE, SITUACAO, DATAENTREGA, CODCPAGTO, CODFORMAPAGTO, QTDTOTAL, VALTOTAL, TIPO, OBS) ' +
	                     ' VALUES(:NROPEDIDO, :DATA, :CODCLIENTE, :SITUACAO, :DATAENTREGA, :CODCPAGTO, :CODFORMAPAGTO, :QTDTOTAL, :VALTOTAL, :TIPO, :OBS) ' +
	                     ' matching(NROPEDIDO) ' +
	                     ' RETURNing NROPEDIDO';
var
  msgValidacao: string;
  i, codPedProds: integer;
begin
  inherited;
  msgValidacao := self.Validar;

  try
    if msgValidacao <> '' then begin
      raise Exception.Create(msgValidacao);
    end;

    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add(insertOrUpdate);

    for I := 0 to dmConexaoBanco.query.Params.Count-1 do begin
      dmConexaoBanco.query.Params[i].Clear;
    end;

    dmConexaoBanco.query.ParamByName('NROPEDIDO').AsInteger := self.nropedido;
    dmConexaoBanco.query.ParamByName('DATA').AsDate := self.data;
    dmConexaoBanco.query.ParamByName('CODCLIENTE').AsInteger := self.codcliente;
    dmConexaoBanco.query.ParamByName('SITUACAO').AsInteger := self.situacao;
    dmConexaoBanco.query.ParamByName('DATAENTREGA').AsDate := self.dataEntrega;
    dmConexaoBanco.query.ParamByName('CODCPAGTO').AsInteger := self.codcpagto;
    dmConexaoBanco.query.ParamByName('CODFORMAPAGTO').AsInteger := self.codformapagto;
    dmConexaoBanco.query.ParamByName('QTDTOTAL').AsFloat := self.qtdetotal;
    dmConexaoBanco.query.ParamByName('VALTOTAL').AsFloat := Self.valtotal;
    dmConexaoBanco.query.ParamByName('TIPO').AsString := self.tipo;
    dmConexaoBanco.query.ParamByName('OBS').AsString := self.obs;
    try
      dmConexaoBanco.query.Open;

      self.nropedido := dmConexaoBanco.query.Fields[0].AsInteger;
    finally
      dmConexaoBanco.query.SQL.Clear;
      dmConexaoBanco.query.Close;
    end;

    codPedProds := 0;
    for I := 0 to Produtos.Count-1 do begin
      if ((Produtos[i].nroped_prods = 0) and (codPedProds > 0)) then begin
        Produtos[i].nroped_prods := codPedProds;
      end;

      Produtos[i].nropedido := self.nropedido;
      Produtos[i].Salvar;

      codPedProds := Produtos[i].nroped_prods;
    end;
  except
    on e: Exception do begin
      raise Exception.Create(e.Message);
    end;                                
  end;
end;

function TPedido.Validar: string;
begin
  Result := '';
  if not TValidaValores.valorValido(self.situacao, [1, 2]) then begin
    Result := 'Situação não preenchida ou valor informado não é valido!';
    exit;
  end;

  if not TValidaValores.valorValido(self.situacao, [1, 2]) then begin
    Result := 'Situação não preenchida ou valor informado é inválido!';
    exit;
  end;

  if not TValidaValores.valorValido(self.tipo, ['V', 'B', 'T']) then begin
    Result := 'Tipo não preenchido ou valor informado é inválido!';
    exit;
  end;

  if not TValidaValores.valorValido(self.codcliente) then begin
    Result := montarMsgCampoObrigatorio('Cliente');
    exit;
  end;

  if not TValidaValores.valorValido(self.codcpagto) then begin
    Result := montarMsgCampoObrigatorio('C. Pagamamento');
    exit;
  end;
end;

{ TPedidoProduto }

class procedure TPedidoProduto.BuscarProdutos(const nroPedido: Integer;
  query: TFDQuery);
const _Query = 'SELECT p.NROPED_PRODS, '+//
               '       p.NROPEDIDO,'+//
               '       p.NROITEM,'+//
               '       p.CODPRODUTO,'+//
               '       prod.PRODUTO  AS descricao_produto,'+//
               '       p.QTDE,'+//
               '       p.UN,'+//
               '       p.PRECO,'+//
               '       p.PERCDESCONTO,'+//
               '       p.VALDESCONTO,'+//
               '       p.VALTOTAL'+//
               '  FROM PED_PRODS p'+//
               '  JOIN PRODUTOS prod ON prod.CODPRODUTO = p.CODPRODUTO'+//
               ' WHERE p.NROPEDIDO  = :NROPEDIDO';
begin
  try
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add(_Query);
    dmConexaoBanco.query.ParamByName('NROPEDIDO').AsInteger := nroPedido;
    dmConexaoBanco.query.Open;

    dmConexaoBanco.query.First;
    while not dmConexaoBanco.query.Eof do begin
      query.Append;
      query.FieldByName('NROPED_PRODS').AsInteger := dmConexaoBanco.query.FieldByName('NROPED_PRODS').AsInteger;
      query.FieldByName('NROPEDIDO').AsInteger := dmConexaoBanco.query.FieldByName('NROPEDIDO').AsInteger;
      query.FieldByName('NROITEM').AsInteger := dmConexaoBanco.query.FieldByName('NROITEM').AsInteger;
      query.FieldByName('CODPRODUTO').AsString := dmConexaoBanco.query.FieldByName('CODPRODUTO').AsString;
      query.FieldByName('descricao_produto').AsString := dmConexaoBanco.query.FieldByName('descricao_produto').AsString;
      query.FieldByName('QTDE').AsFloat := dmConexaoBanco.query.FieldByName('QTDE').AsFloat;
      query.FieldByName('UN').AsString := dmConexaoBanco.query.FieldByName('UN').AsString;
      query.FieldByName('PRECO').AsFloat := dmConexaoBanco.query.FieldByName('PRECO').AsFloat;
      query.FieldByName('PERCDESCONTO').AsFloat := dmConexaoBanco.query.FieldByName('PERCDESCONTO').AsFloat;
      query.FieldByName('VALDESCONTO').AsFloat := dmConexaoBanco.query.FieldByName('VALDESCONTO').AsFloat;
      query.FieldByName('VALTOTAL').AsFloat := dmConexaoBanco.query.FieldByName('VALTOTAL').AsFloat;
      query.post;

      dmConexaoBanco.query.Next;
    end;
  finally
    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
  end;
end;

class procedure TPedidoProduto.excluir(const codigo: integer; tipoExclusao: TTipoExclusaoProduto = tpProduto);
const
  deleteProdutos = 'delete from ped_prods where ';
  whereProduto = ' nroitem = :codigo';
  wherePedido = ' nropedido = :codigo';
begin
  inherited;
  try
    dmConexaoBanco.query.close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add(deleteProdutos + iif(tipoExclusao = tpProduto, whereProduto, wherePedido));
    dmConexaoBanco.query.ParamByName('CODIGO').AsInteger := codigo;
    dmConexaoBanco.query.ExecSQL;
  except
    on e: exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TPedidoProduto.Salvar;
const insertOrUpdateProduto = ' UPDATE OR INSERT INTO PED_PRODS ' + //
                              ' (NROPED_PRODS, NROPEDIDO, NROITEM, CODPRODUTO, QTDE, UN, PRECO, PERCDESCONTO, VALDESCONTO, VALTOTAL) ' +//
                              ' VALUES(:NROPED_PRODS, :NROPEDIDO, :NROITEM, :CODPRODUTO, :QTDE, :UN, :PRECO, :PERCDESCONTO, :VALDESCONTO, :VALTOTAL)' +//
                              ' matching(NROPED_PRODS, NROITEM)' + //
                              ' returning NROPED_PRODS';
var
  msgValidacao: string;
  i: integer;
begin
  inherited;
  if self.nropedido = 0 then begin
    Exit;
  end;

  msgValidacao := self.Validar;

  try
    if msgValidacao <> '' then begin
      raise Exception.Create(msgValidacao);
    end;

    dmConexaoBanco.query.Close;
    dmConexaoBanco.query.SQL.Clear;
    dmConexaoBanco.query.SQL.Add(insertOrUpdateProduto);

    for I := 0 to dmConexaoBanco.query.Params.Count-1 do begin
      dmConexaoBanco.query.Params[i].Clear;
    end;

    dmConexaoBanco.query.ParamByName('NROPED_PRODS').AsInteger := self.nroped_prods;
    dmConexaoBanco.query.ParamByName('NROPEDIDO').AsInteger := self.nropedido;
    dmConexaoBanco.query.ParamByName('NROITEM').AsInteger := self.nroitem;
    dmConexaoBanco.query.ParamByName('CODPRODUTO').AsString := self.codproduto;
    dmConexaoBanco.query.ParamByName('QTDE').AsFloat := self.qtde;
    dmConexaoBanco.query.ParamByName('UN').AsString := self.un;
    dmConexaoBanco.query.ParamByName('PRECO').AsFloat := self.preco;
    dmConexaoBanco.query.ParamByName('PERCDESCONTO').AsFloat := self.percdesconto;
    dmConexaoBanco.query.ParamByName('VALDESCONTO').AsFloat := Self.valdesconto;
    dmConexaoBanco.query.ParamByName('VALTOTAL').AsFloat := self.valtotal;

    try
      dmConexaoBanco.query.open;
      self.nroped_prods := dmConexaoBanco.query.Fields[0].AsInteger;
    finally
      dmConexaoBanco.query.SQL.Clear;
      dmConexaoBanco.query.Close;
    end;

  except
    on e: Exception do begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPedidoProduto.Validar: string;
begin
  Result := '';
  if not TValidaValores.valorValido(self.codproduto) then begin
    Result := montarMsgCampoObrigatorio('Produto');
    exit;
  end;

  if not TValidaValores.valorValido(self.qtde) then begin
    Result := montarMsgCampoObrigatorio('Produto');
    exit;
  end;

  if not TValidaValores.valorValido(self.un) then begin
    Result := montarMsgCampoObrigatorio('Unidade');
    exit;
  end;

  if not TValidaValores.valorValido(self.preco) then begin
    Result := montarMsgCampoObrigatorio('Preço');
    exit;
  end;
end;

end.
