object frmBase: TfrmBase
  Left = 0
  Top = 0
  Caption = 'frmBase'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 89
      Top = 0
      Width = 89
      Height = 35
      Align = alLeft
      Caption = 'Cancelar'
      OnClick = btnCancelarClick
      ExplicitLeft = 82
    end
    object btnConfirmar: TSpeedButton
      Left = 0
      Top = 0
      Width = 89
      Height = 35
      Align = alLeft
      Caption = 'Confirmar'
      OnClick = btnConfirmarClick
      ExplicitLeft = 8
      ExplicitHeight = 41
    end
    object btnExcluir: TSpeedButton
      Left = 178
      Top = 0
      Width = 89
      Height = 35
      Align = alLeft
      Caption = 'Excluir'
      OnClick = btnExcluirClick
      ExplicitLeft = 163
      ExplicitTop = -6
    end
    object btnSair: TSpeedButton
      Left = 267
      Top = 0
      Width = 89
      Height = 35
      Align = alLeft
      Caption = 'Sair'
      OnClick = btnSairClick
      ExplicitTop = -6
    end
  end
  object pnGeral: TPanel
    Left = 0
    Top = 35
    Width = 635
    Height = 264
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
  end
end
