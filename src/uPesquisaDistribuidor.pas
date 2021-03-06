unit uPesquisaDistribuidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.DB;

type
  TfrmTelaDistribuidor = class(TForm)
    Panel1: TPanel;
    dbdistribuidor: TDBGrid;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    edtPesquisaDistr: TEdit;
    btnPesquisaDistr: TButton;
    Button2: TButton;
    DtSourcePesquisaDistribuidor: TDataSource;
    procedure btnPesquisaDistrClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure dbdistribuidorCellClick(Column: TColumn);
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

procedure TfrmTelaDistribuidor.btnPesquisaDistrClick(Sender: TObject);
var
  distribuidorService : TDistribuidorService;
  distribuidor        : TDistribuidor;
begin
  distribuidor := distribuidorService.ConsultaDistribuidor(0, edtPesquisaDistr.Text);

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

procedure TfrmTelaDistribuidor.dbdistribuidorCellClick(Column: TColumn);
var
  vnCodDistribuidor : String;
  gDistribuidor    : TDistribuidor;
  distribuidorService : TDistribuidorService;
  idx :integer;
begin
  gDistribuidor       := TDistribuidor.Create;
  distribuidorService := TDistribuidorService.create;

  with dbdistribuidor.DataSource do

    if dbdistribuidor.SelectedRows.Count > 0 then
      for idx := 0 to dbdistribuidor.SelectedRows.Count - 1 do
        begin
           DataSet.GotoBookmark((dbdistribuidor.SelectedRows.items[idx]));
           vnCodDistribuidor := '';
           vnCodDistribuidor := DataSet.FieldByName('CODDISTRIBUIDOR').Value;
      end;

     gDistribuidor :=  distribuidorService.ConsultaDistribuidor(StrToInt(vnCodDistribuidor),edtPesquisaDistr.Text);
     frmTelaNegociacao.edtCodDistrNegociacao.Text := IntToStr(gDistribuidor.CodigoDistribuidor);
     frmTelaNegociacao.edtDistribuidorNegociacao.Text := gDistribuidor.NomeDistribuidor;

    frmTelaDistribuidor.Close;
end;

end.
