CREATE TABLE pogoda(
id_pogoda INT IDENTITY(1,1) PRIMARY KEY,
wiatr INT NOT NULL,
temperatura INT NOT NULL,
cisnienie INT NOT NULL,
zachmurzenie VARCHAR(45) DEFAULT 'bezchmurnie',
deszcz VARCHAR(20) NOT NULL
);
--select * from pogoda;


CREATE TABLE tor_wyscigowy(
id_tor_wyscigowy INT IDENTITY(1,1) PRIMARY KEY,
pogoda INT REFERENCES pogoda(id_pogoda),
nazwa VARCHAR(45) CHECK(LEN(nazwa)>3),
kraj VARCHAR(45) CHECK(LEN(kraj)>2),
dlugosc FLOAT NOT NULL,
liczba_zakretow INT NOT NULL
);
--select * from tor_wyscigowy

CREATE TABLE pensja_kierowcy(
id_pensja INT IDENTITY(1,1) PRIMARY KEY,
staz DATE NOT NULL DEFAULT getdate(),
pensja INT NOT NULL CHECK(pensja>0)
);
--select * from pensja_kierowcy;

CREATE TABLE zespol(
id_zespol INT IDENTITY(1,1) PRIMARY KEY,
nazwa_zespolu VARCHAR(45) NOT NULL,
data_zalozenia DATE DEFAULT getdate(),
zalozyciel VARCHAR(45) NOT NULL
);
--select * from zespol;

CREATE TABLE kierowca(
id_kierowca INT IDENTITY(1,1) PRIMARY KEY,
pensja INT UNIQUE REFERENCES pensja_kierowcy(id_pensja),
zespol INT REFERENCES zespol(id_zespol),
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(45) NOT NULL,
data_ur DATE NOT NULL DEFAULT getdate()
);
--select * from kierowca;

CREATE TABLE bolid(
id_bolid INT IDENTITY(1,1) PRIMARY KEY,
zespol INT REFERENCES zespol(id_zespol),
naped VARCHAR(20) NOT NULL,
poj_silnika INT NOT NULL,
moc INT NOT NULL,
moment_obr INT NOT NULL,
nazwa VARCHAR(45) NOT NULL
);

CREATE TABLE wyscig(
id_wyscig INT IDENTITY(1,1) PRIMARY KEY,
tor_wyscigowy INT UNIQUE REFERENCES tor_wyscigowy(id_tor_wyscigowy),
data_wyscigu DATE NOT NULL DEFAULT getdate(),
il_okrazen INT CHECK(il_okrazen>0)
);
--select * from wyscig;

CREATE TABLE udzial(
bolid INT REFERENCES bolid(id_bolid),
wyscig INT REFERENCES wyscig(id_wyscig),
kierowca INT REFERENCES kierowca(id_kierowca)
);
--select * from udzial;

CREATE TABLE wyniki(
id_wyniki INT IDENTITY(1,1) PRIMARY KEY,
wyscig INT REFERENCES wyscig(id_wyscig),
kierowca INT REFERENCES kierowca(id_kierowca),
pozycja INT CHECK(pozycja>0) NOT NULL
);
--select * from wyniki;

CREATE TABLE wypadek(
id_wypadek INT IDENTITY(1,1) PRIMARY KEY,
wyscig INT REFERENCES wyscig(id_wyscig),
nazwa_bolidu VARCHAR(45) NOT NULL,
kierowca VARCHAR(45) NOT NULL,
zespol VARCHAR(45) NOT NULL
);
--select * from wypadek;

CREATE TABLE awaria(
id_awaria INT IDENTITY(1,1) PRIMARY KEY,
wyscig INT REFERENCES wyscig(id_wyscig),
nazwa_bolidu VARCHAR(45) NOT NULL,
typ_awarii VARCHAR(45) NOT NULL,
kierowca VARCHAR(45) NOT NULL,
zespol VARCHAR(45) NOT NULL
);
--select * from awaria;


--od tego miejsca inserty

