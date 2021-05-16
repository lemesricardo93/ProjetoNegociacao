unit uPesquisaProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids,Math, Data.DB;

type
  TfrmCadastroProdutor = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    edtPesquisa: TEdit;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    edtPesquisaProdutor: TEdit;
    btnPesquisaProdutor: TButton;
    Button2: TButton;
    dtSourcePesquisaProdutor: TDataSource;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    procedure btnPesquisaProdutorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProdutor: TfrmCadastroProdutor;

implementation
uses udmDados, uProdutorModel, uProdutorService,uTelaNegociacao;
{$R *.dfm}

procedure TfrmCadastroProdutor.btnPesquisaProdutorClick(Sender: TObject);
var
  pesquisaProdutor : TProdutorService;
  gprodutor         : TProdutor;
begin
  pesquisaProdutor := TProdutorService.create;
  gprodutor         := TProdutor.Create;

  gprodutor :=  pesquisaProdutor.ConsultaProdutor(0,edtPesquisaProdutor.Text);
  frmTelaNegociacao.edtCodigoProdutor.Text := IntToStr(gprodutor.CodigoProdutor);
  frmTelaNegociacao.edtProdutorNegociacao.Text := gprodutor.NomeProdutor;

end;

end.
