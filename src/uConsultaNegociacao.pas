unit uConsultaNegociacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.DB;

type
  TfrmConsultaNegociacao = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    edtPesquisaPedido: TEdit;
    btnPesquisaProdutor: TButton;
    dbPesquisaPedido: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    btnImprimir: TButton;
    procedure btnPesquisaProdutorClick(Sender: TObject);
    procedure dbPesquisaPedidoCellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
  private
    function retornaStatus(pStatus : string) : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaNegociacao: TfrmConsultaNegociacao;

implementation
uses udmDados,uNegociacaoService,uNegociacaoModel,uTelaNegociacao, uRelatorio;
{$R *.dfm}

procedure TfrmConsultaNegociacao.btnImprimirClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmRelatorio,frmRelatorio);
    frmRelatorio.frxReport1.ShowReport();
  finally
    FreeAndNil(frmRelatorio);
  end;

end;

procedure TfrmConsultaNegociacao.btnPesquisaProdutorClick(Sender: TObject);
var
 gNegociacao : TNegociacaoService;
 negociacao  : TCabecalhoNegociacao;
 itemNegociacaoservice : TItemNegociacaoService;
 item                  : TItemCabecalho;

begin
 gNegociacao           := TNegociacaoService.create;
 negociacao            := TCabecalhoNegociacao.create;
 itemNegociacaoservice := TItemNegociacaoService.create;
  item                 := TItemCabecalho.Create;

 negociacao            :=  gNegociacao.ConsultaCabecalho(0);
 item                  := itemNegociacaoservice.ConsultaItemPedido(negociacao.numpedCabecalho);
end;

procedure TfrmConsultaNegociacao.dbPesquisaPedidoCellClick(Column: TColumn);
var
  negociacao : TCabecalhoNegociacao;
  negociacaoService :  TNegociacaoService;
  negociacaoItem : TItemCabecalho;
  itemnegociacao  : TItemNegociacaoService;
  idx        : Integer;
  vnNumped : string;
begin
  negociacao        := TCabecalhoNegociacao.Create;
  negociacaoItem    := TItemCabecalho.Create;
  negociacaoService :=  TNegociacaoService.create;
  itemnegociacao    := TItemNegociacaoService.create;

  with dbPesquisaPedido.DataSource do

    if dbPesquisaPedido.SelectedRows.Count > 0 then
      for idx := 0 to dbPesquisaPedido.SelectedRows.Count - 1 do
        begin
           DataSet.GotoBookmark((dbPesquisaPedido.SelectedRows.items[idx]));
           vnNumped := '';
           vnNumped := DataSet.FieldByName('NUMPED').Value;
      end;

    negociacao := negociacaoService.ConsultaCabecalho(StrToInt(vnNumped));

    frmTelaNegociacao.edtNumeroNegociacao.Text       :=  IntToStr(negociacao.numpedCabecalho);
    frmTelaNegociacao.edtCodigoProdutor.Text         :=  IntToStr(negociacao.codprodutorCabecalho);
    frmTelaNegociacao.edtCodDistrNegociacao.Text     := IntToStr(negociacao.coddistribuidorcabecalho);
    frmTelaNegociacao.cbxStatus.ItemIndex            := retornaStatus(negociacao.statusPedido);
    frmTelaNegociacao.edtProdutorNegociacao.Text     := negociacao.produtor;
    frmTelaNegociacao.edtDistribuidorNegociacao.Text := negociacao.distribuidor;
    frmTelaNegociacao.edtValorTotalNegociado.Text    := FloatToStr(negociacao.vltotal);

    negociacaoItem := itemnegociacao.ConsultaItemPedido(negociacao.numpedCabecalho);
    frmTelaNegociacao.memoNegociacao.Lines.Add(IntToStr(negociacaoItem.codprodItem));
    frmConsultaNegociacao.Close;
end;

function TfrmConsultaNegociacao.retornaStatus(pStatus: string): Integer;
begin

  if (pStatus = 'P') OR (pStatus = 'PENDENTE') then
  begin
    Result :=0;
  end;

  if (pStatus = 'A') OR (pStatus = 'APROVADA') then
  begin
    Result :=1;
  end;

    if (pStatus = 'CO') OR (pStatus = 'CONCLUIR') then
  begin
    Result :=2;
  end;

  if (pStatus = 'CA') OR (pStatus = 'CANCELADA') then
  begin
    Result :=3;
  end;
end;

end.
