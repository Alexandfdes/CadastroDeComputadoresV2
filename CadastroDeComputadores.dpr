program CadastroDeComputadores;

uses
  Forms,
  Dialogs,
  SysUtils,
  unitPrincipal in 'unitPrincipal.pas' {TelaPrincipal},
  unitDM in 'unitDM.pas' {DataModule1: TDataModule},
  unitTelaCadastro in 'unitTelaCadastro.pas' {formTelaCadastro},
  unitListagem in 'unitListagem.pas' {formTelaListagem};

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TformTelaCadastro, formTelaCadastro);
  Application.CreateForm(TformTelaListagem, formTelaListagem);
  Application.OnException := TelaPrincipal.TrataExcecao;
  Application.Run;
end.
