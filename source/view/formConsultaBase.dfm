object frmConsultaBase: TfrmConsultaBase
  Left = 0
  Top = 0
  Caption = 'Consulta Base'
  ClientHeight = 299
  ClientWidth = 635
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl_descricao: TLabel
      Left = 24
      Top = 16
      Width = 29
      Height = 16
      Caption = 'Filtro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnPesquisar: TSpeedButton
      Left = 535
      Top = 33
      Width = 26
      Height = 25
      Hint = 'Filtrar'
      Caption = '...'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnPesquisarClick
    end
    object edt_desc: THedit
      Left = 24
      Top = 33
      Width = 505
      Height = 25
      TabOrder = 0
      OnKeyPress = edt_descKeyPress
      ColorFocus = 16777088
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 81
    Width = 635
    Height = 185
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbGridConsulta: TDBGrid
      Left = 0
      Top = 0
      Width = 635
      Height = 185
      Align = alClient
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbGridConsultaDblClick
      OnKeyDown = dbGridConsultaKeyDown
    end
  end
  object pnRodaPe: TPanel
    Left = 0
    Top = 266
    Width = 635
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnImportar: TButton
      Left = 560
      Top = 0
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Importar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnImportarClick
    end
  end
  object DataSource1: TDataSource
    DataSet = queryConsulta
    Left = 368
    Top = 16
  end
  object queryConsulta: TFDQuery
    Connection = dmConexaoBanco.conexaoBase
    Left = 448
    Top = 16
  end
end
