object formTelaCadastro: TformTelaCadastro
  Left = 278
  Top = 112
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Tela de Cadastro'
  ClientHeight = 514
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton2: TSpeedButton
    Left = 248
    Top = 480
    Width = 23
    Height = 22
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 720
    Top = 456
    Width = 69
    Height = 32
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton4: TSpeedButton
    Left = 544
    Top = 456
    Width = 69
    Height = 32
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 632
    Top = 456
    Width = 69
    Height = 32
    Caption = 'Limpar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 456
    Width = 75
    Height = 13
    Caption = 'Procurar por:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TTabSheet2: TPageControl
    Left = 0
    Top = 0
    Width = 809
    Height = 433
    ActivePage = TTabSheet
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TTabSheet: TTabSheet
      Caption = 'Cadastro'
      OnShow = TTabSheetShow
      object Label1: TLabel
        Left = 25
        Top = 88
        Width = 122
        Height = 13
        Caption = 'Nome do Computador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 25
        Top = 280
        Width = 120
        Height = 13
        Caption = 'Usu'#225'rio respons'#225'vel '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 207
        Top = 144
        Width = 31
        Height = 13
        Caption = 'Setor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 25
        Top = 208
        Width = 85
        Height = 13
        Caption = 'Endere'#231'o MAC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 207
        Top = 208
        Width = 71
        Height = 13
        Caption = 'Endere'#231'o IP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 207
        Top = 88
        Width = 51
        Height = 13
        Caption = 'AnyDesk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TLabel
        Left = 25
        Top = 144
        Width = 48
        Height = 13
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 25
        Top = 32
        Width = 324
        Height = 29
        Caption = 'Cadastro De Computadores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 247
        Top = 282
        Width = 100
        Height = 13
        Caption = 'Data de Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 448
        Top = 80
        Width = 94
        Height = 16
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditNomeComputador: TDBEdit
        Left = 25
        Top = 104
        Width = 158
        Height = 21
        DataField = 'nome_computador'
        DataSource = DataModule1.dsQuery1
        MaxLength = 15
        TabOrder = 0
      end
      object EditUsuarioResponsavel: TDBEdit
        Left = 25
        Top = 296
        Width = 190
        Height = 21
        DataField = 'usuario_responsavel'
        DataSource = DataModule1.dsQuery1
        MaxLength = 20
        TabOrder = 1
      end
      object EditEnderecoIP: TDBEdit
        Left = 207
        Top = 224
        Width = 156
        Height = 21
        DataField = 'endereco_ip'
        DataSource = DataModule1.dsQuery1
        TabOrder = 2
      end
      object EditAnyDesk: TDBEdit
        Left = 207
        Top = 104
        Width = 158
        Height = 21
        DataField = 'anydesk'
        DataSource = DataModule1.dsQuery1
        MaxLength = 15
        TabOrder = 3
        OnChange = EditAnyDeskChange
      end
      object RadioDesktop: TRadioButton
        Left = 56
        Top = 352
        Width = 117
        Height = 33
        Caption = 'Desktop'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object RadioNotebook: TRadioButton
        Left = 224
        Top = 352
        Width = 117
        Height = 33
        Caption = 'Notebook'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object DateCadastro: TDBEdit
        Left = 247
        Top = 296
        Width = 118
        Height = 21
        DataField = 'data_cadastro'
        DataSource = DataModule1.dsQuery1
        TabOrder = 6
      end
      object MemoObservacoes: TDBMemo
        Left = 448
        Top = 96
        Width = 309
        Height = 241
        DataField = 'observacoes'
        DataSource = DataModule1.dsTelaCadastro
        TabOrder = 7
      end
      object ComboUnidade: TDBLookupComboBox
        Left = 25
        Top = 160
        Width = 158
        Height = 21
        DataField = 'unidade_id'
        DataSource = DataModule1.dsQuery1
        KeyField = 'id'
        ListField = 'nome'
        ListSource = DataModule1.dsUnidades
        TabOrder = 8
      end
      object ComboSetor: TDBLookupComboBox
        Left = 207
        Top = 160
        Width = 158
        Height = 21
        DataField = 'setor_id'
        DataSource = DataModule1.dsQuery1
        KeyField = 'id'
        ListField = 'nome'
        ListSource = DataModule1.dsSetores
        TabOrder = 9
      end
      object EditEnderecoMAC: TDBEdit
        Left = 25
        Top = 224
        Width = 152
        Height = 21
        DataField = 'endereco_mac'
        DataSource = DataModule1.dsQuery1
        TabOrder = 10
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Listagem'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 801
        Height = 401
        DataSource = DataModule1.dsQuery1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Default'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'nome_computador'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'usuario_responsavel'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'setor_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'anydesk'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco_mac'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'unidade_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'endereco_ip'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'observacoes'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_cadastro'
            Visible = True
          end>
      end
    end
  end
  object ComboBox1: TComboBox
    Left = 88
    Top = 456
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox1Change
  end
  object CheckBox1: TCheckBox
    Left = 240
    Top = 456
    Width = 97
    Height = 17
    Caption = 'Que contenha'
    TabOrder = 2
  end
  object ComboBox2: TComboBox
    Left = 336
    Top = 456
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
  end
  object EditPesquisa: TEdit
    Left = 8
    Top = 480
    Width = 225
    Height = 21
    TabOrder = 4
  end
end
