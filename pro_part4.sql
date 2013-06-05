DROP TABLE IF EXISTS awaria CASCADE;
DROP TABLE IF EXISTS wypadek CASCADE;
DROP TABLE IF EXISTS wyniki CASCADE;
DROP TABLE IF EXISTS udzial CASCADE;
DROP TABLE IF EXISTS wyscig CASCADE;
DROP TABLE IF EXISTS bolid CASCADE;
DROP TABLE IF EXISTS kierowca CASCADE;
DROP TABLE IF EXISTS zespol CASCADE;
DROP TABLE IF EXISTS pensja_kierowcy CASCADE;
DROP TABLE IF EXISTS tor_wyscigowy CASCADE;
DROP TABLE IF EXISTS pogoda CASCADE;

CREATE TABLE pogoda(
id_pogoda SERIAL PRIMARY KEY,
wiatr INT NOT NULL,
temperatura INT NOT NULL,
cisnienie INT NOT NULL,
zachmurzenie VARCHAR(45) DEFAULT 'bezchmurnie',
deszcz VARCHAR(20) NOT NULL
);

CREATE TABLE tor_wyscigowy(
id_tor_wyscigowy SERIAL PRIMARY KEY,
id_pogoda INT NOT NULL,
nazwa VARCHAR(45) NOT NULL,
kraj VARCHAR(45) NOT NULL,
dlugosc FLOAT NOT NULL,
liczba_zakretow INT NOT NULL
);

CREATE TABLE pensja_kierowcy(
id_pensja SERIAL PRIMARY KEY,
data_zatrudnienia DATE,
pensja INT NOT NULL 
);

CREATE TABLE zespol(
id_zespol SERIAL PRIMARY KEY,
nazwa_zespolu VARCHAR(45) NOT NULL,
data_zalozenia DATE,
zalozyciel VARCHAR(45) NOT NULL
);

CREATE TABLE kierowca(
id_kierowca SERIAL PRIMARY KEY,
id_pensja INT,
id_zespol INT NOT NULL,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(45) NOT NULL,
data_ur DATE NOT NULL
);

CREATE TABLE bolid(
id_bolid SERIAL PRIMARY KEY,
id_zespol INT,
naped VARCHAR(20) NOT NULL,
poj_silnika INT NOT NULL,
moc INT NOT NULL,
moment_obr INT NOT NULL,
nazwa VARCHAR(45) NOT NULL
);

CREATE TABLE wyscig(
id_wyscig SERIAL PRIMARY KEY,
id_tor_wyscigowy INT,
data_wyscigu DATE NOT NULL,
il_okrazen INT
);

CREATE TABLE udzial(
id_bolid INT,
id_wyscig INT,
id_kierowca INT
);

CREATE TABLE wyniki(
id_wyniki SERIAL PRIMARY KEY,
id_wyscig INT,
id_kierowca INT,
pozycja INT NOT NULL
);

CREATE TABLE wypadek(
id_wypadek SERIAL PRIMARY KEY,
id_wyscig INT,
nazwa_bolidu VARCHAR(45) NOT NULL,
kierowca VARCHAR(45) NOT NULL,
zespol VARCHAR(45) NOT NULL
);

CREATE TABLE awaria(
id_awaria SERIAL PRIMARY KEY,
id_wyscig INT,
nazwa_bolidu VARCHAR(45) NOT NULL,
typ_awarii VARCHAR(45) NOT NULL,
kierowca VARCHAR(45) NOT NULL,
zespol VARCHAR(45) NOT NULL
);

--inserty

INSERT INTO pogoda VALUES(1,15,20,1040,'lekkie','brak');
INSERT INTO pogoda VALUES(2,5,8,920,'silne','mzawka');
INSERT INTO pogoda VALUES(3,0,10,1020,'bezchmurnie','brak');
INSERT INTO pogoda VALUES(4,7,6,1000,'brak','mglisto');
INSERT INTO pogoda VALUES(5,15,17,1040,'lekkie','brak');
INSERT INTO pogoda VALUES(6,17,10,1020,'lekkie','mzawka');
INSERT INTO pogoda VALUES(7,5,11,1011,'brak','brak');
INSERT INTO pogoda VALUES(8,8,14,997,'silne','ulewa');

