unit TelaListaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TfrmTelaListaProdutos = class(TForm)
    dsProduto: TDataSource;
    fdqPrincipal: TFDQuery;
    grdProduto: TDBGrid;
    pnlTopo: TPanel;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    Label1: TLabel;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    //procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TGridHelper = class helper for TDBGrid
    function ColumnByName(const AName : String) : TColumn;
  end;

var
  frmTelaListaProdutos: TfrmTelaListaProdutos;

implementation

uses  FireDAC.Phys.TDBX, FireDAC.Phys.MSSQLCli, FireDAC.Phys.MSSQLMeta , firedac.VCLUI.Controls,
      FireDAC.CDS.LocalSQL, CadastroProduto, uClasseProduto	 ;
{$R *.dfm}


procedure TfrmTelaListaProdutos.FormShow(Sender: TObject);
begin
  fdqPrincipal.Active	:= true;
end;

procedure TfrmTelaListaProdutos.btnAlterarClick(Sender: TObject);
begin
  try
    frmCadProduto := TfrmCadProduto.Create(self);
    frmCadProduto.id_Produto := grdProduto.ColumnByName('id_Produto').Field.Value;
    frmCadProduto.Caption	:= 'Altera??o de Produto';
  finally
    frmCadProduto.ShowModal;
    fdqPrincipal.Active := false;
    fdqPrincipal.Active	:= true;
    fdqPrincipal.RefreshRecord();
    frmCadProduto.Free;
  end;
end;

procedure TfrmTelaListaProdutos.btnExcluirClick(Sender: TObject);
var
  oProduto: TProduto;
begin
  if Application.MessageBox('Deseja mesmo excluir ?', 'Voc? tem certeza ?', MB_ICONQUESTION or MB_YESNO) = IDYES then begin

    try
      oProduto := TProduto.Create;
      oProduto.ID_Produto := grdProduto.ColumnByName('id_Produto').Field.Value;

      if oProduto.Excluir = False then begin
        Application.MessageBox('N?o foi poss?vel excluir o produto !', 'Aten??o');
      end;
    finally
      oProduto.Free;

      fdqPrincipal.Active := false;
      fdqPrincipal.Active	:= true;
    end;

  end;
end;

procedure TfrmTelaListaProdutos.btnIncluirClick(Sender: TObject);
begin
  try
    frmCadProduto := TfrmCadProduto.Create(self);
    frmCadProduto.id_Produto := 0;
  finally
    frmCadProduto.ShowModal;
    if frmCadProduto.id_Produto>0 then begin
      fdqPrincipal.Active := false;
      fdqPrincipal.Active	:= true;
      fdqPrincipal.RefreshRecord();
      frmCadProduto.Free;
    end;
  end;
end;

procedure TfrmTelaListaProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
    Close;
end;

function TGridHelper.ColumnByName(const AName: String): TColumn;
var
  i : Integer;
begin
  Result := Nil;
  for i := 0 to Columns.Count - 1 do begin
     if (Columns[i].Field <> Nil) and (CompareText(Columns[i].FieldName, AName) = 0) then begin
       Result := Columns[i];
       exit;
     end;
  end;
end;

//procedure TfrmTelaListaProdutos.FormCloseQuery(Sender: TObject;
//  var CanClose: Boolean);
//begin
//  if Appication.MessageBox('Deseja mesmo finalizar o programa ?', 'Voc? tem certeza ?', MB_ICONQUESTION or MB_YESNO) = IDNO then
//    CanClose := false;
//end;

end.