INSERT INTO pogoda VALUES(15,20,1040,'lekkie','brak');
INSERT INTO pogoda VALUES(5,8,920,'silne','mzawka');
INSERT INTO pogoda VALUES(0,10,1020,'bezchmurnie','brak');
INSERT INTO pogoda VALUES(7,6,1000,'brak','mglisto');
INSERT INTO pogoda VALUES(15,17,1040,'lekkie','brak');
INSERT INTO pogoda VALUES(17,10,1020,'lekkie','mzawka');
INSERT INTO pogoda VALUES(5,11,1011,'brak','brak');
INSERT INTO pogoda VALUES(8,14,997,'silne','ulewa');
--select * from pogoda;

INSERT INTO tor_wyscigowy VALUES (1,'blackwood','Wielka Brytania','6.1',10);
INSERT INTO tor_wyscigowy VALUES (5,'westhill','Japonia','7.5',7);
INSERT INTO tor_wyscigowy VALUES (3,'south city','Wielka Brytania','6.1',13);
INSERT INTO tor_wyscigowy VALUES (2,'fern bay','Jamajka','8.1',12);
INSERT INTO tor_wyscigowy VALUES (5,'aston','Holandia','9.7',17);
INSERT INTO tor_wyscigowy VALUES (7,'Kyoto ring','Japonia','11',15);
INSERT INTO tor_wyscigowy VALUES (5,'Rockingham','Wielka Brytania','4.7',10);
--select * from tor_wyscigowy;


INSERT INTO pensja_kierowcy VALUES('1985-05-25','25000');
INSERT INTO pensja_kierowcy VALUES('2001-11-05','12000');
INSERT INTO pensja_kierowcy VALUES('2002-02-14','12500');
INSERT INTO pensja_kierowcy VALUES('1999-10-15','17000');
INSERT INTO pensja_kierowcy VALUES('2010-07-02','5000');
INSERT INTO pensja_kierowcy VALUES('2002-03-30','8500');
INSERT INTO pensja_kierowcy VALUES('2000-11-23','15500');
--select * from pensja_kierowcy;

INSERT INTO zespol VALUES('Team Vires','1980-12-24','James Peace');
INSERT INTO zespol VALUES('E-team','1983-02-14','Morgan Trolle');
INSERT INTO zespol VALUES('My3id','1989-07-21','Joe Holmes');
INSERT INTO zespol VALUES('Drunked Team','1981-10-13','Matt Kingsbury');
INSERT INTO zespol VALUES('Nfinity Racing','1990-09-11','Niki Dakovic');
--select * from zespol;

INSERT INTO kierowca VALUES('4','2','Przemek','Wdowiarz','1995-06-25');
INSERT INTO kierowca VALUES('5','3','Miłosz','Garbolewski','1992-05-15');
INSERT INTO kierowca VALUES('3','1','Piotrek','Krzyżanowski','1992-06-27');
INSERT INTO kierowca VALUES('1','5','Sean','Williams','1992-09-15');
INSERT INTO kierowca VALUES('2','4','Łukasz','Paszczyk','1990-01-15');
INSERT INTO kierowca VALUES('7','5','Marcin','Najman','1988-09-12');
INSERT INTO kierowca VALUES('6','3','Mariusz','Pudzian','1983-11-30');
--select * from kierowca;

INSERT INTO bolid VALUES ('5','RWD','1800','200','321','XRT');
INSERT INTO bolid VALUES ('4','FWD','1800','220','350','FXO');
INSERT INTO bolid VALUES ('3','AWD','1800','200','310','RB4');
INSERT INTO bolid VALUES ('2','RWD','1800','200','342','XRT');
INSERT INTO bolid VALUES ('1','FWD','1800','200','351','FXO');
INSERT INTO bolid VALUES ('3','FWD','1768','197','338','FXO');
INSERT INTO bolid VALUES ('2','AWD','1820','215','319','RB4');
INSERT INTO bolid VALUES ('1','RWD','1769','217','320','XRT');
INSERT INTO bolid VALUES ('4','AWD','1815','223','326','RB4');
INSERT INTO bolid VALUES('1','FWD','1798','220','345','FXO');
--select * from bolid;

