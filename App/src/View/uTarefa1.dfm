object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'fTarefa1'
  ClientHeight = 421
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTituloColunas: TLabel
    Left = 12
    Top = 12
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTituloTabelas: TLabel
    Left = 212
    Top = 12
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblTituloCondicoes: TLabel
    Left = 412
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblTituloSQLGerado: TLabel
    Left = 12
    Top = 216
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object mmoColunas: TMemo
    Left = 12
    Top = 32
    Width = 184
    Height = 172
    TabOrder = 0
  end
  object mmoTabelas: TMemo
    Left = 212
    Top = 32
    Width = 184
    Height = 172
    TabOrder = 1
  end
  object mmoCondicoes: TMemo
    Left = 412
    Top = 32
    Width = 184
    Height = 172
    TabOrder = 2
  end
  object mmoSQLGerado: TMemo
    Left = 12
    Top = 236
    Width = 683
    Height = 172
    TabOrder = 3
  end
  object btnGeraSQL: TButton
    Left = 620
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Gera SQL'
    TabOrder = 4
    OnClick = btnGeraSQLClick
  end
  object spQuery1: TspQuery
    Left = 640
    Top = 136
  end
end
