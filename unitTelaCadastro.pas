unit unitTelaCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, Menus, ComCtrls, Grids,
  DBGrids;

type
  TformTelaCadastro = class(TForm)
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    RadioDesktop: TRadioButton;
    RadioNotebook: TRadioButton;
    SpeedButton2: TSpeedButton;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label10: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    TTabSheet2: TPageControl;
    TTabSheet: TTabSheet;
    ComboBox2: TComboBox;
    EditPesquisa: TEdit;
    EditNomeComputador: TEdit;
    EditUsuarioResponsavel: TEdit;
    EditEnderecoMAC: TEdit;
    EditAnydesk: TEdit;
    EditEnderecoIP: TEdit;
    DateCadastro: TEdit;
    ComboUnidade: TComboBox;
    ComboSetor: TComboBox;
    MemoObservacoes: TMemo;
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TTabSheetShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditEnderecoMACKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  

  private
  procedure CarregarCampos;
    procedure SalvarCampos;
  public
    { Public declarations }
  end;

var
  formTelaCadastro: TformTelaCadastro;

implementation

uses unitDM, unitPrincipal, unitListagem;

{$R *.dfm}



procedure TformTelaCadastro.ComboBox1Change(Sender: TObject);
begin
 combobox2.ItemIndex := combobox1.ItemIndex;
end;

procedure TformTelaCadastro.SpeedButton2Click(Sender: TObject);
var
  campoBanco, valor, sql: string;
begin
  DataModule1.ADOQuery1.Open;
  if DataModule1.ADOQuery1.RecordCount > 0 then
    CarregarCampos;

  campoBanco := ComboBox2.Items[ComboBox1.ItemIndex]; // pega o campo real
  valor := EditPesquisa.Text; // O que o usuário digitou (ex: "Dell")
  if Trim(campoBanco) = '' then
  begin
    ShowMessage('Selecione um campo para pesquisar!');
    Exit;
  end;

  sql := 'SELECT t.*, s.nome AS setor_nome, u.nome AS unidade_nome ' +
    'FROM teladecadastro t ' +
    'LEFT JOIN setores s ON t.setor_id = s.id ' +
    'LEFT JOIN unidades u ON t.unidade_id = u.id ';

  if valor <> '' then
    if CheckBox1.Checked then
      sql := sql + ' WHERE ' + campoBanco + ' LIKE ' + QuotedStr('%' + valor + '%')
    else
      sql := sql + ' WHERE ' + campoBanco + ' = ' + QuotedStr(valor);

  DataModule1.ADOQuery1.Close;
  DataModule1.ADOQuery1.SQL.Text := sql;
  DataModule1.ADOQuery1.Open;

  TTabSheet2.ActivePage := TabSheet2;

  if DataModule1.ADOQuery1.RecordCount = 0 then
    ShowMessage('Registro não encontrado!');
end;




procedure TformTelaCadastro.TTabSheetShow(Sender: TObject);
begin


// ComboBox1: nomes amigáveis para o usuário
 ComboBox1.Items.Clear;
ComboBox1.Items.Add('  ');
ComboBox1.Items.Add('Nome');
ComboBox1.Items.Add('Data Cadastro');
ComboBox1.Items.Add('Usuário');
ComboBox1.Items.Add('Setor');
ComboBox1.Items.Add('Unidade');
ComboBox1.Items.Add('Tipo');
ComboBox1.ItemIndex := 0; // Deixa o primeiro selecionado


// ComboBox2: nomes dos campos reais do banco
ComboBox2.Items.Clear;
ComboBox2.Items.Add('  ');
ComboBox2.Items.Add('nome_computador');
ComboBox2.Items.Add('data_cadastro');
ComboBox2.Items.Add('usuario_responsavel');
ComboBox2.Items.Add('setor_id');
ComboBox2.Items.Add('unidade_id');
ComboBox2.Items.Add('tipo');
ComboBox2.ItemIndex := 0;  // Deixa o primeiro selecionado
end;



