create table ogrenci(
ogr_no int,
	ogr_isim varchar(30),
	notlar real,
	yas int,
	adres varchar(50),
	kayit_tarih date
);
--varolan tablodan yeni tablo olusturalimm
create table ogr_notlari
as
select ogr_no,notlar from ogrenci;
select * from ogrenci ;
select * from ogr_notlari;

---day 2 tekrari----
--personel isminde bir class olusturalim
create table personel(
	pers_id int,
	isim varchar(30),
	sehir varchar(30),
	maas int ,
	sirket varchar (20),
	adres varchar(50)
	);
	--var olan personel tablosundan  pers_id ,sehir,adres fieldlerine sahip personel_adres adinda yeni tablo 
	create table personel_adres
	as 
	select pers_id,sehir,adres from personel;
	select * from personel
	--DML data manipulation lang
	--inser-update-delete
	--tabloya veri ekleme-veri guncelleme-veri silme iicn kullanilir
	--INSERT
	create table student (
		id varchar(4),
		st_name varchar(30),
		age int
	);
	
		insert into student values ('1001','Ali Can',25);
		insert into student values ('1002','Veli Can',35);
		insert into student values ('1003','Ayse Can',45);
		insert into student values ('1004','Ali Can',55);
	select * from student
	commit;
	
	--tabloya parcali veri ekleme
	insert into student (st_name,age) values('Murat Can',65);
	
	--DQL-->Data Querly lang.
	--SELECT
	select * from student ;--*yildiz hepsini getirir
	select st_name from student;--yildiz yerine baska birsey yazarsan sadece onu getirir
	
	--SELECT komutu WHERE KOSULU
	select * from student where age>35;
	--TCL Transaction Control Lang
	--Begin -Savepoint-rollback-commit
	--transaction veri tabani sistemlerinde bir islem basladiginda baslar  ve islem bitince sona erer
	--bu islemler veri tabani olusturma-veri silme-veri guncelleme-veriyi geri getirme
	
	create table ogrenciler2(
		id serial,
		isim varchar(50),
		veli_isim varchar(50),
		yazili_notu real
	);
	begin;
	insert into ogrenciler2 values (default,'Ali Can','Hasan Can',75.5);
	insert into ogrenciler2 values(default,'Canan Gul','Ayse Sen',90.5);
	savepoint x;
	insert into ogrenciler2 VALUES (default,'Kemal Can','Ahmet Can',85.5);
	insert into ogrenciler2 VALUES (default,'Ahmet Şen','Ayşe Can',65.5);
	rollback to x;
	select * from ogrenciler2
	commit;
	
	--Transaction kullanımında SERIAL data türü kullanımı tavsiye edilmez.
--savepointten sonra eklediğimiz veride sayaç mantığı ile çalıştığı için
--sayacta en son hangi sayıda kaldıysa ordan devam eder
-- NOT : PostgreSQL de transaction kullanımı için 'Begin' komutuyla başlarız sonrasında tekrar yanlış bir veriyi
-- düzeltmek veya bizim için önemli olan verilerden sonra ekleme yapabilmek için 'SAVEPOINT savepointadi'
-- kullanırız ve bu savepointe dönebilmek için 'ROLLBACK TO savepointismi' 
-- komutunu kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki verileri tabloda bize 
-- verir ve son olarak Transaction'ı sonlandırmak için mutlaka 'COMMIT' komutu kullanırız. MySQL de 
-- transaction olmadanda kullanılır

--DML-DELETE
--delete from tablo_adi =tablonun tum icerigini siler
--veriyi secerek silmek icin where komutu kullanilir
--delete from tablo_adi where sutun_adi =veri -->tablodaki istedigimiz veriyi siler

create table ogrenciler(
id int ,
	isim varchar(50),
	veli_isim varchar(50),
	yazili_noti int
);
	
insert into ogrenciler values(123,'Ali Can','Hasan',75);
insert into ogrenciler values (124,'Merve Gul','Ayse',85);
insert into ogrenciler values(125,'Kemal Yasa','Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;

-- Soru : id'si 124 olan öğrenciyi siliniz
delete from ogrenciler  where id=124;

-- Soru : ismi Kemal Yasa olan satırı siliniz
delete from ogrenciler where isim='Kemal Yasa';

-- Soru : ismi Nesibe Yılmaz veya Mustafa Bak olan kayıtları silelim

delete from ogrenciler where isim='Nesibe Yilmaz' or isim='Mustafa Bak';

-- soru : ismi Ali Can ve id'si 123 olan kaydı siliniz
delete from ogrenciler where isim='Ali Can' or id =123; 
--tablodaki tum verileri silelim
delete from ogrenciler;

-- DELETE - TRUNCATE --
-- TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
-- Ancak, seçmeli silme yapamaz
Truncate table Ogrenciler

DDL -data definition lang 
--create- alter-drop
--alter table 
--alter table tabloda add ,type set ,rename,veya drop columns islemlri icin kullanilir

--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)    
);
select * from  personel;
-- Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
alter table personel add cinsiyet varchar(20),add yas int,

--Personel tablosundan sirket field'ini siliniz
alter table personel drop column  sirket;

-- Personel tablosundaki sehir sutununun adını ulke olarak değiştirelim
alter table  personel rename column sehir to ulke;

-- Personel tablosunun adını isciler olarak değiştiriniz
alter table personel rename  to isciler;

DDl drop kontrolu
 CONSTRANINT -- Kısıtlamalar
-- Primary Key --> Bir sutunun NULL içermemesini ve sutundaki verilerin BENZERSİZ olmasını sağlar (NOT NULL - UNIQUE)
-- FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. Böylelikle, tablolar arasında ilişki kurmuş oluruz.
-- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
-- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
-- NOT NULL kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
-- CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.
 
 CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);
insert into calisanlar values('10002','Mehmet Yilmaz',12000,'2018-04-14');


INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yas', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

select * from calisanlar

create table adresler(
adres_id char(5),
	sokak varchar(20),
	cadde varchar(30),
	sehir varchar(20),
	CONSTRAINT id_fk FOREIGN KEY (adres_id ) references calisanlar(id)
);
	insert into adresler values('10003','Mutlu Sok','40.Cad','IST');
	INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
	INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
	select * from adresler;
	INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep'); 
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;
DROP table calisanlar
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir
delete from calisanlar where id = '10002'; --Parent
delete from adresler WHERE adres_id = '10002'; --Child
drop table calisanlar;
-- ON DELETE CASCADE --
--Her defasında önce child tablodaki verileri silmek yerine 
--ON DELETE CASCADE silme özelliğini aktif hale getirebiliriz
--Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmamız yeterli
