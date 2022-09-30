inherited frmConsultaProduto: TfrmConsultaProduto
  Caption = 'Consulta Produto'
  ClientWidth = 670
  ExplicitWidth = 686
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnTop: TPanel
    Width = 670
    ExplicitWidth = 670
  end
  inherited pnGrid: TPanel
    Width = 670
    ExplicitWidth = 670
    inherited dbGridConsulta: TDBGrid
      Width = 670
      Columns = <
        item
          Expanded = False
          FieldName = 'CODPRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Produto'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOCUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Custo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECOVENDA'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UN'
          Title.Alignment = taCenter
          Title.Caption = 'Un'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUEATUAL'
          Title.Alignment = taCenter
          Title.Caption = 'Estoque Atual'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCICMS'
          Title.Alignment = taCenter
          Title.Caption = '% Icms'
          Visible = True
        end>
    end
  end
  inherited pnRodaPe: TPanel
    Width = 670
    ExplicitWidth = 670
    inherited btnImportar: TButton
      Left = 595
      ExplicitLeft = 595
    end
  end
  inherited queryConsulta: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT CODPRODUTO, '
      '       PRODUTO, '
      '       PRECOCUSTO, '
      '       PRECOVENDA, '
      '       UN, '
      '       ESTOQUEATUAL,  '
      '       PERCICMS'
      '  FROM PRODUTOS '
      ' WHERE SITUACAO  = '#39'A'#39' '
      ' ')
    object queryConsultaCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Origin = 'CODPRODUTO'
      ProviderFlags = []
    end
    object queryConsultaPRECOCUSTO: TFloatField
      FieldName = 'PRECOCUSTO'
      Origin = 'PRECOCUSTO'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryConsultaPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
      Origin = 'PRECOVENDA'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryConsultaUN: TStringField
      FieldName = 'UN'
      Origin = 'UN'
      ProviderFlags = []
      Size = 3
    end
    object queryConsultaESTOQUEATUAL: TFloatField
      FieldName = 'ESTOQUEATUAL'
      Origin = 'ESTOQUEATUAL'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryConsultaPERCICMS: TFloatField
      FieldName = 'PERCICMS'
      Origin = 'PERCICMS'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryConsultaPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 120
    end
  end
end
