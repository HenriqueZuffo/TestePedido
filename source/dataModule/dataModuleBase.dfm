object dmBase: TdmBase
  OldCreateOrder = False
  Height = 305
  Width = 522
  object queryCadastro: TFDQuery
    Connection = dmConexaoBanco.conexaoBase
    UpdateOptions.AssignedValues = [uvUpdateChngFields]
    UpdateOptions.UpdateChangedFields = False
    Left = 184
    Top = 176
  end
end
