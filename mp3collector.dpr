program mp3collector;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  AddWizard in 'AddWizard.pas' {AddWizardForm},
  Delete in 'Delete.pas' {DeleteForm},
  Splash in 'Splash.pas' {SplashForm},
  Settings in 'Settings.pas' {SettingsForm},
  tables in 'tables.pas',
  CatalogueDetails in 'CatalogueDetails.pas' {CatDetailsForm},
  PlaylistDetails in 'PlaylistDetails.pas' {PlaylistForm},
  Reports in 'Reports.pas',
  datamod in 'datamod.pas' {dmMain: TDataModule},
  ReportFilter in 'ReportFilter.pas' {ReportFilterForm},
  SaveFilter in 'SaveFilter.pas' {SaveFilterForm},
  Filters in 'Filters.pas' {FiltersForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'MP3 Collection Manager';
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
