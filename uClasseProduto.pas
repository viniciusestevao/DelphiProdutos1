unit uClasseProduto;


interface

uses System.Classes,FireDAC.Phys.MSSQLCli	,FireDAC.Phys.MSSQLMeta,
      firedac.VCLUI.Controls, FireDAC.CDS.LocalSQL, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
      FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
      FireDAC.Comp.DataSet, FireDAC.Comp.Client;

Type
  TProduto = class
  Private
    FID_Produto: Integer;
    FCodigo, FNome, FDescricao, FNroLote : string;
    FQtde: Double;
    fdqProduto: TFDQuery;
  Public
    property ID_Produto:Integer read FID_Produto write FID_Produto;
    property Codigo:string read FCodigo write FCodigo;
    property Nome:string read FNome write FNome;
    property Descricao:string read FDescricao write FDescricao;
    property NroLote:string read FNroLote write FNroLote;
    property Qtde:Double read FQtde write FQtde;

    function Gravar():boolean;
    function Incluir():integer;
    function Alterar():integer;
    function Excluir():boolean;
    function Carregar():boolean;
  end;

implementation

uses  DataModule,FireDAC.Phys.TDBX, SysUtils;

{ TProduto }

function TProduto.Gravar(): boolean;
begin
  Result := false;

  if ID_Produto>0 then begin
    if Alterar=0 then begin
      DataModule1.fdConnection.Rollback;
      exit;
    end;
  end else begin
    if Incluir=0 then begin
      DataModule1.fdConnection.Rollback;
      exit;
    end;
  end;
  DataModule1.fdConnection.Commit;

  Result := true;
end;

function TProduto.Excluir(): boolean;
var
  sSQL: string;
begin
  Result := false;

  if ID_Produto>0 then begin
    try
      DataModule1.fdConnection.Close;
      sSQL := 'delete tab_Produto where id_Produto = ' + IntToStr(ID_Produto);
      DataModule1.fdConnection.Open;
      DataModule1.fdConnection.ExecSQL(sSQL);
      DataModule1.fdConnection.Close;
      DataModule1.fdConnection.Commit;
    except
      result := false;
       DataModule1.fdConnection.Rollback;
    end;
    Result := true;
  end;
end;


function TProduto.Incluir(): integer;
var
  sSQL: string;
begin
   Result := 0;

  try
    fdqProduto := TFDQuery.Create(nil);
    fdqProduto.Connection := DataModule1.fdConnection;

    fdqProduto.SQL.Clear;
    fdqProduto.SQL.Add('insert into tab_Produto (cd_Produto,ds_Nome,ds_Descricao,nr_Lote,qt_Estoque) values (''' + Codigo + ''', ''' + Nome + ''', ''' + Descricao + ''', ''' + NroLote + ''', ' + FloatToStr(Qtde)  + ')') ;
    fdqProduto.ExecSQL;

    fdqProduto.SQL.Clear;
    fdqProduto.SQL.Add('SELECT max(id_Produto) ID_Produto from tab_Produto (nolock) ') ;
    fdqProduto.Open;
    ID_Produto := fdqProduto.FieldByName('ID_Produto').Value;
    fdqProduto.Close;

    fdqProduto.Free;
  except
    result := 0;
  end;

  Result := ID_Produto;
end;

function TProduto.Alterar(): integer;
var
  sSQL: string;
begin
   Result := 0;

  try
    DataModule1.fdConnection.Close;
    sSQL := 'update tab_Produto set cd_Produto=''' + Codigo + ''', ds_Nome = ''' + Nome + ''', ds_Descricao= ''' + Descricao + ''', nr_Lote = ''' + NroLote + ''', qt_Estoque = ' + FloatToStr(Qtde) + ', dt_Atualizacao = GETDATE() where id_Produto = ' + IntToStr(ID_Produto);
    DataModule1.fdConnection.Open;
    DataModule1.fdConnection.ExecSQL(sSQL);
    DataModule1.fdConnection.Close;
  except
    result := 0;
  end;

  Result := ID_Produto;
end;


function TProduto.Carregar(): boolean;
begin
  Result := false;

  if ID_Produto>0 then begin
    try
      fdqProduto := TFDQuery.Create(nil);
      fdqProduto.Connection := DataModule1.fdConnection;
      fdqProduto.SQL.Clear;
      fdqProduto.SQL.Add('select top 1 * from tab_Produto where id_Produto = ' + IntToStr(ID_Produto)) ;
      fdqProduto.Open;

      Codigo    := fdqProduto.FieldByName('cd_Produto').Value;
      Nome	    := fdqProduto.FieldByName('ds_Nome').Value;
      Descricao := fdqProduto.FieldByName('ds_Descricao').Value;
      NroLote   := fdqProduto.FieldByName('nr_Lote').Value;
      Qtde      := fdqProduto.FieldByName('qt_Estoque').Value;

      fdqProduto.Close;
      fdqProduto.Free;
    except
      result := false;
    end;
  end;

  Result := true;
end;

end.
