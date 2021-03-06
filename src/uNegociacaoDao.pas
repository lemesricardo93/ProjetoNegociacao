unit uNegociacaoDao;

interface
uses uDmDados, uNegociacaoModel, Winapi.Windows, data.DB;
type
  TCabecalhoNegociacaoDao = class

    public
      procedure SalvarCabecalho(pCabecalho : TCabecalhoNegociacao);
      function  ConsultaCabecalho( pCodigo,pCodProdutor,pCodDistribuidor : integer;pStatus : string ; vltotal : double) : TCabecalhoNegociacao;
      procedure AtualizaNegociacao (pCodigo : integer; pStatus : string);


   constructor create;


end;

type
  TItemNegociacaoDao = class
  private
    function ConsultaCabecalho(pCodigo: integer): TItemCabecalho;

    public
      procedure SalvarItemCabecalho(pItemCabecalho : TItemCabecalho);
      function  ConsultaItemCabecalho(pCodigo  : integer ) : TItemCabecalho;

   constructor create;


  end;

implementation


{ TCabecalhoNegociacaoDao }

procedure TCabecalhoNegociacaoDao.AtualizaNegociacao(pCodigo: integer; pStatus : string);
begin
if not (dmDados.ibTransacaoSistema.Active)  then
  begin
   dmDados.ibTransacaoSistema.StartTransaction;
   end;

  try
    dmDados.ibquerySegunda.Close;
    dmDados.ibquerySegunda.SQL.Clear;
    dmDados.ibquerySegunda.SQL.Add('UPDATE SIAGRICABNEGOCIACAO SET  ');

      if pStatus = 'CO' then
    begin
      dmDados.ibquerySegunda.SQL.Add('DTCONCLUSAO = (SELECT CURRENT_DATE FROM  RDB$DATABASE),');
    end;

    if pStatus = 'A' then
    begin
      dmDados.ibquerySegunda.SQL.Add('DTAPROVACAO = (SELECT CURRENT_DATE FROM  RDB$DATABASE),');
    end;

    if pStatus = 'CA' then
    begin
      dmDados.ibquerySegunda.SQL.Add('DTCANCELAMENTO = (SELECT CURRENT_DATE FROM  RDB$DATABASE),');
    end;
    dmDados.ibquerySegunda.SQL.Add('STATUS = :status');
    dmDados.ibquerySegunda.SQL.Add(' WHERE NUMPED = :numped ');
    dmDados.ibquerySegunda.ParamByName('numped').AsInteger := pCodigo;
    dmDados.ibquerySegunda.ParamByName('status').AsString := pStatus;
    dmDados.ibquerySegunda.ExecSQL;
    dmDados.ibTransacaoSistema.Commit;
  finally

  end;


end;

