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
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    ADOQuery1id: TAutoIncField;
    ADOQuery1nome_computador: TStringField;
    ADOQuery1endereco_mac: TStringField;
    ADOQuery1endereco_ip: TStringField;
    ADOQuery1usuario_responsavel: TStringField;
    ADOQuery1tipo: TStringField;
    ADOQuery1observacoes: TMemoField;
    ADOQuery1data_cadastro: TDateTimeField;
    tabTelaCadastroanydesk: TStringField;
    ADOQuery1setor_nome: TStringField;
    ADOQuery1unidade_nome: TStringField;
    ADOQuery1unidade_id: TIntegerField;
    ADOQuery1setor_id: TIntegerField;
    ADOQuery1anydesk: TStringField;
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
  ADOConnection1.Connected := True;
end;

end.
