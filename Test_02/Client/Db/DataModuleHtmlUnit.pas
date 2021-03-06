unit DataModuleHtmlUnit;

interface

uses System.Classes, Data.DBXDb2, Data.FMTBcd, Data.DB, Data.SqlExpr, System.SysUtils, json;

type
  TRecordClienti = record
    CODCLIEN: String;
    RAGFATTU: String;
    INDFATTU: String;
    CAPFATTU: String;
    CITFATTU: String;
    PAESFATT: String;
  end;

  TRecordFornitori = record
    CODFORNI: String;
    RAGFORNI: String;
    INDFORNI: String;
    CAPFORNI: String;
    CITFORNI: String;
    CODPAESE: String;
  end;

  TDataModule1 = class(TDataModule)
    ConnDavanzam: TSQLConnection;
    DSTemp: TDataSource;
    Qtemp: TSQLQuery;

  private
    { Private declarations }
  public
    { Public declarations }
    function leggilistaClienti (cod:string) :string;
    function leggilistaFornitori (cod:string) :string;
    function inserisciinlistaClienti (cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
    function inserisciinlistaFornitori (cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) : string;
    function rimuovidalistaClienti (cod:string) :string;
    function rimuovidalistaFornitori (cod:string) :string;
    function modificainlistaClienti(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
    function modificainlistaFornitori(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
  end;
  var
   datamodule1 : tdatamodule1;
   c : TrecordClienti;
   b : TrecordFornitori;

  implementation

{$R *.dfm}

function TDataModule1.leggilistaClienti (cod :string) :string;
var s:String;
begin

  s:='';

  try
    ConnDavanzam.Connected:=false;
    ConnDavanzam.Connected:=true;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

  QTemp.SQL.Clear;
  QTemp.SQL.Add('select CODCLIEN,RAGFATTU,ESRAGFAT,INDFATTU,ESINDFAT,CAPFATTU,CITFATTU,ESCITFAT,PAESFATT ');
  QTemp.SQL.Add('from TCLIENTI ');

  if cod <> '' then
  begin
    QTemp.SQL.Add('where codclien = ' + #39 + cod + #39);
  end;


  try
    QTemp.Open;
  except
    on e:eDataBaseError do
    begin
        Qtemp.Close;
      exit;
    end;
  end;

  while not QTemp.Eof do
  begin
    c.CODCLIEN:=trim(Qtemp.FieldBYNAME('CODCLIEN').Asstring);
    s := s + ' Cliente ' + c.codclien + ':';
    c.RAGFATTU:=trim(Qtemp.FieldBYNAME('RAGFATTU').Asstring);
    if trim(Qtemp.FieldBYNAME('ESRAGFAT').Asstring) > '' then
      c.RAGFATTU:=c.RAGFATTU +  ' ' + trim(Qtemp.FieldBYNAME('ESRAGFAT').Asstring);
    s := s + ' ' + c.ragfattu + ',';

    c.INDFATTU:=trim(Qtemp.FieldBYNAME('INDFATTU').Asstring);
    if trim(Qtemp.FieldBYNAME('ESINDFAT').Asstring) > '' then
      c.INDFATTU:=c.INDFATTU + ' ' + trim(Qtemp.FieldBYNAME('ESINDFAT').Asstring);
    s := s + ' ' + c.indfattu + ',';

    c.CAPFATTU:=trim(Qtemp.FieldBYNAME('CAPFATTU').Asstring);
    s := s + ' ' + c.capfattu;
    c.CITFATTU:=trim(Qtemp.FieldBYNAME('CITFATTU').Asstring);
    if trim(Qtemp.FieldBYNAME('ESCITFAT').Asstring) > '' then
      c.CITFATTU:=c.CITFATTU + ' ' + trim(Qtemp.FieldBYNAME('ESCITFAT').Asstring);
    s := s + ' ' + c.citfattu + ',';

    c.PAESFATT:=trim(Qtemp.FieldBYNAME('PAESFATT').Asstring);
    s := s + ' ' + c.paesfatt + ';';

    Qtemp.Next;
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

  if s > '' then
    Result := s
  else if (s = '') and (cod = '') then
    Result := 'Non ci sono clienti'
  else if (s = '') and (cod > '') then
    Result := 'Cliente inesistente';

end;

function TDataModule1.leggilistaFornitori(cod: string): string;
var s:String;
begin
  s:='';

  try
    ConnDavanzam.Connected:=false;
    ConnDavanzam.Connected:=true;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

  QTemp.SQL.Clear;
  QTemp.SQL.Add('select CODforni,RAGForni,ESRAGFor,INDForni,ESINDFor,CAPForni,CITForni,ESCITFor,codpaese ');
  QTemp.SQL.Add('from Tfornitori ');

  if cod <> '' then
  begin
    QTemp.SQL.Add('where codforni = ' + #39 + cod + #39);
  end;


  try
    QTemp.Open;
  except
    on e:eDataBaseError do
    begin
        Qtemp.Close;
      exit;
    end;
  end;

  while not QTemp.Eof do
  begin
    b.CODforni:=trim(Qtemp.FieldBYNAME('CODforni').Asstring);
    s := s + ' Fornitore ' + b.codforni + ':';
    b.RAGForni:=trim(Qtemp.FieldBYNAME('RAGForni').Asstring);
    if trim(Qtemp.FieldBYNAME('ESRAGFor').Asstring) > '' then
      b.RAGForni:=b.RAGForni +  ' ' + trim(Qtemp.FieldBYNAME('ESRAGFor').Asstring);
    s := s + ' ' + b.ragforni + ',';

    b.INDForni:=trim(Qtemp.FieldBYNAME('INDForni').Asstring);
    if trim(Qtemp.FieldBYNAME('ESINDFor').Asstring) > '' then
      b.INDForni:=b.INDForni + ' ' + trim(Qtemp.FieldBYNAME('ESINDFor').Asstring);
    s := s + ' ' + b.indforni + ',';

    b.CAPForni:=trim(Qtemp.FieldBYNAME('CAPForni').Asstring);
    s := s + ' ' + b.capforni;
    b.CITForni:=trim(Qtemp.FieldBYNAME('CITForni').Asstring);
    if trim(Qtemp.FieldBYNAME('ESCITFor').Asstring) > '' then
      b.CITForni:=b.CITForni + ' ' + trim(Qtemp.FieldBYNAME('ESCITFor').Asstring);
    s := s + ' ' + b.citforni + ',';

    b.codpaese:=trim(Qtemp.FieldBYNAME('codpaese').Asstring);
    s := s + ' ' + b.codpaese + ';';

    Qtemp.Next;
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

   if s > '' then
    Result := s
  else if (s = '') and (cod = '') then
    Result := 'Non ci sono fornitori'
  else if (s = '') and (cod > '') then
    Result := 'Fornitore inesistente';

end;

function TDataModule1.inserisciinlistaClienti(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') or ( paesm='') or ( codiling='') or ( ragm='') or ( esragm='') or ( indim='') or ( esindim='') or ( citm='') or ( escitm='') or ( capm='') or ( tipocons='') or ( prof='') or ( prom='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice cliente e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragfattu e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfat e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indifattu e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifat e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capfattu e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citfattu e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfat e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il paesfatt e' + #39 + ' troppo lungo'
 else if length(paesm)>3  then
    result := 'Il paesmerce e' + #39 + ' troppo lungo'
 else if length(codiling)>1  then
    result := 'Il codiling e' + #39 + ' troppo lungo'
 else if length(ragm)>24  then
    result := 'Il ragmerce e' + #39 + ' troppo lungo'
 else if length(esragm)>24  then
    result := 'L' + #39 + 'esragmer e' + #39 + ' troppo lungo'
 else if length(indim)>24  then
    result := 'I#39indmerce e' + #39 + ' troppo lungo'
 else if length(esindim)>24  then
    result := 'L' + #39 + 'esindmer e' + #39 + ' troppo lungo'
 else if length(citm)>18  then
    result := 'Il citmerce e' + #39 + ' troppo lungo'
 else if length(escitm)>18  then
    result := 'L' + #39 + 'escitmer e' + #39 + ' troppo lungo'
 else if length(capm)>5  then
    result := 'Il capmerce e' + #39 + ' troppo lungo'
 else if length(tipocons)>1  then
    result := 'Il tipocons e' + #39 + ' troppo lungo'
 else if length(prof)>2  then
    result := 'Il profattu e' + #39 + ' troppo lungo'
 else if length(prom)>2  then
    result := 'Il promerce e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into tclienti (CODCLIEN,RAGFATTU,ESRAGFAT,INDFATTU,ESINDFAT,CAPFATTU,CITFATTU,ESCITFAT,PAESFATT,PAESMERC,CODILING,RAGMERCE,ESRAGMER,INDMERCE,ESINDMER,CITMERCE,ESCITMER,CAPMERCE,TIPOCONS,PROFATTU,PROMERCE) values (' + #39 + cod + #39 + ',' + #39 + ragf + #39 + ',' + #39 + esragf + #39 + ',' + #39 + indif + #39 + ',' + #39 + esindif + #39 + ',' + #39 + capf + #39 + ',' + #39 + citf + #39 + ',' + #39 + escitf + #39 + ',' + #39 + paesf + #39 + ',' + #39 + paesm + #39 + ',' + #39 + codiling + #39 + ',' + #39 + ragm + #39 + ',' + #39 + esragm + #39 + ',' + #39 + indim + #39 + ',' + #39 + esindim + #39 + ',' + #39 + citm + #39 + ',' + #39 + escitm + #39 + ',' + #39 + capm + #39 + ',' + #39 + tipocons + #39 + ',' + #39 + prof + #39 + ',' + #39 + prom + #39 + ')');
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModule1.inserisciinlistaFornitori(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice fornitore e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragforni e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfor e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indiforni e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifor e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capforni e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citforni e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfor e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il codpaese e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('insert into tfornitori (codforni, ragforni, esragfor, indforni, esindfor, capforni, citforni, escitfor, codpaese) values (' + #39 + cod + #39 + ',' + #39 + ragf + #39 + ',' + #39 + esragf + #39 + ',' + #39 + indif + #39 + ',' + #39 + esindif + #39 + ',' + #39 + capf + #39 + ',' + #39 + citf + #39 + ',' + #39 + escitf + #39 + ',' + #39 + paesf + #39 + ')');
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModule1.rimuovidalistaClienti(cod: string): string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if cod='' then
    result := 'Devi inserire il codice cliente'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from tclienti where codclien = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

 function TDataModule1.rimuovidalistaFornitori(cod: string): string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if cod='' then
    result := 'Devi inserire il codice fornitore'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('delete from tfornitori where codforni = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModule1.modificainlistaClienti(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string; paesm:string; codiling:string; ragm:string; esragm:string; indim:string; esindim:string; citm:string; escitm:string; capm:string; tipocons:String; prof:string; prom:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') or ( paesm='') or ( codiling='') or ( ragm='') or ( esragm='') or ( indim='') or ( esindim='') or ( citm='') or ( escitm='') or ( capm='') or ( tipocons='') or ( prof='') or ( prom='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice cliente e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragfattu e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfat e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indifattu e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifat e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capfattu e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citfattu e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfat e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il paesfatt e' + #39 + ' troppo lungo'
 else if length(paesm)>3  then
    result := 'Il paesmerce e' + #39 + ' troppo lungo'
 else if length(codiling)>1  then
    result := 'Il codiling e' + #39 + ' troppo lungo'
 else if length(ragm)>24  then
    result := 'Il ragmerce e' + #39 + ' troppo lungo'
 else if length(esragm)>24  then
    result := 'L' + #39 + 'esragmer e' + #39 + ' troppo lungo'
 else if length(indim)>24  then
    result := 'I#39indmerce e' + #39 + ' troppo lungo'
 else if length(esindim)>24  then
    result := 'L' + #39 + 'esindmer e' + #39 + ' troppo lungo'
 else if length(citm)>18  then
    result := 'Il citmerce e' + #39 + ' troppo lungo'
 else if length(escitm)>18  then
    result := 'L' + #39 + 'escitmer e' + #39 + ' troppo lungo'
 else if length(capm)>5  then
    result := 'Il capmerce e' + #39 + ' troppo lungo'
 else if length(tipocons)>1  then
    result := 'Il tipocons e' + #39 + ' troppo lungo'
 else if length(prof)>2  then
    result := 'Il profattu e' + #39 + ' troppo lungo'
 else if length(prom)>2  then
    result := 'Il promerce e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('update tclienti set RAGFATTU = ' + #39 + ragf + #39 + ',ESRAGFAT = ' + #39 + esragf + #39 + ',INDFATTU = ' + #39 + indif + #39 + ',ESINDFAT = ' + #39 + esindif + #39 + ',CAPFATTU = ' + #39 + capf + #39 + ',CITFATTU = ' +  #39 + citf + #39 + ',ESCITFAT = ' + #39 + escitf + #39 + ',PAESFATT = ' + #39 + paesf + #39 + ',PAESMERC = ' + #39 + paesm + #39 + ',CODILING = ' + #39 + codiling + #39 + ',RAGMERCE = ' + #39 + ragm + #39 + ',ESRAGMER = ' + #39 + esragm + #39 + ',INDMERCE = ' + #39 + indim + #39 + ',ESINDMER = ' + #39 + esindim + #39 + ',CITMERCE = ' + #39 + citm + #39 + ',ESCITMER = ' + #39 + escitm + #39 + ',CAPMERCE = ' + #39 + capm + #39 + ',TIPOCONS = ' + #39 + tipocons + #39 + ',PROFATTU = ' + #39 + prof + #39 + ',PROMERCE = ' + #39 + prom + #39 + ' where codclien = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;

function TDataModule1.modificainlistaFornitori(cod:string; ragf:string; esragf:string; indif:string; esindif:string; capf:string; citf:string; escitf:string; paesf:string) :string;
begin

 try
   connDavanzam.Connected:=false;
   connDavanzam.Connected:=true;
 except
    on e:eDatabaseError do
    begin
      qTemp.SQL.Clear;
      exit;
    end;
 end;

 if (cod='') or ( ragf='') or ( esragf='') or ( indif='') or ( esindif='') or ( capf='') or ( citf='') or ( escitf='') or ( paesf='') then
    result := 'Devi inserire tutti i parametri'
 else if length(cod)>5  then
    result := 'Il codice fornitore e' + #39 + ' troppo lungo'
 else if length(ragf)>24  then
    result := 'Il ragforni e' + #39 + ' troppo lungo'
 else if length(esragf)>5  then
    result := 'L' + #39 + 'esragfor e' + #39 + ' troppo lungo'
 else if length(indif)>24  then
    result := 'L' + #39 + 'indiforni e' + #39 + ' troppo lungo'
 else if length(esindif)>24  then
    result := 'L' + #39 + 'esindifor e' + #39 + ' troppo lungo'
 else if length(capf)>5  then
    result := 'Il capforni e' + #39 + ' troppo lungo'
 else if length(citf)>18 then
    result := 'Il citforni e' + #39 + ' troppo lungo'
 else if length(escitf)>18  then
    result := 'L' + #39 + 'escitfor e' + #39 + ' troppo lungo'
 else if length(paesf)>3  then
    result := 'Il codpaese e' + #39 + ' troppo lungo'
 else
  begin
    QTemp.SQL.Clear;
    QTemp.SQL.Add('update tfornitori set RAGforni = ' + #39 + ragf + #39 + ',ESRAGFor = ' + #39 + esragf + #39 + ',INDforni = ' + #39 + indif + #39 + ',ESINDFor = ' + #39 + esindif + #39 + ',CAPforni = ' + #39 + capf + #39 + ',CITforni = ' +  #39 + citf + #39 + ',ESCITFor = ' + #39 + escitf + #39 + ',codpaese = ' + #39 + paesf + #39 + ' where codforni = ' + #39 + cod + #39);
    QTemp.ExecSQL;
    result := 'Esecuzione completata';
  end;

  Qtemp.Close;

  try
    ConnDavanzam.Connected:=false;
  except
    on e:eDataBaseError do
    begin
       QTemp.SQL.Clear;
       exit;
    end;
  end;

 end;
end.