function TCabecalhoNegociacaoDao.ConsultaCabecalho(
  pCodigo,pCodProdutor,pCodDistribuidor : integer;pStatus : string ; vltotal : double): TCabecalhoNegociacao;
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
    dmDados.ibQueryCabecalho.SQL.ADD('SELECT  NUMPED                               ');
    dmDados.ibQueryCabecalho.SQL.ADD('    , round(A.VLTOTAL,2) VLTOTAL             ');
    dmDados.ibQueryCabecalho.SQL.ADD('       ,A.CODPRODUTOR                        ');
    dmDados.ibQueryCabecalho.SQL.ADD('       ,A.CODDISTRIBUIDOR                    ');
    dmDados.ibQueryCabecalho.SQL.ADD('       , ( CASE WHEN  STATUS =''P'' THEN     ');
    dmDados.ibQueryCabecalho.SQL.ADD('             ''PENDENTE''                    ');
    dmDados.ibQueryCabecalho.SQL.ADD('           WHEN  STATUS =''A'' THEN          ');
    dmDados.ibQueryCabecalho.SQL.ADD('             ''APROVADA''                    ');
    dmDados.ibQueryCabecalho.SQL.ADD('           WHEN  STATUS =''CO'' THEN         ');
    dmDados.ibQueryCabecalho.SQL.ADD('             ''CONCLUIR''                    ');
    dmDados.ibQueryCabecalho.SQL.ADD('           WHEN  STATUS =''CA'' THEN         ');
    dmDados.ibQueryCabecalho.SQL.ADD('             ''CANCELADA''                   ');
    dmDados.ibQueryCabecalho.SQL.ADD('         END) AS STATUS                     ');
    dmDados.ibQueryCabecalho.SQL.ADD('       ,DATACADASTRO                         ');
    dmDados.ibQueryCabecalho.SQL.ADD('       ,DTCONCLUSAO                         ');
    dmDados.ibQueryCabecalho.SQL.ADD('       ,DTAPROVACAO                         ');
    dmDados.ibQueryCabecalho.SQL.ADD('       ,DTCANCELAMENTO                      ');
    dmDados.ibQueryCabecalho.SQL.ADD('   , B.nome DISTRIBUIDOR                     ');
    dmDados.ibQueryCabecalho.SQL.ADD('    , c.nome produtor                        ');

    dmDados.ibQueryCabecalho.SQL.ADD('  FROM SIAGRICABNEGOCIACAO A , SIAGRIDISTRIBUIDORTESTE B , SIAGRIPRODUTORTESTE  C');
    dmDados.ibQueryCabecalho.SQL.ADD('  WHERE ( A.codprodutor      = C.codprodutor                      ');
    dmDados.ibQueryCabecalho.SQL.ADD('     AND A.coddistribuidor  = B.coddistribuidor)' );
    dmDados.ibQueryCabecalho.SQL.ADD('AND STATUS = ''P''                      ');

    if pCodProdutor > 0 then
    begin
     dmDados.ibQueryCabecalho.SQL.ADD('AND  A.codprodutor  = :codprodutor      ');
     dmDados.ibQueryCabecalho.ParamByName('codprodutor').asinteger := pCodProdutor;
    end;

     if pCodDistribuidor > 0 then
    begin
     dmDados.ibQueryCabecalho.SQL.ADD('AND  A.CODDISTRIBUIDOR  = :coddistribuidor      ');
     dmDados.ibQueryCabecalho.ParamByName('coddistribuidor').asinteger := pCodDistribuidor;
    end;

    if vltotal > 0 then
    begin
     dmDados.ibQueryCabecalho.SQL.ADD('AND  A.vltotal  = :vltotal      ');
     dmDados.ibQueryCabecalho.ParamByName('vltotal').AsFloat := vltotal;
    end;

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
        negociacao.numpedCabecalho          := dmDados.ibQueryCabecalho.FieldByName('NUMPED').AsInteger;
        negociacao.codprodutorCabecalho     := dmDados.ibQueryCabecalho.FieldByName('CODPRODUTOR').AsInteger;
        negociacao.coddistribuidorcabecalho := dmDados.ibQueryCabecalho.FieldByName('CODDISTRIBUIDOR').AsInteger;
        negociacao.statusPedido             := dmDados.ibQueryCabecalho.FieldByName('STATUS').AsString;
        negociacao.dataCadastro             := dmDados.ibQueryCabecalho.FieldByName('DATACADASTRO').AsDateTime;
        negociacao.distribuidor             := dmDados.ibQueryCabecalho.FieldByName('DISTRIBUIDOR').AsString;
        negociacao.produtor                 := dmDados.ibQueryCabecalho.FieldByName('PRODUTOR').AsString;
        negociacao.vltotal                  := dmDados.ibQueryCabecalho.FieldByName('vltotal').AsFloat;


        dmDados.ibQueryCabecalho.Next;
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
   dmDados.ibQueryCabecalho.SQL.Add('INSERT INTO SIAGRICABNEGOCIACAO(NUMPED, CODPRODUTOR, CODDISTRIBUIDOR, STATUS,DATACADASTRO,VLTOTAL) VALUES (:numped, :codprodutor, :coddistribuidor, :status, (SELECT CURRENT_DATE FROM  RDB$DATABASE), :vltotal)    ' );
   dmDados.ibQueryCabecalho.ParamByName('numped').AsInteger;//arNumeradores;
   dmDados.ibQueryCabecalho.ParamByName('codprodutor').AsInteger     := pCabecalho.codprodutorCabecalho;
   dmDados.ibQueryCabecalho.ParamByName('coddistribuidor').AsInteger := pCabecalho.coddistribuidorcabecalho;
   dmDados.ibQueryCabecalho.ParamByName('status').AsString           := pCabecalho.statusPedido;
   dmDados.ibQueryCabecalho.ParamByName('vltotal').AsFloat           := pCabecalho.vltotal;
   dmDados.ibQueryCabecalho.ExecSQL;
   dmDados.ibTransacaoSistema.Commit;


