object formTelaListagem: TformTelaListagem
  Left = 225
  Top = 206
  Width = 870
  Height = 450
  Caption = 'formTelaListagem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = -56
    Top = 0
    Width = 913
    Height = 361
    DataSource = DataModule1.dsTelaCadastro
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_computador'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'anydesk'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unidade_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'setor_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco_mac'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco_ip'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'usuario_responsavel'
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
