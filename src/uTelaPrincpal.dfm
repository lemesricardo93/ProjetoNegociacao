object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Negocia'#231#227'o de Produtores'
  ClientHeight = 279
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 520
    object ff1: TMenuItem
      Caption = 'Cadastro'
      object Produto1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produto1Click
      end
      object Produtor1: TMenuItem
        Caption = 'Produtor'
        OnClick = Produtor1Click
      end
      object Distribuidor1: TMenuItem
        Caption = 'Distribuidor'
      end
    end
    object Manutenodenegociao1: TMenuItem
      Caption = 'Manuten'#231#227'o de negocia'#231#227'o'
      OnClick = Manutenodenegociao1Click
    end
  end
end
