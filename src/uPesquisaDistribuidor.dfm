object frmTelaDistribuidor: TfrmTelaDistribuidor
  Left = 0
  Top = 0
  Caption = 'Pesquisa Distribuidor'
  ClientHeight = 187
  ClientWidth = 546
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
    Left = 0
    Top = 0
    Width = 585
    Height = 321
    TabOrder = 0
    object dbdistribuidor: TDBGrid
      Left = 1
      Top = 63
      Width = 541
      Height = 120
      DataSource = DtSourcePesquisaDistribuidor
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbdistribuidorCellClick
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 4
      Width = 169
      Height = 53
      Caption = 'Pesquisar por'
      TabOrder = 1
      object ComboBox1: TComboBox
        Left = 7
        Top = 16
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
    object GroupBox2: TGroupBox
      Left = 176
      Top = 4
      Width = 209
      Height = 53
      Caption = 'C'#243'digo'
      TabOrder = 2
      object edtPesquisaDistr: TEdit
        Left = 5
        Top = 17
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object btnPesquisaDistr: TButton
      Left = 389
      Top = 5
      Width = 75
      Height = 38
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = btnPesquisaDistrClick
    end
    object Button2: TButton
      Left = 467
      Top = 5
      Width = 75
      Height = 38
      Caption = 'Cadastrar'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object DtSourcePesquisaDistribuidor: TDataSource
    DataSet = dmDados.ibqueryDistribuidor
    Left = 480
    Top = 64
  end
end
