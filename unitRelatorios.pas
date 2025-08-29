unit unitRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, ExtCtrls;

type
  TformTelaRelatorios = class(TForm)
    BtnRelatorio: TSpeedButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboSetor: TComboBox;
    ComboUnidade: TComboBox;
    DateIni: TDateTimePicker;
    DateFim: TDateTimePicker;
    Label8: TLabel;
    ComboEquipamento: TComboBox;
    Label1: TLabel;
    RadioGroupTipo: TRadioGroup;
    procedure BtnRelatorioClick(Sender: TObject);
    procedure ComboEquipamentoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTelaRelatorios: TformTelaRelatorios;

implementation

uses unitDM;

{$R *.dfm}

procedure TformTelaRelatorios.BtnRelatorioClick(Sender: TObject);
var
  filtro, sql: string;
begin
  filtro := ' WHERE 1=1 ';

  // Data de cadastro (exemplo com Data Inicial e Final)
  if DateIni.Date > 0 then
    filtro := filtro + ' AND data_cadastro >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DateIni.Date));
  if DateFim.Date > 0 then
    filtro := filtro + ' AND data_cadastro <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DateFim.Date));
  // Nome do computador
  if ComboEquipamento.Text <> '' then
    filtro := filtro + ' AND nome_computador LIKE ' + ComboSetor.text;

  // Setor
  if ComboSetor.Text <> '' then
    filtro := filtro + ' AND setor_id = ' + ComboSetor.text; // Use .Value se o ItemIndex aponta para o ID

  // Unidade
  if ComboUnidade.Text <> '' then
    filtro := filtro + ' AND unidade_id = ' + ComboUnidade.text;
 begin
  // Tipo
 if RadioGroupTipo.ItemIndex = 0 then
      filtro := filtro + ' AND tipo = ''Notebook'''
    else if RadioGroupTipo.ItemIndex = 1 then
      filtro := filtro + ' AND tipo = ''Desktop''';





  sql := 'SELECT * FROM tabtelacadastrocomputadores' + filtro;
  end
  else if ComboEquipamento.Text = 'Impressora' then
    sql := 'SELECT * FROM tabtelacadastroImpressoras' + filtro
  else if ComboEquipamento.Text = 'Roteador' then
    sql := 'SELECT * FROM tabtelacadastroRoteadores' + filtro
  else
  begin
    ShowMessage('Selecione o tipo de equipamento!');
    Exit;
  end;

  // Executa a query e mostra o relatório
  with DataModule1.ADOQuery1 do
  begin
    Close;
    SQL.Text := sql;
    Open;
  end;

  DataModule1.frxReport.ShowReport;
end;

procedure TformTelaRelatorios.ComboEquipamentoChange(Sender: TObject);
begin

  if ComboEquipamento.Text = 'Computadores' then
  begin
    RadioGroupTipo.Enabled := True;
    RadioGroupTipo.Visible := True;
  end
  else
  begin
    RadioGroupTipo.Enabled := False;
    RadioGroupTipo.Visible := True;
    RadioGroupTipo.ItemIndex := -1; // Limpa seleção
  end;
end;
procedure TformTelaRelatorios.FormShow(Sender: TObject);
var
  nomeUnidade, nomeSetor: string;
   setorID, unidadeID: Variant;
begin

  DataModule1.tabUnidades.Open;
  DataModule1.tabSetores.Open;
  // Preencher ComboBox de Unidades
  ComboUnidade.Items.Clear;
  DataModule1.tabUnidades.First;
  while not DataModule1.tabUnidades.Eof do
  begin
    ComboUnidade.Items.Add(DataModule1.tabUnidades.FieldByName('nome').AsString);
    DataModule1.tabUnidades.Next;
  end;

  // Preencher ComboBox de Setores
  ComboSetor.Items.Clear;
  DataModule1.tabSetores.First;
  while not DataModule1.tabSetores.Eof do
  begin
    ComboSetor.Items.Add(DataModule1.tabSetores.FieldByName('nome').AsString);
    DataModule1.tabSetores.Next;
end;
 end;
end.
