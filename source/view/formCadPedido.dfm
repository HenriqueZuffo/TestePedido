inherited frmCadPedido: TfrmCadPedido
  Caption = 'Pedido'
  ClientHeight = 557
  ClientWidth = 764
  ExplicitWidth = 780
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnTop: TPanel
    Width = 764
  end
  inherited pnGeral: TPanel
    Width = 764
    Height = 522
    ExplicitTop = 41
    ExplicitWidth = 764
    ExplicitHeight = 522
    object pnTopGeral: TPanel
      Left = 0
      Top = 0
      Width = 764
      Height = 305
      Align = alTop
      BevelOuter = bvNone
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
        end
        object edt_NroPedido: THDbEdit
          Left = 0
          Top = 17
          Width = 137
          Height = 27
          TabStop = False
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitTop = 20
          ExplicitWidth = 734
          ExplicitHeight = 25
        end
      end
      object pnData: TPanel
        Left = 307
        Top = 0
        Width = 137
        Height = 44
        BevelOuter = bvNone
        TabOrder = 1
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
        end
        object edt_Data: THDbEdit
          Left = 0
          Top = 17
          Width = 137
          Height = 27
          TabStop = False
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitLeft = -1
        end
      end
      object pnCliente: TPanel
        Left = 27
        Top = 53
        Width = 705
        Height = 44
        BevelOuter = bvNone
        TabOrder = 2
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
        end
        object btnPesquisarCliente: TSpeedButton
          Left = 0
          Top = 17
          Width = 41
          Height = 27
          Align = alLeft
          Caption = '....'
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
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitTop = 20
          ExplicitHeight = 29
        end
        object edt_CodCliente: THDbEdit
          Left = 41
          Top = 17
          Width = 95
          Height = 27
          Align = alClient
          TabOrder = 1
          ColorFocus = 16777088
          ExplicitTop = 20
          ExplicitWidth = 89
          ExplicitHeight = 29
        end
      end
      object pnDataEntrega: TPanel
        Left = 167
        Top = 0
        Width = 137
        Height = 44
        BevelOuter = bvNone
        TabOrder = 3
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
        end
        object edt_edtDtEntrega: THDbEdit
          Left = 0
          Top = 17
          Width = 137
          Height = 27
          TabStop = False
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitTop = 20
          ExplicitWidth = 169
          ExplicitHeight = 25
        end
      end
      object pnFormaPagamento: TPanel
        Left = 27
        Top = 150
        Width = 705
        Height = 44
        BevelOuter = bvNone
        TabOrder = 4
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
          Align = alLeft
          Caption = '....'
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
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitTop = 20
          ExplicitHeight = 25
        end
        object edt_codFormaPagamento: THDbEdit
          Left = 41
          Top = 17
          Width = 95
          Height = 27
          Align = alClient
          TabOrder = 1
          ColorFocus = 16777088
          ExplicitTop = 20
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
          Align = alLeft
          Caption = '....'
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
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitTop = 22
          ExplicitHeight = 25
        end
        object edt_codCPagamento: THDbEdit
          Left = 41
          Top = 17
          Width = 95
          Height = 27
          Align = alClient
          TabOrder = 1
          ColorFocus = 16777088
          ExplicitTop = 22
          ExplicitHeight = 25
        end
      end
      object pnQtdTotal: TPanel
        Left = 27
        Top = 197
        Width = 137
        Height = 44
        BevelOuter = bvNone
        TabOrder = 6
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
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitTop = 23
        end
      end
      object pnVlrTotal: TPanel
        Left = 167
        Top = 197
        Width = 137
        Height = 44
        BevelOuter = bvNone
        TabOrder = 7
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
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitLeft = 1
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
        Items.Strings = (
          'Pendente'
          'Finalizado')
        ParentFont = False
        TabOrder = 8
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
          TabOrder = 0
          OnDblClick = mm_ObservacoesDblClick
          ExplicitLeft = 176
          ExplicitTop = -45
          ExplicitWidth = 185
          ExplicitHeight = 89
        end
      end
    end
    object pnProdutos: TPanel
      Left = 0
      Top = 305
      Width = 764
      Height = 217
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 344
      ExplicitTop = 352
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
  end
end
