object frmCadastroProdutor: TfrmCadastroProdutor
  Left = 0
  Top = 0
  Caption = 'Pesquisa Produtor'
  ClientHeight = 200
  ClientWidth = 552
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
    Top = -3
    Width = 577
    Height = 276
    TabOrder = 0
    object dbProdutor: TDBGrid
      Left = 4
      Top = 63
      Width = 541
      Height = 120
      DataSource = dtSourcePesquisaProdutorra
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbProdutorCellClick
    end
    object GroupBox2: TGroupBox
      Left = 176
      Top = 4
      Width = 209
      Height = 53
      Caption = 'C'#243'digo'
      TabOrder = 1
      object edtPesquisa: TEdit
        Left = 6
        Top = 17
        Width = 192
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 0
        Width = 169
        Height = 53
        Caption = 'Pesquisar por'
        TabOrder = 1
        object ComboBox2: TComboBox
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
      object DBGrid2: TDBGrid
        Left = -332
        Top = -67
        Width = 541
        Height = 120
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 209
        Height = 53
        Caption = 'C'#243'digo'
        TabOrder = 3
        object edtPesquisaProdutor: TEdit
          Left = 5
          Top = 17
          Width = 201
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
      end
    end
    object btnPesquisaProdutor: TButton
      Left = 391
      Top = 19
      Width = 75
      Height = 38
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisaProdutorClick
    end
    object Button2: TButton
      Left = 470
      Top = 19
      Width = 75
      Height = 38
      Caption = 'Cadastrar'
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 4
      Width = 169
      Height = 53
      Caption = 'Pesquisar por'
      TabOrder = 4
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
  end
  object dtSourcePesquisaProdutorra: TDataSource
    DataSet = dmDados.ibqueryProdutor
    Left = 440
    Top = 112
  end
end
