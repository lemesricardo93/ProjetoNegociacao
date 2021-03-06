unit uTelaPrincpal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,uDmDados, Data.DB,
  IBCustomDataSet, IBQuery;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ff1: TMenuItem;
    Produto1: TMenuItem;
    Produtor1: TMenuItem;
    Distribuidor1: TMenuItem;
    Manutenodenegociao1: TMenuItem;
    procedure Produto1Click(Sender: TObject);
    procedure Produtor1Click(Sender: TObject);
    procedure Manutenodenegociao1Click(Sender: TObject);
    procedure Distribuidor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}
uses
  uProdutoService,uTelaCliente,uTelaProduto,uTelaNegociacao,uTelaCadastroDistribuidor;
procedure TForm1.Distribuidor1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCadastrarDistribuidor, frmCadastrarDistribuidor);
    frmCadastrarDistribuidor.ShowModal;
  finally
  FreeAndNil(frmCadastrarDistribuidor);

  end;


end;

procedure TForm1.Manutenodenegociao1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmTelaNegociacao, frmTelaNegociacao);
    frmTelaNegociacao.ShowModal;
  finally
   FreeAndNil(frmTelaNegociacao);
  end;

end;

procedure TForm1.Produto1Click(Sender: TObject);
begin
  try
     Application.CreateForm(TfrmTelaProduto,frmTelaProduto);
     frmTelaProduto.ShowModal;

  finally
    FreeAndNil(frmTelaProduto);
  end;



end;

procedure TForm1.Produtor1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmTelaProdutor,frmTelaProdutor);
    frmTelaProdutor.ShowModal;
  finally
    FreeandNil(frmTelaProdutor);

  end;
end;

end.
