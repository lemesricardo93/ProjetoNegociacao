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
    procedure tsteCellClick(Column: TColumn);
    procedure tsteColEnter(Sender: TObject);
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

  gProduto := produtoService.ConsultaPRoduto(0,edtPesquisaProduto.Text);

  frmTelaNegociacao.edtCodProdutNegociacao.Text :=  IntToStr(gProduto.CodProduto);
  frmTelaNegociacao.edtProdutoNegociao.Text     :=  gProduto.Nome;
  frmTelaNegociacao.edtPrecoNegociacao.Text     := FloatToStr(gProduto.PrecoVenda);

end;

procedure TfrmPesquisaProduto.tsteCellClick(Column: TColumn);
var
  gProduto : TProduto;
  produtoService : TProdutoService;
  idx: integer;
    vnCodProduto: String;
begin
  gProduto := TProduto.Create;
  produtoService := TProdutoService.create;

   with tste.DataSource do

    if tste.SelectedRows.Count > 0 then
      for idx := 0 to tste.SelectedRows.Count - 1 do
        begin
           DataSet.GotoBookmark((tste.SelectedRows.items[idx]));
           vnCodProduto := '';
           vnCodProduto := DataSet.FieldByName('CODPRODUTO').Value;
      end;


  gProduto := produtoService.ConsultaPRoduto(StrToInt(vnCodProduto),edtPesquisaProduto.Text);

  frmTelaNegociacao.edtCodProdutNegociacao.Text :=  IntToStr(gProduto.CodProduto);
  frmTelaNegociacao.edtProdutoNegociao.Text     :=  gProduto.Nome;
  frmTelaNegociacao.edtPrecoNegociacao.Text     := FloatToStr(gProduto.PrecoVenda);
  frmPesquisaProduto.Close;
end;

procedure TfrmPesquisaProduto.tsteColEnter(Sender: TObject);
var
  gProduto : TProduto;
  produtoService : TProdutoService;
  idx: integer;
    vnCodProduto: String;
begin
//  gProduto := TProduto.Create;
//  produtoService := TProdutoService.create;
//
//   with tste.DataSource do
//
//    if tste.SelectedRows.Count > 0 then
//      for idx := 0 to tste.SelectedRows.Count - 1 do
//        begin
//           DataSet.GotoBookmark((tste.SelectedRows.items[idx]));
//           vnCodProduto := '';
//           vnCodProduto := DataSet.FieldByName('CODPRODUTO').Value;
//      end;
//
//
//  gProduto := produtoService.ConsultaPRoduto(StrToInt(vnCodProduto),edtPesquisaProduto.Text);
//
//  frmTelaNegociacao.edtCodProdutNegociacao.Text :=  IntToStr(gProduto.CodProduto);
//  frmTelaNegociacao.edtProdutoNegociao.Text     :=  gProduto.Nome;
//  frmTelaNegociacao.edtPrecoNegociacao.Text     := FloatToStr(gProduto.PrecoVenda);

end;

end.
