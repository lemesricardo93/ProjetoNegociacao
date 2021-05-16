unit uNegociacaoModel;

interface
type
  TCabecalhoNegociacao = class
 private
   FNUMPED          : integer;
   FCODPRODUTOR     : integer;
   FCODDISTRIBUIDOR : integer;
   FSTATUS          : string;
   FDATACADASTRO    : TDate;
   FDATACANCELAMENTO : TDate;

 public
   property  numpedCabecalho         : integer  read FNUMPED           write FNUMPED;
   property codprodutorCabecalho     : integer  read FCODPRODUTOR      write FCODPRODUTOR;
   property coddistribuidorcabecalho : integer  read FCODDISTRIBUIDOR  write FCODDISTRIBUIDOR;
   property statusPedido             : string   read FSTATUS           write FSTATUS;
   property dataCadastro             : TDate    read FDATACADASTRO     write FDATACADASTRO;
   property dataCancelamento         : TDate    read FDATACANCELAMENTO write FDATACANCELAMENTO;


 end;

  TItemCabecalho = class
 private
   FNUMPEDITEM  : integer;
   FCODPROD     : integer;
   FQUANTIDADE  : Double;
   FPRECOVENDA  : Double;

 public
   property  numpedItem    : integer read FNUMPEDITEM     write FNUMPEDITEM;
   property codprodItem    : integer  read FCODPROD write FCODPROD;
   property quantidadeItem : Double read FQUANTIDADE  write FQUANTIDADE;
   property precovendaItem : Double read FPRECOVENDA  write FPRECOVENDA;

 end;

implementation

end.

