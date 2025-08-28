object formTelaRelatorios: TformTelaRelatorios
  Left = 482
  Top = 214
  Width = 585
  Height = 370
  Caption = 'Relatorios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnRelatorio: TSpeedButton
    Left = 472
    Top = 280
    Width = 89
    Height = 33
    OnClick = BtnRelatorioClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 561
    Height = 241
    Caption = 'Par'#226'metros'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 175
      Height = 16
      Caption = 'Nome do computador.....-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 80
      Width = 175
      Height = 16
      Caption = 'Endere'#231'o IP.....................-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 104
      Width = 175
      Height = 16
      Caption = 'Setor.................................-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 128
      Width = 173
      Height = 16
      Caption = 'Unidade...........................-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 176
      Width = 175
      Height = 16
      Caption = 'Data..................................-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 152
      Width = 174
      Height = 16
      Caption = 'Tipo..................................-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 280
      Top = 176
      Width = 10
      Height = 16
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditNomeComputador: TEdit
      Left = 184
      Top = 27
      Width = 201
      Height = 21
      TabOrder = 0
      Text = 'EditNomeComputador'
    end
    object ComboTipo: TComboBox
      Left = 184
      Top = 157
      Width = 201
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'ComboBox1'
    end
    object ComboSetor: TComboBox
      Left = 184
      Top = 99
      Width = 201
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'ComboBox1'
    end
    object ComboUnidade: TComboBox
      Left = 184
      Top = 124
      Width = 201
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'ComboBox1'
    end
    object EditEnderecoIP: TEdit
      Left = 184
      Top = 75
      Width = 200
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
    end
    object DateCadastro1: TDateTimePicker
      Left = 184
      Top = 173
      Width = 89
      Height = 21
      Date = 45896.631894108800000000
      Time = 45896.631894108800000000
      TabOrder = 5
    end
    object DateCadastro2: TDateTimePicker
      Left = 296
      Top = 173
      Width = 89
      Height = 21
      Date = 45896.631894108800000000
      Time = 45896.631894108800000000
      TabOrder = 6
    end
  end
end
