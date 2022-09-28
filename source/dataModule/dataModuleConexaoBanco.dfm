object dmConexaoBanco: TdmConexaoBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 400
  Width = 546
  object conexaoBase: TFDConnection
    Params.Strings = (
      'Database=C:\Users\henri\Downloads\TESTE\BANCODADOS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Left = 232
    Top = 256
  end
  object query: TFDQuery
    Connection = conexaoBase
    Left = 400
    Top = 256
  end
end
