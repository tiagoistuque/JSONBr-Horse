# JSONBr Middleware for Horse
<b>HorseJsonBr</b> is a middleware created by Isaque Pinheiro to work with JSON in APIs developed with the <a href="https://github.com/HashLoad/horse">Horse</a> framework.
<br>We created a channel on Telegram for questions and support:<br><br>
<a href="https://t.me/ormbr">
  <img src="https://img.shields.io/badge/telegram-join%20channel-7289DA?style=flat-square">
</a>

## ⚙️ Installation
Installation is done using the [`boss install`](https://github.com/HashLoad/boss) command:
``` sh
boss install github.com/isaquepinheiro/horse-jsonbr
```
If you choose to install manually, simply add the following folders to your project, in *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*
```
../JSONBr-Horse/src
```

## ✔️ Compatibility
This middleware is compatible with projects developed in:
- [X] Delphi

## ⚡️ Quickstart Delphi
```delphi
uses 
  Horse, 
  Horse.JsonBr;

type
  TMyClass = class
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
```

## ⚠️ License
`HorseJsonBr` is free and open-source middleware licensed under the [MIT License](https://github.com/isaquepinheiro/horse-jsonbr/blob/master/LICENSE). 
