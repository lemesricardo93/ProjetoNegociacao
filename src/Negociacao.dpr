program Negociacao;

uses
  Vcl.Forms,
  uTelaPrincpal in 'uTelaPrincpal.pas' {Form1},
  uProdutorDAO in 'uProdutorDAO.pas',
  uDistribuidorDAO in 'uDistribuidorDAO.pas',
  uProdutoModel in 'uProdutoModel.pas',
  uProdutoService in 'uProdutoService.pas',
  uProdutoDAO in 'uProdutoDAO.pas',
  uDmDados in 'uDmDados.pas' {dmDados: TDataModule},
  uTelaCliente in 'uTelaCliente.pas' {frmTelaProdutor},
  uPesquisaDistribuidor in 'uPesquisaDistribuidor.pas' {Form3},
  uDistribuidorModel in 'uDistribuidorModel.pas',
  uDistribuidorService in 'uDistribuidorService.pas',
  uProdutorModel in 'uProdutorModel.pas',
  uProdutorService in 'uProdutorService.pas',
  uBiblioteca in 'uBiblioteca.pas',
  uTelaCadastroDistribuidor in 'uTelaCadastroDistribuidor.pas' {frmCadastrarDistribuidor},
  uTelaProduto in 'uTelaProduto.pas' {frmTelaProduto},
  uTelaNegociacao in 'uTelaNegociacao.pas' {frmTelaNegociacao},
  uPesquisaProdutor in 'uPesquisaProdutor.pas' {frmCadastroProdutor},
  uPesquisaProduto in 'uPesquisaProduto.pas' {frmPesquisaProduto},
  uNegociacaoDao in 'uNegociacaoDao.pas',
  uNegociacaoModel in 'uNegociacaoModel.pas',
  uNegociacaoService in 'uNegociacaoService.pas',
  uConsultaNegociacao in 'uConsultaNegociacao.pas' {frmConsultaNegociacao},
  uRelatorio in 'uRelatorio.pas' {frmRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
