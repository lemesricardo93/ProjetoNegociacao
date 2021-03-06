object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  Caption = 'Relatorio'
  ClientHeight = 362
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDados'
    CloseDataSource = False
    DataSet = dmDados.ibQueryCabecalho
    BCDToCurrency = False
    Left = 528
    Top = 168
  end
  object frxReport1: TfrxReport
    Version = '4.11.17'
    DataSet = frxDBDataset1
    DataSetName = 'frxDados'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44332.390772800930000000
    ReportOptions.LastChange = 44333.837694537040000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 344
    Top = 96
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
      end
      object frxDadosNUMPED: TfrxMemoView
        Left = 192.756030000000000000
        Top = 258.063080000000000000
        Width = 117.165430000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'NUMPED'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."NUMPED"]')
      end
      object Memo1: TfrxMemoView
        Top = 258.063080000000000000
        Width = 143.622140000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'N'#250'mero da negociacao')
      end
      object Memo2: TfrxMemoView
        Left = 3.779530000000000000
        Top = 292.078850000000000000
        Width = 166.299320000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'C'#243'digo do distribuidor')
      end
      object Memo3: TfrxMemoView
        Left = 430.866420000000000000
        Top = 255.283550000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'Status')
      end
      object frxDadosDISTRIBUIDOR: TfrxMemoView
        Left = 317.480520000000000000
        Top = 292.078850000000000000
        Width = 400.630180000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'DISTRIBUIDOR'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."DISTRIBUIDOR"]')
      end
      object frxDadosPRODUTOR: TfrxMemoView
        Left = 294.803340000000000000
        Top = 328.315090000000000000
        Width = 400.630180000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'PRODUTOR'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."PRODUTOR"]')
      end
      object Memo4: TfrxMemoView
        Left = 3.779530000000000000
        Top = 326.874150000000000000
        Width = 166.299320000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'C'#243'digo do PRODUTOR')
      end
      object frxDadosCODPRODUTOR1: TfrxMemoView
        Left = 185.196970000000000000
        Top = 326.094620000000000000
        Width = 83.149660000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'CODPRODUTOR'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."CODPRODUTOR"]')
      end
      object Memo5: TfrxMemoView
        Left = 5.000000000000000000
        Top = 360.110390000000000000
        Width = 166.299320000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'Valor Total')
      end
      object Memo6: TfrxMemoView
        Left = 7.559060000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        Height = 94.488250000000000000
        ShowHint = False
        Memo.UTF8W = (
          
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------'
          
            '                                                                ' +
            '         Cabe'#231'alho negocia'#231#227'o'
          
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------')
      end
      object Memo7: TfrxMemoView
        Left = -7.559060000000000000
        Top = 486.189240000000000000
        Width = 718.110700000000000000
        Height = 94.488250000000000000
        ShowHint = False
        Memo.UTF8W = (
          
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------'
          
            '                                                                ' +
            '         ITENS DA NEGOCIA'#199#195'O'
          
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------')
      end
      object Memo8: TfrxMemoView
        Left = 6.000000000000000000
        Top = 542.882190000000000000
        Width = 143.622140000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'N'#250'mero da negocia'#231#227'o')
      end
      object Memo9: TfrxMemoView
        Left = 3.779530000000000000
        Top = 580.677490000000000000
        Width = 143.622140000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'C'#243'digo do Produto')
      end
      object Memo10: TfrxMemoView
        Left = 385.512060000000000000
        Top = 580.677490000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'Quantidade')
      end
      object frxDBDataset2quantidade: TfrxMemoView
        Left = 385.512060000000000000
        Top = 618.472790000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'quantidade'
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        Memo.UTF8W = (
          '[frxDBDataset2."quantidade"]')
      end
      object frxDBDataset2precovenda: TfrxMemoView
        Left = 513.457020000000000000
        Top = 621.472790000000000000
        Width = 136.063080000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'precovenda'
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        Memo.UTF8W = (
          '[frxDBDataset2."precovenda"]')
      end
      object Memo11: TfrxMemoView
        Left = 514.016080000000000000
        Top = 580.677490000000000000
        Width = 143.622140000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'Pre'#231'o de Venda')
      end
      object frxDBDataset2DESCRICAO: TfrxMemoView
        Left = 154.960730000000000000
        Top = 618.472790000000000000
        Width = 181.417440000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'DESCRICAO'
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        Memo.UTF8W = (
          '[frxDBDataset2."DESCRICAO"]')
      end
      object Memo12: TfrxMemoView
        Left = 158.740260000000000000
        Top = 580.677490000000000000
        Width = 143.622140000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'Descri'#231#227'o do produto')
      end
      object frxDadosSTATUS: TfrxMemoView
        Left = 480.000310000000000000
        Top = 256.228510000000000000
        Width = 400.630180000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'STATUS'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."STATUS"]')
      end
      object frxDadosVLTOTAL: TfrxMemoView
        Left = 188.976500000000000000
        Top = 361.055350000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'VLTOTAL'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."VLTOTAL"]')
      end
      object Memo13: TfrxMemoView
        Left = 3.779530000000000000
        Top = 389.291590000000000000
        Width = 166.299320000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'DATA CONCLUS'#195'O :')
      end
      object Memo14: TfrxMemoView
        Left = 3.779530000000000000
        Top = 423.307360000000000000
        Width = 166.299320000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'DATA CANCELAMENTO :')
      end
      object Memo15: TfrxMemoView
        Left = 7.559060000000000000
        Top = 449.764070000000000000
        Width = 166.299320000000000000
        Height = 18.897650000000000000
        ShowHint = False
        Memo.UTF8W = (
          'DATA APROVAC'#195'O')
      end
      object frxDadosDTCONCLUSAO: TfrxMemoView
        Left = 185.196970000000000000
        Top = 389.291590000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'DTCONCLUSAO'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."DTCONCLUSAO"]')
      end
      object frxDadosDTCANCELAMENTO: TfrxMemoView
        Left = 185.196970000000000000
        Top = 423.307360000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'DTCANCELAMENTO'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."DTCANCELAMENTO"]')
      end
      object frxDadosDTAPROVACAO: TfrxMemoView
        Left = 184.196970000000000000
        Top = 449.764070000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'DTAPROVACAO'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."DTAPROVACAO"]')
      end
      object frxDBDataset2CODPROD: TfrxMemoView
        Left = 3.779530000000000000
        Top = 619.842920000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'CODPROD'
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        Memo.UTF8W = (
          '[frxDBDataset2."CODPROD"]')
      end
      object frxDBDataset2NUMPEDITEM: TfrxMemoView
        Left = 166.299320000000000000
        Top = 543.472790000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'NUMPEDITEM'
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        Memo.UTF8W = (
          '[frxDBDataset2."NUMPEDITEM"]')
      end
      object frxDadosCODDISTRIBUIDOR: TfrxMemoView
        Left = 192.756030000000000000
        Top = 291.023810000000000000
        Width = 117.165430000000000000
        Height = 18.897650000000000000
        ShowHint = False
        DataField = 'CODDISTRIBUIDOR'
        DataSet = frxDBDataset1
        DataSetName = 'frxDados'
        Memo.UTF8W = (
          '[frxDados."CODDISTRIBUIDOR"]')
      end
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = dmDados.ibqueryItem
    BCDToCurrency = False
    Left = 448
    Top = 248
  end
end
