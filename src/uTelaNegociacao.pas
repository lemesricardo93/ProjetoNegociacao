unit uTelaNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,math;

type
  TfrmTelaNegociacao = class(TForm)
    Panel1: TPanel;
    vo: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNumeroNegociacao: TEdit;
    edtProdutorNegociacao: TEdit;
    edtCodigoProdutor: TEdit;
    Button3: TButton;
    edtCodDistrNegociacao: TEdit;
    Button4: TButton;
    edtDistribuidorNegociacao: TEdit;
    edtCodProdutNegociacao: TEdit;
    Button5: TButton;
    edtProdutoNegociao: TEdit;
    Label5: TLabel;
    cbxStatus: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    edtQuantidadeRequisitada: TEdit;
    memoNegociacao: TMemo;
    Label8: TLabel;
    edtValorTotalNegociado: TEdit;
    btnAdicionar: TButton;
    btnLimparLista: TButton;
    edtPrecoNegociacao: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure edtQuantidadeRequisitadaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaNegociacao: TfrmTelaNegociacao;

implementation
uses uDmDados, uPesquisaDistribuidor,uPesquisaProdutor,uPesquisaProduto,uNegociacaoService,unegociacaoModel,uConsultaNegociacao;
{$R *.dfm}

procedure TfrmTelaNegociacao.btnAdicionarClick(Sender: TObject);
begin
  dmDados.ItemNegociacao.Insert;
   dmDados.ItemNegociacaocodproduto.AsFloat := 1;
  dmDados.ItemNegociacaocodproduto.AsFloat := StrTofloat(edtCodProdutNegociacao.Text);
  dmDados.ItemNegociacaoprecovenda.AsFloat := StrTofloat(edtPrecoNegociacao.Text);
  dmDados.ItemNegociacaoquantidade.AsFloat := StrTofloat(edtQuantidadeRequisitada.Text);
  dmDados.ItemNegociacao.Post;

  memoNegociacao.Lines.Add(edtCodProdutNegociacao.Text + '                            '+edtProdutoNegociao.Text +'   ' +edtQuantidadeRequisitada.Text + '   '+ edtPrecoNegociacao.Text);

end;

procedure TfrmTelaNegociacao.Button1Click(Sender: TObject);
var
  negociacaoService : TNegociacaoService;
  vnStatus  : string;
  negociacao    : TCabecalhoNegociacao;
begin
  negociacao    := TCabecalhoNegociacao.Create;
 case cbxStatus.ItemIndex of
   0:
   begin
    vnStatus := 'P';
   end;
   1:
   begin
     vnStatus := 'A';
   end;

   2:
   begin
     vnStatus := 'CO';
   end;
   3:
   begin
    vnStatus := 'CA';
   end;
 end;



  negociacaoService := TNegociacaoService.create;

  negociacaoService.SalvarNegociacao(0,StrToInt(edtCodigoProdutor.Text),StrToInt(edtCodDistrNegociacao.Text),vnStatus);

  ShowMessage(IntToStr(negociacao.numpedCabecalho));
end;

procedure TfrmTelaNegociacao.Button2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmConsultaNegociacao,frmConsultaNegociacao);
    frmConsultaNegociacao.ShowModal;
  finally
    FreeAndNil(frmConsultaNegociacao);
  end;
end;

procedure TfrmTelaNegociacao.Button3Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastroProdutor, frmCadastroProdutor);
    frmCadastroProdutor.ShowModal;
  finally
    FreeAndNil(frmCadastroProdutor);
  end;

end;

procedure TfrmTelaNegociacao.Button4Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmTelaDistribuidor,frmTelaDistribuidor);
    frmTelaDistribuidor.ShowModal;
  finally
    FreeAndNil(frmTelaDistribuidor);
  end;

end;

procedure TfrmTelaNegociacao.Button5Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmPesquisaProduto,frmPesquisaProduto);
    frmPesquisaProduto.ShowModal;
  finally
   FreeAndNil(frmPesquisaProduto);
  end;
end;

procedure TfrmTelaNegociacao.edtQuantidadeRequisitadaChange(Sender: TObject);
var
  Totalizador , vnSomatorio: double;

begin
  if edtQuantidadeRequisitada.Text > '0' then
  begin
    vnSomatorio := (StrToFloat(edtQuantidadeRequisitada.Text) * StrToFloat(edtPrecoNegociacao.Text));
     Totalizador := Totalizador + vnSomatorio;
     edtValorTotalNegociado.Text :=  FloatToStr(Totalizador);
  end;
end;

procedure TfrmTelaNegociacao.FormShow(Sender: TObject);
begin
  dmDados.ItemNegociacao.EmptyDataSet;
end;

end.
