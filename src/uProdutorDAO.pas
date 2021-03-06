unit uProdutorDAO;

interface
uses uProdutoModel,uDmDados,SqlEXpr,Generics.Collections,Sysutils, data.DB, Dialogs,
 IBDatabase, IBCustomDataSet, IBQuery ,  uProdutorModel;
type
  TProdutorDao = class
    private
       FListProdutor : TList<TProdutor>;

    public
      procedure SalvarProdutor(pProdutor : TProdutor);
      procedure SalvarLimiteProdutor(pLimiteProdutor : TProdutorLimite);
      function ConsultaLimiteProdutor (pCodigoProdutor, pCodigoDistribuidor : integer) : TProdutorLimite;

      function  ConsultaProdutor(pNome,pCpfCNPJ : string ) : TProdutor;
   constructor create;

   const SQLINSERT = 'INSERT INTO  SIAGRIPRODUTORTESTE (CODPRODUTOR,NOME, CPFCNPJ) VALUES (:id,:nome, :cpfcnpj)';
   const SQLINSERTLimite = ' INSERT INTO  SIAGRILIMITEPRODUTOR (CODIGOPRODUTORD , CODIGODISTRIBUIDOR , LIMITETOTAL) VALUES (:codigoprodutor, :codigodistribuidor, :limitetotal)';
  end;

implementation

{ TProdutorDao }

function TProdutorDao.ConsultaLimiteProdutor(pCodigoProdutor,
  pCodigoDistribuidor: integer): TProdutorLimite;
var
  produtorlimite : TProdutorLimite;
