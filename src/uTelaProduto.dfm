object frmTelaProduto: TfrmTelaProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro Produto'
  ClientHeight = 293
  ClientWidth = 618
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
    Width = 617
    Height = 297
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 32
      Width = 617
      Height = 265
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 19
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 7
        Top = 54
        Width = 87
        Height = 13
        Caption = 'Nome do Produto:'
      end
      object Label3: TLabel
        Left = 7
        Top = 98
        Width = 79
        Height = 13
        Caption = 'Pre'#231'o de Venda:'
      end
      object edtIdProduto: TEdit
        Left = 100
        Top = 12
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtNomeProduto: TEdit
        Left = 100
        Top = 51
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object mskPrecoVenda: TMaskEdit
        Left = 100
        Top = 95
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    object btnSalvarProduto: TButton
      Left = 7
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarProdutoClick
    end
  end
end
