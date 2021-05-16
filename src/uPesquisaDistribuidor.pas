unit uPesquisaDistribuidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.DB;

type
  TfrmTelaDistribuidor = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    edtPesquisa: TEdit;
    Button1: TButton;
    Button2: TButton;
    DtSourcePesquisaDistribuidor: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaDistribuidor: TfrmTelaDistribuidor;

implementation
uses uDmDados,udistribuidorModel,uDistribuidorService,uTelaCliente,uTelaCadastroDistribuidor,uTelaNegociacao ;
{$R *.dfm}

procedure TfrmTelaDistribuidor.Button1Click(Sender: TObject);
var
  distribuidorService : TDistribuidorService;
  distribuidor        : TDistribuidor;
begin
  distribuidor := distribuidorService.ConsultaDistribuidor(edtPesquisa.Text);

  if Application.FindComponent('frmTelaProdutor') <> nil then
  begin
    frmTelaProdutor.edtDistribuidorLimite.Text  := distribuidor.NomeDistribuidor;
    frmTelaProdutor.edtCodDistLimite.Text       :=  intToStr(distribuidor.CodigoDistribuidor);
  end;
   if Application.FindComponent('frmTelaNegociacao') <> nil then
   begin
     frmTelaNegociacao.edtDistribuidorNegociacao.Text := distribuidor.NomeDistribuidor;
     frmTelaNegociacao.edtCodDistrNegociacao.Text     := intToStr(distribuidor.CodigoDistribuidor);
   end;
end;

procedure TfrmTelaDistribuidor.Button2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastrarDistribuidor,frmCadastrarDistribuidor);
    frmCadastrarDistribuidor.ShowModal;
  finally
    FreeAndNil(frmCadastrarDistribuidor);
  end;

end;

end.
