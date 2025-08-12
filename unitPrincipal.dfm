object TelaPrincipal: TTelaPrincipal
  Left = 242
  Top = 305
  BorderStyle = bsSingle
  Caption = 'Sistema de Controle'
  ClientHeight = 495
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 809
    Height = 97
    Align = alTop
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 0
      Top = 0
      Width = 121
      Height = 97
      Caption = 'Cadastro'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
end
