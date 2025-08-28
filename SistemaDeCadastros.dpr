program SistemaDeCadastros;

uses
  Forms,
  Dialogs,
  SysUtils,
  unitPrincipal in 'unitPrincipal.pas' {TelaPrincipal},
  unitDM in 'unitDM.pas' {DataModule1: TDataModule},
  unitTelaCadastroComputadores in 'unitTelaCadastroComputadores.pas' {formTelaCadastroComputadores},
  unitTelaCadastroImpressoras in 'unitTelaCadastroImpressoras.pas' {formTelaCadastroImpressoras},
  unitTelaCadastroRoteadores in 'unitTelaCadastroRoteadores.pas' {formTelaCadastroRoteadores},
  unitRelatorios in 'unitRelatorios.pas' {formTelaRelatorios};

{$R *.res}


begin
  Application.Initialize;
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TformTelaCadastroComputadores, formTelaCadastroComputadores);
  Application.CreateForm(TformTelaCadastroImpressoras, formTelaCadastroImpressoras);
  Application.CreateForm(TformTelaCadastroRoteadores, formTelaCadastroRoteadores);
  Application.CreateForm(TformTelaRelatorios, formTelaRelatorios);
  Application.OnException := TelaPrincipal.TrataExcecao;
  Application.Run;
end.
