unit unitTelaCadastroRoteadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB, Menus, ComCtrls, Grids,
  DBGrids, JPEG, ExtCtrls;

type
  TformTelaCadastroRoteadores = class(TForm)
    Label10: TLabel;
    PaginaRoteadores: TPageControl;
    Cadastro: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    EditNomeRoteador: TEdit;
    EditUsuario: TEdit;
    EditEnderecoMAC: TEdit;
    EditSenha: TEdit;
    EditEnderecoIP: TEdit;
    DateCadastro: TEdit;
    ComboUnidade: TComboBox;
    ComboSetor: TComboBox;
    MemoObservacoes: TMemo;
    Listagem: TTabSheet;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EditPesquisa: TEdit;
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure CarregarCamposRoteadores;
    procedure SalvarCamposRoteadores;
    procedure LimparCamposRoteadores;
  public
    { Public declarations }
  end;

var
  formTelaCadastroRoteadores: TformTelaCadastroRoteadores;

implementation

uses unitDM, unitPrincipal;

{$R *.dfm}




procedure TformTelaCadastroRoteadores.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.ItemIndex := ComboBox1.ItemIndex;
end;











procedure TformTelaCadastroRoteadores.SpeedButton2Click(Sender: TObject);

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



  sql := 'SELECT trot.*, s.nome AS setor_nome, u.nome AS unidade_nome ' +
    'FROM telacadastroroteadores trot ' +
    'LEFT JOIN setores s ON trot.setor_id = s.id ' +
    'LEFT JOIN unidades u ON trot.unidade_id = u.id ';




  if valor <> '' then
  begin
    if CheckBox1.Checked then
      sql := sql + ' WHERE ' + campoBanco + ' LIKE ' + QuotedStr('%' + valor + '%')
    else
      sql := sql + ' WHERE ' + campoBanco + ' = ' + QuotedStr(valor);
      end;

  DataModule1.ADOQuery3.Close;
  DataModule1.ADOQuery3.SQL.Text := sql;

  DataModule1.ADOQuery3.Open;

  PaginaRoteadores.ActivePage := Listagem;

  if DataModule1.ADOQuery3.RecordCount = 0 then
    ShowMessage('Registro não encontrado!');


end;










procedure TformTelaCadastroRoteadores.DBGrid1DblClick(Sender: TObject);
var
  id: Integer;
begin
  if not DataModule1.ADOQuery3.IsEmpty then
  begin
    id := DataModule1.ADOQuery3.FieldByName('id').AsInteger;
    DataModule1.tabCadastroRoteadores.Locate('id', id, []);
    CarregarCamposRoteadores; // <-- aqui!
    PaginaRoteadores.ActivePage := Cadastro; // volta para aba Cadastro
    EditNomeRoteador.SetFocus;

  end;
end;








procedure TformTelaCadastroRoteadores.CarregarCamposRoteadores;
var
  nomeUnidade, nomeSetor: string;
begin
  EditNomeRoteador.Text    := DataModule1.tabCadastroRoteadores.FieldByName('nome_roteador').AsString;
  EditEnderecoIP.Text        := DataModule1.tabCadastroRoteadores.FieldByName('endereco_ip').AsString;
  EditUsuario.Text:= DataModule1.tabCadastroRoteadores.FieldByName('usuario_acesso').AsString;
  EditEnderecoMAC.Text       := DataModule1.tabCadastroRoteadores.FieldByName('endereco_mac').AsString;
  EditSenha.Text           := DataModule1.tabCadastroRoteadores.FieldByName('senha_acesso').AsString;
  DateCadastro.Text          := DataModule1.tabCadastroRoteadores.FieldByName('data_cadastro').AsString;
  MemoObservacoes.Text       := DataModule1.tabCadastroRoteadores.FieldByName('observacoes').AsString;

  // Busca o nome da unidade pelo ID
  nomeUnidade := VarToStr(DataModule1.tabUnidades.Lookup('id', DataModule1.tabCadastroRoteadores.FieldByName('unidade_id').AsInteger, 'nome'));
  ComboUnidade.Text := nomeUnidade;

  // Busca o nome do setor pelo ID
  nomeSetor := VarToStr(DataModule1.tabSetores.Lookup('id', DataModule1.tabCadastroRoteadores.FieldByName('setor_id').AsInteger, 'nome'));
  ComboSetor.Text := nomeSetor;

end;







procedure TformTelaCadastroRoteadores.SpeedButton4Click(Sender: TObject);
var
  registroExiste: Boolean;
begin
  // Validação dos campos obrigatórios
  if Trim(EditNomeRoteador.Text) = '' then
  begin
    ShowMessage('Preencha o nome do Roteador!');
    EditNomeRoteador.SetFocus;
    Exit;
  end;
  if Trim(ComboUnidade.Text) = '' then
  begin
    ShowMessage('Selecione uma unidade!');
    ComboUnidade.SetFocus;
    Exit;
  end;


 // Verifica se já existe registro com este serial
  registroExiste := DataModule1.tabCadastroRoteadores.Locate('endereco_mac', EditEnderecoMAC.Text, []);
if registroExiste then
    DataModule1.tabCadastroRoteadores.Edit;


  SalvarCamposRoteadores; // Preenche os campos do dataset com os valores dos controles

  DataModule1.tabCadastroRoteadores.Post;
  ShowMessage('Registro salvo com sucesso!');
