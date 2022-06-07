unit Horse.JsonBr;

interface

uses
  Horse;

type
  TJSONBrMiddleware = class
  end;

function HorseJsonBr: THorseCallback; overload;
function HorseJsonBr(const ACharset: string): THorseCallback; overload;

procedure Middleware(Req: THorseRequest; Res: THorseResponse; Next: TNextProc);

implementation

uses jsonbr;

var
  Charset: string;

function HorseJsonBr: THorseCallback;
begin
  Result := HorseJsonBr('UTF-8');
end;

function HorseJsonBr(const ACharset: string): THorseCallback;
begin
  Charset := ACharset;
  Result := Middleware;
end;

procedure Middleware(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  try
    Next;
  finally
    if (Res.Content <> nil) and (Res.Content.InheritsFrom(TJSONBrMiddleware)) then
    begin
      Res.RawWebResponse.Content := TJSONBr.ObjectToJsonString(Res.Content);
      Res.RawWebResponse.ContentType := 'application/json; charset=' + Charset;
    end;
  end;
end;

end.
