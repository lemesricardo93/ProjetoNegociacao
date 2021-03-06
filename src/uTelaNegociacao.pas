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
    procedure edtValorTotalNegociadoChange(Sender: TObject);
  private
    function GravaStatusNegociacao(pStatus : integer) : String;
    function VerficaNumped(pNumeroPedido : integer) : Boolean;
    { Private declarations }
  public
    { Public declarations }
    Totalizador,vnSomatorio :double;
  end;

var
  frmTelaNegociacao: TfrmTelaNegociacao;

implementation
uses uDmDados, uPesquisaDistribuidor,uPesquisaProdutor,uPesquisaProduto,uNegociacaoService,unegociacaoModel,uConsultaNegociacao,uProdutorService,uProdutorModel;
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
  negociacaoService    : TNegociacaoService;
  negociacao           : TCabecalhoNegociacao;
  produtorlimiteService : TProdutorLimiteService;
  produtorlimite       : TProdutorLimite;
  vnDisponivel         :double;

begin

  if (cbxStatus.ItemIndex <> 0) and (edtNumeroNegociacao.Text = '') then
  begin
    ShowMessage('O status n?o corresponde ao o Permitido. Por Favor altere para Pendente.');
    Exit;
  end;

  negociacao           := TCabecalhoNegociacao.Create;
  negociacaoService    := TNegociacaoService.create;
  produtorlimiteService := TProdutorLimiteService.create;
  produtorlimite       := TProdutorLimite.create;

   try

     if VerficaNumped(StrToInt(edtNumeroNegociacao.Text)) then
     begin
       if cbxStatus.ItemIndex = -1 then
       begin
         ShowMessage('Informe o status');
         Exit;
       end;

      negociacaoService.AtualizaCabecalho(StrToInt(edtNumeroNegociacao.Text),GravaStatusNegociacao(cbxStatus.ItemIndex));
     end
     else
     begin

      produtorlimite := produtorlimiteService.validaLimiteProdutor(StrToInt(edtCodigoProdutor.Text),StrToInt(edtCodDistrNegociacao.Text));

      vnDisponivel :=   produtorlimite.disponivel;

      if ((vnDisponivel + StrToFloat(edtValorTotalNegociado.Text)) > produtorlimite.ValorLimite ) then
      begin
       ShowMessage('N?ao ser? possivel gerar uma negocia??o pois o produtor'+ ' '  +edtProdutorNegociacao.Text + ' ' + 'n?o tem saldo disponivel '+#13#10 +
                   'Limite Total: ' + ' ' + FloatToStr(produtorlimite.ValorLimite) + ' ' +#13#10 +
                   'Disponivel : ' + '  '  +FloatToStr(vnDisponivel + StrToFloat(edtValorTotalNegociado.Text))) ;
      end
      else
      begin
        negociacaoService.SalvarNegociacao(0,StrToInt(edtCodigoProdutor.Text),StrToInt(edtCodDistrNegociacao.Text),GravaStatusNegociacao(cbxStatus.ItemIndex), StrToFloat(edtValorTotalNegociado.text));
        ShowMessage('Negocia??o Cadastrada com Sucesso.');
        FreeAndNil(negociacaoService);
      end;
     end;
    except
      on E: Exception do
      begin
        FreeAndNil(negociacaoService);
        ShowMessage('Erro ao gravar informa??es' + 'Motivo' + E.message);
      end;
    end;

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
begin
Totalizador := 0;
vnSomatorio := 0;
  if edtQuantidadeRequisitada.Text > '0' then
  begin
    vnSomatorio := (StrToFloat(edtQuantidadeRequisitada.Text) * StrToFloat(edtPrecoNegociacao.Text));
     Totalizador := Totalizador + vnSomatorio;
     edtValorTotalNegociado.Text :=  FloatToStr(StrToFloatDef(edtValorTotalNegociado.Text,0) + (vnSomatorio));
  end;
end;

procedure TfrmTelaNegociacao.edtValorTotalNegociadoChange(Sender: TObject);
begin
 //edtValorTotalNegociado.text := FloatToSTr(StrToFloat(edtValorTotalNegociado.Text) +vnSomatorio);
end;

function  TfrmTelaNegociacao.GravaStatusNegociacao(pStatus : integer) : String;
begin
  case pStatus of
    0:
      begin
       Result  := 'P';
      end;
    1:
      begin
        Result  := 'A';
      end;
    2:
      begin
        Result  := 'CO';
      end;
    3:
      begin
        Result  := 'CA';
      end;
  end;
end;

function TfrmTelaNegociacao.VerficaNumped(pNumeroPedido: integer): Boolean;
begin
  if pNumeroPedido > 0 then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

procedure TfrmTelaNegociacao.FormShow(Sender: TObject);
begin
  dmDados.ItemNegociacao.EmptyDataSet;
end;

end.
