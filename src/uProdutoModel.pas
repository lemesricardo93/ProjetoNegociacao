unit uProdutoModel;

interface

type
 TProduto = class
   private
     FCodProduto : integer;
     FNome       : string;
     FPrecoVenda : Double;
     FdataCadastroPRoduto : TDate;

   public
   property CodProduto : integer read FCodProduto write FCodProduto;
   property Nome       : string read  FNome write FNome;
   property PrecoVenda : double read FPrecoVenda write FPrecoVenda;

 end;

implementation

end.
