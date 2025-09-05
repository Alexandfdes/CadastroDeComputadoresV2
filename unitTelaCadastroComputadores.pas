unit unitTelaCadastroComputadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, Menus, ComCtrls, Grids,
  DBGrids, JPEG, ExtCtrls, frxClass, frxDBSet, RXCtrls;

type
  TformTelaCadastroComputadores = class(TForm)
    Listagem: TTabSheet;
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
    Label10: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    PaginaComputadores: TPageControl;
    Cadastro: TTabSheet;
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
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    GroupBox1: TGroupBox;
    procedure SpeedButton4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditEnderecoMACKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LimparCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  




  private
  procedure CarregarCampos;
    procedure SalvarCampos;
  public
    { Public declarations }
  end;

var
  formTelaCadastroComputadores: TformTelaCadastroComputadores;

implementation

uses unitDM, unitPrincipal;

{$R *.dfm}










procedure TformTelaCadastroComputadores.ComboBox1Change(Sender: TObject);
begin
 combobox2.ItemIndex := combobox1.ItemIndex;
end;






procedure TformTelaCadastroComputadores.SpeedButton2Click(Sender: TObject);
var
  campoBanco, valor, sql: string;


begin


  campoBanco := ComboBox2.Items[ComboBox1.ItemIndex]; // pega o campo real
  valor := EditPesquisa.Text; // O que o usuário digitou (ex: "Dell")
  if Trim(campoBanco) = '' then
  begin
    ShowMessage('Selecione um campo para pesquisar!');
    Exit;
  end;



  sql := 'SELECT t.*, s.nome AS setor_nome, u.nome AS unidade_nome ' +
    'FROM telacadastrocomputadores t ' +
    'LEFT JOIN setores s ON t.setor_id = s.id ' +
    'LEFT JOIN unidades u ON t.unidade_id = u.id ';




  if valor <> '' then
  begin
    if CheckBox1.Checked then
      sql := sql + ' WHERE ' + campoBanco + ' LIKE ' + QuotedStr('%' + valor + '%')
    else
      sql := sql + ' WHERE ' + campoBanco + ' = ' + QuotedStr(valor);
      end;

  DataModule1.ADOQuery1.Close;
  DataModule1.ADOQuery1.SQL.Text := sql;

  DataModule1.ADOQuery1.Open;

  PaginaComputadores.ActivePage := Listagem;

  if DataModule1.ADOQuery1.RecordCount = 0 then
    ShowMessage('Registro não encontrado!');


end;















procedure TformTelaCadastroComputadores.DBGrid1DblClick(Sender: TObject);
var
  id: Integer;
begin
  if not DataModule1.ADOQuery1.IsEmpty then
  begin
    id := DataModule1.ADOQuery1.FieldByName('id').AsInteger;
    DataModule1.tabCadastroComputadores.Locate('id', id, []);
    CarregarCampos; // <-- aqui!
    PaginaComputadores.ActivePage := Cadastro; // volta para aba Cadastro
    EditNomeComputador.SetFocus;

  end;
end;




procedure TformTelaCadastroComputadores.SpeedButton4Click(Sender: TObject);
begin
if not (DataModule1.tabCadastroComputadores.State in [dsEdit, dsInsert]) then
  DataModule1.tabCadastroComputadores.Edit;
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

  if Trim(ComboUnidade.Text) = '' then
  begin
    ShowMessage('Selecione uma unidade!');
    ComboUnidade.SetFocus;
    Exit;
  end;



 if not (RadioDesktop.Checked or RadioNotebook.Checked) then
begin
  ShowMessage('Selecione se é Desktop ou Notebook!');
  Exit;
end;

if DataModule1.tabCadastroComputadores.Locate('nome_computador', EditNomeComputador.Text, []) then
begin
  // Já existe um registro com esse nome, então atualiza os campos
  DataModule1.tabCadastroComputadores.Edit;
end
else
begin
  // Não existe, então cria um novo
  DataModule1.tabCadastroComputadores.Append;
end;


  SalvarCampos;
  DataModule1.tabCadastroComputadores.Post;
  ShowMessage('Registro salvo com sucesso!');
end;






procedure TformTelaCadastroComputadores.FormShow(Sender: TObject);

begin

 PaginaComputadores.ActivePage := Cadastro;


DataModule1.tabCadastroComputadores.Open;
DataModule1.tabUnidades.Open;
DataModule1.tabSetores.Open;

 DateCadastro.Text := FormatDateTime('dd/mm/yyyy', Now);

  DataModule1.tabCadastroComputadores.Open;
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
ComboBox2.Items.Add('s.nome');
ComboBox2.Items.Add('u.nome');
ComboBox2.Items.Add('tipo');
ComboBox2.ItemIndex := 0;  // Deixa o primeiro selecionado





end;
end;



procedure TformTelaCadastroComputadores.CarregarCampos;
var
  nomeUnidade, nomeSetor: string;
