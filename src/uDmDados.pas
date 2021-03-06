unit uDmDados;

interface

uses
   System.SysUtils, System.Classes, Data.DB, IBDatabase, forms, System.IniFiles,
  dialogs, IBCustomDataSet, IBQuery, Datasnap.DBClient;

type
  TdmDados = class(TDataModule)
    IBDatabase: TIBDatabase;
    ibTransacaoSistema: TIBTransaction;
    ibqueryDistribuidor: TIBQuery;
    ibqueryProdutor: TIBQuery;
    cdsProduorLimite: TClientDataSet;
    dtSourceProdutoLimite: TDataSource;
    cdsProduorLimitecodigoProdutor: TIntegerField;
    cdsProduorLimitecodigoDistribuidor: TIntegerField;
    cdsProduorLimitevalorLimite: TFloatField;
    ibqueryProdutorLimite: TIBQuery;
    ibqueryProduto: TIBQuery;
    ItemNegociacao: TClientDataSet;
    DataSource1: TDataSource;
    ItemNegociacaocodproduto: TFloatField;
    ItemNegociacaoprecovenda: TFloatField;
    ItemNegociacaoquantidade: TFloatField;
    ibQueryCabecalho: TIBQuery;
    ItemNegociacaonumped: TFloatField;
    ibqueryItem: TIBQuery;
    DataSource2: TDataSource;
    ibQueryCabecalhoNUMPED: TIntegerField;
    ibQueryCabecalhoCODPRODUTOR: TIntegerField;
    ibQueryCabecalhoCODDISTRIBUIDOR: TIntegerField;
    ibQueryCabecalhoDATACADASTRO: TDateField;
    ibQueryCabecalhoDISTRIBUIDOR: TWideStringField;
    ibQueryCabecalhoPRODUTOR: TWideStringField;
    ibQueryCabecalhoSTATUS: TWideStringField;
    ibqueryItemNUMPEDITEM: TIntegerField;
    ibqueryItemCODPROD: TIntegerField;
    ItemNegociacaoDESCRICAO: TStringField;
    ibqueryItemDESRICAO: TWideStringField;
    ibqueryItemQUANTIDADE: TCurrencyField;
    ibqueryItemPRECOVENDA: TFloatField;
    ibQueryCabecalhoVLTOTAL: TFloatField;
    ibquerySegunda: TIBQuery;
    ibQueryCabecalhoDTAPROVACAO: TDateField;
    ibQueryCabecalhoDTCANCELAMENTO: TDateField;
    ibQueryCabecalhoDTCONCLUSAO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private

  function LeIni(strArqIni, strSecao, strVariavel: string): string; overload;
function LeIni(strArqIni, strSecao, strVariavel, strDefault: string): string; overload;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmDados.DataModuleCreate(Sender: TObject);
var
  WFile: TIniFile;
  strCaminho: string;
begin
  try
    try
      strCaminho :=(ExtractFilePath(Application.exeName) + 'negociacao.ini');
      if (not FileExists(strCaminho)) then
      begin
       // WFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'negociacao.ini');
        WFile.WriteString('negociacao.ini','ConfiguracaoLocal', 'C:\ProjetoSiagri\data\DADOS.FDB');
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao Criar Arquivo ini ' + 'motivo:' + E.message);
      end;
    end;
  finally
    try
      IBDatabase.Connected := False;
      IBDatabase.DataBaseName := LeIni('negociacao.ini', 'ConfiguracaoLocal',
        'C:\ProjetoSiagri\data\DADOS.FDB');
      IBDatabase.LoginPrompt := False;
      IBDatabase.Connected := True;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao Conectar no Banco' + 'Motivo' + E.message);
      end;
    end;
  end;
  cdsProduorLimite.CreateDataSet;
  ItemNegociacao.CreateDataSet;
END;

function TdmDados.LeIni(strArqIni, strSecao, strVariavel: string): string;
var
  objArqIni: TIniFile;
  strString: string;
begin
  Result := '';
  objArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName) + '/' + strArqIni);
  try
    Result := objArqIni.ReadString(strSecao, strVariavel, strString);
  finally
    objArqIni.Free;
  end;
end;

procedure TdmDados.DataModuleDestroy(Sender: TObject);
begin
  cdsProduorLimite.Destroy;
end;

function TdmDados.LeIni(strArqIni, strSecao, strVariavel,
  strDefault: string): string;
var
  objArqIni: TIniFile;
begin
  Result := '';
  //objArqIni := tIniFile.Create(GetCurrentDir + '/' + strArqIni);
  objArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName) + '/' + strArqIni);
  try
    Result := objArqIni.ReadString(strSecao, strVariavel, strDefault);
  finally
    objArqIni.Free;
  end;
end;
end.
