unit uNegociacaoDao;

interface
uses uDmDados, uNegociacaoModel;
type
  TCabecalhoNegociacaoDao = class

    public
      procedure SalvarCabecalho(pCabecalho : TCabecalhoNegociacao);
      function  ConsultaCabecalho(pCodigo : integer ) : TCabecalhoNegociacao;

   constructor create;


end;

type
  TItemNegociacaoDao = class

    public
      procedure SalvarItemCabecalho(pItemCabecalho : TItemCabecalho);
      function  ConsultaCabecalho(pCodigo  : integer ) : TItemCabecalho;

   constructor create;


  end;

implementation


{ TCabecalhoNegociacaoDao }

function TCabecalhoNegociacaoDao.ConsultaCabecalho(
  pCodigo: integer): TCabecalhoNegociacao;
var
 negociacao : TCabecalhoNegociacao;
begin
 negociacao := TCabecalhoNegociacao.Create;
  if not (dmDados.ibTransacaoSistema.Active)  then
  begin
   dmDados.ibTransacaoSistema.StartTransaction;
   end;

  try
      dmDados.ibQueryCabecalho.Close;
      dmDados.ibQueryCabecalho.SQL.Clear;
      dmDados.ibQueryCabecalho.SQL.ADD('SELECT  NUMPED                            ');
      dmDados.ibQueryCabecalho.SQL.ADD('       ,CODPRODUTOR                       ');
      dmDados.ibQueryCabecalho.SQL.ADD('       ,CODDISTRIBUIDOR                   ');
      dmDados.ibQueryCabecalho.SQL.ADD('       ,STATUS                            ');
      dmDados.ibQueryCabecalho.SQL.ADD('       ,DATACADASTRO                      ');
      dmDados.ibQueryCabecalho.SQL.ADD(' FROM SIAGRICABNEGOCIACAO                 ');
      dmDados.ibQueryCabecalho.SQL.ADD('WHERE STATUS = ''P''                      ');

      if pCodigo > 0 then
      begin
        dmDados.ibQueryCabecalho.SQL.ADD('AND  NUMPED  = :numped                      ');
        dmDados.ibQueryCabecalho.ParamByName('numped').asinteger := pCodigo;
      end;



      dmDados.ibQueryCabecalho.Open;

      if not (dmDados.ibQueryCabecalho.IsEmpty) then
      begin
        dmDados.ibQueryCabecalho.First;

        while not dmDados.ibQueryCabecalho.Eof do
        begin
         negociacao.numpedCabecalho := dmDados.ibQueryCabecalho.FieldByName('NUMPED').AsInteger;
         negociacao.codprodutorCabecalho := dmDados.ibQueryCabecalho.FieldByName('CODPRODUTOR').AsInteger;
         negociacao.coddistribuidorcabecalho := dmDados.ibQueryCabecalho.FieldByName('CODDISTRIBUIDOR').AsInteger;
          negociacao.statusPedido            :=  dmDados.ibQueryCabecalho.FieldByName('STATUS').AsString;
          negociacao.dataCadastro            :=   dmDados.ibQueryCabecalho.FieldByName('DATACADASTRO').AsDateTime;
          dmDados.ibqueryProduto.Next;
         end;
         result := negociacao;
      end;
    finally

    end;
end;

constructor TCabecalhoNegociacaoDao.create;
begin

end;

procedure TCabecalhoNegociacaoDao.SalvarCabecalho(
  pCabecalho: TCabecalhoNegociacao);
begin
 if   ( not DmDados.ibTransacaoSistema.Active) then
 begin
  DmDados.ibTransacaoSistema.StartTransaction;
 end;

   dmDados.ibQueryCabecalho.Close;
   dmDados.ibQueryCabecalho.Close;
   dmDados.ibQueryCabecalho.SQL.Clear;
   dmDados.ibQueryCabecalho.SQL.Add('INSERT INTO SIAGRICABNEGOCIACAO(NUMPED, CODPRODUTOR, CODDISTRIBUIDOR, STATUS,DATACADASTRO) VALUES (:numped, :codprodutor, :coddistribuidor, :status, (SELECT CURRENT_DATE FROM  RDB$DATABASE))     ' );
   dmDados.ibQueryCabecalho.ParamByName('numped').AsInteger;//arNumeradores;
   dmDados.ibQueryCabecalho.ParamByName('codprodutor').AsInteger     := pCabecalho.codprodutorCabecalho;
   dmDados.ibQueryCabecalho.ParamByName('coddistribuidor').AsInteger := pCabecalho.coddistribuidorcabecalho;
   dmDados.ibQueryCabecalho.ParamByName('status').AsString           := pCabecalho.statusPedido;
   dmDados.ibQueryCabecalho.ExecSQL;

   //DmDados.ibTransacaoSistema.Commit;


end;

{ TItemNegociacaoDao }

function TItemNegociacaoDao.ConsultaCabecalho(
  pCodigo: integer): TItemCabecalho;
begin

end;

constructor TItemNegociacaoDao.create;
begin


end;

procedure TItemNegociacaoDao.SalvarItemCabecalho(pItemCabecalho: TItemCabecalho);
begin
 if   ( not DmDados.ibTransacaoSistema.Active) then
 begin
  DmDados.ibTransacaoSistema.StartTransaction;
 end;

   dmDados.ibqueryItem.Close;
   dmDados.ibqueryItem.Close;
   dmDados.ibqueryItem.SQL.Clear;
   dmDados.ibqueryItem.SQL.Add('INSERT INTO  SIAGRIITEMNEGOCIACAO (NUMPEDITEM ,CODPROD , QUANTIDADE, PRECOVENDA ) VALUES (:numpeditem, :codprod, :quantidade, :precovenda)' );
   dmDados.ibqueryItem.ParamByName('numpeditem').AsInteger;//arNumeradores;
   dmDados.ibqueryItem.ParamByName('codprod').AsInteger     :=pItemCabecalho.codprodItem ;
   dmDados.ibqueryItem.ParamByName('quantidade').AsFloat := pItemCabecalho.quantidadeItem;
   dmDados.ibqueryItem.ParamByName('precovenda').AsFloat  := pItemCabecalho.precovendaItem  ;
   dmDados.ibqueryItem.ExecSQL;
    DmDados.ibTransacaoSistema.Commit;

end;

end.
