object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'fTarefa3'
  ClientHeight = 355
  ClientWidth = 635
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grdProjetos: TDBGrid
    Left = 12
    Top = 12
    Width = 609
    Height = 245
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtTotal: TLabeledEdit
    Left = 500
    Top = 284
    Width = 121
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Total R$'
    TabOrder = 1
    Text = '0'
  end
  object btnTotal: TButton
    Left = 376
    Top = 282
    Width = 87
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 2
    OnClick = btnTotalClick
  end
  object edtTotalDivisoes: TLabeledEdit
    Left = 500
    Top = 326
    Width = 121
    Height = 21
    EditLabel.Width = 40
    EditLabel.Height = 13
    EditLabel.Caption = 'Total R$'
    TabOrder = 3
    Text = '0'
  end
  object btnTotalDivisoes: TButton
    Left = 344
    Top = 322
    Width = 119
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 4
    OnClick = btnTotalDivisoesClick
  end
end