INSERT INTO wyscig VALUES('3','2002-05-12','30');
INSERT INTO wyscig VALUES('1','2002-06-12','20');
INSERT INTO wyscig VALUES('5','2002-07-12','25');
INSERT INTO wyscig VALUES('4','2002-08-12','27');
INSERT INTO wyscig VALUES('2','2002-09-12','26');
INSERT INTO wyscig VALUES('7','2002-10-15','24');
INSERT INTO wyscig VALUES('6','2002-11-14','20');
--select * from wyscig;


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
--select * from udzial;

INSERT INTO wyniki VALUES('1','4',1); 
INSERT INTO wyniki VALUES('1','5',3);
INSERT INTO wyniki VALUES('1','7',2);
INSERT INTO wyniki VALUES('2','1',3);
INSERT INTO wyniki VALUES('2','3',1);
INSERT INTO wyniki VALUES('2','2',2);
INSERT INTO wyniki VALUES('3','2',2);
INSERT INTO wyniki VALUES('3','1',1);
INSERT INTO wyniki VALUES('3','3',3);
INSERT INTO wyniki VALUES('4','1',3);
INSERT INTO wyniki VALUES('4','3',2);
INSERT INTO wyniki VALUES('4','5',1);
INSERT INTO wyniki VALUES('5','4',2);
INSERT INTO wyniki VALUES('5','5',3);
INSERT INTO wyniki VALUES('5','7',1);
INSERT INTO wyniki VALUES('6','2',1);
INSERT INTO wyniki VALUES('6','1',3);
INSERT INTO wyniki VALUES('6','3',2);
INSERT INTO wyniki VALUES('7','5',1);
INSERT INTO wyniki VALUES('7','3',3);
INSERT INTO wyniki VALUES('7','1',2);
--select * from wyniki;

INSERT INTO wypadek VALUES(5,'XRT','Sean Williams','Nfinity Racing');
INSERT INTO wypadek VALUES(5,'RB4','Mariusz Pudzian','My3id');
INSERT INTO wypadek VALUES(2,'RB4','Przemek Wdowiarz','E-Team');
INSERT INTO wypadek VALUES(1,'XRT','Marcin Najman','Nfinity Racing');
INSERT INTO wypadek VALUES(2,'FXO','Piotrek Krzyżanowski','Team Vires');
INSERT INTO wypadek VALUES(7,'XRT','Piotrek Krzyżanowski','Team Vires');
--select * from wypadek;

INSERT INTO awaria VALUES(2,'XRT','przegrzanie silnika','Piotrek krzyżanowski','Team Vires');
INSERT INTO awaria VALUES(3,'FXO','urwane koło','Przemek Wdowiarz','E-Team');
INSERT INTO awaria VALUES(4,'RB4','awaria hamulców','Miłosz Garbolewski','My3id');
INSERT INTO awaria VALUES(1,'XRT','awaria turbiny','Piotrek Krzyżanowski','Team Vires');
INSERT INTO awaria VALUES(5,'XRT','awaria ukl. kierowniczego','Łukasz Paszczyk','Drunked Team');
INSERT INTO awaria VALUES(6,'FXO','awaria pompy paliwa','Piotrek Krzyżanowski','Team Vires');
--select * from awaria;


/*
4 wyzwalacze [8 pkt]
2 tabele przestawne (instrukcja pivot) [2 pkt]
co najmniej 2 razy:
b) IF-ELSE, c) CASE, d) WHILE, e) kursor
*/

--widok1 wyświetla kierowców którzy brali udział w wyścigach wraz z ilością ich startów
IF EXISTS (SELECT * FROM SYS.views WHERE name='widok1')
DROP VIEW widok1;
GO

CREATE VIEW widok1 AS SELECT k.id_kierowca,k.imie,k.nazwisko,
COUNT(u.kierowca) AS starty
FROM kierowca k JOIN udzial u
ON k.id_kierowca=u.kierowca
GROUP BY k.id_kierowca,k.imie,k.nazwisko
HAVING COUNT(u.kierowca)>0;
GO
--wywołanie
select imie,nazwisko,starty from widok1
ORDER BY starty DESC;


--widok2 wyświetla zespoły które mają co najmniej j ednego kierowce
IF EXISTS (SELECT * FROM SYS.views WHERE name='widok2')
DROP VIEW widok2;
GO

