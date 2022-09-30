inherited dmPedido: TdmPedido
  OldCreateOrder = True
  inherited queryCadastro: TFDQuery
    AfterClose = queryCadastroAfterClose
    OnNewRecord = queryCadastroNewRecord
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvGeneratorName]
    UpdateOptions.UpdateChangedFields = True
    SQL.Strings = (
      'SELECT '
      '    CAST(NULL AS integer) as NROPEDIDO,'
      '    cast(NULL AS date) AS DATA,'
      '    CAST(NULL AS integer) AS CODCLIENTE,'
      '    CAST(NULL AS varchar(80)) AS NOME_CLIENTE, '
      '    CAST(NULL AS integer) AS situacao,   '
      '    CAST(NULL AS date) AS DATAENTREGA,'
      '    CAST(NULL AS integer) as CODCPAGTO,'
      '    CAST(NULL AS varchar(50)) AS descricao_cpgto,     '
      '    CAST(NULL AS integer) AS CODFORMAPAGTO, '
      '    CAST(NULL AS varchar(35)) as descricao_formapagto,   '
      '    CAST(NULL AS double precision) as QTDTOTAL, '
      '    CAST(NULL AS double precision) as VALTOTAL,'
      '    CAST(NULL AS char(1)) AS tipo,'
      '    CAST(NULL AS varchar(5000)) as OBS   '
      'FROM RDB$DATABASE'
      ' '
      ' '
      ' ')
    Left = 200
    Top = 168
    object queryCadastroNROPEDIDO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'NROPEDIDO'
      Origin = 'NROPEDIDO'
      ProviderFlags = []
    end
    object queryCadastroDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
      EditMask = '!99/99/00;1;_'
    end
    object queryCadastroCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      ProviderFlags = []
      OnValidate = queryCadastroCODCLIENTEValidate
    end
    object queryCadastroNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 80
    end
    object queryCadastroSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
    end
    object queryCadastroDATAENTREGA: TDateField
      FieldName = 'DATAENTREGA'
      Origin = 'DATAENTREGA'
      ProviderFlags = []
      EditMask = '!99/99/00;1;_'
    end
    object queryCadastroCODCPAGTO: TSmallintField
      FieldName = 'CODCPAGTO'
      Origin = 'CODCPAGTO'
      ProviderFlags = []
      OnValidate = queryCadastroCODCPAGTOValidate
    end
    object queryCadastroDESCRICAO_CPGTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_CPGTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object queryCadastroCODFORMAPAGTO: TSmallintField
      FieldName = 'CODFORMAPAGTO'
      Origin = 'CODFORMAPAGTO'
      ProviderFlags = []
      OnValidate = queryCadastroCODFORMAPAGTOValidate
    end
    object queryCadastroDESCRICAO_FORMAPAGTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_FORMAPAGTO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Size = 35
    end
    object queryCadastroQTDTOTAL: TFloatField
      FieldName = 'QTDTOTAL'
      Origin = 'QTDTOTAL'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryCadastroVALTOTAL: TFloatField
      FieldName = 'VALTOTAL'
      Origin = 'VALTOTAL'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryCadastroTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object queryCadastroOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      ProviderFlags = []
      Size = 5000
    end
  end
  object queryProduto: TFDQuery
    BeforePost = queryProdutoBeforePost
    AfterPost = queryProdutoAfterPost
    Connection = dmConexaoBanco.conexaoBase
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCountUpdatedRecords, uvFetchGeneratorsPoint, uvGeneratorName, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    SQL.Strings = (
      'SELECT '
      '    CAST(NULL AS integer) as NROPED_PRODS, '
      '    CAST(NULL AS integer) AS NROPEDIDO,'
      '    CAST(NULL AS integer) AS NROITEM, '
      '    CAST(NULL AS varchar(20)) AS CODPRODUTO, '
      '    CAST(NULL AS varchar(120)) AS descricao_produto,'
      '    CAST(NULL AS double precision) as QTDE,'
      '    CAST(NULL AS varchar(3)) AS UN, '
      '    CAST(NULL AS double precision) AS PRECO, '
      '    CAST(NULL AS double precision) as PERCDESCONTO, '
      '    CAST(NULL AS double precision) as VALDESCONTO, '
      '    CAST(NULL AS double precision) as VALTOTAL'
      'FROM RDB$DATABASE'
      ' '
      ' ')
    Left = 200
    Top = 240
    object queryProdutoNROPED_PRODS: TIntegerField
      FieldName = 'NROPED_PRODS'
      Origin = 'NROPED_PRODS'
      ProviderFlags = []
    end
    object queryProdutoNROPEDIDO: TIntegerField
      FieldName = 'NROPEDIDO'
      Origin = 'NROPEDIDO'
      ProviderFlags = []
    end
    object queryProdutoNROITEM: TIntegerField
      FieldName = 'NROITEM'
      Origin = 'NROITEM'
      ProviderFlags = []
    end
    object queryProdutoCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      ProviderFlags = []
      OnValidate = queryProdutoCODPRODUTOValidate
    end
    object queryProdutoDESCRICAO_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTO'
      ProviderFlags = []
      Size = 120
    end
    object queryProdutoQTDE: TFloatField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = []
      OnValidate = queryProdutoQTDEValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoUN: TStringField
      FieldName = 'UN'
      Origin = 'UN'
      ProviderFlags = []
      Size = 3
    end
    object queryProdutoPRECO: TFloatField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      ProviderFlags = []
      OnValidate = queryProdutoPRECOValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoPERCDESCONTO: TFloatField
      FieldName = 'PERCDESCONTO'
      Origin = 'PERCDESCONTO'
      ProviderFlags = []
      OnValidate = queryProdutoPERCDESCONTOValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoVALDESCONTO: TFloatField
      FieldName = 'VALDESCONTO'
      Origin = 'VALDESCONTO'
      ProviderFlags = []
      OnValidate = queryProdutoVALDESCONTOValidate
      DisplayFormat = '0.00,'
    end
    object queryProdutoVALTOTAL: TFloatField
      FieldName = 'VALTOTAL'
      Origin = 'VALTOTAL'
      ProviderFlags = []
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
