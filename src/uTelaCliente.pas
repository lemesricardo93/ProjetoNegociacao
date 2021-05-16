unit uTelaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Mask, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmTelaProdutor = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    addLimite: TLabel;
    edtNomeProdutor: TEdit;
    Label3: TLabel;
    mskCPFCNPJ: TMaskEdit;
    mskLimite: TMaskEdit;
    Label4: TLabel;
    Button1: TButton;
    edtCodDistLimite: TEdit;
    btnAdicionarLimite: TButton;
    memoLimite: TMemo;
    edtDistribuidorLimite: TEdit;
    btnSalvarProdutor: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnAdicionarLimiteClick(Sender: TObject);
    procedure mskCPFCNPJChange(Sender: TObject);
    procedure btnSalvarProdutorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmTelaProdutor: TfrmTelaProdutor;

implementation
uses uPesquisaDistribuidor,uBiblioteca,uProdutorService,udmDados;
{$R *.dfm}

procedure TfrmTelaProdutor.btnAdicionarLimiteClick(Sender: TObject);
begin
  dmDados.cdsProduorLimite.Append;
  dmDados.cdsProduorLimitecodigoProdutor.AsInteger :=  1;
  dmDados.cdsProduorLimitecodigoDistribuidor.AsInteger := StrToInt(edtCodDistLimite.Text);
  dmDados.cdsProduorLimitevalorLimite.AsFloat := StrToFloat(mskLimite.Text);
  dmDados.cdsProduorLimite.Post;

  memoLimite.Lines.Add(edtCodDistLimite.Text + ' ' + ' ' +
                       edtDistribuidorLimite.Text + ' ' +
                       mskLimite.Text);
end;

procedure TfrmTelaProdutor.btnSalvarProdutorClick(Sender: TObject);
var
  produtor : TProdutorService;
  produtorlimite : TProdutorLimiteService;
  dados : TBiblioteca;
begin
  dados :=  TBiblioteca.Create;
  produtor := TProdutorService.create;
  produtorlimite := TProdutorLimiteService.create;
  produtor.SalvarProdutor(edtNomeProdutor.Text, dados.EliminaCaracter(mskCPFCNPJ.Text));

  if memoLimite.Lines.Count = 0 then
  begin
    ShowMessage('Insira por favor ao menos um distribuidor.');
    edtCodDistLimite.SetFocus;
  end
  else
  begin
    dmDados.cdsProduorLimite.First;
    while not dmDados.cdsProduorLimite.Eof do
    begin
      produtorlimite.SalvarProdutorLimite(dmDados.cdsProduorLimitecodigoProdutor.AsInteger,
                                          dmDados.cdsProduorLimitecodigoDistribuidor.AsInteger,
                                          dmDados.cdsProduorLimitevalorLimite.AsFloat);
      dmDados.cdsProduorLimite.Next;
    end;

  end;
end;

procedure TfrmTelaProdutor.Button1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmTelaDistribuidor,frmTelaDistribuidor);
    frmTelaDistribuidor.ShowModal;
  finally
    frmTelaDistribuidor.Free;
  end;
end;

procedure TfrmTelaProdutor.mskCPFCNPJChange(Sender: TObject);
var
  dados : TBiblioteca;
begin
  if Length(mskCPFCNPJ.Text) >=11 then
  begin
    dados := TBiblioteca.Create;
    if dados.cpf(mskCPFCNPJ.Text)   then
    begin
      mskCPFCNPJ.EditMask :='000.000.000-00;1';
    end
  else
  begin
    mskCPFCNPJ.EditMask :='00.000.000/0000-00;1';
  end;
end;
 if Length(mskCPFCNPJ.Text) = 0 then
 begin
   mskCPFCNPJ.Text := '';
 end;

end;

procedure TfrmTelaProdutor.FormShow(Sender: TObject);
begin
 dmDados.cdsProduorLimite.EmptyDataSet;
end;

end.
