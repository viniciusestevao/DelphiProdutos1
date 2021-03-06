program ProjetoDelphiProdutos;

uses
  Vcl.Forms,
  TelaListaProdutos in 'TelaListaProdutos.pas' {frmTelaListaProdutos},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  CadastroProduto in 'CadastroProduto.pas' {frmCadProduto},
  uClasseProduto in 'uClasseProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Cadastro de Produtos';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmTelaListaProdutos, frmTelaListaProdutos);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.Run;
end.
