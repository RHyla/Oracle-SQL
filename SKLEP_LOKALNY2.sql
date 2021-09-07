create public database link WYP_ZDAL
Connect to Test Identified by test123
using 'ORCLPDB2';

create table WYPOZYCZALNIA(
      ID number Primary Key,
      Nazwa varchar2(255) ,
      Ulica varchar2(255),
      Miasto varchar2(255),
      Województwo varchar2(255),
      Telefon number
);
create table KLIENT(
      ID number Primary Key,
      WypID Number,
      Imie varchar2(255),
      Nazwisko varchar2(255),
      Adres varchar2(255),
      DataUrodzenia Date,
      Telefon number
);

create table KLIENT_FILM(
      FilmID Number,
      KlientID Number,
      WypID Number,
      DataWypo¿yczenia Date,
      DataZwrotu Date
);

insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(1,'U Jerzego','Tkacka 34','Wroc³aw','Dolnoœl¹skie',507888922);
insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(2,'Video Hit 20','Rac³awicka 42 /1','Wroc³aw','Dolnoœl¹skie',505688912);
insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(3,'Super DVD','ul. Bogus³awskiego 99','Wroc³aw','Dolnoœl¹skie',515644913);
insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(4,'LSP','Grabiszyñska 240','Wroc³aw','Dolnoœl¹skie',607134556);

insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(1,1,'Karol','Krawczyk','Krucza 99 Wroc³aw','90/12/12',597644899);
insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(2,1,'Karol','Krawczyk','Krucza 99 Wroc³aw','90/12/12',597644899);
insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(3,1,'Karol','Krawczyk','Krucza 99 Wroc³aw','90/12/12',597644899);
insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(4,1,'Karol','Krawczyk','Krucza 99 Wroc³aw','90/12/12',597644899);




insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(1,1,1,'2020/07/07','2020/07/21');
insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(1,2,2,'2020/05/11','2020/05/25');
insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(2,3,3,'2020/01/17','2020/01/31');
insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(3,4,3,'2020/02/01','2020/02/15');

create view Wypo¿yczenia as 
SELECT * FROM Wypozyczalnia 
UNION 
SELECT * FROM Wypozyczalnia@WYP_ZDAL; 


SELECT * FROM "WYPO¯YCZENIA"
ORDER BY Miasto;

SELECT * FROM Klient
UNION
SELECT * FROM Klient@WYP_ZDAL;

create view Wypo¿yczenia as 
SELECT KLIENT.Imie, KLIENT.Nazwisko, KLIENT.Adres, Wypozyczalnia.Nazwa, Wypozyczalnia.Miasto, m_Filmy.Tytul FROM KLIENT
JOIN Wypozyczalnia ON Klient.Wypid = Wypozyczalnia.Id
JOIN  Klient_Film ON Klient.id = Klient_Film.KlientID
JOIN  m_Filmy ON Klient_Film.FilmID = m_Filmy.iD
UNION
SELECT KLIENT.IMIE, KLIENT.Nazwisko,  KLIENT.Adres, Wypozyczalnia.Nazwa, Wypozyczalnia.Miasto,Film.Tytul FROM KLIENT@WYP_ZDAL
JOIN Wypozyczalnia@WYP_ZDAL ON Klient.Wypid = Wypozyczalnia.ID
JOIN  Klient_Film@WYP_ZDAL ON Klient.id = Klient_Film.KlientID
JOIN  Film@WYP_ZDAL ON Klient_Film.FilmID = Film.iD

SELECT * FROM Klient_FIlm
UNION
SELECT * FROM Klient_Film@WYP_ZDAL;


SELECT KLIENT.IMIE, KLIENT.Nazwisko,  KLIENT.Adres, Klient_Film.FilmID FROM KLIENT@WYP_ZDAL
JOIN Klient_Film@WYP_ZDAL ON Klient.id = Klient_Film.KlientID;



create Materialized View m_Filmy
build Immediate
Refresh complete
next sysdate+(1/(24*60))
as
select * from FILM@WYP_ZDAL;

create Materialized View m_Producenci
build Immediate
Refresh complete
next sysdate+(1/(24*60))
as
select * from Producent@WYP_ZDAL;

create Materialized View m_Wypozyczalnie
build Immediate
Refresh complete
next sysdate+(1/(24*60))
as
select * from Wypozyczalnia@WYP_ZDAL;

insert into Filmy(ID,ProducentID, Tytul,Czastrwania,Ocena,"ILOSCDOSTÊPNYCHSZTUK") values(8,2,'Titanic',180,8,19);

DROP view Wypo¿yczenia;
DROP snapshot Filmy;
DROP table Pracownicy;


