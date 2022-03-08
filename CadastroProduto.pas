unit CadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Data.FMTBcd, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, Vcl.ComCtrls, uClasseProduto;

type
  TfrmCadProduto = class(TForm)
    pnlTopo: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mskLote: TMaskEdit;
    mskNomeProduto: TMaskEdit;
    mskCodigo: TMaskEdit;
    StatusBar1: TStatusBar;
    memDescricao: TMemo;
    edtQtde: TEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    var bGravadoSucesso: boolean;
  public
    function CarregaCampos(): boolean;
    var id_Produto: Integer;
  end;

var
  frmCadProduto: TfrmCadProduto;
  oProduto: TProduto;

implementation

{$R *.dfm}


function TfrmCadProduto.CarregaCampos():boolean;
begin
  Result := false;
  try
    oProduto.ID_Produto := id_Produto;
    oProduto.Codigo := mskCodigo.Text;
    oProduto.Nome := mskNomeProduto.Text;
    oProduto.Descricao := memDescricao.Text;
    oProduto.NroLote := mskLote.Text;
    oProduto.Qtde := StrToFloat(edtQtde.Text);
    Result := true;
  except
    Result := false;
  end;
end;

procedure TfrmCadProduto.btnGravarClick(Sender: TObject);
begin
  try
    oProduto := TProduto.Create;

    if CarregaCampos then begin
      if oProduto.Gravar then begin
        id_Produto := oProduto.ID_Produto;
        bGravadoSucesso := true;
        Application.MessageBox('Os dados foram gravados com sucesso !', 'Aviso');
      end else begin
        Application.MessageBox('Não foi possível gravar os dados !', 'Atenção');
      end;
    end else begin
        Application.MessageBox('Não foi possível carregar os dados para gravá-los !', 'Atenção');
    end;
  finally
    oProduto.Free;
  end;
end;

procedure TfrmCadProduto.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProduto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not bGravadoSucesso then begin
    if Application.MessageBox('Deseja mesmo cancelar ? Os dados não salvos serão perdidos. ', 'Você tem certeza ?', MB_ICONQUESTION or MB_YESNO) = IDNO then
      CanClose := false;
  end;
end;

procedure TfrmCadProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
    Close;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  bGravadoSucesso := false;

  if id_Produto>0 then begin

    try
      oProduto := TProduto.Create;
      oProduto.ID_Produto := id_Produto;

      if oProduto.Carregar then begin
        if oProduto.Codigo <> '' then
          mskCodigo.Text := oProduto.Codigo;
        if oProduto.Nome <> '' then
          mskNomeProduto.Text := oProduto.Nome;
        if oProduto.Descricao <> '' then
          memDescricao.Text := oProduto.Descricao;
        if oProduto.NroLote <> '' then
          mskLote.Text := oProduto.NroLote;
        edtQtde.Text := FloatToStr(oProduto.Qtde);
      end else begin
          Application.MessageBox('Não foi possível carregar os dados do Produto !', 'Atenção');
      end;
    finally
      oProduto.Free;
    end;
  end;

end;

end.
