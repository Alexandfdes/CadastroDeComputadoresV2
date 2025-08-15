unit unitDM;

interface

uses
  SysUtils, Classes, DB, ADODB, FMTBcd, SqlExpr, DBXpress;

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
    tabTelaCadastro: TADOTable;
    tabTelaCadastroid: TAutoIncField;
    tabTelaCadastronome_computador: TStringField;
    tabTelaCadastrounidade_id: TIntegerField;
    tabTelaCadastrosetor_id: TIntegerField;
    tabTelaCadastroendereco_mac: TStringField;
    tabTelaCadastroendereco_ip: TStringField;
    tabTelaCadastrousuario_responsavel: TStringField;
    tabTelaCadastrotipo: TStringField;
    tabTelaCadastroobservacoes: TMemoField;
    tabTelaCadastrodata_cadastro: TDateTimeField;
    dsTelaCadastro: TDataSource;
    dsQuery1: TDataSource;
    tabTelaCadastroanydesk: TStringField;
    tabCadastroImpressoras: TADOTable;
    dsImpressoras: TDataSource;
    tabCadastroImpressorasid: TIntegerField;
    tabCadastroImpressorasnome_impressora: TStringField;
    tabCadastroImpressorasserial: TStringField;
    tabCadastroImpressorasunidade_id: TIntegerField;
    tabCadastroImpressorassetor_id: TIntegerField;
    tabCadastroImpressorasendereco_mac: TStringField;
    tabCadastroImpressorasendereco_ip: TStringField;
    tabCadastroImpressorasusuario_responsavel: TStringField;
    tabCadastroImpressorasobservacoes: TMemoField;
    tabCadastroImpressorasdata_cadastro: TDateTimeField;
    ADOQuery1: TADOQuery;
    ADOQuery1id: TAutoIncField;
    ADOQuery1nome_computador: TStringField;
    ADOQuery1usuario_responsavel: TStringField;
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
  tabTelaCadastro.Open;
  conexao.Connected := True;
end;



end.
