object frmPesquisaProduto: TfrmPesquisaProduto
  Left = 0
  Top = 0
  Caption = 'Pesquisa Produto'
  ClientHeight = 249
  ClientWidth = 509
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
    Left = -5
    Top = -8
    Width = 681
    Height = 409
    TabOrder = 0
    object btnPesquisaProdutor: TButton
      Left = 356
      Top = 26
      Width = 75
      Height = 38
      Caption = 'Pesquisar'
      TabOrder = 0
      OnClick = btnPesquisaProdutorClick
    end
    object tste: TDBGrid
      Left = 8
      Top = 87
      Width = 504
      Height = 162
      DataSource = dSourcePesquisProduto
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = tsteCellClick
      OnColEnter = tsteColEnter
      Columns = <
        item
          Expanded = False
          FieldName = 'CODPRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Visible = True
        end>
    end
    object Button2: TButton
      Left = 437
      Top = 26
      Width = 75
      Height = 38
      Caption = 'Cadastrar'
      TabOrder = 2
    end
    object GroupBox4: TGroupBox
      Left = 184
      Top = 16
      Width = 161
      Height = 53
      Caption = 'C'#243'digo'
      TabOrder = 3
      object edtPesquisaProduto: TEdit
        Left = 12
        Top = 21
        Width = 133
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 16
      Width = 169
      Height = 53
      Caption = 'Pesquisar por'
      TabOrder = 4
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
  end
  object dSourcePesquisProduto: TDataSource
    DataSet = dmDados.ibqueryProduto
    Left = 392
    Top = 128
  end
end
