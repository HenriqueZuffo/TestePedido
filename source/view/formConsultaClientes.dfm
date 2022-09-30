inherited frmConsultaClientes: TfrmConsultaClientes
  Caption = 'Consulta de Clientes'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnGrid: TPanel
    inherited dbGridConsulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODCLIENTE'
          Title.Caption = 'Cliente'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FANTASIA'
          Title.Caption = 'Fantasia'
          Width = 64
          Visible = True
        end>
    end
  end
  inherited queryConsulta: TFDQuery
    SQL.Strings = (
      'SELECT CODCLIENTE, '
      '  '#9'   NOME, '
      '  '#9'   FANTASIA  '#9'  '
      'FROM CLIENTES')
    object queryConsultaCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryConsultaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 80
    end
    object queryConsultaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 50
    end
  end
end
