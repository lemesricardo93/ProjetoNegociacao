unit uProdutoDAO;

interface
uses uProdutoModel,uDmDados,SqlEXpr,Generics.Collections,Sysutils, data.DB, Dialogs,
 IBDatabase, IBCustomDataSet,
  IBQuery;
type
  TProdutoDao = class
    private
      FQryProduto : TIBQuery;
       FListProduto : TList<TProduto>;

    public
      procedure Salvar(pProduto : TProduto);
      function ConsultaProduto (pCodProd : integer;  pNome : string) : TProduto;



   constructor create;
   const
     SQLInsertProduto = ' INSERT INTO SIAGRIPRODUTOTESTE(CODPRODUTO,  NOME, PRECO) VALUES (:ID, :N0ME, :PRECO)';

  end;

implementation
   uses uTelaPrincpal;
{ TProdutoDao }

function TProdutoDao.ConsultaProduto(pCodProd : integer; pNome: string): TProduto;
var
  produto  : TProduto;
begin
  produto  := TProduto.Create;
  if not (dmDados.ibTransacaoSistema.Active)  then
  begin
   dmDados.ibTransacaoSistema.StartTransaction;
   end;

  try

      dmDados.ibqueryProduto.Close;
      dmDados.ibqueryProduto.SQL.Clear;
      dmDados.ibqueryProduto.SQL.ADD('SELECT  CODPRODUTO            ');
      dmDados.ibqueryProduto.SQL.ADD('       ,NOME                  ');
      dmDados.ibqueryProduto.SQL.ADD('       ,PRECO                 ');
      dmDados.ibqueryProduto.SQL.ADD(' FROM SIAGRIPRODUTOTESTE      ');
      dmDados.ibqueryProduto.SQL.Add('WHERE 1=1                     ');

     if pCodProd > 0 then
     begin
       dmDados.ibqueryProduto.SQL.Add('AND CODPRODUTO = :codproduto');
       dmDados.ibqueryProduto.ParamByName('codproduto').AsInteger := pCodProd;

     end;

      if pNome <> '' then
      begin
        dmDados.ibqueryProduto.SQL.Add('AND NOME LIKE :nome');
        dmDados.ibqueryProduto.ParamByName('nome').AsString := pNome + '%';
      end;

      dmDados.ibqueryProduto.Open;

      if not (dmDados.ibqueryProduto.IsEmpty) then
      begin
        dmDados.ibqueryProduto.First;

        while not dmDados.ibqueryProduto.Eof do
        begin
          produto.CodProduto  := dmDados.ibqueryProduto.FieldByName('CODPRODUTO').AsInteger;
          produto.Nome        := dmDados.ibqueryProduto.FieldByName('NOME').AsString;
          produto.PrecoVenda  := dmDados.ibqueryProduto.FieldByName('PRECO').AsFloat;
          dmDados.ibqueryProduto.Next;
         end;
         result := produto;
      end;
    finally

    end;
end;

constructor TProdutoDao.create;
begin
  FQryProduto  := TIBQuery.Create(nil);
//FQryProduto := dmDados.sqlProduto;
  FListProduto := TList<TProduto>.Create;

end;

procedure TProdutoDao.Salvar(pProduto: TProduto);
begin
 if   ( not DmDados.ibTransacaoSistema.Active) then
 begin
  DmDados.ibTransacaoSistema.StartTransaction;
 end;

   dmDados.ibqueryProduto.Close;
   dmDados.ibqueryProduto.Close;
   dmDados.ibqueryProduto.SQL.Clear;
   dmDados.ibqueryProduto.SQL.Add('INSERT INTO SIAGRIPRODUTOTESTE (CODPRODUTO,  NOME, PRECO) VALUES (:id, :nome, :preco)');
   dmDados.ibqueryProduto.ParamByName('ID').AsInteger;//arNumeradores;
   dmDados.ibqueryProduto.ParamByName('nome').AsString := pProduto.Nome;
   dmDados.ibqueryProduto.ParamByName('preco').AsFloat := pProduto.PrecoVenda;
   dmDados.ibqueryProduto.ExecSQL;
   DmDados.ibTransacaoSistema.Commit;
end;

end.
