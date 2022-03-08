object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Inclus'#227'o de Produto'
  ClientHeight = 366
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 31
    Width = 44
    Height = 19
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 31
    Width = 50
    Height = 19
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 95
    Width = 58
    Height = 19
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 224
    Width = 72
    Height = 19
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 168
    Top = 224
    Width = 81
    Height = 19
    Caption = 'N'#250'mero Lote'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 303
    Width = 591
    Height = 63
    Align = alBottom
    TabOrder = 5
    object btnGravar: TBitBtn
      AlignWithMargins = True
      Left = 351
      Top = 4
      Width = 115
      Height = 55
      Hint = 'Cadastrar uma nova venda'
      Align = alRight
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelar: TBitBtn
      AlignWithMargins = True
      Left = 472
      Top = 4
      Width = 115
      Height = 55
      Hint = 'Excluir a venda selecionada'
      Align = alRight
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object mskLote: TMaskEdit
    Left = 168
    Top = 249
    Width = 121
    Height = 23
    TabOrder = 4
    Text = ''
  end
  object mskNomeProduto: TMaskEdit
    Left = 168
    Top = 56
    Width = 401
    Height = 23
    TabOrder = 1
    Text = ''
  end
  object mskCodigo: TMaskEdit
    Left = 16
    Top = 56
    Width = 121
    Height = 23
    TabOrder = 0
    Text = ''
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 284
    Width = 591
    Height = 19
    Panels = <>
  end
  object memDescricao: TMemo
    Left = 16
    Top = 120
    Width = 553
    Height = 89
    TabOrder = 2
  end
  object edtQtde: TEdit
    Left = 16
    Top = 249
    Width = 121
    Height = 23
    TabOrder = 3
  end
end
