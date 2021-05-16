unit uDistribuidorService;

interface
uses uDistribuidorModel, uDistribuidorDao;
type
  TDistribuidorService = class
  private
    FDistribuidorDAO : TDistribuidorDao;
  public
   function  ConsultaDistribuidor(pNome : string ) : TDistribuidor;
   procedure SalvarDistribuidor(pNome , pCNPJ : string) ;

  constructor create;

  end;

implementation

{ TDistribuidorService }

function TDistribuidorService.ConsultaDistribuidor(pNome: string): TDistribuidor;
var
 distribuidordao :  TDistribuidorDao;
begin
 distribuidordao :=  TDistribuidorDao.create;
  result :=  distribuidordao.ConsultaDistribuidor(pNome);
end;

constructor TDistribuidorService.create;
begin
  FDistribuidorDAO := TDistribuidorDao.create;
end;

procedure TDistribuidorService.SalvarDistribuidor(pNome, pCNPJ: string);
var
  distribuidorD : TDistribuidor;
begin
  distribuidorD := TDistribuidor.create;
  distribuidorD.NomeDistribuidor := pNome;
  distribuidorD.CNPJDistribuidor := pCNPJ;

  FDistribuidorDAO.Salvar(distribuidorD);


end;

end.
