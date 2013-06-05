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
--select * from pogoda;

CREATE TABLE tor_wyscigowy(
id_tor_wyscigowy SERIAL PRIMARY KEY,
id_pogoda INT NOT NULL,
nazwa VARCHAR(45) NOT NULL,
kraj VARCHAR(45) NOT NULL,
dlugosc FLOAT NOT NULL,
liczba_zakretow INT NOT NULL
);
--select * from tor_wyscigowy

CREATE TABLE pensja_kierowcy(
id_pensja SERIAL PRIMARY KEY,
data_zatrudnienia DATE,
pensja INT NOT NULL 
);
--select * from pensja_kierowcy;

CREATE TABLE zespol(
id_zespol SERIAL PRIMARY KEY,
nazwa_zespolu VARCHAR(45) NOT NULL,
data_zalozenia DATE,
zalozyciel VARCHAR(45) NOT NULL
);
--select * from zespol;

CREATE TABLE kierowca(
id_kierowca SERIAL PRIMARY KEY,
id_pensja INT,
id_zespol INT NOT NULL,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(45) NOT NULL,
data_ur DATE NOT NULL
);
--select * from kierowca;

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
--select * from wyscig;

CREATE TABLE udzial(
id_bolid INT,
id_wyscig INT,
id_kierowca INT
);
--select * from udzial;

CREATE TABLE wyniki(
id_wyniki SERIAL PRIMARY KEY,
id_wyscig INT,
id_kierowca INT,
pozycja INT NOT NULL
);
--select * from wyniki;

CREATE TABLE wypadek(
id_wypadek SERIAL PRIMARY KEY,
id_wyscig INT,
nazwa_bolidu VARCHAR(45) NOT NULL,
kierowca VARCHAR(45) NOT NULL,
zespol VARCHAR(45) NOT NULL
);
--select * from wypadek;

CREATE TABLE awaria(
id_awaria SERIAL PRIMARY KEY,
id_wyscig INT,
nazwa_bolidu VARCHAR(45) NOT NULL,
typ_awarii VARCHAR(45) NOT NULL,
kierowca VARCHAR(45) NOT NULL,
zespol VARCHAR(45) NOT NULL
);
--select * from awaria;
