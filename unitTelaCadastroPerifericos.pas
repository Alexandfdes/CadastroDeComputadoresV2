unit unitTelaCadastroPerifericos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, Buttons;

type
  TformTelaCadastroPerifericos = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label10: TLabel;
    TTabSheet2: TPageControl;
    TTabSheet: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    EditNomeComputador: TEdit;
    EditUsuarioResponsavel: TEdit;
    EditEnderecoMAC: TEdit;
    EditSerial: TEdit;
    EditEnderecoIP: TEdit;
    DateCadastro: TEdit;
    ComboUnidade: TComboBox;
    ComboSetor: TComboBox;
    MemoObservacoes: TMemo;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    EditPesquisa: TEdit;
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CarregarCampos(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
   procedure CarregarCamposImpressoras;
    procedure SalvarCampos;
  public
    { Public declarations }
  end;

var
  formTelaCadastroPerifericos: TformTelaCadastroPerifericos;

implementation

uses unitDM, unitPrincipal;

{$R *.dfm}





procedure TformTelaCadastroPerifericos.ComboBox1Change(Sender: TObject);
begin
  ComboBox2.ItemIndex := ComboBox1.ItemIndex;
end;











procedure TformTelaCadastroPerifericos.SpeedButton2Click(Sender: TObject);

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



  sql := 'SELECT timp.*, s.nome AS setor_nome, u.nome AS unidade_nome ' +
    'FROM teladecadastroimpressoras timp ' +
    'LEFT JOIN setores s ON timp.setor_id = s.id ' +
    'LEFT JOIN unidades u ON timp.unidade_id = u.id ';




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

  TTabSheet2.ActivePage := TabSheet2;

  if DataModule1.ADOQuery1.RecordCount = 0 then
    ShowMessage('Registro não encontrado!');


end;










procedure TformTelaCadastroPerifericos.DBGrid1DblClick(Sender: TObject);
var
  id: Integer;
begin
  if not DataModule1.ADOQuery1.IsEmpty then
  begin
    id := DataModule1.ADOQuery1.FieldByName('id').AsInteger;
    DataModule1.tabCadastroImpressoras.Locate('id', id, []);
    CarregarCamposImpressoras; // <-- aqui!
    TTabSheet2.ActivePage := TTabSheet; // volta para aba Cadastro
    EditNomeComputador.SetFocus;

  end;
end;








procedure TformTelaCadastroPerifericos.CarregarCamposImpressoras;
var
  nomeUnidade, nomeSetor: string;
begin
  EditNomeComputador.Text    := DataModule1.tabCadastroImpressoras.FieldByName('nome_computador').AsString;
  EditEnderecoIP.Text        := DataModule1.tabCadastroImpressoras.FieldByName('endereco_ip').AsString;
  EditUsuarioResponsavel.Text:= DataModule1.tabCadastroImpressoras.FieldByName('usuario_responsavel').AsString;
  EditEnderecoMAC.Text       := DataModule1.tabCadastroImpressoras.FieldByName('endereco_mac').AsString;
  EditSerial.Text           := DataModule1.tabCadastroImpressoras.FieldByName('serial').AsString;
  DateCadastro.Text          := DataModule1.tabCadastroImpressoras.FieldByName('data_cadastro').AsString;
  MemoObservacoes.Text       := DataModule1.tabCadastroImpressoras.FieldByName('observacoes').AsString;

  // Busca o nome da unidade pelo ID
  nomeUnidade := VarToStr(DataModule1.tabUnidades.Lookup('id', DataModule1.tabTelaCadastro.FieldByName('unidade_id').AsInteger, 'nome'));
  ComboUnidade.Text := nomeUnidade;

  // Busca o nome do setor pelo ID
  nomeSetor := VarToStr(DataModule1.tabSetores.Lookup('id', DataModule1.tabTelaCadastro.FieldByName('setor_id').AsInteger, 'nome'));
  ComboSetor.Text := nomeSetor;

end;







procedure TformTelaCadastroPerifericos.SpeedButton4Click(Sender: TObject);
begin
if not (DataModule1.tabCadastroImpressoras.State in [dsEdit, dsInsert]) then
  DataModule1.tabCadastroImpressoras.Edit;
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



 if DataModule1.tabCadastroImpressoras.Locate('nome_computador', EditnomeComputador.Text, []) then
begin
  // Já existe um registro com esse nome, então atualiza os campos
  DataModule1.tabCadastroImpressoras.Edit;
  // Atualize os campos como normalmente faria ao editar
end
else
begin
  // Não existe, então cria um novo
  DataModule1.tabCadastroImpressoras.Append;
  // Preencha os campos normalmente
end;

// Preencha os campos normalmente (em ambos os casos)
DataModule1.tabCadastroImpressoras.FieldByName('nome_computador').AsString := EditNomeComputador.Text;
// ... e assim por diante para os outros campos



  SalvarCampos;
  DataModule1.tabCadastroImpressoras.Post;
  ShowMessage('Registro salvo com sucesso!');
end;


















procedure TformTelaCadastroPerifericos.FormShow(Sender: TObject);
begin
DataModule1.tabCadastroImpressoras.Append; // ou .Insert
 DateCadastro.Text := FormatDateTime('dd/mm/yyyy', Now);
  DataModule1.tabCadastroImpressoras.Open;
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
ComboBox2.Items.Add('nome_computador');
ComboBox2.Items.Add('data_cadastro');
ComboBox2.Items.Add('usuario_responsavel');
ComboBox2.Items.Add('s.nome');
ComboBox2.Items.Add('u.nome');
ComboBox2.Items.Add('serial');
ComboBox2.ItemIndex := 0;  // Deixa o primeiro selecionado





end;
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





procedure TformTelaCadastro.LimparCampos;
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


procedure TformTelaCadastroPerifericos.SpeedButton5Click(Sender: TObject);
begin
 begin
 LimparCampos;
 DataModule1.tabTelaCadastro.Append; // ou .Insert
end;
end;

end.
