object frmTelaProdutor: TfrmTelaProdutor
  Left = 0
  Top = 0
  Caption = 'Cadastro Produtor'
  ClientHeight = 266
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 0
    Width = 602
    Height = 265
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 37
      Width = 585
      Height = 225
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Cadastro de Produtor'
        object addLimite: TLabel
          Left = 5
          Top = 8
          Width = 72
          Height = 13
          Caption = 'Nome produtor'
        end
        object Label3: TLabel
          Left = 7
          Top = 35
          Width = 52
          Height = 13
          Caption = 'CPF/CNPJ:'
        end
        object edtNomeProdutor: TEdit
          Left = 83
          Top = 2
          Width = 246
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
        end
        object mskCPFCNPJ: TMaskEdit
          Left = 83
          Top = 29
          Width = 120
          Height = 21
          TabOrder = 1
          OnChange = mskCPFCNPJChange
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Limite de  cr'#233'dito'
        ImageIndex = 1
        object Label1: TLabel
          Left = 6
          Top = 40
          Width = 27
          Height = 13
          Caption = 'Limite'
        end
        object Label4: TLabel
          Left = 2
          Top = 15
          Width = 54
          Height = 13
          Caption = 'Distribuidor'
        end
        object mskLimite: TMaskEdit
          Left = 81
          Top = 37
          Width = 118
          Height = 21
          TabOrder = 0
        end
        object edtDistribuidorLimite: TEdit
          Left = 113
          Top = 10
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object Button1: TButton
          Left = 58
          Top = 10
          Width = 17
          Height = 21
          Hint = 'Pesquisar Distribuidor'
          Caption = '...'
          TabOrder = 2
          OnClick = Button1Click
        end
        object edtCodDistLimite: TEdit
          Left = 81
          Top = 10
          Width = 26
          Height = 21
          TabOrder = 3
        end
        object btnAdicionarLimite: TButton
          Left = 216
          Top = 33
          Width = 75
          Height = 25
          Caption = '&Adicionar'
          TabOrder = 4
          OnClick = btnAdicionarLimiteClick
        end
        object memoLimite: TMemo
          Left = 3
          Top = 64
          Width = 566
          Height = 129
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 5
        end
      end
    end
    object btnSalvarProdutor: TButton
      Left = 0
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarProdutorClick
    end
  end
end
