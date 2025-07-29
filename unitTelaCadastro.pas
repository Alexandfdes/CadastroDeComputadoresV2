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

  sql := 'SELECT * FROM teladecadastro WHERE ';

  if CheckBox1.Checked then
    sql := sql + campoBanco + ' LIKE ' + QuotedStr('%' + valor + '%')
  else
    sql := sql + campoBanco + ' = ' + QuotedStr(valor);

  DataModule1.ADOQuery1.Close;
  DataModule1.ADOQuery1.SQL.Text := sql;
  DataModule1.ADOQuery1.Open;
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

begin
  // Verifica se existe registro selecionado no dataset
  if not DataModule1.ADOQuery1.IsEmpty then
  begin
    try
      // Checa se os campos de lookup existem e não estão nulos
      if (not VarIsNull(DataModule1.ADOQuery1.FieldByName('setor_nome').Value)) and
         (not VarIsNull(DataModule1.ADOQuery1.FieldByName('unidade_nome').Value)) and
         (Trim(DataModule1.ADOQuery1.FieldByName('setor_nome').AsString) <> '') and
         (Trim(DataModule1.ADOQuery1.FieldByName('unidade_nome').AsString) <> '') then
      begin
        TTabSheet2.ActivePage := TTabSheet;
        formTelaCadastro.Show;
        formTelaCadastro.BringToFront;
      end
      else
        ShowMessage('Cadastro inválido. Verifique setor e unidade do registro.');
    except
      on E: Exception do
        ShowMessage('Erro ao abrir cadastro: ' + E.Message);
    end;
  end
  else
    ShowMessage('Nenhum registro selecionado.');
end;






procedure TformTelaCadastro.SpeedButton4Click(Sender: TObject);
begin

if DataModule1.ADOQuery1.State = dsBrowse then
    DataModule1.ADOQuery1.Edit;




  // Validação dos campos obrigatórios
  if Trim(EditNomeComputador.Text) = '' then
  begin
    ShowMessage('Preencha o nome do computador!');
    EditNomeComputador.SetFocus;
    Exit;
  end;

     if RadioDesktop.Checked then
  DataModule1.tabTelaCadastro.FieldByName('tipo').AsString := 'Desktop'

else if RadioNotebook.Checked then
  DataModule1.tabTelaCadastro.FieldByName('tipo').AsString := 'Notebook';



    // Valide se os campos obrigatórios estão preenchidos
  if ComboUnidade.KeyValue = Null then


  begin
    ShowMessage('Selecione uma unidade!');
    ComboUnidade.SetFocus;
    Exit;
  end;





  // Salva o registro
  DataModule1.ADOQuery1.Post;
  ShowMessage('Registro salvo com sucesso!');

 
end;











procedure TformTelaCadastro.FormShow(Sender: TObject);
begin
DataModule1.tabTelaCadastro.Append;
  DataModule1.ADOQuery1.Open;
 // Prepara novo registro, deixando os campos em branco
  if not (DataModule1.ADOQuery1.State in [dsInsert, dsEdit]) then
    DataModule1.ADOQuery1.Append;
    // Preenche a data de cadastro automaticamente
  if DataModule1.ADOQuery1.State = dsInsert then
    DataModule1.ADOQuery1.FieldByName('data_cadastro').AsDateTime := Date;
end;



procedure TformTelaCadastro.SpeedButton5Click(Sender: TObject);
begin

    DataModule1.ADOQuery1.Append;

    // Preenche a data atual no campo data_cadastro
  if DataModule1.ADOQuery1.State = dsInsert then
    DataModule1.ADOQuery1.FieldByName('data_cadastro').AsDateTime := Date;

// Limpa campos não data-aware (manuais)
  EditPesquisa.Text := '';
  ComboBox1.ItemIndex := 0;
  ComboBox2.ItemIndex := 0;
  CheckBox1.Checked := False;

  // Desmarca RadioButtons (opcional, se quiser que nenhum fique marcado)
  RadioDesktop.Checked := False;
  RadioNotebook.Checked := False;

 // Move o foco para o primeiro campo (opcional)
  EditNomeComputador.SetFocus;
end;

procedure TformTelaCadastro.SpeedButton3Click(Sender: TObject);
begin
 try
  // Verifica se há um registro selecionado
  if not DataModule1.ADOQuery1.IsEmpty then
  begin
    // Pede confirmação ao usuário
    if MessageDlg('Tem certeza que deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
    DataModule1.ADOQuery1.FieldByName('data_cadastro').AsDateTime := Now;
      DataModule1.ADOQuery1.Delete;
      ShowMessage('Registro excluído com sucesso!');
      // Só tente editar se ainda houver registros!
      if not DataModule1.ADOQuery1.IsEmpty then
      begin
        DataModule1.ADOQuery1.Edit;
        DataModule1.ADOQuery1.FieldByName('data_cadastro').AsDateTime := Now;
        DataModule1.ADOQuery1.Post;
      end;

    end;

  end
   else
      ShowMessage('Nenhum registro selecionado para excluir.');
  except
    on E: Exception do
      ShowMessage('Não foi possível excluir ou atualizar o registro. Motivo: ' + E.Message);
  end;
end;


procedure TformTelaCadastro.EditEnderecoMACKeyPress(Sender: TObject;
  var Key: Char);
begin

  if not (Key in ['0'..'9', #8]) then // só permite números e backspace
    Key := #0;
end;

end.

