unit unitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, RXCtrls;

type
  TTelaPrincipal = class(TForm)
    EditComputadores: TBitBtn;
    EditRelatorios: TBitBtn;
    EditImpressoras: TBitBtn;
    BitBtn1: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    SecretPanel1: TSecretPanel;
    Panel1: TPanel;
    procedure EditCompuadoresClick(Sender: TObject);
     procedure TrataExcecao(Sender: TObject; E: Exception);

    
    procedure EditImpressorasClick(Sender: TObject);
    procedure EditRelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 
var
  TelaPrincipal: TTelaPrincipal;

implementation

uses unitTelaCadastroComputadores, unitDM, unitTelaCadastroImpressoras,
  unitTelaCadastroRoteadores, unitRelatorios;

{$R *.dfm}

procedure TTelaPrincipal.EditCompuadoresClick(Sender: TObject);
begin formTelaCadastroComputadores.showModal;
  end;


 procedure TTelaPrincipal.TrataExcecao(Sender: TObject; E: Exception);
begin
  ShowMessage('Erro inesperado: ' + E.Message);
end;



procedure TTelaPrincipal.EditImpressorasClick(Sender: TObject);
begin
 formTelaCadastroImpressoras.showModal;
end;

procedure TTelaPrincipal.EditRelatoriosClick(Sender: TObject);
begin
formTelaRelatorios.ShowModal;
end;

end.
