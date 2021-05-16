unit uProdutoService;

interface
uses uProdutoDAO, uProdutoModel,   Generics.Collections,uDmDados;
type
  TProdutoService = class
  private
    FProdutoDAO : TProdutoDao;

  public
    procedure salvarProduto(pNome : string; pPrecoVenda : Double );
    function ConsultaPRoduto(pNome : string ) : TProduto;

  constructor create;

  end;

implementation

{ TProdutoService }

function TProdutoService.ConsultaPRoduto(pNome: string): TProduto;
var
  produtodao : TProdutoDao;
begin
   produtodao := TProdutoDao.create;
  Result :=  produtodao.ConsultaProduto(pNome);
end;

constructor TProdutoService.create;
begin
 FProdutoDAO := TProdutoDao.create;
end;

procedure TProdutoService.salvarProduto(pNome: string; pPrecoVenda: Double);
var
 gProduto : TProduto;
begin
  gProduto            := TProduto.Create;

  gProduto.Nome       := pNome;
  gProduto.PrecoVenda := pPrecoVenda;
 FProdutoDAO.Salvar(gProduto);

 gProduto.Free;


end;

end.
