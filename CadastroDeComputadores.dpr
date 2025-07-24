program CadastroDeComputadores;

uses
  Forms,
  unitPrincipal in 'unitPrincipal.pas' {DM},
  unitDM in 'unitDM.pas' {DataModule1: TDataModule},
  unitTelaCadastro in 'unitTelaCadastro.pas' {formTelaCadastro},
  unitListagem in 'unitListagem.pas' {formTelaListagem};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TformTelaCadastro, formTelaCadastro);
  Application.CreateForm(TformTelaListagem, formTelaListagem);
  Application.Run;
end.