end;




















procedure TformTelaCadastroRoteadores.FormShow(Sender: TObject);
begin
PaginaRoteadores.ActivePage := Cadastro;
 DataModule1.ADOQuery3.Close;

DataModule1.tabCadastroRoteadores.Append; // ou .Insert
 DateCadastro.Text := FormatDateTime('dd/mm/yyyy', Now);
  DataModule1.tabCadastroRoteadores.Open;
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
ComboBox1.Items.Add('Serial');
ComboBox1.ItemIndex := 0; // Deixa o primeiro selecionado


// ComboBox2: nomes dos campos reais do banco
ComboBox2.Items.Clear;
ComboBox2.Items.Add('  ');
ComboBox2.Items.Add('nome_roteador');
ComboBox2.Items.Add('data_cadastro');
ComboBox2.Items.Add('usuario_responsavel');
ComboBox2.Items.Add('s.nome');
ComboBox2.Items.Add('u.nome');
ComboBox2.Items.Add('serial');
ComboBox2.ItemIndex := 0;  // Deixa o primeiro selecionado





end;
end;

procedure TformTelaCadastroRoteadores.SalvarCamposRoteadores;
var
  setorID, unidadeID: Variant;
begin
  if not (DataModule1.tabCadastroRoteadores.State in [dsEdit, dsInsert]) then
    DataModule1.tabCadastroRoteadores.Edit;
  DataModule1.tabCadastroRoteadores.FieldByName('nome_roteador').AsString      := EditNomeRoteador.Text;
  DataModule1.tabCadastroRoteadores.FieldByName('endereco_ip').AsString          := EditEnderecoIP.Text;
  DataModule1.tabCadastroRoteadores.FieldByName('usuario_acesso').AsString  := EditUsuario.Text;
  DataModule1.tabCadastroRoteadores.FieldByName('endereco_mac').AsString         := EditEnderecoMAC.Text;
  DataModule1.tabCadastroRoteadores.FieldByName('senha_acesso').AsString              := EditSenha.Text;

  // Busca o ID correspondente ao nome selecionado no ComboBox
  setorID := DataModule1.tabSetores.Lookup('nome', ComboSetor.Text, 'id');
  unidadeID := DataModule1.tabUnidades.Lookup('nome', ComboUnidade.Text, 'id');


    if VarIsNull(setorID) then
  begin
    ShowMessage('Setor não encontrado.');
    Exit;
  end;

  if VarIsNull(unidadeID) then
  begin
    ShowMessage('Unidade não encontrada.');
    Exit;
  end;
  // Só atribui se encontrou (evita erro de valor inválido)
  if not VarIsNull(setorID) then
    DataModule1.tabCadastroRoteadores.FieldByName('setor_id').AsInteger := setorID
  else
    DataModule1.tabCadastroRoteadores.FieldByName('setor_id').Clear;

  if not VarIsNull(unidadeID) then
    DataModule1.tabCadastroRoteadores.FieldByName('unidade_id').AsInteger := unidadeID
  else
    DataModule1.tabCadastroRoteadores.FieldByName('unidade_id').Clear;

if Trim(DateCadastro.Text) = '' then
  DataModule1.tabCadastroRoteadores.FieldByName('data_cadastro').Clear
else
  DataModule1.tabCadastroRoteadores.FieldByName('data_cadastro').AsDateTime := StrToDate(DateCadastro.Text);
  DataModule1.tabCadastroRoteadores.FieldByName('observacoes').AsString := MemoObservacoes.Text;

end;





procedure TformTelaCadastroRoteadores.LimparCamposRoteadores;
begin

  EditNomeRoteador.Clear;
  EditEnderecoIP.Clear;
  EditUsuario.Clear;
  EditEnderecoMAC.Clear;
  EditSenha.Clear;
  ComboSetor.ItemIndex := -1; // se for ComboBox, limpa seleção
  ComboUnidade.ItemIndex := -1; // idem
  DateCadastro.Text := DateToStr(Date);

  MemoObservacoes.Clear;
  EditPesquisa.Clear;
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
  CheckBox1.Checked := False;
  EditNomeRoteador.SetFocus;
end;







procedure TformTelaCadastroRoteadores.SpeedButton5Click(Sender: TObject);

 begin
 LimparCamposRoteadores;
 DataModule1.tabCadastroRoteadores.Append; // ou .Insert
end;








procedure TformTelaCadastroRoteadores.SpeedButton3Click(Sender: TObject);
var
  registroID: Variant;
begin
  registroID := DataModule1.tabCadastroRoteadores.FieldByName('id').Value;

  if DataModule1.tabCadastroRoteadores.IsEmpty or VarIsNull(registroID) then
  begin
    ShowMessage('Nenhum registro selecionado para excluir.');
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      DataModule1.tabCadastroRoteadores.Delete;
      ShowMessage('Registro excluído com sucesso!');
    except
      on E: Exception do
        ShowMessage('Não foi possível excluir o registro. Motivo: ' + E.Message);
    end;
  end;
  LimparCamposRoteadores;
end;




















procedure TformTelaCadastroRoteadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataModule1.tabCadastroRoteadores.State in [dsInsert, dsEdit] then
    DataModule1.tabCadastroRoteadores.Cancel;
end;
end.
