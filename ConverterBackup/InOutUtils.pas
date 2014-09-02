unit InOutUtils;

interface

uses
  math, SysUtils, IdGlobal, Windows, Messages, Forms;

  function Inp32(wAddr:word):byte; stdcall; external 'inpout32.dll';
  function Out32(wAddr:word;bOut:byte):byte; stdcall; external 'inpout32.dll';
  procedure BitSwc(adr: Integer; poz: Byte; sts: Byte; inv: Boolean = False);
  function BitRead(adr: Integer; poz: Byte; inv: Boolean = False): integer;
  procedure Delay(msecs: Longint);
  procedure NanoSleep(dur: Integer);
  function BinToInt(Value: string): Integer;
  function GetUgDif(ug1: Integer; ug2: Integer): Integer;
  
var
  busInUse: Boolean;

implementation

function BinToInt(Value: string): Integer;
var
  i, iValueSize: Integer;
begin
  Result := 0;
  iValueSize := Length(Value);
  for i := iValueSize downto 1 do
    if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
end;

procedure NanoSleep(dur: Integer);
var
  i: Integer;
  Msg: TMsg;
begin
  if dur>0 then
    Delay(dur)
  else
    if dur = 0 then
      for i:=1 to 1000 do
      begin
        {if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
        begin
          If Msg.message = WM_QUIT Then
          begin
            PostQuitMessage(msg.wparam);
            Break;
          end;
          TranslateMessage(Msg);
          DispatchMessage(Msg);
        end;}
        application.ProcessMessages;
      end;
end;

procedure BitSwc(adr: Integer; poz: Byte; sts: Byte; inv: Boolean = False);
begin
  if not inv then
  begin
    if sts = 0 then
      out32(adr, inp32(adr) and ($ff - round(power(2, poz))))
    else
      out32(adr, inp32(Adr) or round((power(2, poz))));
  end
  else
    if sts = 1 then
      out32(adr, inp32(adr) and ($ff - round(power(2, poz))))
    else
      out32(adr, inp32(Adr) or round((power(2, poz))));
end;

function BitRead(adr: Integer; poz: Byte; inv: Boolean = False): integer;
begin
  result := StrToInt(copy(IntToBin(inp32(Adr)), 32-poz, 1));
  if inv then
    if result = 1 then
      result := 0
    else
      result := 1;
end;

procedure Delay(msecs: Longint);
var
  targettime: Longint;
  Msg: TMsg;
begin
  targettime := GetTickCount + msecs;
  while targettime > GetTickCount do
    {if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
    begin
      If Msg.message = WM_QUIT Then
      begin
        PostQuitMessage(msg.wparam);
        Break;
      end;
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;}
    application.ProcessMessages;
end;

function GetUgDif(ug1: Integer; ug2: Integer): Integer;
var
  tmpUg, smn: Integer;
begin
  smn := -1;
  if ug1 < ug2 then
  begin
    tmpUg := ug1;
    ug1 := ug2;
    ug2 := tmpUg;
    smn := 1;
  end;

  if (abs(ug1 - ug2) > 180) then
  begin
    tmpUg := abs((360 - ug1) + ug2)*-1;
  end
  else
  begin
    tmpUg := abs(ug1 - ug2);
  end;

  result := tmpUg * smn;
end;//function GetUgDif(ug1: Integer; ug2: Integer): integer;

end.
