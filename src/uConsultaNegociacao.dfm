object frmConsultaNegociacao: TfrmConsultaNegociacao
  Left = 0
  Top = 0
  Caption = 'Consulta Negocia'#231#227'o'
  ClientHeight = 244
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 0
    Width = 681
    Height = 385
    TabOrder = 0
    object btnImprimir: TButton
      Left = 427
      Top = 26
      Width = 71
      Height = 38
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object Button1: TButton
      Left = 30
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 15
    Width = 169
    Height = 53
    Caption = 'Pesquisar por'
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 8
      Top = 18
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'C'#243'digo'
      Items.Strings = (
        'C'#243'digo'
        'Nome')
    end
  end
  object GroupBox4: TGroupBox
    Left = 184
    Top = 16
    Width = 161
    Height = 53
    Caption = 'C'#243'digo'
    TabOrder = 2
    object edtPesquisaPedido: TEdit
      Left = 12
      Top = 21
      Width = 133
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  object btnPesquisaProdutor: TButton
    Left = 356
    Top = 26
    Width = 75
    Height = 38
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = btnPesquisaProdutorClick
  end
  object dbPesquisaPedido: TDBGrid
    Left = 9
    Top = 75
    Width = 504
    Height = 162
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbPesquisaPedidoCellClick
  end
  object DataSource1: TDataSource
    DataSet = dmDados.ibQueryCabecalho
    Left = 400
    Top = 128
  end
end
