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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    data_cadastro: TDBEdit;
    DBMemo1: TDBMemo;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    SpeedButton2: TSpeedButton;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label10: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    TTabSheet2: TPageControl;
    TTabSheet: TTabSheet;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TTabSheetShow(Sender: TObject);
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

procedure TformTelaCadastro.FormShow(Sender: TObject);
begin
  if not (DataModule1.tabTelaCadastro.State in [dsInsert, dsEdit]) then
    DataModule1.tabTelaCadastro.Append;
  DataModule1.tabTelaCadastro.FieldByName('data_cadastro').AsDateTime := Date;
end;

procedure TformTelaCadastro.DBEdit6Change(Sender: TObject);
begin
// Remove todos os espaços, se houver
  DBEdit6.Text := StringReplace(DBEdit6.Text, ' ', '', [rfReplaceAll]);
  // Move o cursor para o final do texto após alterar
  DBEdit6.SelStart := Length(DBEdit6.Text);
end;

procedure TformTelaCadastro.SpeedButton1Click(Sender: TObject);
begin

 if RadioButton1.Checked then
  DataModule1.tabTelaCadastro.FieldByName('tipo').AsString := 'Desktop'
else if RadioButton2.Checked then
  DataModule1.tabTelaCadastro.FieldByName('tipo').AsString := 'Notebook';
// Sempre entra em modo de inserção (novo registro)
  if not (DataModule1.tabTelaCadastro.State in [dsInsert]) then
    DataModule1.tabTelaCadastro.Append;
    // Valide se os campos obrigatórios estão preenchidos
  if DBLookupComboBox2.KeyValue = Null then
  begin
    ShowMessage('Selecione uma unidade!');
    DBLookupComboBox2.SetFocus;
    Exit;
  end;

  // Outras validações...

  // Salva o registro
  DataModule1.tabTelaCadastro.Post;
  ShowMessage('Registro salvo com sucesso!');

  // Prepara para um novo cadastro, limpando os campos e indo para novo registro
  DataModule1.tabTelaCadastro.Append;

end;

procedure TformTelaCadastro.ComboBox1Change(Sender: TObject);
begin
 combobox2.ItemIndex := combobox1.ItemIndex;
end;

procedure TformTelaCadastro.SpeedButton2Click(Sender: TObject);

var
campoBanco, valor, sql: string;
begin
 campoBanco := ComboBox2.Items[comboBox1.ItemIndex]; // pega o campo real
 valor := Edit1.Text; // O que o usuário digitou (ex: "Dell")

  sql := 'SELECT * FROM teladecadastro WHERE ';

  if CheckBox1.Checked then
    sql := sql + campoBanco + ' LIKE ' + QuotedStr('%' + valor + '%')
  else
    sql := sql + campoBanco + ' = ' + QuotedStr(valor);

  DataModule1.ADOQuery1.Close;
  DataModule1.ADOQuery1.SQL.Text := sql;
  DataModule1.ADOQuery1.Open;
  // O resultado aparece no DBGrid (já vinculado ao DataSource do Query)
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

end.
