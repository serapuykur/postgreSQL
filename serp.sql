--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--Varolan personel
--Varolan personel tablosundan pers_id,sehir,adres fieldlarına sahip personel_adres adında yeni tablo olusturalım
create table personel_adres
as
select pers_id, sehir, adres from personel;
select * from personel
-- DML --> Data Manupulation Lang.
-- INSERT - UPDATE - DELETE
--Tabloya veri ekleme, tablodan veri güncelleme ve silme işlemlerinde kullanılan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES ('1001','Ali Can',25);
INSERT into student VALUES ('1002','Veli Can',35);
INSERT into student VALUES ('1003','Ayse Can',45);
INSERT into student VALUES ('1004','Derya Can',55);
--Tabloya parçalı veri ekleme
insert into student(st_name,age) values ('Murat Can',65);
--DQL --> Data Query Lang.
--SELECT
select * from student;
select st_name from student;
--SELECT KOMUTU WHERE KOŞULU
select * from student WHERE age>35;
--TCL - Transaction Control Lang.
--Begin - Savepoint - rollback - commit
--Transaction veritabanı sistemlerinde bir işlem başladığında başlar ve işlem bitince sona erer
--Bu işlemler veri tabanı oluşturma, veri silme, veri güncelleme, veriyi geri getirme gibi işlemler olabilir
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);
Begin;
insert into ogrenciler2 VALUES (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 VALUES (default,'Canan Gül','Ayşe Şen',90.5);
savepoint x;
insert into ogrenciler2 VALUES (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 VALUES (default,'Ahmet Şen','Ayşe Can',65.5);
ROLLBACK TO x;
select * from ogrenciler2;
commit;
--Transaction kullanımında SERIAL data türü kullanımı tavsiye edilmez.
--savepointten sonra eklediğimiz veride sayaç mantığı ile çalıştığı için
--sayacta en son hangi sayıda kaldıysa ordan devam eder
--not :postgreSQL de transaction kullanimi icin begin komutuyla baslarizz sonrasimda tekrr yanlis bir veriyi 
--duzeltmek icin bizizm icin onemli olan verilerden sonra ekleme yapabilmek icin 
--savepoint lomutunu kullaniriz ve bu savepointe donebilmekiicn  'ROLLBACK TO savepointismi 
--komutu kullaniriz ve rollback calistirildiginda savepoint yazdirgimiz satirin ustundeki   verileri depoda bize
--transaction olmadan da kullanilirr

--DML-delete--
--delete from tablo_adi-->tablonun tum icerigini siler
--veriyi secerek silmek icin where kosulu kullanilir
--delete from tablo_adi WHERE sutun_adi=vveri ==> tabloda istedigimiz veriyi siler
-- DML - DELETE -
--DELETE FROM tablo_adi --> Tablo'nun tüm içeriğini siler
-- Veriyi seçerek silmek için WHERE koşulu kullanılır
-- DELETE FROM tablo_adı WHERE sutun_adi = veri --> Tablodaki istediğimiz veriyi siler
-- DML - DELETE -
--DELETE FROM tablo_adi --> Tablo'nun tüm içeriğini siler
-- Veriyi seçerek silmek için WHERE koşulu kullanılır
-- DELETE FROM tablo_adı WHERE sutun_adi = veri --> Tablodaki istediğimiz veriyi siler-- DML - DELETE -
--DELETE FROM tablo_adi --> Tablo'nun tüm içeriğini siler
-- Veriyi seçerek silmek için WHERE koşulu kullanılır
-- DELETE FROM tablo_adı WHERE sutun_adi = veri --> Tablodaki istediğimiz veriyi siler

-- DML - DELETE -
--DELETE FROM tablo_adi --> Tablo'nun tüm içeriğini siler
-- Veriyi seçerek silmek için WHERE koşulu kullanılır
-- DELETE FROM tablo_adı WHERE sutun_adi = veri --> Tablodaki istediğimiz veriyi siler

-- Soru : id'si 124 olan öğrenciyi siliniz
DELETE From ogrenciler where id=124;

--soru: ismi kemal yasa olan satiri siliniz

delete from ogrenciler where isim='kemal yasa';

--soru ismi nesibe yilmaz mustafa bak olan lari sil
delete from ogrenciler where isim ='nesibe yilmaz ' or isim ='mustafa bak';
--soru ismi ali can ve id 123 olan kaydi silin 

delete from ogrenciler where isim='ali can ' or id=123;
delete  from ogrenciler ABORT
--delete -truncate--
trancete komutu delete komutu gibi bir tablodaki verilerin tamamini sile
--ancak secmel i silmek yapamaz 
select * from ogrenciler
truncate  table ogrenciler

personel tablosuna cinsiyer varchar (20)
 --ve yas int olsun sek yeni sutunlar ekleyin 
 alter table personel
 create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);


create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--Varolan personel
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--Varolan personel





create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--Varolan personel

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);




