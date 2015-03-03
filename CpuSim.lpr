program CpuSim;

{$MODE Delphi}

uses
  Forms, Interfaces,
  main in 'main.pas' {Form1},
  GrfCpu in 'GrfCpu.pas',
  Cpu in 'Cpu.pas',
  about in 'about.pas' {Form2},
  Settings in 'Settings.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.Run;
end.
