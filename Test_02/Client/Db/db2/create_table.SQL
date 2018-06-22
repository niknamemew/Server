CREATE TABLE MIRO.TCLIENTI
       (CODCLIEN             CHAR(5)              NOT NULL
       ,RAGFATTU             CHAR(24)             NOT NULL DEFAULT
       ,ESRAGFAT             CHAR(24)             NOT NULL DEFAULT
       ,INDFATTU             CHAR(24)             NOT NULL DEFAULT
       ,ESINDFAT             CHAR(24)             NOT NULL DEFAULT
       ,CAPFATTU             CHAR(5)              NOT NULL DEFAULT
       ,CITFATTU             CHAR(18)             NOT NULL DEFAULT
       ,ESCITFAT             CHAR(18)             NOT NULL DEFAULT
       ,PAESFATT             CHAR(3)              NOT NULL DEFAULT
       ,PAESMERC             CHAR(3)              NOT NULL DEFAULT
       ,CODILING             CHAR(1)              NOT NULL DEFAULT
       ,RAGMERCE             CHAR(24)             NOT NULL DEFAULT
       ,ESRAGMER             CHAR(24)             NOT NULL DEFAULT
       ,INDMERCE             CHAR(24)             NOT NULL DEFAULT
       ,ESINDMER             CHAR(24)             NOT NULL DEFAULT
       ,CITMERCE             CHAR(18)             NOT NULL DEFAULT
       ,ESCITMER             CHAR(18)             NOT NULL DEFAULT
       ,CAPMERCE             CHAR(5)              NOT NULL DEFAULT
       ,TIPOCONS             CHAR(1)              NOT NULL DEFAULT
       ,PROFATTU             CHAR(2)              NOT NULL DEFAULT	
       ,PROMERCE             CHAR(2)              NOT NULL DEFAULT
       ,PRIMARY KEY (CODCLIEN)
       )
;
CREATE TABLE MIRO.TFORNITORI
       (CODFORNI             CHAR(5)              NOT NULL
       ,RAGFORNI             CHAR(24)             NOT NULL DEFAULT
       ,ESRAGFOR             CHAR(11)             NOT NULL DEFAULT
       ,INDFORNI             CHAR(24)             NOT NULL DEFAULT
       ,ESINDFOR             CHAR(11)             NOT NULL DEFAULT
       ,CAPFORNI             CHAR(5)              NOT NULL DEFAULT
       ,CITFORNI             CHAR(18)             NOT NULL DEFAULT
       ,ESCITFOR             CHAR(17)             NOT NULL DEFAULT
       ,CODPAESE             CHAR(3)              NOT NULL DEFAULT
       ,PRIMARY KEY (CODFORNI)
       )
;
