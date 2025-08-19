unit unitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TTelaPrincipal = class(TForm)
    Panel1: TPanel;
    EditComputadores: TBitBtn;
    EditRoteadores: TBitBtn;
    EditImpressoras: TBitBtn;
    procedure EditCompuadoresClick(Sender: TObject);
     procedure TrataExcecao(Sender: TObject; E: Exception);

    
    procedure EditImpressorasClick(Sender: TObject);
    procedure EditRoteadoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 
var
  TelaPrincipal: TTelaPrincipal;

implementation

uses unitTelaCadastroComputadores, unitDM, unitTelaCadastroImpressoras,
  unitTelaCadastroRoteadores;

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

procedure TTelaPrincipal.EditRoteadoresClick(Sender: TObject);
begin
formTelaCadastroRoteadores.ShowModal;
end;

end.
