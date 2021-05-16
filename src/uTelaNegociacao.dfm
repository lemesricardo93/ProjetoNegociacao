object frmTelaNegociacao: TfrmTelaNegociacao
  Left = 0
  Top = 0
  Caption = 'Tela de Negocia'#231#227'o'
  ClientHeight = 362
  ClientWidth = 521
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
    Left = 0
    Top = 0
    Width = 665
    Height = 361
    TabOrder = 0
    object vo: TGroupBox
      Left = 3
      Top = 39
      Width = 662
      Height = 322
      TabOrder = 0
      object Label1: TLabel
        Left = 7
        Top = 16
        Width = 110
        Height = 13
        Caption = 'N'#250'mero da Negocia'#231#227'o'
      end
      object Label2: TLabel
        Left = 7
        Top = 43
        Width = 49
        Height = 13
        Caption = 'Produtor :'
      end
      object Label3: TLabel
        Left = 7
        Top = 69
        Width = 58
        Height = 13
        Caption = 'Distribuidor:'
      end
      object Label4: TLabel
        Left = 7
        Top = 95
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object Label5: TLabel
        Left = 216
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Status:'
      end
      object Label6: TLabel
        Left = 226
        Top = 123
        Width = 79
        Height = 13
        Caption = 'Pre'#231'o de Venda:'
      end
      object Label7: TLabel
        Left = 7
        Top = 123
        Width = 119
        Height = 13
        Caption = 'Quantidade Requisitada:'
      end
      object Label8: TLabel
        Left = 379
        Top = 123
        Width = 58
        Height = 13
        Caption = 'Valor Total :'
      end
      object edtNumeroNegociacao: TEdit
        Left = 130
        Top = 13
        Width = 63
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtProdutorNegociacao: TEdit
        Left = 186
        Top = 40
        Width = 191
        Height = 21
        TabOrder = 1
      end
      object edtCodigoProdutor: TEdit
        Left = 130
        Top = 40
        Width = 33
        Height = 21
        TabOrder = 2
      end
      object Button3: TButton
        Left = 164
        Top = 40
        Width = 20
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = Button3Click
      end
      object edtCodDistrNegociacao: TEdit
        Left = 130
        Top = 66
        Width = 33
        Height = 21
        TabOrder = 4
      end
      object Button4: TButton
        Left = 164
        Top = 66
        Width = 20
        Height = 21
        Caption = '...'
        TabOrder = 5
        OnClick = Button4Click
      end
      object edtDistribuidorNegociacao: TEdit
        Left = 186
        Top = 66
        Width = 191
        Height = 21
        TabOrder = 6
      end
      object edtCodProdutNegociacao: TEdit
        Left = 130
        Top = 93
        Width = 33
        Height = 21
        TabOrder = 7
      end
      object Button5: TButton
        Left = 164
        Top = 93
        Width = 20
        Height = 21
        Caption = '...'
        TabOrder = 8
        OnClick = Button5Click
      end
      object edtProdutoNegociao: TEdit
        Left = 186
        Top = 93
        Width = 191
        Height = 21
        TabOrder = 9
      end
      object cbxStatus: TComboBox
        Left = 256
        Top = 13
        Width = 121
        Height = 22
        Style = csOwnerDrawFixed
        CharCase = ecUpperCase
        ItemIndex = 0
        TabOrder = 10
        Text = 'PENDENTE'
        Items.Strings = (
          'PENDENTE'
          'APROVADA'
          'CONCLUIR'
          'CANCELADA')
      end
      object edtQuantidadeRequisitada: TEdit
        Left = 130
        Top = 120
        Width = 68
        Height = 21
        Alignment = taRightJustify
        TabOrder = 11
        Text = '0'
        OnChange = edtQuantidadeRequisitadaChange
      end
      object memoNegociacao: TMemo
        Left = 3
        Top = 173
        Width = 510
        Height = 145
        Enabled = False
        Lines.Strings = (
          'Cod Produto        Nome       Quantidade       Pre'#231'o')
        TabOrder = 12
      end
      object edtValorTotalNegociado: TEdit
        Left = 445
        Top = 120
        Width = 60
        Height = 21
        TabOrder = 13
      end
      object btnAdicionar: TButton
        Left = 7
        Top = 145
        Width = 82
        Height = 25
        Caption = 'Adicinar item '
        TabOrder = 14
        OnClick = btnAdicionarClick
      end
      object btnLimparLista: TButton
        Left = 95
        Top = 145
        Width = 114
        Height = 25
        Caption = 'Cancelar todos Item'
        TabOrder = 15
      end
      object edtPrecoNegociacao: TEdit
        Left = 308
        Top = 120
        Width = 53
        Height = 21
        TabOrder = 16
      end
    end
    object GroupBox2: TGroupBox
      Left = 3
      Top = -7
      Width = 662
      Height = 49
      TabOrder = 1
      object Button1: TButton
        Left = 7
        Top = 15
        Width = 114
        Height = 25
        Caption = 'Gravar Negocia'#231#227'o'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 126
        Top = 15
        Width = 115
        Height = 25
        Caption = 'Alterar Negocia'#231#227'o'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
end
