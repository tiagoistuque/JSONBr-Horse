program Samples;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  DB,
  Horse,
  JSON,
  Horse.JsonBr;

type
  TMyClass = class(TJSONBrMiddleware)
  private
    FName: String;
  public
    property Name: String read FName write FName;
  end;

begin
  THorse.Use(HorseJsonBr);

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LObj: TMyClass;
    begin
      LObj := TMyClass.Create;
      LObj.Name := 'JSONBr Middleware for Horse';
      Res.Send<TMyClass>(LObj);
    end);

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Servidor Rodando...');
    end);
end.
