inherited frmConsultaFormaPagamento: TfrmConsultaFormaPagamento
  Caption = 'Consulta de Forma de Pagamento'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnGrid: TPanel
    inherited dbGridConsulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODFORMAPAGTO'
          Title.Alignment = taCenter
          Title.Caption = 'Forma Pagamento'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end>
    end
  end
  inherited queryConsulta: TFDQuery
    SQL.Strings = (
      'SELECT CODFORMAPAGTO, '
      '       DESCRICAO'
      '  FROM FORMAPAGTO'
      ' WHERE SITUACAO = '#39'A'#39)
    object queryConsultaCODFORMAPAGTO: TSmallintField
      FieldName = 'CODFORMAPAGTO'
      Origin = 'CODFORMAPAGTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryConsultaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
  end
end
