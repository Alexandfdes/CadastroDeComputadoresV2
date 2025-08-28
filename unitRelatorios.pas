unit unitRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls;

type
  TformTelaRelatorios = class(TForm)
    BtnRelatorio: TSpeedButton;
    GroupBox1: TGroupBox;
    EditNomeComputador: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboTipo: TComboBox;
    ComboSetor: TComboBox;
    ComboUnidade: TComboBox;
    EditEnderecoIP: TEdit;
    DateCadastro1: TDateTimePicker;
    DateCadastro2: TDateTimePicker;
    Label8: TLabel;
    procedure BtnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTelaRelatorios: TformTelaRelatorios;

implementation

{$R *.dfm}

procedure TformTelaRelatorios.BtnRelatorioClick(Sender: TObject);
var
  filtro: string;
begin
  filtro := ' WHERE 1=1 ';

  // Nome do computador
  if EditNomeComputador.Text <> '' then
    filtro := filtro + ' AND nome_computador LIKE ' + QuotedStr('%' + EditNome.Text + '%');


  // Endereço IP
  if EditIP.Text <> '' then
    filtro := filtro + ' AND endereco_ip LIKE ' + QuotedStr('%' + EditIP.Text + '%');

  // Setor
  if ComboSetor.Text <> '' then
    filtro := filtro + ' AND setor_id = ' + ComboSetor.Value; // Use .Value se o ItemIndex aponta para o ID

  // Unidade
  if ComboUnidade.Text <> '' then
    filtro := filtro + ' AND unidade_id = ' + ComboUnidade.Value;

  // Tipo
  if ComboTipo.Text <> '' then
    filtro := filtro + ' AND tipo = ' + QuotedStr(ComboTipo.Text);

  // Data de cadastro (exemplo com Data Inicial e Final)
  if DateIni.Date > 0 then
    filtro := filtro + ' AND data_cadastro >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DateIni.Date));
  if DateFim.Date > 0 then
    filtro := filtro + ' AND data_cadastro <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DateFim.Date));

  // Monta o SQL final
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT * FROM tabCadastroComputadores' + filtro;
    Open;
  end;

  // Mostra o relatório
  DataModule1.frxComputadores.ShowReport;
end;

end.
