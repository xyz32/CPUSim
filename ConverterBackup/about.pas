unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, CgWindow, CgUtils, GL, AppEvnts,
  CgFont;

type
  TForm2 = class(TCGForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  CgDC: TCGDeviceContext;

implementation

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Form2.AlphaBlendValue := 1;
  Form2.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  pDC: HDC;
begin
  pDC := GetDC(Panel1.Handle);
  CgDC := TCGDeviceContext.Create(pDC);
  CgDC.InitGL;
end;

end.                      
