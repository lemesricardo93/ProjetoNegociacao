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
    Active = True
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
    Left = 408
    Top = 80
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
    Left = 296
    Top = 48
  end
  object ibqueryProduto: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 240
    Top = 8
  end
  object ItemNegociacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 144
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
    object ItemNegociacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
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
    SQL.Strings = (
      '')
    Left = 384
    Top = 8
    object ibQueryCabecalhoNUMPED: TIntegerField
      FieldName = 'NUMPED'
    end
    object ibQueryCabecalhoCODPRODUTOR: TIntegerField
      FieldName = 'CODPRODUTOR'
    end
    object ibQueryCabecalhoCODDISTRIBUIDOR: TIntegerField
      FieldName = 'CODDISTRIBUIDOR'
    end
    object ibQueryCabecalhoDATACADASTRO: TDateField
      FieldName = 'DATACADASTRO'
    end
    object ibQueryCabecalhoDISTRIBUIDOR: TWideStringField
      FieldName = 'DISTRIBUIDOR'
      Size = 80
    end
    object ibQueryCabecalhoPRODUTOR: TWideStringField
      FieldName = 'PRODUTOR'
      Size = 80
    end
    object ibQueryCabecalhoSTATUS: TWideStringField
      FieldName = 'STATUS'
      Size = 80
    end
    object ibQueryCabecalhoVLTOTAL: TFloatField
      FieldName = 'VLTOTAL'
    end
    object ibQueryCabecalhoDTAPROVACAO: TDateField
      FieldName = 'DTAPROVACAO'
    end
    object ibQueryCabecalhoDTCANCELAMENTO: TDateField
      FieldName = 'DTCANCELAMENTO'
    end
    object ibQueryCabecalhoDTCONCLUSAO: TDateField
      FieldName = 'DTCONCLUSAO'
    end
  end
  object ibqueryItem: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 224
    Top = 80
    object ibqueryItemNUMPEDITEM: TIntegerField
      FieldName = 'NUMPEDITEM'
    end
    object ibqueryItemCODPROD: TIntegerField
      FieldName = 'CODPROD'
    end
    object ibqueryItemDESRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object ibqueryItemQUANTIDADE: TCurrencyField
      FieldName = 'QUANTIDADE'
    end
    object ibqueryItemPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
    end
  end
  object DataSource2: TDataSource
    Left = 184
    Top = 200
  end
  object ibquerySegunda: TIBQuery
    Database = IBDatabase
    Transaction = ibTransacaoSistema
    Left = 64
    Top = 152
  end
end
