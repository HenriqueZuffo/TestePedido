object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 319
  ClientWidth = 635
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object pnGeral: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 319
    Align = alClient
    Caption = 'Henrique Pedidos'
    TabOrder = 0
    object pnRodape: TPanel
      Left = 1
      Top = 296
      Width = 633
      Height = 22
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object lbl_usuarioLogado: TLabel
        Left = 0
        Top = 0
        Width = 94
        Height = 22
        Align = alLeft
        Caption = 'Usu'#225'rio Logado'
        Layout = tlCenter
        ExplicitHeight = 17
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 72
    object Pedido1: TMenuItem
      Caption = '&Pedido'
      OnClick = Pedido1Click
    end
  end
end
