object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 246
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 17
  object btnEntrar: TSpeedButton
    Left = 219
    Top = 160
    Width = 137
    Height = 33
    Caption = 'Entrar'
    OnClick = btnEntrarClick
  end
  object btnSair: TSpeedButton
    Left = 40
    Top = 160
    Width = 137
    Height = 33
    Caption = 'Sair'
    OnClick = btnSairClick
  end
  object pnUsuario: TPanel
    Left = 40
    Top = 96
    Width = 137
    Height = 44
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object lbl_edtUsuario: TLabel
      Left = 0
      Top = 0
      Width = 137
      Height = 17
      Align = alTop
      Caption = 'Usu'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 47
    end
    object edtUsuario: THedit
      Left = 0
      Top = 17
      Width = 137
      Height = 27
      Align = alClient
      PasswordChar = '*'
      TabOrder = 0
      Text = 'edtUsuario'
      ColorFocus = 16777088
      ExplicitHeight = 25
    end
  end
  object pnSenha: TPanel
    Left = 219
    Top = 96
    Width = 137
    Height = 44
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object lbl_edtSenha: TLabel
      Left = 0
      Top = 0
      Width = 137
      Height = 17
      Align = alTop
      Caption = 'Senha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 37
    end
    object edtSenha: THedit
      Left = 0
      Top = 17
      Width = 137
      Height = 27
      Align = alClient
      PasswordChar = '*'
      TabOrder = 0
      Text = 'Hedit1'
      ColorFocus = 16777088
      ExplicitHeight = 25
    end
  end
end