procedure TformTelaCadastro.DBGrid1DblClick(Sender: TObject);
var
  id: Integer;
begin
  if not DataModule1.ADOQuery1.IsEmpty then
  begin
    id := DataModule1.ADOQuery1.FieldByName('id').AsInteger;
    DataModule1.tabTelaCadastro.Locate('id', id, []);
    CarregarCampos; // <-- aqui!
    TTabSheet2.ActivePage := TTabSheet; // volta para aba Cadastro
    EditNomeComputador.SetFocus;

  end;
end;




procedure TformTelaCadastro.SpeedButton4Click(Sender: TObject);
begin
if not (DataModule1.tabTelaCadastro.State in [dsEdit, dsInsert]) then
  DataModule1.tabTelaCadastro.Edit;
  // Validação dos campos obrigatórios
  if Trim(EditNomeComputador.Text) = '' then
  begin
    ShowMessage('Preencha o nome do computador!');
    EditNomeComputador.SetFocus;
    Exit;
  end;
  if Trim(ComboUnidade.Text) = '' then
  begin
    ShowMessage('Selecione uma unidade!');
    ComboUnidade.SetFocus;
    Exit;
  end;
  
  // Define tipo
  if RadioDesktop.Checked then
    DataModule1.tabTelaCadastro.FieldByName('tipo').AsString := 'Desktop'
  else if RadioNotebook.Checked then
    DataModule1.tabTelaCadastro.FieldByName('tipo').AsString := 'Notebook';

  // Garante que está em modo edição/insert
  if not (DataModule1.tabTelaCadastro.State in [dsEdit, dsInsert]) then
    DataModule1.tabTelaCadastro.Edit;

 if DataModule1.tabTelaCadastro.Locate('endereco_mac', EditEnderecoMAC.Text, []) then
begin
  // Já existe um registro com esse MAC, então atualiza os campos
  DataModule1.tabTelaCadastro.Edit;
  // Atualize os campos como normalmente faria ao editar
end
else
begin
  // Não existe, então cria um novo
  DataModule1.tabTelaCadastro.Append;
  // Preencha os campos normalmente
end;

// Preencha os campos normalmente (em ambos os casos)
DataModule1.tabTelaCadastro.FieldByName('nome_computador').AsString := EditNomeComputador.Text;
// ... e assim por diante para os outros campos

DataModule1.tabTelaCadastro.Post;

  SalvarCampos;
  DataModule1.tabTelaCadastro.Post;
  ShowMessage('Registro salvo com sucesso!');
end;






procedure TformTelaCadastro.FormShow(Sender: TObject);
begin
DataModule1.tabTelaCadastro.Append; // ou .Insert
 DateCadastro.Text := FormatDateTime('dd/mm/yyyy', Now);
  DataModule1.tabTelaCadastro.Open;
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


procedure TformTelaCadastro.CarregarCampos;
begin
  EditNomeComputador.Text    := DataModule1.tabTelaCadastro.FieldByName('nome_computador').AsString;
  EditEnderecoIP.Text        := DataModule1.tabTelaCadastro.FieldByName('endereco_ip').AsString;
  EditUsuarioResponsavel.Text:= DataModule1.tabTelaCadastro.FieldByName('usuario_responsavel').AsString;
  EditEnderecoMAC.Text       := DataModule1.tabTelaCadastro.FieldByName('endereco_mac').AsString;
  EditAnydesk.Text           := DataModule1.tabTelaCadastro.FieldByName('anydesk').AsString;
  ComboSetor.Text            := DataModule1.tabTelaCadastro.FieldByName('setor_id').AsString;
  ComboUnidade.Text          := DataModule1.tabTelaCadastro.FieldByName('unidade_id').AsString;
  DateCadastro.Text          := DataModule1.tabTelaCadastro.FieldByName('data_cadastro').AsString;
  MemoObservacoes.Text       := DataModule1.tabTelaCadastro.FieldByName('observacoes').AsString;