INSERT INTO tor_wyscigowy VALUES (1,1,'blackwood','Wielka Brytania','6.1',10);
INSERT INTO tor_wyscigowy VALUES (2,5,'westhill','Japonia','7.5',7);
INSERT INTO tor_wyscigowy VALUES (3,3,'south city','Wielka Brytania','6.1',13);
INSERT INTO tor_wyscigowy VALUES (4,2,'fern bay','Jamajka','8.1',12);
INSERT INTO tor_wyscigowy VALUES (5,5,'aston','Holandia','9.7',17);
INSERT INTO tor_wyscigowy VALUES (6,7,'Kyoto ring','Japonia','11',15);
INSERT INTO tor_wyscigowy VALUES (7,5,'Rockingham','Wielka Brytania','4.7',10);

INSERT INTO pensja_kierowcy VALUES(1,'1985-05-25','25000');
INSERT INTO pensja_kierowcy VALUES(2,'2001-11-05','12000');
INSERT INTO pensja_kierowcy VALUES(3,'2002-02-14','12500');
INSERT INTO pensja_kierowcy VALUES(4,'1999-10-15','17000');
INSERT INTO pensja_kierowcy VALUES(5,'2010-07-02','5000');
INSERT INTO pensja_kierowcy VALUES(6,'2002-03-30','8500');
INSERT INTO pensja_kierowcy VALUES(7,'2000-11-23','15500');

INSERT INTO zespol VALUES(1,'Team Vires','1980-12-24','James Peace');
INSERT INTO zespol VALUES(2,'E-team','1983-02-14','Morgan Trolle');
INSERT INTO zespol VALUES(3,'My3id','1989-07-21','Joe Holmes');
INSERT INTO zespol VALUES(4,'Drunked Team','1981-10-13','Matt Kingsbury');
INSERT INTO zespol VALUES(5,'Nfinity Racing','1990-09-11','Niki Dakovic');

INSERT INTO kierowca VALUES(1,'4','2','Przemek','Wdowiarz','1995-06-25');
INSERT INTO kierowca VALUES(2,'5','3','Milosz','Garbolewski','1992-05-15');
INSERT INTO kierowca VALUES(3,'3','1','Piotrek','Krzyzanowski','1992-06-27');
INSERT INTO kierowca VALUES(4,'1','5','Sean','Williams','1992-09-15');
INSERT INTO kierowca VALUES(5,'2','4','Lukasz','Paszczyk','1990-01-15');
INSERT INTO kierowca VALUES(6,'7','5','Marcin','Najman','1988-09-12');
INSERT INTO kierowca VALUES(7,'6','3','Mariusz','Pudzian','1983-11-30');

INSERT INTO bolid VALUES (1,'5','RWD','1800','200','321','XRT');
INSERT INTO bolid VALUES (2,'4','FWD','1800','220','350','FXO');
INSERT INTO bolid VALUES (3,'3','AWD','1800','200','310','RB4');
INSERT INTO bolid VALUES (4,'2','RWD','1800','200','342','XRT');
INSERT INTO bolid VALUES (5,'1','FWD','1800','200','351','FXO');
INSERT INTO bolid VALUES (6,'3','FWD','1768','197','338','FXO');
INSERT INTO bolid VALUES (7,'2','AWD','1820','215','319','RB4');
INSERT INTO bolid VALUES (8,'1','RWD','1769','217','320','XRT');
INSERT INTO bolid VALUES (9,'4','AWD','1815','223','326','RB4');
INSERT INTO bolid VALUES(10,'1','FWD','1798','220','345','FXO');

INSERT INTO wyscig VALUES(1,'3','2002-05-12','30');
INSERT INTO wyscig VALUES(2,'1','2002-06-12','20');
INSERT INTO wyscig VALUES(3,'5','2002-07-12','25');
INSERT INTO wyscig VALUES(4,'4','2002-08-12','27');
INSERT INTO wyscig VALUES(5,'2','2002-09-12','26');
INSERT INTO wyscig VALUES(6,'7','2002-10-15','24');
INSERT INTO wyscig VALUES(7,'6','2002-11-14','20');