CREATE VIEW widok2 AS SELECT z.nazwa_zespolu,z.id_zespol,
COUNT(k.zespol) AS kierowcy
FROM  zespol z JOIN kierowca k
ON k.zespol=z.id_zespol
GROUP BY z.nazwa_zespolu,z.id_zespol
HAVING COUNT(k.zespol)>=1;
GO
--wywołanie
select nazwa_zespolu,kierowcy from widok2;

--funkcja1 podaje łączną sumę wszystkich kierowców w bazie danych
CREATE FUNCTION ile_kierowcow()
RETURNS INT
BEGIN
  DECLARE @oblicz INT
  SET @oblicz=(SELECT COUNT(*) FROM kierowca) 
  RETURN @oblicz
END;
GO
--wywołanie
SELECT dbo.ile_kierowcow() AS 'ilosc kierowcow';

--funkcja2 opisuje warunki pogodowe na każdym z torów
CREATE FUNCTION tekst(
@nazwa VARCHAR(45),
@wiatr VARCHAR(10),
@temperatura VARCHAR(10),
@zachmurzenie VARCHAR(45)
)
RETURNS VARCHAR(150)AS
BEGIN
DECLARE @tekst VARCHAR(150)
SET @tekst='na torze '+@nazwa+' wiał wiatr z prędkością '+
@wiatr + ' m/s, temperatura wyniosła ' +@temperatura+
'*C, panował(o) '+@zachmurzenie+' zachmurzenie(a)'
RETURN @tekst
END; 
GO
--wywołanie
SELECT dbo.tekst(nazwa,wiatr,temperatura,zachmurzenie) AS 'warunki pogodowe'
FROM tor_wyscigowy t JOIN pogoda p
ON t.pogoda=p.id_pogoda
ORDER BY t.id_tor_wyscigowy;

--funkcja 3 obliczająca wiek danego kierowcy
CREATE FUNCTION wiek(
@rok_ur varchar(4)
)
RETURNS varchar(4)
AS
BEGIN	
	DECLARE @wiek varchar(4)	
	SET @wiek=2013-@rok_ur	
	RETURN @wiek
END;
GO
--wywołanie
SELECT imie,nazwisko, dbo.wiek(data_ur) AS 'wiek kierowcy'
FROM kierowca;
GO


--funkcja 4 która nie działa  
DROP FUNCTION Info;
CREATE FUNCTION info(
@min INT,
@max INT
)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @tekst VARCHAR(50)
	SET @tekst=
	(
	SELECT nazwa FROM bolid WHERE poj_silnika<=@max AND poj_silnika>=@min)
	RETURN @tekst
END;
GO
--wywołanie ;)
SELECT dbo.info(1816,2000) AS informacje;
GO

--procedura1 usuwa zespoły, które nie mają kierowców
CREATE PROCEDURE usun_zespol
AS
DELETE FROM zespol
WHERE id_zespol NOT IN (
   SELECT zespol FROM kierowca
);
GO
--wywołanie
EXEC usun_zespol;


--procedura2 wyświetla nazwę toru, długość okrążenia, 
--ilość okrążeń i dlugość wyścigów z całego sezonu
CREATE PROCEDURE dlugosc
AS
(
SELECT t.nazwa,t.dlugosc,w.il_okrazen,t.dlugosc*w.il_okrazen AS 'dlugosc wyscigu'
FROM wyscig w JOIN tor_wyscigowy t
ON w.tor_wyscigowy=t.id_tor_wyscigowy
GROUP BY t.nazwa,w.il_okrazen,t.dlugosc
);
GO
--wywołanie
EXEC dlugosc;

--procedura3 dodawanie nowego toru
CREATE PROCEDURE dodaj_tor
@pogoda int,
@nazwa varchar(45),
@kraj varchar (45),
@dlugosc float,
@zakrety int
AS
INSERT tor_wyscigowy
VALUES (@pogoda,@nazwa,@kraj,@dlugosc,@zakrety)
--wywolanie
EXECUTE dodaj_tor '3','Imola','San Marino','8.7','11';

