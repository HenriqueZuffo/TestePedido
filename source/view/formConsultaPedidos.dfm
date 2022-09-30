object frmConsultaPedidos: TfrmConsultaPedidos
  Left = 0
  Top = 0
  Caption = 'Consulta de Pedidos'
  ClientHeight = 513
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object pnFiltros: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 185
    Align = alTop
    TabOrder = 0
    object btnCarregar: TSpeedButton
      Left = 640
      Top = 148
      Width = 80
      Height = 35
      Caption = 'Carregar'
      OnClick = btnCarregarClick
    end
    object pnData: TPanel
      Left = 15
      Top = 0
      Width = 258
      Height = 44
      BevelOuter = bvNone
      TabOrder = 0
      object lblData: TLabel
        Left = 0
        Top = 0
        Width = 258
        Height = 17
        Align = alTop
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 27
      end
      object lbl_edt_dtFinal: TLabel
        Left = 120
        Top = 17
        Width = 18
        Height = 27
        Align = alClient
        Alignment = taCenter
        Caption = #224' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 11
        ExplicitHeight = 17
      end
      object edt_dtInicial: THMaskEdit
        Left = 0
        Top = 17
        Width = 120
        Height = 27
        Align = alLeft
        EditMask = '!99/99/00;1;_'
        MaxLength = 8
        TabOrder = 0
        Text = '  /  /  '
        ColorFocus = 16777088
        ApenasNumeros = True
        ExplicitHeight = 25
      end
      object edt_dtFinal: THMaskEdit
        Left = 138
        Top = 17
        Width = 120
        Height = 27
        Align = alRight
        EditMask = '!99/99/00;1;_'
        MaxLength = 8
        TabOrder = 1
        Text = '  /  /  '
        ColorFocus = 16777088
        ApenasNumeros = True
        ExplicitHeight = 25
      end
    end
    object pnCliente: TPanel
      Left = 15
      Top = 48
      Width = 705
      Height = 44
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object lblCliente: TLabel
        Left = 0
        Top = 0
        Width = 705
        Height = 17
        Align = alTop
        Caption = 'Cliente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 39
      end
      object btnPesquisarCliente: TSpeedButton
        Left = 0
        Top = 17
        Width = 41
        Height = 27
        Hint = 'Pesquisar Cliente'
        ParentCustomHint = False
        Align = alLeft
        Caption = '....'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnPesquisarClienteClick
        ExplicitTop = 20
        ExplicitHeight = 29
      end
      object edt_nomeCliente: THedit
        Left = 154
        Top = 17
        Width = 551
        Height = 27
        TabStop = False
        Align = alClient
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitHeight = 25
      end
      object edt_codCliente: THedit
        Left = 41
        Top = 17
        Width = 113
        Height = 27
        Align = alLeft
        TabOrder = 1
        ColorFocus = 16777088
        ExplicitHeight = 25
      end
    end
    object rgSituacao: TRadioGroup
      Left = 15
      Top = 98
      Width = 185
      Height = 44
      Caption = 'Situa'#231#227'o'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Pendente'
        'Finalizado')
      ParentFont = False
      TabOrder = 2
    end
    object rgTipo: TRadioGroup
      Left = 298
      Top = 98
      Width = 422
      Height = 44
      Caption = 'Tipo'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Venda'
        'Bonifica'#231#227'o'
        'Troca')
      ParentFont = False
      TabOrder = 3
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 478
    Width = 727
    Height = 35
    Align = alBottom
    TabOrder = 1
    object btnCadastrar: TSpeedButton
      Left = 576
      Top = 1
      Width = 150
      Height = 33
      Align = alRight
      Caption = 'Cadastrar'
      OnClick = btnCadastrarClick
      ExplicitLeft = 504
    end
    object btnEditar: TSpeedButton
      Left = 426
      Top = 1
      Width = 150
      Height = 33
      Align = alRight
      Caption = 'Editar'
      Enabled = False
      OnClick = btnEditarClick
      ExplicitLeft = 374
    end
    object btnExcluir: TSpeedButton
      Left = 276
      Top = 1
      Width = 150
      Height = 33
      Align = alRight
      Caption = 'Excluir'
      Enabled = False
      OnClick = btnExcluirClick
      ExplicitLeft = 244
    end
    object btnFinalizar: TSpeedButton
      Left = 126
      Top = 1
      Width = 150
      Height = 33
      Align = alRight
      Caption = 'Finalizar'
      Enabled = False
      OnClick = btnFinalizarClick
      ExplicitLeft = 114
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 185
    Width = 727
    Height = 293
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 725
      Height = 291
      Align = alClient
      DataSource = dsPedidos
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'NROPEDIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Pedido'
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'CODCLIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'NOME_CLIENTE'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Cliente'
          Width = 150
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DESC_SITUACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Situa'#231#227'o'
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'DESC_TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'QTDTOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde Total'
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'VALTOTAL'
          Title.Alignment = taCenter
          Title.Caption = 'Vlr. Total'
          Visible = True
        end>
    end
  end
  object queryPedidos: TFDQuery
    AfterOpen = queryPedidosAfterOpen
    AfterClose = queryPedidosAfterClose
    AfterScroll = queryPedidosAfterScroll
    Connection = dmConexaoBanco.conexaoBase
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT p.nropedido,'
      #9'   p.DATA,'
      #9'   CASE p.situacao '
      #9'   '#9'WHEN 1 THEN '#39'Pendente'#39
      #9'   '#9'WHEN 2 THEN '#39'Finalizado'#39
      #9'   END AS desc_situacao,'
      #9'   p.SITUACAO,'
      #9'   CASE p.tipo'
      #9'   '#9'WHEN '#39'V'#39' THEN '#39'Venda'#39
      #9'   '#9'WHEN '#39'B'#39' THEN '#39'Bonifica'#231#227'o'#39
      #9'   '#9'WHEN '#39'T'#39' THEN '#39'Troca'#39
      #9'   END AS desc_tipo,'
      #9'   p.tipo,'
      #9'   p.qtdtotal,'
      #9'   p.valtotal,'
      #9'   p.CODCLIENTE,'
      #9'   c.NOME  AS nome_cliente'
      '  FROM PEDIDOS p '
      '  JOIN CLIENTES c ON c.CODCLIENTE  = p.CODCLIENTE'
      ' WHERE ((P.DATA >= :DT_INI) OR (:DT_INI IS NULL)) AND '
      '       ((P.DATA <= :DT_FIM) OR (:DT_FIM IS NULL)) AND '
      
        '       ((P.CODCLIENTE = :CODCLIENTE) OR (:CODCLIENTE IS null)) A' +
        'ND '
      '       ((P.SITUACAO = :SITUACAO) OR (:SITUACAO IS null)) AND '
      '       ((P.TIPO = :TIPO) OR (:TIPO IS null))'
      ' ')
    Left = 424
    Top = 329
    ParamData = <
      item
        Name = 'DT_INI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_FIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODCLIENTE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SITUACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIPO'
        ParamType = ptInput
        Value = Null
      end>
    object queryPedidosNROPEDIDO: TIntegerField
      FieldName = 'NROPEDIDO'
      Origin = 'NROPEDIDO'
      ProviderFlags = []
    end
    object queryPedidosDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
    end
    object queryPedidosDESC_SITUACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_SITUACAO'
      Origin = 'DESC_SITUACAO'
      ProviderFlags = []
      FixedChar = True
      Size = 10
    end
    object queryPedidosSITUACAO: TIntegerField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = []
    end
    object queryPedidosDESC_TIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_TIPO'
      Origin = 'DESC_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 11
    end
    object queryPedidosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object queryPedidosQTDTOTAL: TFloatField
      FieldName = 'QTDTOTAL'
      Origin = 'QTDTOTAL'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryPedidosVALTOTAL: TFloatField
      FieldName = 'VALTOTAL'
      Origin = 'VALTOTAL'
      ProviderFlags = []
      DisplayFormat = '0.00,'
    end
    object queryPedidosCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
      Origin = 'CODCLIENTE'
      ProviderFlags = []
    end
    object queryPedidosNOME_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 80
    end
  end
  object dsPedidos: TDataSource
    DataSet = queryPedidos
    Left = 552
    Top = 329
  end
end
