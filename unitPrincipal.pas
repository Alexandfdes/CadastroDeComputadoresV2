unit unitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, RXCtrls;

type
  TTelaPrincipal = class(TForm)
    RxSpeedButton1: TRxSpeedButton;
    SecretPanel1: TSecretPanel;
    RxSpeedButton2: TRxSpeedButton;
    RxSpeedButton3: TRxSpeedButton;
    RxSpeedButton4: TRxSpeedButton;
    RxSpeedButton5: TRxSpeedButton;
    RxSpeedButton6: TRxSpeedButton;
    RxSpeedButton7: TRxSpeedButton;
    procedure EditCompuadoresClick(Sender: TObject);
     procedure TrataExcecao(Sender: TObject; E: Exception);

    
    procedure EditImpressorasClick(Sender: TObject);
    procedure EditRelatoriosClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxSpeedButton7Click(Sender: TObject);
    procedure RxSpeedButton3Click(Sender: TObject);
    procedure RxSpeedButton6Click(Sender: TObject);
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

procedure TTelaPrincipal.RxSpeedButton1Click(Sender: TObject);
begin

formTelaRelatorios.ShowModal;
end;

procedure TTelaPrincipal.RxSpeedButton7Click(Sender: TObject);
begin
formTelaCadastroComputadores.ShowModal;
end;

procedure TTelaPrincipal.RxSpeedButton3Click(Sender: TObject);
begin
 formTelaCadastroImpressoras.ShowModal;
end;

procedure TTelaPrincipal.RxSpeedButton6Click(Sender: TObject);
begin
formTelaCadastroRoteadores.ShowModal;
end;

end.
