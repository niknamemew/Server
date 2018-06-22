unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Generics.Collections, json;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function listaClienti(name: string): string;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function listaFornitori (const aName: string; nVal: Integer = -1): string;
  end;
{$METHODINFO OFF}

type
    TMyData = class (TPersistent)
      public
        Name: String;
        Value: Integer;
      public
        constructor Create (const aName: string);
      end;

implementation


uses System.StrUtils, unit1, dialogs;

function TServerMethods1.listaFornitori(const aName: string; nVal: Integer) : string;
var
  md: TMyData;
begin
  md := TMyData.Create (aName);
  if nVal <> -1 then
    md.Value := nVal;
  Result := 'complete';
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.listaClienti(name: string): string;
var
md:TDataModule1;
begin
 md := TDataModule1.create(nil);
 md.leggilistaClienti;
 md.Free;
 end;

constructor TMyData.Create(const aName: string);
begin

end;

end.

