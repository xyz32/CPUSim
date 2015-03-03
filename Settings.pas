unit Settings;

{$MODE Delphi}

interface

uses
  LCLIntf, LCLType, LMessages, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TSettingsForm = class(TForm)
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

uses main;

{$R *.lfm}

procedure TSettingsForm.Button2Click(Sender: TObject);
begin
  SettingsForm.Close;
end;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
  MainForm.Timer1.Interval := SpinEdit1.value;
  cmpCpu.SetMemSz(SpinEdit2.Value);
  SettingsForm.Close;
end;

end.
