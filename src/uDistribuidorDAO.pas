unit uDistribuidorDAO;

interface
uses uProdutoModel,uDmDados,SqlEXpr,Generics.Collections,Sysutils, data.DB, Dialogs,
 IBDatabase, IBCustomDataSet, IBQuery ,  uDistribuidorModel;
type
  TDistribuidorDao = class
    private
      FQryProduto : TIBQuery;
       FListProduto : TList<TProduto>;



    public
      procedure Salvar(pDistribuidor : TDistribuidor);
      function  ConsultaDistribuidor(pNome : string ) : TDistribuidor;



   constructor create;
   const
     SQLInsertDistribuidor = ' INSERT INTO SIAGRIDISTRIBUIDORTESTE(CODDISTRIBUIDOR,  NOME, CNPJ )VALUES (:id, :nome, :cnpj)';


  end;

implementation


{ TDistribuidorDao }

function  TDistribuidorDao.ConsultaDistribuidor(pNome : string ) : TDistribuidor;
var
  distribuidor  : TDistribuidor;
begin
  distribuidor  := TDistribuidor.Create;
  if not (dmDados.ibTransacaoSistema.Active)  then
  begin
   dmDados.ibTransacaoSistema.StartTransaction;
   end;

  try

      dmDados.ibqueryDistribuidor.Close;
      dmDados.ibqueryDistribuidor.SQL.Clear;
      dmDados.ibqueryDistribuidor.SQL.ADD('SELECT  CODDISTRIBUIDOR        ');
      dmDados.ibqueryDistribuidor.SQL.ADD('       ,NOME                   ');
      dmDados.ibqueryDistribuidor.SQL.ADD('       ,CNPJ                   ');
      dmDados.ibqueryDistribuidor.SQL.ADD(' FROM  SIAGRIDISTRIBUIDORTESTE ');
      dmDados.ibqueryDistribuidor.SQL.ADD('WHERE (NOME like :nome)  ');
      dmDados.ibqueryDistribuidor.ParamByName('nome').AsString := pNome + '%';
      dmDados.ibqueryDistribuidor.Open;

      if not (dmDados.ibqueryDistribuidor.IsEmpty) then
      begin
        dmDados.ibqueryDistribuidor.First;

        while not dmDados.ibqueryDistribuidor.Eof do
        begin
          distribuidor.CodigoDistribuidor := dmDados.ibqueryDistribuidor.FieldByName('CODDISTRIBUIDOR').AsInteger;
          distribuidor.NomeDistribuidor   := dmDados.ibqueryDistribuidor.FieldByName('NOME').AsString;
          distribuidor.CNPJDistribuidor   := dmDados.ibqueryDistribuidor.FieldByName('CNPJ').AsString;
          dmDados.ibqueryDistribuidor.Next;
         end;
         result := distribuidor;
      end;
    finally

    end;
end;


constructor TDistribuidorDao.create;
begin

end;

procedure TDistribuidorDao.Salvar(pDistribuidor: TDistribuidor);
begin
 if not (dmDados.ibTransacaoSistema.Active) then
 begin
   dmDados.ibTransacaoSistema.StartTransaction;
 end;
  try
     try
       dmDados.ibqueryDistribuidor.Close;
       dmDados.ibqueryDistribuidor.SQL.Clear;
       dmDados.ibqueryDistribuidor.SQL.ADD(SQLInsertDistribuidor);
       dmDados.ibqueryDistribuidor.ParamByName('id').AsInteger  ;
       dmDados.ibqueryDistribuidor.ParamByName('nome').AsString := pDistribuidor.NomeDistribuidor;
       dmDados.ibqueryDistribuidor.ParamByName('cnpj').AsString := pDistribuidor.CNPJDistribuidor;
      dmDados.ibqueryDistribuidor.ExecSQL;

       dmDados.ibTransacaoSistema.Commit;

     finally
      dmDados.ibqueryDistribuidor.Close;
      dmDados.ibqueryDistribuidor.Free;
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
