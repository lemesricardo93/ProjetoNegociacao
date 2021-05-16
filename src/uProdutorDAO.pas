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

      function  ConsultaProdutor(pNome : string ) : TProdutor;
   constructor create;

   const SQLINSERT = 'INSERT INTO  SIAGRIPRODUTORTESTE (CODPRODUTOR,NOME, CPFCNPJ) VALUES (:id,:nome, :cpfcnpj)';
   const SQLINSERTLimite = ' INSERT INTO  SIAGRILIMITEPRODUTOR (CODIGOPRODUTORD , CODIGODISTRIBUIDOR , LIMITETOTAL) VALUES (:codigoprodutor, :codigodistribuidor, :limitetotal)';
  end;

implementation

{ TProdutorDao }

function TProdutorDao.ConsultaProdutor(pNome: string): TProdutor;
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
      dmDados.ibqueryProdutor.SQL.ADD('WHERE (NOME like :nome)  ');
      dmDados.ibqueryProdutor.ParamByName('nome').AsString := pNome + '%';
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
      dmDados.ibqueryProdutor.Close;
      dmDados.ibqueryProdutor.Free;
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
         dmDados.ibqueryProdutor.Close;
          dmDados.ibqueryProdutor.Free;
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
