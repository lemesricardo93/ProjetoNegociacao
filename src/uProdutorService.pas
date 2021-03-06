unit uProdutorService;

interface
uses uProdutorModel, uProdutorDao;
type
  TProdutorService = class
  private
    FProdutorDAO : TProdutorDao;
  public
    procedure SalvarProdutor(pNome : string; pCPFCNPJ : string ) ;
      function ConsultaProdutor(pCodigo : integer; pNome,pCpfCNPJ : string) : TProdutor;
  constructor create;

  end;

type
  TProdutorLimiteService = class
  private
    FProdutorDAO : TProdutorDao;
  public
    procedure SalvarProdutorLimite(pCodigoProdutor, pCodigoDistribuidor :integer; pLimiteTotal : double) ;
    function  validaLimiteProdutor(pCodigoProdutor, pCodigoDistribuidor : Integer) : TProdutorLimite;

  constructor create;

  end;


implementation

{ TProdutorService }

function TProdutorService.ConsultaProdutor(pCodigo: integer;
  pNome, pCpfCNPJ: string): TProdutor;
var
  distribuidordao : TProdutorDao;
begin
  distribuidordao := TProdutorDao.create;
  result := distribuidordao.ConsultaProdutor(pNome,pCpfCNPJ);
end;

constructor TProdutorService.create;
begin
  FProdutorDAO := TProdutorDao.create
end;

procedure TProdutorService.SalvarProdutor(pNome, pCPFCNPJ: string);
var
  gProdutor : TProdutor;
begin
  gProdutor := TProdutor.Create;
  gProdutor.NomeProdutor := pNome;
  gProdutor.IdentidadeProdutor :=pCPFCNPJ;
  FProdutorDAO.SalvarProdutor(gProdutor);
end;

{ TProdutorLimiteService }


constructor TProdutorLimiteService.create;
begin
  FProdutorDAO := TProdutorDao.create;
end;

procedure TProdutorLimiteService.SalvarProdutorLimite(pCodigoProdutor,
  pCodigoDistribuidor: integer; pLimiteTotal: double);
var
  gProdutoLimite : TProdutorLimite;
begin
  gProdutoLimite := TProdutorLimite.Create;
  gProdutoLimite.CodigoProdutorLimite     := pCodigoProdutor;
  gProdutoLimite.CodigoDistribuidorLimite := pCodigoDistribuidor;
  gProdutoLimite.ValorLimite              := pLimiteTotal;
  FProdutorDAO.SalvarLimiteProdutor(gProdutoLimite);

end;

function TProdutorLimiteService.validaLimiteProdutor(pCodigoProdutor,
  pCodigoDistribuidor: Integer): TProdutorLimite;
var
  produtordao : TProdutorDao;
begin
  produtordao := TProdutorDao.create;
  Result := produtordao.ConsultaLimiteProdutor(pCodigoProdutor,pCodigoDistribuidor);

end;

end.
