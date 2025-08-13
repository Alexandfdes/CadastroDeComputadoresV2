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
    EditAnydesk: TEdit;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTelaCadastroPerifericos: TformTelaCadastroPerifericos;

implementation

{$R *.dfm}

end.
