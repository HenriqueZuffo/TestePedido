inherited frmCadProdutoPedido: TfrmCadProdutoPedido
  Caption = 'Produto Pedido'
  ClientHeight = 243
  ClientWidth = 764
  Constraints.MinHeight = 282
  Constraints.MinWidth = 780
  Position = poMainFormCenter
  ExplicitWidth = 780
  ExplicitHeight = 282
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnTop: TPanel
    Width = 764
  end
  inherited pnGeral: TPanel
    Width = 764
    Height = 208
    object pnPedido: TPanel
      Left = 27
      Top = 0
      Width = 137
      Height = 44
      BevelOuter = bvNone
      TabOrder = 0
      object lbl_edt_NroPedido: TLabel
        Left = 0
        Top = 0
        Width = 137
        Height = 17
        Align = alTop
        Caption = 'N'#186' Pedido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 63
      end
      object edt_NroPedido: THDbEdit
        Left = 0
        Top = 17
        Width = 137
        Height = 27
        TabStop = False
        Align = alClient
        Color = clBtnFace
        DataField = 'NROPEDIDO'
        DataSource = dmPedido.dsProduto
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitHeight = 25
      end
    end
    object pnNroItem: TPanel
      Left = 587
      Top = 0
      Width = 137
      Height = 44
      BevelOuter = bvNone
      TabOrder = 1
      object lbl_edt_NroItem: TLabel
        Left = 0
        Top = 0
        Width = 137
        Height = 17
        Align = alTop
        Caption = 'N'#186' Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 48
      end
      object edt_NroItem: THDbEdit
        Left = 0
        Top = 17
        Width = 137
        Height = 27
        TabStop = False
        Align = alClient
        Color = clBtnFace
        DataField = 'NROITEM'
        DataSource = dmPedido.dsProduto
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitLeft = -1
      end
    end
    object pnProduto: TPanel
      Left = 27
      Top = 53
      Width = 697
      Height = 44
      BevelOuter = bvNone
      TabOrder = 2
      TabStop = True
      object lblProduto: TLabel
        Left = 0
        Top = 0
        Width = 697
        Height = 17
        Align = alTop
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 50
      end
      object btnPesquisarCliente: TSpeedButton
        Left = 0
        Top = 17
        Width = 41
        Height = 27
        Hint = 'Pesquisar Produto'
        ParentCustomHint = False
        Align = alLeft
        Caption = '....'
        ParentShowHint = False
        ShowHint = True
        ExplicitTop = 20
        ExplicitHeight = 29
      end
      object edt_NomeProduto: THDbEdit
        Left = 182
        Top = 17
        Width = 458
        Height = 27
        TabStop = False
        Align = alRight
        Color = clBtnFace
        DataField = 'DESCRICAO_PRODUTO'
        DataSource = dmPedido.dsProduto
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitLeft = 146
      end
      object edt_CodProduto: THDbEdit
        Left = 41
        Top = 17
        Width = 141
        Height = 27
        Align = alClient
        DataField = 'CODPRODUTO'
        DataSource = dmPedido.dsProduto
        TabOrder = 1
        ColorFocus = 16777088
        ExplicitWidth = 64
      end
      object edt_Un: THDbEdit
        Left = 640
        Top = 17
        Width = 57
        Height = 27
        Align = alRight
        DataField = 'UN'
        DataSource = dmPedido.dsProduto
        TabOrder = 2
        ColorFocus = 16777088
      end
    end
    object pnQtde: TPanel
      Left = 27
      Top = 103
      Width = 137
      Height = 44
      BevelOuter = bvNone
      TabOrder = 3
      TabStop = True
      object lbl_edt_Qtde: TLabel
        Left = 0
        Top = 0
        Width = 137
        Height = 17
        Align = alTop
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 72
      end
      object edt_Qtde: THDbEdit
        Left = 0
        Top = 17
        Width = 137
        Height = 27
        Align = alClient
        DataField = 'QTDE'
        DataSource = dmPedido.dsProduto
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitHeight = 25
      end
    end
    object pnPreco: TPanel
      Left = 167
      Top = 103
      Width = 137
      Height = 44
      BevelOuter = bvNone
      TabOrder = 4
      TabStop = True
      object lbl_edt_Preco: TLabel
        Left = 0
        Top = 0
        Width = 137
        Height = 17
        Align = alTop
        Caption = 'Pre'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 34
      end
      object edt_Preco: THDbEdit
        Left = 0
        Top = 17
        Width = 137
        Height = 27
        Align = alClient
        DataField = 'PRECO'
        DataSource = dmPedido.dsProduto
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitHeight = 25
      end
    end
    object pnPercDesconto: TPanel
      Left = 307
      Top = 103
      Width = 137
      Height = 44
      BevelOuter = bvNone
      TabOrder = 5
      TabStop = True
      object lbl_edt_PercDesconto: TLabel
        Left = 0
        Top = 0
        Width = 137
        Height = 17
        Align = alTop
        Caption = '% Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 73
      end
      object edt_PercDesconto: THDbEdit
        Left = 0
        Top = 17
        Width = 137
        Height = 27
        Align = alClient
        DataField = 'PERCDESCONTO'
        DataSource = dmPedido.dsProduto
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitHeight = 25
      end
    end
    object pnValDesconto: TPanel
      Left = 447
      Top = 103
      Width = 137
      Height = 44
      BevelOuter = bvNone
      TabOrder = 6
      TabStop = True
      object lbl_edt_ValDesconto: TLabel
        Left = 0
        Top = 0
        Width = 137
        Height = 17
        Align = alTop
        Caption = 'Vlr. Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 83
      end
      object edt_ValDesconto: THDbEdit
        Left = 0
        Top = 17
        Width = 137
        Height = 27
        Align = alClient
        DataField = 'VALDESCONTO'
        DataSource = dmPedido.dsProduto
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitLeft = 3
        ExplicitTop = 23
      end
    end
    object pnTotal: TPanel
      Left = 587
      Top = 103
      Width = 137
      Height = 44
      BevelOuter = bvNone
      TabOrder = 7
      object lbl_edt_Total: TLabel
        Left = 0
        Top = 0
        Width = 137
        Height = 17
        Align = alTop
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 31
      end
      object edt_Total: THDbEdit
        Left = 0
        Top = 17
        Width = 137
        Height = 27
        TabStop = False
        Align = alClient
        Color = clBtnFace
        DataField = 'VALTOTAL'
        DataSource = dmPedido.dsProduto
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        ColorFocus = 16777088
        ExplicitHeight = 25
      end
    end
  end
end
