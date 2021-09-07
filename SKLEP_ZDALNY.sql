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

create table FILM(
      ID Number PRIMARY KEY ,
      ProducentID Number,
      Tytul varchar2(255),
      CzasTrwania Number,
      Ocena varchar2(2),
      IloscDostêpnychSztuk Number
);

create table Producent(
      ID Number PRIMARY KEY,
      Nazwa varchar2(255),
      Kraj varchar2(255)

);


insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(5,'Na wypasie','1 Maja 37/6','Opole','Opolskie',589643678);
insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(6,'U Zbigniewa','Zawiszaków 8/103','Opole','Opolskie',576665785);
insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(7,'Dobre DVD','Sieradzka 3','Opole','Opolskie',590877650);
insert into WYPOZYCZALNIA(ID,Nazwa, Ulica, Miasto, Województwo,Telefon) values(8,'Ole Opole','Waryñskiego 41','Opolskie','Opolskie',607134556);

insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(5,5,'Janusz','Tracz','Ozimska 15','89/10/15',597699880);
insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(6,6,'Marek','Krawski','Karola Miarki 56 Opole','77/04/02',509644899);
insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(7,6,'Michal','Murek','Konsularna 9 Opole','76/02/16',597644123);
insert into KLIENT(ID,WypID, Imie, Nazwisko, Adres, DataUrodzenia,Telefon) values(8,7,'Zbigniew','Koralski','1 Maja 94 Opole','78/09/12',597123456);




insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(4,5,5,'2020/08/07','2020/08/21');
insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(4,6,6,'2020/03/11','2020/03/25');
insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(5,7,7,'2020/05/17','2020/05/31');
insert into KLIENT_FILM(FilmID,KlientID, WypID, DATAWYPO¯YCZENIA,Datazwrotu) values(5,8,8,'2020/03/11','2020/03/25');

insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(1,1,'Piraci z Karaibów: Kl¹twa Czarnej Perly',143,9,80);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(2,1,'Piraci z Karaibów: Skrzynia umarlaka',151,8,70);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(3,1,'Piraci z Karaibów: Na krañcu œwiata',169,8,68);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(4,1,'Piraci z Karaibów: Na nieznanych wodach',137,7,75);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(5,1,'Piraci z Karaibów: Zemsta Salazara',153,7,40);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(6,2,'Forrest Gump',144,10,30);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(7,2,'Intersellar',169,10,20);
insert into Film(ID,ProducentID, Tytul,Czastrwania,Ocena,"ILOSCDOSTÊPNYCHSZTUK") values(8,2,'Titanic',210,8,19);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(9,3,'Joker',124,8,10);
insert into FILM(ID,ProducentID, Tytul, CZASTRWANIA,Ocena, "ILOSCDOSTÊPNYCHSZTUK") values(10,3,'Mroczny Rycerz',169,8,44);
 

insert into PRODUCENT(ID,Nazwa,Kraj) values(1,'Walt Disney Pictures','USA');
insert into PRODUCENT(ID,Nazwa,Kraj) values(2,'Paramount Pictures','USA');
insert into PRODUCENT(ID,Nazwa,Kraj) values(3,'Warner Bros.','USA');


 