begin
  EditNomeComputador.Text    := DataModule1.tabCadastroComputadores.FieldByName('nome_computador').AsString;
  EditEnderecoIP.Text        := DataModule1.tabCadastroComputadores.FieldByName('endereco_ip').AsString;
  EditUsuarioResponsavel.Text:= DataModule1.tabCadastroComputadores.FieldByName('usuario_responsavel').AsString;
  EditEnderecoMAC.Text       := DataModule1.tabCadastroComputadores.FieldByName('endereco_mac').AsString;
  EditAnydesk.Text           := DataModule1.tabCadastroComputadores.FieldByName('anydesk').AsString;
  DateCadastro.Text          := DataModule1.tabCadastroComputadores.FieldByName('data_cadastro').AsString;
  MemoObservacoes.Text       := DataModule1.tabCadastroComputadores.FieldByName('observacoes').AsString;

 

  // Busca o nome da unidade pelo ID
  nomeUnidade := VarToStr(DataModule1.tabUnidades.Lookup('id', DataModule1.tabCadastroComputadores.FieldByName('unidade_id').AsInteger, 'nome'));
  ComboUnidade.Text := nomeUnidade;

  // Busca o nome do setor pelo ID
  nomeSetor := VarToStr(DataModule1.tabSetores.Lookup('id', DataModule1.tabCadastroComputadores.FieldByName('setor_id').AsInteger, 'nome'));
  ComboSetor.Text := nomeSetor;

end;

procedure TformTelaCadastroComputadores.SalvarCampos;
var
  setorID, unidadeID: Variant;
begin
  if not (DataModule1.tabCadastroComputadores.State in [dsEdit, dsInsert]) then
    DataModule1.tabCadastroComputadores.Edit;
  DataModule1.tabCadastroComputadores.FieldByName('nome_computador').AsString      := EditNomeComputador.Text;
  DataModule1.tabCadastroComputadores.FieldByName('endereco_ip').AsString          := EditEnderecoIP.Text;
  DataModule1.tabCadastroComputadores.FieldByName('usuario_responsavel').AsString  := EditUsuarioResponsavel.Text;
  DataModule1.tabCadastroComputadores.FieldByName('endereco_mac').AsString         := EditEnderecoMAC.Text;
  DataModule1.tabCadastroComputadores.FieldByName('anydesk').AsString              := EditAnydesk.Text;

  // Busca o ID correspondente ao nome selecionado no ComboBox
  setorID := DataModule1.tabSetores.Lookup('nome', ComboSetor.Text, 'id');
  unidadeID := DataModule1.tabUnidades.Lookup('nome', ComboUnidade.Text, 'id');




  if RadioDesktop.Checked then
  DataModule1.tabCadastroComputadores.FieldByName('tipo').AsString := 'Desktop'
  else if RadioNotebook.Checked then
  DataModule1.tabCadastroComputadores.FieldByName('tipo').AsString := 'Notebook';






  // Só atribui se encontrou (evita erro de valor inválido)
  if not VarIsNull(setorID) then
    DataModule1.tabCadastroComputadores.FieldByName('setor_id').AsInteger := setorID
  else
    DataModule1.tabCadastroComputadores.FieldByName('setor_id').Clear;

  if not VarIsNull(unidadeID) then
    DataModule1.tabCadastroComputadores.FieldByName('unidade_id').AsInteger := unidadeID
  else
    DataModule1.tabCadastroComputadores.FieldByName('unidade_id').Clear;

if Trim(DateCadastro.Text) = '' then
  DataModule1.tabCadastroComputadores.FieldByName('data_cadastro').Clear
else
  DataModule1.tabCadastroComputadores.FieldByName('data_cadastro').AsDateTime := StrToDate(DateCadastro.Text);
  DataModule1.tabCadastroComputadores.FieldByName('observacoes').AsString          := MemoObservacoes.Text;
end;



procedure TformTelaCadastroComputadores.LimparCampos;
begin

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



 procedure TformTelaCadastroComputadores.SpeedButton5Click(Sender: TObject);
 begin
 LimparCampos;

end;












procedure TformTelaCadastroComputadores.SpeedButton3Click(Sender: TObject);
var
  registroID: Variant;
begin
  registroID := DataModule1.tabCadastroComputadores.FieldByName('id').Value;

  if DataModule1.tabCadastroComputadores.IsEmpty or VarIsNull(registroID) then
  begin
    ShowMessage('Nenhum registro selecionado para excluir.');
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      DataModule1.tabCadastroComputadores.Delete;
      ShowMessage('Registro excluído com sucesso!');
    except
      on E: Exception do
        ShowMessage('Não foi possível excluir o registro. Motivo: ' + E.Message);
    end;
  end;
  LimparCampos;
end;




procedure TformTelaCadastroComputadores.EditEnderecoMACKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in ['0'..'9', #8]) then // só permite números e backspace
    Key := #0;
end;

procedure TformTelaCadastroComputadores.SpeedButton1Click(Sender: TObject);
begin
SpeedButton4Click(Sender); // Reutiliza o método de salvar
end;









procedure TformTelaCadastroComputadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataModule1.tabCadastroComputadores.State in [dsInsert, dsEdit] then
    DataModule1.tabCadastroComputadores.Cancel;
end;

end.

