unit uPesquisaProdutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids,Math, Data.DB;

type
  TfrmCadastroProdutor = class(TForm)
    Panel1: TPanel;
    dbProdutor: TDBGrid;
    GroupBox2: TGroupBox;
    edtPesquisa: TEdit;
    GroupBox3: TGroupBox;
    ComboBox2: TComboBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    edtPesquisaProdutor: TEdit;
    btnPesquisaProdutor: TButton;
    Button2: TButton;
    dtSourcePesquisaProdutorra: TDataSource;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    procedure btnPesquisaProdutorClick(Sender: TObject);
    procedure dbProdutorCellClick(Column: TColumn);
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

  gprodutor :=  pesquisaProdutor.ConsultaProdutor(0,edtPesquisaProdutor.Text,'');
end;

procedure TfrmCadastroProdutor.dbProdutorCellClick(Column: TColumn);
var
  vnCodProdutor : String;
  gProdutor     : TProdutor;
  produtorService : TProdutorService;
  idx :integer;
begin
 gProdutor     := TProdutor.Create;
  produtorService := TProdutorService.create;
  with dbProdutor.DataSource do

    if dbProdutor.SelectedRows.Count > 0 then
      for idx := 0 to dbProdutor.SelectedRows.Count - 1 do
        begin
           DataSet.GotoBookmark((dbProdutor.SelectedRows.items[idx]));
           vnCodProdutor := '';
           vnCodProdutor := DataSet.FieldByName('CODPRODUTOR').Value;
      end;

      gProdutor := produtorService.ConsultaProdutor(StrToInt(vnCodProdutor),edtPesquisaProdutor.Text,'');


  frmTelaNegociacao.edtCodigoProdutor.Text :=  IntToStr(gProdutor.CodigoProdutor);
  frmTelaNegociacao.edtProdutorNegociacao.Text     :=  gProdutor.NomeProdutor;
  frmCadastroProdutor.Close;
end;

end.
