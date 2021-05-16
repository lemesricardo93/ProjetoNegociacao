unit uPesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaProduto = class(TForm)
    Panel1: TPanel;
    btnPesquisaProdutor: TButton;
    tste: TDBGrid;
    Button2: TButton;
    GroupBox4: TGroupBox;
    edtPesquisaProduto: TEdit;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    dSourcePesquisProduto: TDataSource;
    procedure btnPesquisaProdutorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaProduto: TfrmPesquisaProduto;

implementation
 uses udmDados,uProdutoModel, uProdutoService,uTelaNegociacao;
{$R *.dfm}

procedure TfrmPesquisaProduto.btnPesquisaProdutorClick(Sender: TObject);
var
  gProduto : TProduto;
  produtoService : TProdutoService;
begin
  gProduto := TProduto.Create;
  produtoService := TProdutoService.create;

  gProduto := produtoService.ConsultaPRoduto(edtPesquisaProduto.Text);

  frmTelaNegociacao.edtCodProdutNegociacao.Text :=  IntToStr(gProduto.CodProduto);
  frmTelaNegociacao.edtProdutoNegociao.Text     :=  gProduto.Nome;
  frmTelaNegociacao.edtPrecoNegociacao.Text     := FloatToStr(gProduto.PrecoVenda);

end;

end.
