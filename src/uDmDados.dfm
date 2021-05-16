object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 282
  Width = 478
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'C:\ProjetoSiagri\data\DADOS.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 16
    Top = 8
  end
  object ibTransacaoSistema: TIBTransaction
    DefaultDatabase = IBDatabase
    Left = 88
  end
  object ibqueryDistribuidor: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 40
    Top = 80
  end
  object ibqueryProdutor: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 160
    Top = 8
  end
  object cdsProduorLimite: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 376
    Top = 112
    object cdsProduorLimitecodigoProdutor: TIntegerField
      FieldName = 'codigoProdutor'
    end
    object cdsProduorLimitecodigoDistribuidor: TIntegerField
      FieldName = 'codigoDistribuidor'
    end
    object cdsProduorLimitevalorLimite: TFloatField
      FieldName = 'valorLimite'
    end
  end
  object dtSourceProdutoLimite: TDataSource
    DataSet = cdsProduorLimite
    Left = 296
    Top = 120
  end
  object ibqueryProdutorLimite: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 288
    Top = 8
  end
  object ibqueryProduto: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 224
    Top = 8
  end
  object ItemNegociacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 184
    object ItemNegociacaocodproduto: TFloatField
      FieldName = 'codproduto'
    end
    object ItemNegociacaoprecovenda: TFloatField
      FieldName = 'precovenda'
    end
    object ItemNegociacaoquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object ItemNegociacaonumped: TFloatField
      FieldName = 'numped'
    end
  end
  object DataSource1: TDataSource
    DataSet = ItemNegociacao
    Left = 296
    Top = 184
  end
  object ibQueryCabecalho: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    DataSource = DataSource1
    Left = 384
    Top = 8
  end
  object ibqueryItem: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 224
    Top = 80
  end
end