end;

{ TItemNegociacaoDao }

function TItemNegociacaoDao.ConsultaCabecalho(
  pCodigo: integer): TItemCabecalho;
begin

end;

function TItemNegociacaoDao.ConsultaItemCabecalho(
  pCodigo: integer): TItemCabecalho;
var
 Itemnegociacao : TItemCabecalho;
begin
 Itemnegociacao := TItemCabecalho.Create;
  if not (dmDados.ibTransacaoSistema.Active)  then
  begin
   dmDados.ibTransacaoSistema.StartTransaction;
   end;

  try
    dmDados.ibqueryItem.Close;
    dmDados.ibqueryItem.SQL.Clear;
    dmDados.ibqueryItem.SQL.ADD('SELECT  NUMPEDITEM                            ');
    dmDados.ibqueryItem.SQL.ADD('       ,CODPROD                               ');
    dmDados.ibqueryItem.SQL.ADD('       ,QUANTIDADE                            ');
    dmDados.ibqueryItem.SQL.ADD('       ,PRECOVENDA                            ');
    dmDados.ibqueryItem.SQL.ADD('       , P.NOME DESCRICAO                     ');
    dmDados.ibqueryItem.SQL.ADD(' FROM SIAGRIITEMNEGOCIACAO I, SIAGRIPRODUTOTESTE  P            ');

    dmDados.ibqueryItem.SQL.ADD('WHERE 1 = 1                            ');
    dmDados.ibqueryItem.SQL.ADD(' AND  I.CODPROD = P.CODPRODUTO           ');
    if pCodigo > 0 then
    begin
      dmDados.ibqueryItem.SQL.ADD('AND  NUMPEDITEM  = :numped                      ');
      dmDados.ibqueryItem.ParamByName('numped').asinteger := pCodigo;
    end;

    dmDados.ibqueryItem.Open;

    if not (dmDados.ibqueryItem.IsEmpty) then
    begin
      dmDados.ibqueryItem.First;
      while not dmDados.ibqueryItem.Eof do
      begin
        Itemnegociacao.numpedItem := dmDados.ibqueryItem.FieldByName('NUMPEDITEM').AsInteger;
        Itemnegociacao.codprodItem := dmDados.ibqueryItem.FieldByName('CODPROD').AsInteger;
        Itemnegociacao.quantidadeItem := dmDados.ibqueryItem.FieldByName('QUANTIDADE').AsFloat;
        Itemnegociacao.precovendaItem            :=  dmDados.ibqueryItem.FieldByName('PRECOVENDA').AsFloat;
        dmDados.ibqueryItem.Next;
      end;
        result := Itemnegociacao;
  end;
  finally

  end;
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
   dmDados.ibqueryItem.ParamByName('numpeditem').AsInteger  := pItemCabecalho.numpedItem;
   dmDados.ibqueryItem.ParamByName('codprod').AsInteger     :=pItemCabecalho.codprodItem ;
   dmDados.ibqueryItem.ParamByName('quantidade').AsFloat := pItemCabecalho.quantidadeItem;
   dmDados.ibqueryItem.ParamByName('precovenda').AsFloat  := pItemCabecalho.precovendaItem  ;
   dmDados.ibqueryItem.ExecSQL;
    DmDados.ibTransacaoSistema.Commit;

end;

end.
