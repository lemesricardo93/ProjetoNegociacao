unit uDistribuidorModel;

interface
type
 TDistribuidor = class
 private
   FCodigoDistribuidor : integer;
   FNomeDistr          : string;
   FCNPJ               : string;

 public
   property  CodigoDistribuidor  : integer read FCodigoDistribuidor write FCodigoDistribuidor;
   property NomeDistribuidor     : string  read FNomeDistr           write FNomeDistr;
   property CNPJDistribuidor     : string read FCNPJ                write FCNPJ;

 end;

implementation

end.
