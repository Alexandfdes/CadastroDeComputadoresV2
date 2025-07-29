unit unitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TDM = class(TForm)
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
  DM: TDM;

implementation

uses unitTelaCadastro, unitDM;

{$R *.dfm}

procedure TDM.BitBtn1Click(Sender: TObject);
begin
 formTelaCadastro.showModal; 
  end;


 procedure TDM.TrataExcecao(Sender: TObject; E: Exception);
begin
  ShowMessage('Erro inesperado: ' + E.Message);
end;

end.
