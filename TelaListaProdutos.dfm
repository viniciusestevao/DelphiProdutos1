object frmTelaListaProdutos: TfrmTelaListaProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 689
  ClientWidth = 1082
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 384
    Top = 20
    Width = 298
    Height = 40
    Alignment = taCenter
    Caption = 'Cadastro de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grdProduto: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 88
    Width = 1076
    Height = 535
    Align = alBottom
    DataSource = dsProduto
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -21
    TitleFont.Name = 'Calibri'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'id_Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = 0
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'cd_Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Caption = 'Produto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ds_Descricao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 320
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_Lote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Caption = 'Nro. Lote'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qt_Estoque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Caption = 'Qtde Estoque'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_Cadastro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Caption = 'Data Cadastro'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_Atualizacao'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Caption = 'Data Altera'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -14
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end>
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 626
    Width = 1082
    Height = 63
    Align = alBottom
    TabOrder = 1
    object btnIncluir: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 55
      Height = 55
      Hint = 'Cadastrar uma nova venda'
      Align = alLeft
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnExcluir: TBitBtn
      AlignWithMargins = True
      Left = 126
      Top = 4
      Width = 55
      Height = 55
      Hint = 'Excluir a venda selecionada'
      Align = alLeft
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnAlterar: TBitBtn
      AlignWithMargins = True
      Left = 65
      Top = 4
      Width = 55
      Height = 55
      Hint = 'Excluir a venda selecionada'
      Align = alLeft
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnAlterarClick
    end
  end
  object dsProduto: TDataSource
    DataSet = fdqPrincipal
    Left = 88
    Top = 440
  end
  object fdqPrincipal: TFDQuery
    IndexesActive = False
    Connection = FDConnection1
    SQL.Strings = (
      'select * from tab_Produto')
    Left = 168
    Top = 440
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=ArecoDB1'
      'User_Name=sa'
      'Password=@Areco123'
      'Server=LAPTOP-E45FJV75\SQLEXPRESS'
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 264
    Top = 440
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 384
    Top = 440
  end
end