--procedura4 dodawanie nowego zespołu
CREATE PROCEDURE dodaj_zespol
@nazwa varchar(45),
@data date,
@zalozyciel varchar(45)
AS
INSERT zespol
VALUES(@nazwa,@data,@zalozyciel)
--wywołanie
EXECUTE dodaj_zespol 'Ferrari','2013-05-05','Fernando Alonso';


--wyzwalacz1 zapisuje w odrębnej tabeli imiona i nazwiska usuniętych kierowców
CREATE TABLE kierowca_log (
	nr int,
	imie varchar(15), 
    nazwisko varchar(20),
	czas DATETIME
)
GO

CREATE TRIGGER usuwanie
ON kierowca
AFTER DELETE
AS
BEGIN
  DECLARE kursor_usuwanie CURSOR 
  FOR SELECT id_kierowca, imie, nazwisko FROM deleted; 
  OPEN kursor_usuwanie  
  DECLARE @nr INT,  @imie varchar(15), @nazwisko varchar(20)  
  FETCH NEXT FROM kursor_usuwanie INTO @nr, @imie, @nazwisko  
  WHILE @@FETCH_STATUS = 0 
  BEGIN   
    INSERT INTO kierowca_log
    VALUES(@nr, @imie,@nazwisko,getdate());  
    print 'Usunięto: '+@imie+' '+ @nazwisko
    FETCH NEXT FROM kursor_usuwanie INTO @nr, @imie, @nazwisko
  END
  CLOSE kursor_usuwanie
  DEALLOCATE kursor_usuwanie
END

--test wyzwalacza 'usuwanie'
DELETE FROM kierowca WHERE imie='Marcin';
SELECT * FROM kierowca_log;


--wyzwalacz 2 który "po decyzji sędziów" zabrania dodawania kierowców do zespołu id=3
CREATE TRIGGER przepisy
ON kierowca AFTER INSERT
AS
BEGIN
	DECLARE @idzespol INT
	SELECT @idzespol=zespol
	FROM inserted WHERE zespol=3
		IF @idzespol=3
		BEGIN
		RAISERROR('Sędziowie nie zezwolili na zatrudnienie jeszcze jednego kierowcy',1,2)
		ROLLBACK
		END
	END
GO

--sprawdzenie wyzwalacza 'przepisy'
INSERT INTO pensja_kierowcy VALUES('2001-10-20','13500'); 
INSERT INTO kierowca
 VALUES('8','3','Marian','Wiercipieta','1988-01-10');
SELECT * FROM kierowca;


--wyzwalacz 3 który ogranicza poj. silnika dodawanych pojazdów wg. wymogów ligi
CREATE TRIGGER ograniczenie
ON bolid AFTER INSERT
AS
BEGIN
	DECLARE @pojemnosc INT
	SELECT @pojemnosc=poj_silnika
	FROM inserted WHERE poj_silnika>2000
	IF @pojemnosc>2000
		BEGIN
		RAISERROR('Regulamin nie pozwala używać pojazdów z pojemnością powyżel 2.0L',1,2)
		ROLLBACK
		END
END
GO
--sprawdzenie wyzwalacza 'ograniczenie'
INSERT INTO bolid VALUES('2','FWD','2100','300','200','FZ5')
select * from bolid;


--usuwanie wszystkiego:
DROP TABLE awaria;
DROP TABLE wypadek;
DROP TABLE wyniki;
DROP TABLE udzial;
DROP TABLE wyscig;
DROP TABLE bolid;
DROP TABLE kierowca;
DROP TABLE zespol;
DROP TABLE pensja_kierowcy;
DROP TABLE tor_wyscigowy;
DROP TABLE pogoda;
DROP VIEW widok1;
DROP VIEW widok2;
DROP FUNCTION ile_kierowcow;
DROP FUNCTION tekst;
DROP FUNCTION wiek;
--DROP FUNCTION ;
DROP PROCEDURE usun_zespol;
DROP PROCEDURE dlugosc;
DROP PROCEDURE dodaj_tor;
DROP PROCEDURE dodaj_zespol;
DROP TRIGGER usuwanie;
DROP TRIGGER przepisy;
DROP TRIGGER ograniczenie;
