unit uNegociacaoService;

interface
uses uNegociacaoModel, uNegociacaoDao;
type
  TNegociacaoService = class
  private
    FCabecalhoNegociacao : TCabecalhoNegociacaoDao;
    FItemCabecalho : TItemNegociacaoDao;
  public
   procedure SalvarNegociacao(pNumped, pCodProdutor, pCodDistribuidor : integer; pStatus : String;vltotal : double);
   function ConsultaCabecalho(pNumped : integer) : TCabecalhoNegociacao;
   procedure AtualizaCabecalho(pCodigo : integer; pStatus : string);
  constructor create;

  end;

   TItemNegociacaoService = class
  private
    FCabecalhoNegociacao : TCabecalhoNegociacaoDao;
    FItemCabecalho : TItemNegociacaoDao;
  public
   procedure SalvarNegociacao(pNumped, pCodProdutor, pCodDistribuidor : integer; pStatus : String);
   function ConsultaItemPedido(pNumped : integer) : TItemCabecalho;

  constructor create;

  end;


implementation
 uses udmDados;
{ TProdutorService }

procedure TNegociacaoService.AtualizaCabecalho(pCodigo: integer;
  pStatus: string);
var
  negociacaodao : TCabecalhoNegociacaoDao;
begin
  negociacaodao := TCabecalhoNegociacaoDao.create;
  negociacaodao.AtualizaNegociacao(pCodigo, pStatus);

end;

function TNegociacaoService.ConsultaCabecalho(
  pNumped: integer): TCabecalhoNegociacao;
var
 negociacaodao :   TCabecalhoNegociacaoDao;
begin
  negociacaodao :=   TCabecalhoNegociacaoDao.create;

 Result := negociacaodao.ConsultaCabecalho(pNumped,0,0,'',0);



end;

constructor TNegociacaoService.create;
begin
 FCabecalhoNegociacao := TCabecalhoNegociacaoDao.create;
 FItemCabecalho := TItemNegociacaoDao.create;

end;

procedure TNegociacaoService.SalvarNegociacao(pNumped, pCodProdutor, pCodDistribuidor : integer ; pStatus : string; vltotal : double );
var
  gNegociacao : TCabecalhoNegociacao;
  gNegociacaoItem : TItemCabecalho;
begin
  gNegociacao     := TCabecalhoNegociacao.Create;
  gNegociacaoItem := TItemCabecalho.Create;

  gNegociacao.codprodutorCabecalho     := pCodProdutor;
  gNegociacao.coddistribuidorcabecalho :=  pCodDistribuidor;
  gNegociacao.statusPedido             :=  pStatus;
//  gNegociacao.vltotal                  := vltotal;

  FCabecalhoNegociacao.SalvarCabecalho(gNegociacao);

  gNegociacao := FCabecalhoNegociacao.ConsultaCabecalho(0,pCodProdutor,pCodDistribuidor,pStatus,vltotal);


   dmDados.ItemNegociacao.first;
   while not dmDados.ItemNegociacao.Eof do
   begin
      gNegociacaoItem.numpedItem    := gNegociacao.numpedCabecalho;
     gNegociacaoItem.codprodItem    := dmDados.ItemNegociacaocodproduto.AsInteger;
     gNegociacaoItem.quantidadeItem := dmDados.ItemNegociacaoquantidade.AsInteger;
     gNegociacaoItem.precovendaItem := dmDados.ItemNegociacaoprecovenda.AsFloat;

    FItemCabecalho.SalvarItemCabecalho(gNegociacaoItem);
   dmDados.ItemNegociacao.Next;
   end;
end;

{ TItemNegociacaoService }

function TItemNegociacaoService.ConsultaItemPedido(
  pNumped: integer): TItemCabecalho;
var
  itemNegociacaodao : TItemNegociacaoDao;
begin
  itemNegociacaodao := TItemNegociacaoDao.create;

  result :=  itemNegociacaodao.ConsultaItemCabecalho(pNumped);

end;

constructor TItemNegociacaoService.create;
begin

end;

procedure TItemNegociacaoService.SalvarNegociacao(pNumped, pCodProdutor,
  pCodDistribuidor: integer; pStatus: String);
begin

end;

end.
