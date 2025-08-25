object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 426
  Top = 173
  Height = 439
  Width = 527
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=xande123;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=CadastroComputadoresV2;Data Source=D' +
      'ESKTOP-P6GK0P9\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 456
    Top = 352
  end
  object tabUnidades: TADOTable
    Active = True
    Connection = conexao
    CursorType = ctStatic
    MasterSource = dsSetores
    TableName = 'unidades'
    Left = 352
    Top = 40
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
    Left = 432
    Top = 40
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
    Left = 352
    Top = 104
  end
  object dsSetores: TDataSource
    DataSet = tabSetores
    Left = 440
    Top = 104
  end
  object tabCadastroComputadores: TADOTable
    Connection = conexao
    CursorType = ctStatic
    TableName = 'telacadastrocomputadores'
    Left = 32
    Top = 32
    object tabCadastroComputadoresid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object tabCadastroComputadoresnome_computador: TStringField
      FieldName = 'nome_computador'
      Size = 10
    end
    object tabCadastroComputadoresunidade_id: TIntegerField
      FieldName = 'unidade_id'
    end
    object tabCadastroComputadoressetor_id: TIntegerField
      FieldName = 'setor_id'
    end
    object tabCadastroComputadoresendereco_mac: TStringField
      FieldName = 'endereco_mac'
      EditMask = 'AA-AA-AA-AA-AA-AA;1;_'
      Size = 50
    end
    object tabCadastroComputadoresendereco_ip: TStringField
      FieldName = 'endereco_ip'
      EditMask = 'AA.AA.A.AAA;1;_'
      Size = 50
    end
    object tabCadastroComputadoresusuario_responsavel: TStringField
      FieldName = 'usuario_responsavel'
      Size = 50
    end
    object tabCadastroComputadorestipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object tabCadastroComputadoresobservacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object tabCadastroComputadoresdata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
    object tabCadastroComputadoresanydesk: TStringField
      FieldName = 'anydesk'
      Size = 15
    end
  end
  object dsComputadores: TDataSource
    DataSet = tabCadastroComputadores
    Left = 32
    Top = 104
  end
  object dsQuery1: TDataSource
    DataSet = ADOQuery1
    Left = 32
    Top = 264
  end
  object tabCadastroImpressoras: TADOTable
    Active = True
    Connection = conexao
    CursorType = ctStatic
    TableName = 'telacadastroimpressoras'
    Left = 136
    Top = 32
    object tabCadastroImpressorasid: TIntegerField
      FieldName = 'id'
    end
    object tabCadastroImpressorasnome_impressora: TStringField
      FieldName = 'nome_impressora'
      Size = 50
    end
    object tabCadastroImpressorasserial: TStringField
      FieldName = 'serial'
      Size = 50
    end
    object tabCadastroImpressorasunidade_id: TIntegerField
      FieldName = 'unidade_id'
    end
    object tabCadastroImpressorassetor_id: TIntegerField
      FieldName = 'setor_id'
    end
    object tabCadastroImpressorasendereco_mac: TStringField
      FieldName = 'endereco_mac'
      Size = 50
    end
    object tabCadastroImpressorasendereco_ip: TStringField
      FieldName = 'endereco_ip'
      Size = 50
    end
    object tabCadastroImpressorasusuario_responsavel: TStringField
      FieldName = 'usuario_responsavel'
      Size = 50
    end
    object tabCadastroImpressorasobservacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object tabCadastroImpressorasdata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
  end
  object dsImpressoras: TDataSource
    DataSet = tabSetores
    Left = 136
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT t.*, s.nome AS setor_nome, u.nome AS unidade_nome'
      'FROM telacadastrorocomputadores t'
      'LEFT JOIN setores s ON t.setor_id = s.id'
      'LEFT JOIN unidades u ON t.unidade_id = u.id')
    Left = 32
    Top = 192
    object ADOQuery1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQuery1nome_computador: TStringField
      FieldName = 'nome_computador'
      Size = 10
    end
    object ADOQuery1usuario_responsavel: TStringField
      FieldName = 'usuario_responsavel'
      Size = 50
    end
    object ADOQuery1endereco_ip: TStringField
      FieldName = 'endereco_ip'
      EditMask = '##.##.#.###;1;_'
      Size = 50
    end
    object ADOQuery1tipo: TStringField
      FieldName = 'tipo'
      Size = 50
    end
    object ADOQuery1observacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object ADOQuery1data_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
    object ADOQuery1setor_nome: TStringField
      FieldName = 'setor_nome'
      Size = 50
    end
    object ADOQuery1unidade_nome: TStringField
      FieldName = 'unidade_nome'
      Size = 50
    end
    object ADOQuery1unidade_id: TIntegerField
      FieldName = 'unidade_id'
    end
    object ADOQuery1setor_id: TIntegerField
      FieldName = 'setor_id'
    end
    object ADOQuery1anydesk: TStringField
      FieldName = 'anydesk'
      Size = 15
    end
    object ADOQuery1endereco_mac: TStringField
      FieldName = 'endereco_mac'
      Size = 50
    end
  end
  object ADOQuery2: TADOQuery
    Active = True
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT timp.*, s.nome AS setor_nome, u.nome AS unidade_nome '
      '  FROM telacadastroimpressoras timp '
      '    LEFT JOIN setores s ON timp.setor_id = s.id '
      '    LEFT JOIN unidades u ON timp.unidade_id = u.id '
      ''
      ''
      '')
    Left = 136
    Top = 192
    object ADOQuery2id: TIntegerField
      FieldName = 'id'
    end
    object ADOQuery2nome_impressora: TStringField
      FieldName = 'nome_impressora'
      Size = 50
    end
    object ADOQuery2serial: TStringField
      FieldName = 'serial'
      Size = 50
    end
    object ADOQuery2unidade_id: TIntegerField
      FieldName = 'unidade_id'
    end
    object ADOQuery2setor_id: TIntegerField
      FieldName = 'setor_id'
    end
    object ADOQuery2endereco_mac: TStringField
      FieldName = 'endereco_mac'
      Size = 50
    end
    object ADOQuery2endereco_ip: TStringField
      FieldName = 'endereco_ip'
      Size = 50
    end
    object ADOQuery2usuario_responsavel: TStringField
      FieldName = 'usuario_responsavel'
      Size = 50
    end
    object ADOQuery2observacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object ADOQuery2data_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
    object ADOQuery2setor_nome: TStringField
      FieldName = 'setor_nome'
      Size = 50
    end
    object ADOQuery2unidade_nome: TStringField
      FieldName = 'unidade_nome'
      Size = 50
    end
  end
  object dsQuery2: TDataSource
    DataSet = ADOQuery2
    Left = 120
    Top = 264
  end
  object dsQuery3: TDataSource
    DataSet = ADOQuery3
    Left = 232
    Top = 272
  end
  object dsRoteadores: TDataSource
    DataSet = tabCadastroRoteadores
    Left = 256
    Top = 104
  end
  object tabCadastroRoteadores: TADOTable
    Active = True
    Connection = conexao
    CursorType = ctStatic
    TableName = 'telacadastroroteadores'
    Left = 256
    Top = 32
    object tabCadastroRoteadoresid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object tabCadastroRoteadoresnome_roteador: TStringField
      FieldName = 'nome_roteador'
      Size = 50
    end
    object tabCadastroRoteadoressenha_acesso: TStringField
      FieldName = 'senha_acesso'
      Size = 50
    end
    object tabCadastroRoteadoresunidade_id: TIntegerField
      FieldName = 'unidade_id'
    end
    object tabCadastroRoteadoressetor_id: TIntegerField
      FieldName = 'setor_id'
    end
    object tabCadastroRoteadoresendereco_mac: TStringField
      FieldName = 'endereco_mac'
      Size = 50
    end
    object tabCadastroRoteadoresendereco_ip: TStringField
      FieldName = 'endereco_ip'
      Size = 50
    end
    object tabCadastroRoteadoresusuario_acesso: TStringField
      FieldName = 'usuario_acesso'
      Size = 50
    end
    object tabCadastroRoteadoresobservacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object tabCadastroRoteadoresdata_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
  end
  object ADOQuery3: TADOQuery
    Active = True
    Connection = conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT trot.*, s.nome AS setor_nome, u.nome AS unidade_nome '
      '  FROM telacadastroroteadores trot'
      '    LEFT JOIN setores s ON trot.setor_id = s.id '
      '    LEFT JOIN unidades u ON trot.unidade_id = u.id '
      ''
      ''
      ''
      '')
    Left = 240
    Top = 200
    object ADOQuery3id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADOQuery3nome_roteador: TStringField
      FieldName = 'nome_roteador'
      Size = 50
    end
    object ADOQuery3senha_acesso: TStringField
      FieldName = 'senha_acesso'
      Size = 50
    end
    object ADOQuery3unidade_id: TIntegerField
      FieldName = 'unidade_id'
    end
    object ADOQuery3setor_id: TIntegerField
      FieldName = 'setor_id'
    end
    object ADOQuery3endereco_mac: TStringField
      FieldName = 'endereco_mac'
      Size = 50
    end
    object ADOQuery3endereco_ip: TStringField
      FieldName = 'endereco_ip'
      Size = 50
    end
    object ADOQuery3usuario_acesso: TStringField
      FieldName = 'usuario_acesso'
      Size = 50
    end
    object ADOQuery3observacoes: TMemoField
      FieldName = 'observacoes'
      BlobType = ftMemo
    end
    object ADOQuery3data_cadastro: TDateTimeField
      FieldName = 'data_cadastro'
    end
    object ADOQuery3setor_nome: TStringField
      FieldName = 'setor_nome'
      Size = 50
    end
    object ADOQuery3unidade_nome: TStringField
      FieldName = 'unidade_nome'
      Size = 50
    end
  end
end
