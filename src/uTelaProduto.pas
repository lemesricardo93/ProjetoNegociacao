unit uTelaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmTelaProduto = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnSalvarProduto: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtIdProduto: TEdit;
    edtNomeProduto: TEdit;
    mskPrecoVenda: TMaskEdit;
    procedure btnSalvarProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaProduto: TfrmTelaProduto;

implementation
uses uProdutoService;
{$R *.dfm}

procedure TfrmTelaProduto.btnSalvarProdutoClick(Sender: TObject);
var
 ProdutoService : TProdutoService;
begin
 ProdutoService := TProdutoService.create;

  ProdutoService.salvarProduto(edtNomeProduto.Text, StrToFloat(mskPrecoVenda.Text));

  FreeAndNil(ProdutoService);

end;

end.
