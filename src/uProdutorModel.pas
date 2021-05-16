unit uProdutorModel;

interface
type
 TProdutor = class
 private
   FCodigoProdutor        : integer;
   FNomeProdutor          : string;
   FIdentidadeProdutor    : string;

 public
   property  CodigoProdutor     : integer read FCodigoProdutor     write FCodigoProdutor;
   property NomeProdutor        : string  read FNomeProdutor       write FNomeProdutor;
   property IdentidadeProdutor : string read FIdentidadeProdutor  write FIdentidadeProdutor;

 end;

  TProdutorLimite = class
 private
   FCodigoProdutor        : integer;
   FCodigoDistribuidor    : integer;
   FValorLimite           : Double;

 public
   property  CodigoProdutorLimite     : integer read FCodigoProdutor     write FCodigoProdutor;
   property CodigoDistribuidorLimite  : integer  read FCodigoDistribuidor write FCodigoDistribuidor;
   property ValorLimite : Double read FValorLimite  write FValorLimite;

 end;

implementation

end.