begin
  produtorlimite := TProdutorLimite.Create;
 if not (dmDados.ibTransacaoSistema.Active) then
 begin
   dmDados.ibTransacaoSistema.StartTransaction;
 end;
     try
       dmDados.ibqueryProdutorLimite.Close;
       dmDados.ibqueryProdutorLimite.SQL.Clear;
       dmDados.ibqueryProdutorLimite.SQL.ADD('SELECT  ((LI.limitetotal) - SUM(VLTOTAL ))  DISP,                     ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('          LI.LIMITETOTAL ,                                            ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('         CAB.CODDISTRIBUIDOR,                                         ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('         CAB.CODPRODUTOR                                              ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('     FROM  SIAGRICABNEGOCIACAO cab, SIAGRILIMITEPRODUTOR LI           ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('     WHERE CAB.codprodutor = li.codigoprodutord                       ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('         and cab.coddistribuidor = li.codigodistribuidor              ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('         and cab.coddistribuidor = :coddistribuidor                   ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('         and cab.codprodutor = :codprodutor                           ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('         and cab.status =''A''                                        ');
       dmDados.ibqueryProdutorLimite.SQL.ADD('     group by  CAB.CODDISTRIBUIDOR , CAB.CODPRODUTOR , LI.limitetotal ');
       dmDados.ibqueryProdutorLimite.ParamByName('codprodutor').AsInteger := pCodigoProdutor;
       dmDados.ibqueryProdutorLimite.ParamByName('coddistribuidor').AsInteger := pCodigoDistribuidor;
       dmDados.ibqueryProdutorLimite.Open;

       if  not dmDados.ibqueryProdutorLimite.IsEmpty then
       begin
         produtorlimite.ValorLimite :=  dmDados.ibqueryProdutorLimite.FieldByName('LIMITETOTAL').AsFloat;
         produtorlimite.disponivel  :=   dmDados.ibqueryProdutorLimite.FieldByName('DISP').AsFloat;
       end;

       Result :=produtorlimite;


    finally

     end;

end;

function TProdutorDao.ConsultaProdutor(pNome,pCpfCNPJ : string): TProdutor;
var
  produtor  : TProdutor;
begin
  produtor  := TProdutor.Create;
  if not (dmDados.ibTransacaoSistema.Active)  then
  begin
   dmDados.ibTransacaoSistema.StartTransaction;
   end;
  try
      dmDados.ibqueryProdutor.Close;
      dmDados.ibqueryProdutor.SQL.Clear;
      dmDados.ibqueryProdutor.SQL.ADD('SELECT  CODPRODUTOR           ');
      dmDados.ibqueryProdutor.SQL.ADD('       ,NOME                  ');
      dmDados.ibqueryProdutor.SQL.ADD('       ,CPFCNPJ               ');
      dmDados.ibqueryProdutor.SQL.ADD(' FROM  SIAGRIPRODUTORTESTE    ');


      if pNome <> '' then
      begin
        dmDados.ibqueryProdutor.SQL.ADD('WHERE 0=0 ');
         dmDados.ibqueryProdutor.SQL.ADD('AND NOME LIKE (:nome)        ');
        dmDados.ibqueryProdutor.ParamByName('nome').AsString := pNome + '%';
      end;

      if pCpfCNPJ <> '' then
      begin
        dmDados.ibqueryProdutor.SQL.ADD('AND CPFCNPJ = :cpfcnpj       ');
        dmDados.ibqueryProdutor.ParamByName('cpfcnpj').AsString :=pCpfCNPJ;
      end;

     dmDados.ibqueryProdutor.Open;

      if not (dmDados.ibqueryProdutor.IsEmpty) then
      begin
        dmDados.ibqueryProdutor.First;

        while not dmDados.ibqueryProdutor.Eof do
        begin
          produtor.CodigoProdutor     := dmDados.ibqueryProdutor.FieldByName('CODPRODUTOR').AsInteger;
          produtor.NomeProdutor       := dmDados.ibqueryProdutor.FieldByName('NOME').AsString;
          produtor.IdentidadeProdutor := dmDados.ibqueryProdutor.FieldByName('CPFCNPJ').AsString;
          dmDados.ibqueryProdutor.Next;
         end;
         result := produtor;
      end;
    finally
    
    end;
end;


constructor TProdutorDao.create;
begin

end;

procedure TProdutorDao.SalvarLimiteProdutor(pLimiteProdutor: TProdutorLimite);
begin
 if not (dmDados.ibTransacaoSistema.Active) then
 begin
   dmDados.ibTransacaoSistema.StartTransaction;
 end;
  try
     try
       dmDados.ibqueryProdutorLimite.Close;
       dmDados.ibqueryProdutorLimite.SQL.Clear;
       dmDados.ibqueryProdutorLimite.SQL.ADD(SQLINSERTLimite);
       dmDados.ibqueryProdutorLimite.ParamByName('codigoprodutor').AsInteger    := pLimiteProdutor.CodigoProdutorLimite;
       dmDados.ibqueryProdutorLimite.ParamByName('codigodistribuidor').AsInteger := pLimiteProdutor.CodigoDistribuidorLimite;
       dmDados.ibqueryProdutorLimite.ParamByName('limitetotal').AsFloat   := pLimiteProdutor.ValorLimite;
       dmDados.ibqueryProdutorLimite.ExecSQL;

       dmDados.ibTransacaoSistema.Commit;

     finally
         dmDados.ibqueryProdutorLimite.Close;
          dmDados.ibqueryProdutorLimite.Free;
     end;


  except
   on E: Exception do
      begin
        dmDados.ibTransacaoSistema.Rollback;
        ShowMessage('Erro ao Conectar no Banco' + 'Motivo' + E.message);
      end;
  end;
end;

procedure TProdutorDao.SalvarProdutor(pPRodutor: TProdutor);
begin
 if not (dmDados.ibTransacaoSistema.Active) then
 begin
   dmDados.ibTransacaoSistema.StartTransaction;
 end;
  try
     try
       dmDados.ibqueryProdutor.Close;
       dmDados.ibqueryProdutor.SQL.Clear;
       dmDados.ibqueryProdutor.SQL.ADD(SQLINSERT);
       dmDados.ibqueryProdutor.ParamByName('id').AsInteger;// pPRodutor.CodigoProdutor;
       dmDados.ibqueryProdutor.ParamByName('nome').AsString := pProdutor.NomeProdutor;
       dmDados.ibqueryProdutor.ParamByName('cpfcnpj').AsString := pProdutor.IdentidadeProdutor;
       dmDados.ibqueryProdutor.ExecSQL;

       dmDados.ibTransacaoSistema.Commit;

     finally

     end;


  except
   on E: Exception do
      begin
        dmDados.ibTransacaoSistema.Rollback;
        ShowMessage('Erro ao Conectar no Banco' + 'Motivo' + E.message);
      end;
  end;
end;

end.
