inherited frmConsultaCPagamento: TfrmConsultaCPagamento
  Caption = 'Consulta de C. Pagamento'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnGrid: TPanel
    inherited dbGridConsulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODCPAGTO'
          Title.Alignment = taCenter
          Title.Caption = 'C. Pagamento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NROPARCELAS'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Parcelas'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIASPARCELAS'
          Title.Alignment = taCenter
          Title.Caption = 'Dias Parc.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIASPRIMPARC'
          Title.Alignment = taCenter
          Title.Caption = 'Dias Primeira Parc.'
          Visible = True
        end>
    end
  end
  inherited queryConsulta: TFDQuery
    SQL.Strings = (
      'SELECT CODCPAGTO, '
      '       DESCRICAO, '
      '       NROPARCELAS, '
      '       DIASPARCELAS, '
      '       DIASPRIMPARC '
      'FROM CPAGTO'
      'WHERE SITUACAO = '#39'A'#39)
    object queryConsultaCODCPAGTO: TSmallintField
      FieldName = 'CODCPAGTO'
      Origin = 'CODCPAGTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object queryConsultaNROPARCELAS: TSmallintField
      FieldName = 'NROPARCELAS'
      Origin = 'NROPARCELAS'
    end
    object queryConsultaDIASPARCELAS: TSmallintField
      FieldName = 'DIASPARCELAS'
      Origin = 'DIASPARCELAS'
    end
    object queryConsultaDIASPRIMPARC: TSmallintField
      FieldName = 'DIASPRIMPARC'
      Origin = 'DIASPRIMPARC'
    end
  end
end
