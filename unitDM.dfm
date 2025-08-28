object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 362
  Top = 133
  Height = 518
  Width = 550
  object conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=xande123;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=CadastroComputadoresV2;Data Source=D' +
      'ESKTOP-P6GK0P9\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 480
    Top = 192
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
    Active = True
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
  object frxDBComputadores: TfrxDBDataset
    UserName = 'Computadores'
    CloseDataSource = False
    DataSource = dsComputadores
    BCDToCurrency = False
    Left = 132
    Top = 368
  end
  object frxComputadores: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45894.627214386600000000
    ReportOptions.LastChange = 45895.592685173600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 40
    Top = 368
    Datasets = <
      item
        DataSet = frxDBComputadores
        DataSetName = 'Computadores'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object mdComputadores: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 128.504020000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 37.795300000000000000
          Top = 34.015770000000000000
          Width = 377.953000000000000000
          Height = 94.488250000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'CONTROLE DE COMPUTADORES')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 120.944960000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Diagonal = True
        end
        object Date: TfrxMemoView
          Left = 631.181510000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[Date]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        DataSet = frxDBComputadores
        DataSetName = 'Computadores'
        RowCount = 0
        object frxDBDataset1nome_computador: TfrxMemoView
          Left = 7.559060000000000000
          Top = 11.338590000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'nome_computador'
          DataSet = frxDBComputadores
          DataSetName = 'Computadores'
          Memo.UTF8 = (
            '[Computadores."nome_computador"]')
        end
        object frxDBDataset1usuario_responsavel: TfrxMemoView
          Left = 196.535560000000000000
          Top = 11.338590000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataField = 'usuario_responsavel'
          DataSet = frxDBComputadores
          DataSetName = 'Computadores'
          Memo.UTF8 = (
            '[Computadores."usuario_responsavel"]')
        end
        object Computadoresanydesk: TfrxMemoView
          Left = 411.968770000000000000
          Top = 11.338590000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'anydesk'
          DataSet = frxDBComputadores
          DataSetName = 'Computadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Computadores."anydesk"]')
          ParentFont = False
        end
        object Computadoresdata_cadastro: TfrxMemoView
          Align = baWidth
          Left = 532.913730000000000000
          Top = 11.338590000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataField = 'data_cadastro'
          DataSet = frxDBComputadores
          DataSetName = 'Computadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Computadores."data_cadastro"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
      end
    end
  end
end
