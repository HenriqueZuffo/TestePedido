inherited dmPedido: TdmPedido
  inherited queryCadastro: TFDQuery
    AfterOpen = queryCadastroAfterOpen
    AfterClose = queryCadastroAfterClose
    OnNewRecord = queryCadastroNewRecord
    SQL.Strings = (
      'SELECT P.NROPEDIDO, '
      '       P.DATA, '
      '       P.CODCLIENTE,'
      '       C.NOME AS NOME_CLIENTE,'
      '       P.SITUACAO, '
      '       P.DATAENTREGA, '
      '       P.CODCPAGTO, '
      '       pgto.DESCRICAO AS descricao_cpgto,'
      '       P.CODFORMAPAGTO,'
      '       f.DESCRICAO AS descricao_formapagto,'
      '       P.QTDTOTAL, '
      '       P.VALTOTAL, '
      '       P.TIPO, '
      '       P.OBS'
      '  FROM PEDIDOS P'
      '  JOIN CLIENTES C ON C.CODCLIENTE = P.CODCLIENTE '
      '  JOIN CPAGTO pgto ON pgto.CODCPAGTO = p.CODCPAGTO'
      '  LEFT JOIN FORMAPAGTO f ON f.CODFORMAPAGTO = p.CODFORMAPAGTO'
      ' WHERE p.NROPEDIDO = :PEDIDO')
    Left = 200
    Top = 168
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object queryCadastroNROPEDIDO: TIntegerField
      FieldName = 'NROPEDIDO'
      Origin = 'NROPEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryCadastroDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
      EditMask = '!99/99/00;1;_'
    end
    object queryCadastroCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      Required = True
      OnValidate = queryCadastroCODCLIENTEValidate
    end
    object queryCadastroNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object queryCadastroSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
    end
    object queryCadastroDATAENTREGA: TDateField
      FieldName = 'DATAENTREGA'
      Origin = 'DATAENTREGA'
      Required = True
      EditMask = '!99/99/00;1;_'
    end
    object queryCadastroCODCPAGTO: TSmallintField
      FieldName = 'CODCPAGTO'
      Origin = 'CODCPAGTO'
      Required = True
      OnValidate = queryCadastroCODCPAGTOValidate
    end
    object queryCadastroDESCRICAO_CPGTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CPGTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object queryCadastroCODFORMAPAGTO: TSmallintField
      FieldName = 'CODFORMAPAGTO'
      Origin = 'CODFORMAPAGTO'
      OnValidate = queryCadastroCODFORMAPAGTOValidate
    end
    object queryCadastroDESCRICAO_FORMAPAGTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_FORMAPAGTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object queryCadastroQTDTOTAL: TFloatField
      FieldName = 'QTDTOTAL'
      Origin = 'QTDTOTAL'
      Required = True
      DisplayFormat = '0.00,'
    end
    object queryCadastroVALTOTAL: TFloatField
      FieldName = 'VALTOTAL'
      Origin = 'VALTOTAL'
      DisplayFormat = '0.00,'
    end
    object queryCadastroTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object queryCadastroOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 5000
    end
  end
  object queryProduto: TFDQuery
    BeforePost = queryProdutoBeforePost
    AfterPost = queryProdutoAfterPost
    OnNewRecord = queryProdutoNewRecord
    Connection = dmConexaoBanco.conexaoBase
    UpdateOptions.AssignedValues = [uvUpdateChngFields]
    UpdateOptions.UpdateChangedFields = False
    SQL.Strings = (
      'SELECT p.NROPED_PRODS, '
      '       p.NROPEDIDO,'
      '       p.NROITEM, '
      '       p.CODPRODUTO, '
      '       prod.PRODUTO  AS descricao_produto,'
      '       p.QTDE,'
      '       p.UN, '
      '       p.PRECO, '
      '       p.PERCDESCONTO, '
      '       p.VALDESCONTO, '
      '       p.VALTOTAL'
      '  FROM PED_PRODS p'
      '  JOIN PRODUTOS prod ON prod.CODPRODUTO = p.CODPRODUTO '
      ' WHERE p.NROPEDIDO  = :NROPEDIDO')
    Left = 200
    Top = 240
    ParamData = <
      item
        Name = 'NROPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object queryProdutoNROPED_PRODS: TIntegerField
      FieldName = 'NROPED_PRODS'
      Origin = 'NROPED_PRODS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryProdutoNROPEDIDO: TIntegerField
      FieldName = 'NROPEDIDO'
      Origin = 'NROPEDIDO'
      Required = True
    end
    object queryProdutoNROITEM: TIntegerField
      FieldName = 'NROITEM'
      Origin = 'NROITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryProdutoCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      Required = True
      OnValidate = queryProdutoCODPRODUTOValidate
    end
    object queryProdutoDESCRICAO_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object queryProdutoQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      OnValidate = queryProdutoQTDEValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoUN: TStringField
      FieldName = 'UN'
      Origin = 'UN'
      Required = True
      Size = 3
    end
    object queryProdutoPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Required = True
      OnValidate = queryProdutoPRECOValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoPERCDESCONTO: TFloatField
      FieldName = 'PERCDESCONTO'
      Origin = 'PERCDESCONTO'
      OnValidate = queryProdutoPERCDESCONTOValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoVALDESCONTO: TFloatField
      FieldName = 'VALDESCONTO'
      Origin = 'VALDESCONTO'
      OnValidate = queryProdutoVALDESCONTOValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoVALTOTAL: TFloatField
      FieldName = 'VALTOTAL'
      Origin = 'VALTOTAL'
      Required = True
      DisplayFormat = '0.00,'
    end
  end
  object dsCadastro: TDataSource
    DataSet = queryCadastro
    Left = 336
    Top = 168
  end
  object dsProduto: TDataSource
    DataSet = queryProduto
    Left = 328
    Top = 248
  end
end
