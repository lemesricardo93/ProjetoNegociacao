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
    procedure btnPesquisaProdutorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaNegociacao: TfrmConsultaNegociacao;

implementation
uses udmDados,uNegociacaoService,uNegociacaoModel;
{$R *.dfm}

procedure TfrmConsultaNegociacao.btnPesquisaProdutorClick(Sender: TObject);
var
 gNegociacao : TNegociacaoService;
 negociacao  : TCabecalhoNegociacao;
begin
 gNegociacao := TNegociacaoService.create;
 negociacao  := TCabecalhoNegociacao.create;

 negociacao :=  gNegociacao.ConsultaCabecalho(0);




end;

end.
