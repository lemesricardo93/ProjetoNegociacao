unit uNegociacaoService;

interface
uses uNegociacaoModel, uNegociacaoDao;
type
  TNegociacaoService = class
  private
    FCabecalhoNegociacao : TCabecalhoNegociacaoDao;
    FItemCabecalho : TItemNegociacaoDao;
  public
   procedure SalvarNegociacao(pNumped, pCodProdutor, pCodDistribuidor : integer; pStatus : String);
   function ConsultaCabecalho(pNumped : integer) : TCabecalhoNegociacao;



  constructor create;

  end;

implementation
 uses udmDados;
{ TProdutorService }

function TNegociacaoService.ConsultaCabecalho(
  pNumped: integer): TCabecalhoNegociacao;
var
 negociacaodao :   TCabecalhoNegociacaoDao;
begin
  negociacaodao :=   TCabecalhoNegociacaoDao.create;

Result := negociacaodao.ConsultaCabecalho(0);


end;

constructor TNegociacaoService.create;
begin
 FCabecalhoNegociacao := TCabecalhoNegociacaoDao.create;
 FItemCabecalho := TItemNegociacaoDao.create;

end;

procedure TNegociacaoService.SalvarNegociacao(pNumped, pCodProdutor, pCodDistribuidor : integer ; pStatus : string );
var
  gNegociacao : TCabecalhoNegociacao;
  gNegociacaoItem : TItemCabecalho;
begin
   gNegociacao     := TCabecalhoNegociacao.Create;
   gNegociacaoItem := TItemCabecalho.Create;
   // gNegociacao.numpedCabecalho :=0;
   gNegociacao.codprodutorCabecalho := pCodProdutor;
   gNegociacao.coddistribuidorcabecalho :=  pCodProdutor;
   gNegociacao.statusPedido             :=  pStatus;

   FCabecalhoNegociacao.SalvarCabecalho(gNegociacao);

   dmDados.ItemNegociacao.first;
   while not dmDados.ItemNegociacao.Eof do
   begin
     gNegociacaoItem.codprodItem := dmDados.ItemNegociacaocodproduto.AsInteger;
     gNegociacaoItem.quantidadeItem := dmDados.ItemNegociacaoquantidade.AsInteger;
     gNegociacaoItem.precovendaItem  := dmDados.ItemNegociacaoprecovenda.AsFloat;

    FItemCabecalho.SalvarItemCabecalho(gNegociacaoItem);


   dmDados.ItemNegociacao.Next;
   end;





end;

end.
