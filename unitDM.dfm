object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 371
  Top = 190
  Height = 343
  Width = 459
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=xande123;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=CadastroComputadoresV2;Data Source=D' +
      'ESKTOP-P6GK0P9\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 32
  end
  object tabUnidades: TADOTable
    Active = True
    Connection = conexao
    CursorType = ctStatic
    MasterSource = dsSetores
    TableName = 'unidades'
    Left = 184
    Top = 32
    object tabUnidadesid: TIntegerField
      FieldName = 'id'
    end
    object tabUnidadesnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object tabSetores: TADOTable
    Active = True
    Connection = conexao
    CursorType = ctStatic
    TableName = 'setores'
    Left = 264
    Top = 32
    object tabSetoresid: TIntegerField
      FieldName = 'id'
    end
    object tabSetoresnome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object dsUnidades: TDataSource
    DataSet = tabUnidades
    Left = 200
    Top = 120
  end
  object dsSetores: TDataSource
    DataSet = tabSetores
    Left = 272
    Top = 120
  end
  object tabTelaCadastro: TADOTable
    Active = True
    Connection = conexao
    CursorType = ctStatic
    TableName = 'teladecadastro'
    Left = 112
    Top = 32
    object tabTelaCadastroid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object tabTelaCadastronome_computador: TStringField
      FieldName = 'nome_computador'
      Size = 10
    end
    object tabTelaCadastroanydesk: TLargeintField
      FieldName = 'anydesk'
    end
    object tabTelaCadastrounidade_id: TIntegerField
      FieldName = 'unidade_id'
    end
    object tabTelaCadastrosetor_id: TIntegerField
      FieldName = 'setor_id'
    end
    object tabTelaCadastroendereco_mac: TStringField
      FieldName = 'endereco_mac'
      EditMask = 'AA-AA-AA-AA-AA-AA;1;_'
      Size = 50
    end
    object tabTelaCadastroendereco_ip: TStringField
      FieldName = 'endereco_ip'
      EditMask = 'AA.AA.A.AAA;1;_'
      Size = 50
    end
    object tabTelaCadastrousuario_responsavel: TStringField
      FieldName = 'usuario_responsavel'
      Size = 50
    end
    object tabTelaCadastrotipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object tabTelaCadastroobservacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object tabTelaCadastrodata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
  end
  object dsTelaCadastro: TDataSource
    DataSet = tabTelaCadastro
    Left = 96
    Top = 120
  end
  object dsQuery1: TDataSource
    DataSet = ADOQuery1
    Left = 272
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 192
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=xande123;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=CadastroComputadoresV2;Data Source=D' +
      'ESKTOP-P6GK0P9\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 104
    Top = 192
  end
end
