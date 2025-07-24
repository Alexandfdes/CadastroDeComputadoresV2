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
    tabTelaCadastroanydesk: TLargeintField;
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
