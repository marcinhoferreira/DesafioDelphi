object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'fTarefa2'
  ClientHeight = 299
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblAndamentoThread1: TLabel
    Left = 16
    Top = 59
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblAndamentoThread2: TLabel
    Left = 16
    Top = 123
    Width = 6
    Height = 13
    Caption = '0'
  end
  object btnExecutar: TButton
    Left = 222
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 0
    OnClick = btnExecutarClick
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 36
    Width = 373
    Height = 17
    TabOrder = 1
  end
  object edtEsperaThread1: TLabeledEdit
    Left = 404
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 125
    EditLabel.Height = 13
    EditLabel.Caption = 'Espera (em Milisegundos):'
    TabOrder = 2
    OnKeyPress = edtEsperaThread1KeyPress
  end
  object edtEsperaThread2: TLabeledEdit
    Left = 404
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 125
    EditLabel.Height = 13
    EditLabel.Caption = 'Espera (em Milisegundos):'
    TabOrder = 3
    OnKeyPress = edtEsperaThread1KeyPress
  end
  object ProgressBar2: TProgressBar
    Left = 16
    Top = 100
    Width = 373
    Height = 17
    TabOrder = 4
  end
end
