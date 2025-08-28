object TelaPrincipal: TTelaPrincipal
  Left = 255
  Top = 188
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Sistema de Controle'
  ClientHeight = 431
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 809
    Height = 97
    Align = alTop
    TabOrder = 0
    object EditComputadores: TBitBtn
      Left = 0
      Top = 0
      Width = 121
      Height = 97
      Caption = 'Computadores'
      TabOrder = 0
      OnClick = EditCompuadoresClick
    end
    object EditImpressoras: TBitBtn
      Left = 120
      Top = 0
      Width = 121
      Height = 97
      Caption = 'Impressoras'
      TabOrder = 1
      OnClick = EditImpressorasClick
    end
    object BitBtn1: TBitBtn
      Left = 240
      Top = 0
      Width = 121
      Height = 97
      Caption = 'Roteadores'
      TabOrder = 2
      OnClick = EditRoteadoresClick
    end
  end
  object EditRoteadores: TBitBtn
    Left = 360
    Top = 0
    Width = 121
    Height = 97
    Caption = 'Relatorios'
    TabOrder = 1
    OnClick = EditRoteadoresClick
  end
end