end;

procedure TformTelaCadastro.SalvarCampos;
var
  setorID, unidadeID: Variant;
begin
  if not (DataModule1.tabTelaCadastro.State in [dsEdit, dsInsert]) then
    DataModule1.tabTelaCadastro.Edit;
  DataModule1.tabTelaCadastro.FieldByName('nome_computador').AsString      := EditNomeComputador.Text;
  DataModule1.tabTelaCadastro.FieldByName('endereco_ip').AsString          := EditEnderecoIP.Text;
  DataModule1.tabTelaCadastro.FieldByName('usuario_responsavel').AsString  := EditUsuarioResponsavel.Text;
  DataModule1.tabTelaCadastro.FieldByName('endereco_mac').AsString         := EditEnderecoMAC.Text;
  DataModule1.tabTelaCadastro.FieldByName('anydesk').AsString              := EditAnydesk.Text;

  // Busca o ID correspondente ao nome selecionado no ComboBox
  setorID := DataModule1.tabSetores.Lookup('nome', ComboSetor.Text, 'id');
  unidadeID := DataModule1.tabUnidades.Lookup('nome', ComboUnidade.Text, 'id');

  // Só atribui se encontrou (evita erro de valor inválido)
  if not VarIsNull(setorID) then
    DataModule1.tabTelaCadastro.FieldByName('setor_id').AsInteger := setorID
  else
    DataModule1.tabTelaCadastro.FieldByName('setor_id').Clear;

  if not VarIsNull(unidadeID) then
    DataModule1.tabTelaCadastro.FieldByName('unidade_id').AsInteger := unidadeID
  else
    DataModule1.tabTelaCadastro.FieldByName('unidade_id').Clear;

if Trim(DateCadastro.Text) = '' then
  DataModule1.tabTelaCadastro.FieldByName('data_cadastro').Clear
else
  DataModule1.tabTelaCadastro.FieldByName('data_cadastro').AsDateTime := StrToDate(DateCadastro.Text);
  DataModule1.tabTelaCadastro.FieldByName('observacoes').AsString          := MemoObservacoes.Text;
end;
procedure TformTelaCadastro.SpeedButton5Click(Sender: TObject);
begin
DataModule1.tabTelaCadastro.Append; // ou .Insert
   EditNomeComputador.Clear;
  EditEnderecoIP.Clear;
  EditUsuarioResponsavel.Clear;
  EditEnderecoMAC.Clear;
  EditAnydesk.Clear;
  ComboSetor.ItemIndex := -1; // se for ComboBox, limpa seleção
  ComboUnidade.ItemIndex := -1; // idem
  DateCadastro.Text := DateToStr(Date);
  
  MemoObservacoes.Clear;
  EditPesquisa.Clear;
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
  CheckBox1.Checked := False;
  RadioDesktop.Checked := False;
  RadioNotebook.Checked := False;
  EditNomeComputador.SetFocus;

end;

procedure TformTelaCadastro.SpeedButton3Click(Sender: TObject);
begin
  try
    if not DataModule1.tabTelaCadastro.IsEmpty then
    begin
      if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DataModule1.tabTelaCadastro.Delete;
        ShowMessage('Registro excluído com sucesso!');
      end;
    end
    else
      ShowMessage('Nenhum registro selecionado para excluir.');
  except
    on E: Exception do
      ShowMessage('Não foi possível excluir o registro. Motivo: ' + E.Message);
  end;
end;




procedure TformTelaCadastro.EditEnderecoMACKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in ['0'..'9', #8]) then // só permite números e backspace
    Key := #0;
end;

procedure TformTelaCadastro.SpeedButton1Click(Sender: TObject);
begin
SpeedButton4Click(Sender); // Reutiliza o método de salvar
end;





end.

