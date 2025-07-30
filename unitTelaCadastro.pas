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
    EditNomeComputador: TDBEdit;
    EditUsuarioResponsavel: TDBEdit;
    EditEnderecoIP: TDBEdit;
    RadioDesktop: TRadioButton;
    RadioNotebook: TRadioButton;
    DateCadastro: TDBEdit;
    MemoObservacoes: TDBMemo;
    ComboUnidade: TDBLookupComboBox;
    ComboSetor: TDBLookupComboBox;
    EditEnderecoMAC: TDBEdit;
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
    EditAnydesk: TDBEdit;
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TTabSheetShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditEnderecoMACKeyPress(Sender: TObject; var Key: Char);
  

  private
    { Private declarations }
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
 
 campoBanco := ComboBox2.Items[comboBox1.ItemIndex]; // pega o campo real
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
    sql := sql + ' WHERE '+ campoBanco + ' LIKE ' + QuotedStr('%' + valor + '%')
  else
    sql := sql + ' WHERE '+ campoBanco + ' = ' + QuotedStr(valor);

  DataModule1.ADOQuery1.Close;
  DataModule1.ADOQuery1.SQL.Text := sql;
  DataModule1.ADOQuery1.Open;
   // Troca para a aba de listagem
  TTabSheet2.ActivePage := TabSheet2;
  // O resultado aparece no DBGrid (já vinculado ao DataSource do Query)
  // Se encontrar, o DataSet estará no registro e os DBEdits já mostram os dados
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
    TTabSheet2.ActivePage := TTabSheet; // volta para aba Cadastro
    EditNomeComputador.SetFocus;
  end;
end;





procedure TformTelaCadastro.SpeedButton4Click(Sender: TObject);
begin

 // Validação dos campos obrigatórios
  if Trim(EditNomeComputador.Text) = '' then
  begin
    ShowMessage('Preencha o nome do computador!');
    EditNomeComputador.SetFocus;
    Exit;
  end;

  if ComboUnidade.KeyValue = Null then
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
 if Trim(EditNomeComputador.Text) = '' then
begin
  ShowMessage('O nome do computador é obrigatório!');
  EditNomeComputador.SetFocus;
  Exit;
end;



// Verificar duplicidade de MAC
if DataModule1.tabTelaCadastro.Locate('endereco_mac', EditEnderecoMAC.Text, []) then
begin
  ShowMessage('Já existe um computador com esse endereço MAC!');
  EditEnderecoMAC.SetFocus;
  Exit;
end;
  // Salva o registro
  DataModule1.tabTelaCadastro.Post;
  ShowMessage('Registro salvo com sucesso!');
end;








procedure TformTelaCadastro.FormShow(Sender: TObject);
begin
  DataModule1.tabTelaCadastro.Open;
  DataModule1.tabUnidades.Open;
  DataModule1.tabSetores.Open;
end;



procedure TformTelaCadastro.SpeedButton5Click(Sender: TObject);
begin
  DataModule1.tabTelaCadastro.Append;
  DataModule1.tabTelaCadastro.FieldByName('data_cadastro').AsDateTime := Date;

  // Limpa controles manuais
  EditPesquisa.Text := '';
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

end.

