object frmCadastrarDistribuidor: TfrmCadastrarDistribuidor
  Left = 0
  Top = 0
  Caption = 'Cadastro Distribuidor'
  ClientHeight = 202
  ClientWidth = 447
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
    Width = 449
    Height = 201
    TabOrder = 0
    object btnSalvarDistribuidor: TButton
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Salvar'
      TabOrder = 0
      OnClick = btnSalvarDistribuidorClick
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 36
      Width = 444
      Height = 165
      TabOrder = 1
      object labek1: TLabel
        Left = 8
        Top = 17
        Width = 17
        Height = 13
        Caption = 'Id: '
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 29
        Height = 13
        Caption = 'CNPJ:'
      end
      object edIdDistr: TEdit
        Left = 45
        Top = 13
        Width = 60
        Height = 21
        Enabled = False
        OEMConvert = True
        TabOrder = 0
      end
      object edtNomeDistr: TEdit
        Left = 45
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object mskCNPJDistr: TMaskEdit
        Left = 43
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
  end
end
