unit unitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TTelaPrincipal = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
     procedure TrataExcecao(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 
var
  TelaPrincipal: TTelaPrincipal;

implementation

uses unitTelaCadastro, unitDM;

{$R *.dfm}

procedure TTelaPrincipal.BitBtn1Click(Sender: TObject);
begin
 formTelaCadastro.showModal; 
  end;


 procedure TTelaPrincipal.TrataExcecao(Sender: TObject; E: Exception);
begin
  ShowMessage('Erro inesperado: ' + E.Message);
end;

end.
