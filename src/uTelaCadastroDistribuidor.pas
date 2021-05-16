unit uTelaCadastroDistribuidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmCadastrarDistribuidor = class(TForm)
    Panel1: TPanel;
    btnSalvarDistribuidor: TButton;
    GroupBox1: TGroupBox;
    labek1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edIdDistr: TEdit;
    edtNomeDistr: TEdit;
    mskCNPJDistr: TMaskEdit;
    procedure btnSalvarDistribuidorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarDistribuidor: TfrmCadastrarDistribuidor;

implementation
  uses uDistribuidorModel, uDistribuidorService;
{$R *.dfm}

procedure TfrmCadastrarDistribuidor.btnSalvarDistribuidorClick(Sender: TObject);
var
  distribuidorService : TDistribuidorService;
begin
  distribuidorService := TDistribuidorService.create;
  distribuidorService.SalvarDistribuidor(edtNomeDistr.Text, mskCNPJDistr.text);
end;

end.