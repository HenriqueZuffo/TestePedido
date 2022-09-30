inherited frmCadPedido: TfrmCadPedido
  Caption = 'Pedido'
  ClientHeight = 557
  ClientWidth = 764
  Color = clWhite
  Constraints.MinHeight = 596
  Constraints.MinWidth = 780
  Position = poMainFormCenter
  Visible = True
  OnShow = FormShow
  ExplicitWidth = 780
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnTop: TPanel
    Width = 764
    ExplicitWidth = 764
    inherited btnConfirmar: TSpeedButton
      ExplicitLeft = -6
      ExplicitTop = -6
      ExplicitHeight = 35
    end
    inherited btnExcluir: TSpeedButton
      Visible = False
    end
  end
  inherited pnGeral: TPanel
    Width = 764
    Height = 522
    ExplicitWidth = 764
    ExplicitHeight = 522
    object pnTopGeral: TPanel
      Left = 0
      Top = 0
      Width = 764
      Height = 305
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
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
          DataSource = dmPedido.dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object pnData: TPanel
        Left = 307
        Top = 0
        Width = 137
        Height = 44
        BevelOuter = bvNone
        TabOrder = 2
        object lbl_edt_Data: TLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 17
          Align = alTop
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 29
        end
        object edt_Data: THDbEdit
          Left = 0
          Top = 17
          Width = 137
          Height = 27
          TabStop = False
          Align = alClient
          Color = clBtnFace
          DataField = 'DATA'
          DataSource = dmPedido.dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object pnCliente: TPanel
        Left = 27
        Top = 53
        Width = 705
        Height = 44
        BevelOuter = bvNone
        Caption = 'VALTOTAL'
        TabOrder = 4
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
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 43
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
        object edt_NomeCliente: THDbEdit
          Left = 136
          Top = 17
          Width = 569
          Height = 27
          TabStop = False
          Align = alRight
          Color = clBtnFace
          DataField = 'NOME_CLIENTE'
          DataSource = dmPedido.dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
        object edt_CodCliente: THDbEdit
          Left = 41
          Top = 17
          Width = 95
          Height = 27
          Align = alClient
          DataField = 'CODCLIENTE'
          DataSource = dmPedido.dsCadastro
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object pnDataEntrega: TPanel
        Left = 167
        Top = 0
        Width = 137
        Height = 44
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object lbl_edtDtEntrega: TLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 17
          Align = alTop
          Caption = 'Data Entrega'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 80
        end
        object edt_edtDtEntrega: THDbEdit
          Left = 0
          Top = 17
          Width = 137
          Height = 27
          TabStop = False
          Align = alClient
          DataField = 'DATAENTREGA'
          DataSource = dmPedido.dsCadastro
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object pnFormaPagamento: TPanel
        Left = 27
        Top = 150
        Width = 705
        Height = 44
        BevelOuter = bvNone
        TabOrder = 6
        TabStop = True
        object lbl_formaPagamento: TLabel
          Left = 0
          Top = 0
          Width = 705
          Height = 17
          Align = alTop
          Caption = 'Forma Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 107
        end
        object btnPesquisarFormaPagamento: TSpeedButton
          Left = 0
          Top = 17
          Width = 41
          Height = 27
          Hint = 'Pesquisar Forma Pagamento'
          Align = alLeft
          Caption = '....'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnPesquisarFormaPagamentoClick
          ExplicitTop = 20
          ExplicitHeight = 29
        end
        object edt_nomeFormaPagamento: THDbEdit
          Left = 136
          Top = 17
          Width = 569
          Height = 27
          TabStop = False
          Align = alRight
          Color = clBtnFace
          DataField = 'DESCRICAO_FORMAPAGTO'
          DataSource = dmPedido.dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
        object edt_codFormaPagamento: THDbEdit
          Left = 41
          Top = 17
          Width = 95
          Height = 27
          Align = alClient
          DataField = 'CODFORMAPAGTO'
          DataSource = dmPedido.dsCadastro
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object pnCPagamento: TPanel
        Left = 27
        Top = 102
        Width = 705
        Height = 44
        BevelOuter = bvNone
        TabOrder = 5
        TabStop = True
        object lbl_cPagamento: TLabel
          Left = 0
          Top = 0
          Width = 705
          Height = 17
          Align = alTop
          Caption = 'C. Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 86
        end
        object btnPesquisarCPagamento: TSpeedButton
          Left = 0
          Top = 17
          Width = 41
          Height = 27
          Hint = 'Pesquisar C. Pagamento'
          Align = alLeft
          Caption = '....'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnPesquisarCPagamentoClick
          ExplicitTop = 20
          ExplicitHeight = 29
        end
        object edt_NomeCPagamento: THDbEdit
          Left = 136
          Top = 17
          Width = 569
          Height = 27
          TabStop = False
          Align = alRight
          Color = clBtnFace
          DataField = 'DESCRICAO_CPGTO'
          DataSource = dmPedido.dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
        object edt_codCPagamento: THDbEdit
          Left = 41
          Top = 17
          Width = 95
          Height = 27
          Align = alClient
          DataField = 'CODCPAGTO'
          DataSource = dmPedido.dsCadastro
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object pnQtdTotal: TPanel
        Left = 27
        Top = 197
        Width = 137
        Height = 44
        BevelOuter = bvNone
        TabOrder = 7
        object lbl_edt_qtdTotal: TLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 17
          Align = alTop
          Caption = 'Qtd Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 58
        end
        object edt_qtdTotal: THDbEdit
          Left = 0
          Top = 17
          Width = 137
          Height = 27
          TabStop = False
          Align = alClient
          Color = clBtnFace
          DataField = 'QTDTOTAL'
          DataSource = dmPedido.dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object pnVlrTotal: TPanel
        Left = 167
        Top = 197
        Width = 137
        Height = 44
        BevelOuter = bvNone
        TabOrder = 8
        object lbl_edt_VlrTotal: TLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 17
          Align = alTop
          Caption = 'Vlr. Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 56
        end
        object edt_VlrTotal: THDbEdit
          Left = 0
          Top = 17
          Width = 137
          Height = 27
          TabStop = False
          Align = alClient
          Color = clBtnFace
          DataField = 'VALTOTAL'
          DataSource = dmPedido.dsCadastro
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
      object rgSituacao: TRadioGroup
        Left = 547
        Top = 0
        Width = 185
        Height = 44
        Caption = 'Situa'#231#227'o'
        Columns = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Pendente'
          'Finalizado')
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object rgTipo: TRadioGroup
        Left = 310
        Top = 197
        Width = 422
        Height = 44
        Caption = 'Tipo'
        Columns = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Venda'
          'Bonifica'#231#227'o'
          'Troca')
        ParentFont = False
        TabOrder = 9
      end
      object pnObservacoes: TPanel
        Left = 27
        Top = 248
        Width = 705
        Height = 44
        BevelOuter = bvNone
        TabOrder = 10
        TabStop = True
        object lbl_mm_Observacoes: TLabel
          Left = 0
          Top = 0
          Width = 705
          Height = 17
          Align = alTop
          Caption = 'Observa'#231#245'es'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 76
        end
        object mm_Observacoes: TDBMemo
          Left = 0
          Top = 17
          Width = 705
          Height = 27
          Align = alClient
          DataField = 'OBS'
          DataSource = dmPedido.dsCadastro
          TabOrder = 0
        end
      end
    end
    object gbProdutos: TGroupBox
      Left = 0
      Top = 305
      Width = 764
      Height = 217
      Align = alClient
      Caption = 'Produtos'
      TabOrder = 1
      object pnProdutos: TPanel
        Left = 2
        Top = 19
        Width = 760
        Height = 196
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgridProdutos: TDBGrid
          Left = 0
          Top = 0
          Width = 696
          Height = 196
          TabStop = False
          Align = alClient
          DataSource = dmPedido.dsProduto
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
              FieldName = 'NROITEM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' Item'
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'CODPRODUTO'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Produto'
              Visible = True
            end
            item
              Color = clBtnFace
              Expanded = False
              FieldName = 'DESCRICAO_PRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Dec. Produto'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Alignment = taCenter
              Title.Caption = 'Qtde.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALDESCONTO'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Desconto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALTOTAL'
              Title.Alignment = taCenter
              Title.Caption = 'Vlr. Total'
              Visible = True
            end>
        end
        object pnBotoesGrid: TPanel
          Left = 696
          Top = 0
          Width = 64
          Height = 196
          Align = alRight
          TabOrder = 1
          object btnExcluirProduto: TSpeedButton
            Left = 1
            Top = 65
            Width = 62
            Height = 32
            Align = alTop
            Caption = 'Excluir'
            ExplicitTop = 1
            ExplicitWidth = 98
          end
          object btnEditarProduto: TSpeedButton
            Left = 1
            Top = 33
            Width = 62
            Height = 32
            Align = alTop
            Caption = 'Editar'
            OnClick = btnEditarProdutoClick
            ExplicitTop = 1
            ExplicitWidth = 98
          end
          object btnIncluirProduto: TSpeedButton
            Left = 1
            Top = 1
            Width = 62
            Height = 32
            Align = alTop
            Caption = 'Incluir'
            OnClick = btnIncluirProdutoClick
            ExplicitWidth = 98
          end
        end
      end
    end
  end
end
