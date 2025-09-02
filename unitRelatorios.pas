unit unitRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, ExtCtrls, Mask, ToolEdit;

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
    Label8: TLabel;
    ComboEquipamento: TComboBox;
    Label1: TLabel;
    RadioGroupTipo: TRadioGroup;
    DateFim: TDateEdit;
    DateIni: TDateEdit;
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

uses unitDM, unitPrincipal, unitTelaCadastroComputadores,
  unitTelaCadastroImpressoras, unitTelaCadastroRoteadores;

{$R *.dfm}

procedure TformTelaRelatorios.BtnRelatorioClick(Sender: TObject);
var
  filtro, sql, campoNome, nome: string;
  id: integer;
begin



  // Filtrar por Setor (usando o ID selecionado)
  if ComboSetor.ItemIndex >= 0 then
    filtro := filtro + ' AND setor_id = ' + IntToStr(Integer(ComboSetor.Items.Objects[ComboSetor.ItemIndex]));

  // Filtrar por Unidade (usando o ID selecionado)
  if ComboUnidade.ItemIndex >= 0 then
    filtro := filtro + ' AND unidade_id = ' + IntToStr(Integer(ComboUnidade.Items.Objects[ComboUnidade.ItemIndex]));




  // Data Inicial
  if Trim(DateIni.Text) <> '' then
  begin
    try
      filtro := filtro + ' AND data_cadastro >= ' + QuotedStr(FormatDateTime('DD/MM/YYYY', StrToDate(DateIni.Text)));
    except
      on E: EConvertError do
      begin
        ShowMessage('Data inicial inválida!');
        Exit;
      end;
    end;
  end;

  // Data Final
  if Trim(DateFim.Text) <> '' then
  begin
    try
      filtro := filtro + ' AND data_cadastro <= ' + QuotedStr(FormatDateTime('DD/MM/YYYY', StrToDate(DateFim.Text)));
    except
      on E: EConvertError do
      begin
        ShowMessage('Data final inválida!');
        Exit;
      end;
    end;
  end;

  // Escolhe o campo de nome conforme o equipamento
  if ComboEquipamento.Text = 'Computadores' then
    campoNome := 'nome_computador'
  else if ComboEquipamento.Text = 'Impressoras' then
    campoNome := 'nome_impressora'
  else if ComboEquipamento.Text = 'Roteadores' then
    campoNome := 'nome_roteador'
  else
    campoNome := '';

  // Agora monta o SQL e chama o relatório conforme o equipamento
  if ComboEquipamento.Text = 'Computadores' then
  begin
    // Tipo (só para computador)
    if RadioGroupTipo.ItemIndex = 0 then
      filtro := filtro + ' AND tipo = ''Notebook''';
    if RadioGroupTipo.ItemIndex = 1 then
      filtro := filtro + ' AND tipo = ''Desktop''';

   sql := 'SELECT t.*, s.nome AS setor_nome, u.nome AS unidade_nome ' +
    'FROM telacadastrocomputadores t ' +
    'LEFT JOIN setores s ON t.setor_id = s.id ' +
    'LEFT JOIN unidades u ON t.unidade_id = u.id ' +
    'WHERE 1=1 ' +
    filtro;
   ShowMessage(sql);
    DataModule1.ADOQuery1.Close;
    DataModule1.ADOQuery1.SQL.Text := sql;
    DataModule1.ADOQuery1.Open;
    DataModule1.frxComputadores.ShowReport;
  end
  else if ComboEquipamento.Text = 'Impressoras' then
  begin
    sql := 'SELECT tim.*, s.nome AS setor_nome, u.nome AS unidade_nome ' +
    'FROM telacadastroimpressoras tim ' +
    'LEFT JOIN setores s ON tim.setor_id = s.id ' +
    'LEFT JOIN unidades u ON tim.unidade_id = u.id ' +
    'WHERE 1=1 ' +
    filtro;
   ShowMessage(sql);
    DataModule1.ADOQuery2.Close;
    DataModule1.ADOQuery2.SQL.Text := sql;
    DataModule1.ADOQuery2.Open;
    DataModule1.frxImpressoras.ShowReport;
  end
  else if ComboEquipamento.Text = 'Roteadores' then
  begin
    sql := 'SELECT trot.*, s.nome AS setor_nome, u.nome AS unidade_nome ' +
    'FROM telacadastroroteadores trot ' +
    'LEFT JOIN setores s ON trot.setor_id = s.id ' +
    'LEFT JOIN unidades u ON trot.unidade_id = u.id ' +
    'WHERE 1=1 ' +
    filtro;
   ShowMessage(sql);;
    DataModule1.ADOQuery3.Close;
    DataModule1.ADOQuery3.SQL.Text := sql;
    DataModule1.ADOQuery3.Open;
    DataModule1.frxRoteadores.ShowReport;
  end
  else
  begin
    ShowMessage('Selecione o tipo de equipamento!');
    Exit;
  end;
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
 // Preencher ComboBox de Setores com nome e ID
ComboUnidade.Items.Clear;
DataModule1.tabUnidades.First;
while not DataModule1.tabUnidades.Eof do
begin
  ComboUnidade.Items.AddObject(
    DataModule1.tabUnidades.FieldByName('nome').AsString,
    TObject(DataModule1.tabUnidades.FieldByName('id').AsInteger)
  );
  DataModule1.tabUnidades.Next;
end;

 // Preencher ComboBox de Setores com nome e ID
ComboSetor.Items.Clear;
DataModule1.tabSetores.First;
while not DataModule1.tabSetores.Eof do
begin
  ComboSetor.Items.AddObject(
    DataModule1.tabSetores.FieldByName('nome').AsString,
    TObject(DataModule1.tabSetores.FieldByName('id').AsInteger)
  );
  DataModule1.tabSetores.Next;
end;
 end;
end.
