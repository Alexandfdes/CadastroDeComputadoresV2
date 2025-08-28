unit unitDM;

interface

uses
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr, DBXpress, frxClass,
  frxDBSet;

type
  TDataModule1 = class(TDataModule)
    conexao: TADOConnection;
    tabUnidades: TADOTable;
    tabSetores: TADOTable;
    dsUnidades: TDataSource;
    dsSetores: TDataSource;
    tabSetoresid: TIntegerField;
    tabSetoresnome: TStringField;
    tabUnidadesid: TIntegerField;
    tabUnidadesnome: TStringField;
    tabCadastroComputadores: TADOTable;
    tabCadastroComputadoresid: TAutoIncField;
    tabCadastroComputadoresnome_computador: TStringField;
    tabCadastroComputadoresunidade_id: TIntegerField;
    tabCadastroComputadoressetor_id: TIntegerField;
    tabCadastroComputadoresendereco_mac: TStringField;
    tabCadastroComputadoresendereco_ip: TStringField;
    tabCadastroComputadoresusuario_responsavel: TStringField;
    tabCadastroComputadorestipo: TStringField;
    tabCadastroComputadoresobservacoes: TMemoField;
    tabCadastroComputadoresdata_cadastro: TDateTimeField;
    dsComputadores: TDataSource;
    dsQuery1: TDataSource;
    tabCadastroComputadoresanydesk: TStringField;
    tabCadastroImpressoras: TADOTable;
    dsImpressoras: TDataSource;
    tabCadastroImpressorasid: TIntegerField;
    tabCadastroImpressorasnome_impressora: TStringField;
    tabCadastroImpressorasserial: TStringField;
    tabCadastroImpressorasunidade_id: TIntegerField;
    tabCadastroImpressorassetor_id: TIntegerField;
    tabCadastroImpressorasendereco_mac: TStringField;
    tabCadastroImpressorasendereco_ip: TStringField;
    tabCadastroImpressorasobservacoes: TMemoField;
    tabCadastroImpressorasdata_cadastro: TDateTimeField;
    ADOQuery1: TADOQuery;
    ADOQuery1id: TAutoIncField;
    ADOQuery1nome_computador: TStringField;
    ADOQuery1endereco_ip: TStringField;
    ADOQuery1tipo: TStringField;
    ADOQuery1observacoes: TMemoField;
    ADOQuery1data_cadastro: TDateTimeField;
    ADOQuery1setor_nome: TStringField;
    ADOQuery1unidade_nome: TStringField;
    ADOQuery1unidade_id: TIntegerField;
    ADOQuery1setor_id: TIntegerField;
    ADOQuery1anydesk: TStringField;
    ADOQuery1endereco_mac: TStringField;
    ADOQuery2: TADOQuery;
    dsQuery2: TDataSource;
    ADOQuery2id: TIntegerField;
    ADOQuery2nome_impressora: TStringField;
    ADOQuery2serial: TStringField;
    ADOQuery2unidade_id: TIntegerField;
    ADOQuery2setor_id: TIntegerField;
    ADOQuery2endereco_mac: TStringField;
    ADOQuery2endereco_ip: TStringField;
    ADOQuery2usuario_responsavel: TStringField;
    ADOQuery2observacoes: TMemoField;
    ADOQuery2data_cadastro: TDateTimeField;
    ADOQuery2setor_nome: TStringField;
    ADOQuery2unidade_nome: TStringField;
    dsQuery3: TDataSource;
    dsRoteadores: TDataSource;
    tabCadastroRoteadores: TADOTable;
    ADOQuery3: TADOQuery;
    tabCadastroRoteadoresid: TAutoIncField;
    tabCadastroRoteadoresnome_roteador: TStringField;
    tabCadastroRoteadoressenha_acesso: TStringField;
    tabCadastroRoteadoresunidade_id: TIntegerField;
    tabCadastroRoteadoressetor_id: TIntegerField;
    tabCadastroRoteadoresendereco_mac: TStringField;
    tabCadastroRoteadoresendereco_ip: TStringField;
    tabCadastroRoteadoresusuario_acesso: TStringField;
    tabCadastroRoteadoresobservacoes: TMemoField;
    tabCadastroRoteadoresdata_cadastro: TDateTimeField;
    ADOQuery3id: TAutoIncField;
    ADOQuery3nome_roteador: TStringField;
    ADOQuery3senha_acesso: TStringField;
    ADOQuery3unidade_id: TIntegerField;
    ADOQuery3setor_id: TIntegerField;
    ADOQuery3endereco_mac: TStringField;
    ADOQuery3endereco_ip: TStringField;
    ADOQuery3usuario_acesso: TStringField;
    ADOQuery3observacoes: TMemoField;
    ADOQuery3data_cadastro: TDateTimeField;
    ADOQuery3setor_nome: TStringField;
    ADOQuery3unidade_nome: TStringField;
    frxDBComputadores: TfrxDBDataset;
    frxComputadores: TfrxReport;
    procedure DataModuleCreate(Sender: TObject);
   
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  tabUnidades.Open;
  tabSetores.Open;
  tabCadastroComputadores.Close;
  tabCadastroComputadores.Open;
  conexao.Connected := True;
 
end;



end.
