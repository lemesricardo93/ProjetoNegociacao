unit uNegociacaoModel;

interface
uses data.DB;
type
  TCabecalhoNegociacao = class
 private
   FNUMPED          : integer;
   FCODPRODUTOR     : integer;
   FCODDISTRIBUIDOR : integer;
   FSTATUS          : string;
   FDATACADASTRO    : TDate;
   FDATACANCELAMENTO : TDate;
   FDISTRIBUIDOR     : string;
   FPRODUTOR         : string;
   FVLTOTAL          : Double;

 public
   property  numpedCabecalho         : integer  read FNUMPED           write FNUMPED;
   property codprodutorCabecalho     : integer  read FCODPRODUTOR      write FCODPRODUTOR;
   property coddistribuidorcabecalho : integer  read FCODDISTRIBUIDOR  write FCODDISTRIBUIDOR;
   property statusPedido             : string   read FSTATUS           write FSTATUS;
   property dataCadastro             : TDate    read FDATACADASTRO     write FDATACADASTRO;
   property distribuidor             : string   read FDISTRIBUIDOR     write FDISTRIBUIDOR;
   property produtor                 : string   read FPRODUTOR         write FPRODUTOR;
   property vltotal                 : double   read FVLTOTAL          write FVLTOTAL;


 end;

  TItemCabecalho = class
 private
   FNUMPEDITEM  : integer;
   FCODPROD     : integer;
   FQUANTIDADE  : double;
   FPRECOVENDA  : Double;

 public
   property  numpedItem    : integer read FNUMPEDITEM     write FNUMPEDITEM;
   property codprodItem    : integer  read FCODPROD write FCODPROD;
   property quantidadeItem : double read FQUANTIDADE  write FQUANTIDADE;
   property precovendaItem : Double read FPRECOVENDA  write FPRECOVENDA;

 end;

implementation

end.

