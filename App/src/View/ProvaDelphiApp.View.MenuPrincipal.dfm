object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'frmMenuPrincipal'
  ClientHeight = 461
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnuMenuPrincipal
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mnuMenuPrincipal: TMainMenu
    Left = 312
    Top = 156
    object r1: TMenuItem
      Caption = 'Tarefas'
      object arefa11: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = arefa11Click
      end
      object arefa21: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = arefa21Click
      end
      object arefa31: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = arefa31Click
      end
    end
  end
end