INSERT INTO udzial VALUES('1','1','4');
INSERT INTO udzial VALUES('2','1','5');
INSERT INTO udzial VALUES('6','1','7');
INSERT INTO udzial VALUES('3','2','2');
INSERT INTO udzial VALUES('7','2','1');
INSERT INTO udzial VALUES('10','2','3');
INSERT INTO udzial VALUES('4','3','1');
INSERT INTO udzial VALUES('5','3','3');
INSERT INTO udzial VALUES('6','3','2');
INSERT INTO udzial VALUES('7','4','1');
INSERT INTO udzial VALUES('8','4','3');
INSERT INTO udzial VALUES('2','4','5');
INSERT INTO udzial VALUES('1','5','4');
INSERT INTO udzial VALUES('2','5','5');
INSERT INTO udzial VALUES('6','5','7');
INSERT INTO udzial VALUES('4','6','1');
INSERT INTO udzial VALUES('5','6','3');
INSERT INTO udzial VALUES('6','6','2');
INSERT INTO udzial VALUES('7','7','1');
INSERT INTO udzial VALUES('8','7','3');
INSERT INTO udzial VALUES('2','7','5');

INSERT INTO wyniki VALUES(1,'1','4',1); 
INSERT INTO wyniki VALUES(2,'1','5',3);
INSERT INTO wyniki VALUES(3,'1','7',2);
INSERT INTO wyniki VALUES(4,'2','1',3);
INSERT INTO wyniki VALUES(5,'2','3',1);
INSERT INTO wyniki VALUES(6,'2','2',2);
INSERT INTO wyniki VALUES(7,'3','2',2);
INSERT INTO wyniki VALUES(8,'3','1',1);
INSERT INTO wyniki VALUES(9,'3','3',3);
INSERT INTO wyniki VALUES(10,'4','1',3);
INSERT INTO wyniki VALUES(11,'4','3',2);
INSERT INTO wyniki VALUES(12,'4','5',1);
INSERT INTO wyniki VALUES(13,'5','4',2);
INSERT INTO wyniki VALUES(14,'5','5',3);
INSERT INTO wyniki VALUES(15,'5','7',1);
INSERT INTO wyniki VALUES(16,'6','2',1);
INSERT INTO wyniki VALUES(17,'6','1',3);
INSERT INTO wyniki VALUES(18,'6','3',2);
INSERT INTO wyniki VALUES(19,'7','5',1);
INSERT INTO wyniki VALUES(20,'7','3',3);
INSERT INTO wyniki VALUES(21,'7','1',2);

INSERT INTO wypadek VALUES(1,5,'XRT','Sean Williams','Nfinity Racing');
INSERT INTO wypadek VALUES(2,5,'RB4','Mariusz Pudzian','My3id');
INSERT INTO wypadek VALUES(3,2,'RB4','Przemek Wdowiarz','E-Team');
INSERT INTO wypadek VALUES(4,1,'XRT','Marcin Najman','Nfinity Racing');
INSERT INTO wypadek VALUES(5,2,'FXO','Piotrek Krzyzanowski','Team Vires');
INSERT INTO wypadek VALUES(6,7,'XRT','Piotrek Krzyzanowski','Team Vires');

INSERT INTO awaria VALUES(1,2,'XRT','przegrzanie silnika','Piotrek krzyzanowski','Team Vires');
INSERT INTO awaria VALUES(2,3,'FXO','urwane kolo','Przemek Wdowiarz','E-Team');
INSERT INTO awaria VALUES(3,4,'RB4','awaria hamulcow','Milosz Garbolewski','My3id');
INSERT INTO awaria VALUES(4,1,'XRT','awaria turbiny','Piotrek Krzyzanowski','Team Vires');
INSERT INTO awaria VALUES(5,5,'XRT','awaria ukl. kierowniczego','Lukasz Paszczyk','Drunked Team');
INSERT INTO awaria VALUES(6,6,'FXO','awaria pompy paliwa','Piotrek Krzyzanowski','Team Vires');
