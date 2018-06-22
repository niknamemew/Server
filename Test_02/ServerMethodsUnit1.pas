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
    function Clienti(cod: string): string;
    function Fornitori(cod :string): string;
    function InserisciCliente(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
    function InserisciFornitore(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
    function RimuoviCliente(cod:string): string;
    function RimuoviFornitore(cod:string): string;
    function ModificaCliente(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
    function ModificaFornitore(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Test(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;

  end;
{$METHODINFO OFF}

implementation

uses System.StrUtils, datamodulehtmlunit, dialogs;


function TServerMethods1.Clienti(cod: string): string;
var
md:TDataModule1;
begin
 md := TDataModule1.create(nil);
 result := md.leggilistaclienti (cod);
 md.Free;
 end;

function TServerMethods1.Fornitori(cod: string): string;
var
md:TDataModule1;
begin
 md := TDataModule1.create(nil);
 result := md.leggilistafornitori (cod);
 md.Free;
 end;

function TServerMethods1.InserisciCliente(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string): string;
var
md:TdataModule1;
begin
md := TDataModule1.create(nil);
result := md.inserisciinlistaClienti(cod, ragf, esragf, indif, esindif, capf, citf, escitf, paesf, paesm, codiling, ragm, esragm, indim, esindim, citm, escitm, capm, tipocons, prof, prom);
md.Free;
end;

function TServerMethods1.InserisciFornitore(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string): string;
var
md:TdataModule1;
begin
md := TDataModule1.create(nil);
result := md.inserisciinlistaFornitori(cod, ragf, esragf, indif, esindif, capf, citf, escitf, paesf);
md.Free;
end;

function TServerMethods1.RimuoviCliente(cod: string): string;
var
md:TdataModule1;
begin
md := TdataModule1.Create(nil);
result := md.rimuovidalistaClienti(cod);
end;

function TServerMethods1.RimuoviFornitore(cod: string): string;
var
md:TdataModule1;
begin
md := TdataModule1.Create(nil);
result := md.rimuovidalistaFornitori(cod);
end;

function TServerMethods1.ModificaCliente(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string): string;
var
md:TdataModule1;
begin
md := TDataModule1.create(nil);
result := md.modificainlistaClienti(cod, ragf, esragf, indif, esindif, capf, citf, escitf, paesf, paesm, codiling, ragm, esragm, indim, esindim, citm, escitm, capm, tipocons, prof, prom);
md.Free;
end;

function TServerMethods1.ModificaFornitore(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string): string;
var
md:TdataModule1;
begin
md := TDataModule1.Create(nil);
result := md.modificainlistaFornitori(cod, ragf, esragf, indif, esindif, capf, citf, escitf, paesf)
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.Test(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
begin
  result := 'update tclienti set RAGFATTU = ' + #39 + ragf + #39 + ',ESRAGFAT = ' + #39 + esragf + #39 + ',INDFATTU = ' + #39 + indif + #39 + ',ESINDFAT = ' + #39 + esindif + #39 + ',CAPFATTU = ' + #39 + capf + #39 + ',CITFATTU = ' +  #39 + citf + #39 + ',ESCITFAT = ' + #39 + escitf + #39 + ',PAESFATT = ' + #39 + paesf + #39 + ',PAESMERC = ' + #39 + paesm + #39 + ',CODILING = ' + #39 + codiling + #39 + ',RAGMERCE = ' + #39 + ragm + #39 + ',ESRAGMER = ' + #39 + esragm + #39 + ',INDMERCE = ' + #39 + indim + #39 + ',ESINDMER = ' + #39 + esindim + #39 + ',CITMERCE = ' + #39 + citm + #39 + ',ESCITMER = ' + #39 + escitm + #39 + ',CAPMERCE = ' + #39 + capm + #39 + ',TIPOCONS = ' + #39 + tipocons + #39 + ',PROFATTU = ' + #39 + prof + #39 + ',PROMERCE = ' + #39 + prom + #39 + ' where codclien = ' + #39 + cod + #39
end;

end.

