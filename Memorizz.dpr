program Memorizz;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {fMain},
  UnitLearning in 'UnitLearning.pas' {fLearning},
  UnitDefinitionMeaningPair in 'UnitDefinitionMeaningPair.pas',
  UnitCategories in 'UnitCategories.pas',
  UnitPairs in 'UnitPairs.pas',
  UnitRepository in 'UnitRepository.pas',
  UnitRepositoryService in 'UnitRepositoryService.pas',
  UnitLearningService in 'UnitLearningService.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.Title := 'Memorizz?';
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfLearning, fLearning);
  Application.Run;
end.
