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
      Height = 241
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 6
      object pnCampos: TPanel
        Left = 27
        Top = 0
        Width = 137
        Height = 49
        BevelOuter = bvNone
        TabOrder = 0
        object lbl_edt_NroPedido: TLabel
          Left = 0
          Top = 0
          Width = 137
          Height = 20
          Align = alTop
          Caption = 'N'#186' Pedido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 71
        end
        object edt_NroPedido: THDbEdit
          Left = 0
          Top = 20
          Width = 137
          Height = 29
          TabStop = False
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitWidth = 734
          ExplicitHeight = 25
        end
      end
      object Panel1: TPanel
        Left = 563
        Top = 0
        Width = 169
        Height = 49
        BevelOuter = bvNone
        TabOrder = 1
        object lbl_edt_Data: TLabel
          Left = 0
          Top = 0
          Width = 169
          Height = 20
          Align = alTop
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 33
        end
        object edt_Data: THDbEdit
          Left = 0
          Top = 20
          Width = 169
          Height = 29
          TabStop = False
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitWidth = 734
          ExplicitHeight = 25
        end
      end
      object Panel2: TPanel
        Left = 27
        Top = 53
        Width = 705
        Height = 49
        BevelOuter = bvNone
        TabOrder = 2
        TabStop = True
        object lblCliente: TLabel
          Left = 0
          Top = 0
          Width = 705
          Height = 20
          Align = alTop
          Caption = 'Cliente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 48
        end
        object btnPesquisarCliente: TSpeedButton
          Left = 0
          Top = 20
          Width = 41
          Height = 29
          Align = alLeft
          Caption = '....'
        end
        object edt_NomeCliente: THDbEdit
          Left = 136
          Top = 20
          Width = 569
          Height = 29
          TabStop = False
          Align = alRight
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
        end
        object edt_CodCliente: THDbEdit
          Left = 41
          Top = 20
          Width = 95
          Height = 29
          Align = alClient
          TabOrder = 1
          ColorFocus = 16777088
          ExplicitWidth = 89
        end
      end
      object rgSituacao: TDBRadioGroup
        Left = 283
        Top = 222
        Width = 222
        Height = 65
        Caption = 'Situa'#231#227'o'
        Columns = 2
        Items.Strings = (
          'Pendente'
          'Finalizado')
        TabOrder = 3
      end
      object Panel3: TPanel
        Left = 336
        Top = 0
        Width = 169
        Height = 49
        BevelOuter = bvNone
        TabOrder = 4
        object lbl_edtDtEntrega: TLabel
          Left = 0
          Top = 0
          Width = 169
          Height = 20
          Align = alTop
          Caption = 'Data Entrega'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 91
        end
        object edt_edtDtEntrega: THDbEdit
          Left = 0
          Top = 20
          Width = 169
          Height = 29
          TabStop = False
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          ColorFocus = 16777088
          ExplicitHeight = 25
        end
      end
    end
  end
end
