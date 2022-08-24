--personel isminde bir tablo olusturalim
create table personel(
	pers_id int,
	isim varchar(30),
	sehir VARCHAR(30),
	maas int,
	sirket varchar(20),
	adres VARCHAR(50) 
	);
	--varolan persoel tablosundan  pers_id,sehir,adres fieldlerine sahip 
	--personel_adres adinda yeni tablo olusturalim
	create TABLE personel_adres
	as
	select pers_id,sehir,adres from personel;
	select * from personel
	
	--DML-->data maniplation lang 
	--INSERT-UPDATE-DELETE
	--Tabloya veri ekleme  ,tablodan veri guncelleme ve silme islemlerinde kullanilan komutlar
	--1)INSERT
	create TABLE student (
	id varchar(4),
		st_name varchar(30),
		age int 
		);
		insert into student VALUES('1001','Ali Can',25);
		insert into student VALUES('1002','Veli Can',35);
		insert into student VALUES('1003','Ayse Can',45);
		insert into student VALUES('1004','Derya Can',55);
		--Tabloya parcali veri ekleme
		insert into student(st_name,age) values('Murat Can',65)
		
		--DQL -->Data  Query Lang.
		--select
		select * from student;
		select st_name from student;
		--select komutu where(kosullu ekleme)
		select * from student where age>35;
		
		--TCL-transaction Control lang.
		--Begin-Savepoint -rollback-commite
		--transaction veritabani sistemlerinde bir islem baslafiginda baslar ve islem bitince sona erer
		--bu islemler veri tabani olusturma ,veri silme,veri guncelleme ,veriyi geri getirme gibi islemler olabilir
		
	
		
		create table ogrenciler2
		(
			id serial,
			isim varchar(50),
			veli_isim varchar (50),
			yazili_notu real
		 
		);
		
		insert into ogrenciler2 values (default,'Ali Can','Hasan Can',75.5);
		insert into ogrenciler2 values (default,'Canan Gul','Ayse Sen ',90.5);
		insert into ogrenciler2 values (default,'Kemal Can','Ahmet Can',85.5);
		insert into ogrenciler2 values (default,'Ahmet Sen','Ayse Can ',65.5);
		select * from ogrenciler2
		
		create TABLE student (
	id varchar(4),
		st_name varchar(30),
		age int 
		);
		insert into student VALUES('1001','Ali Can',25);
		insert into student VALUES('1002','Veli Can',35);
		insert into student VALUES('1003','Ayse Can',45);
		insert into student VALUES('1004','Derya Can',55);
		--Tabloya parcali veri ekleme
		insert into student(st_name,age) values('Murat Can',65)
		
		--DQL -->Data  Query Lang.
		--select
		select * from student;
		select st_name from student;
		--select komutu where(kosullu ekleme)
		select * from student where age>35;
		
		--TCL-transaction Control lang.
		--Begin-Savepoint -rollback-commite
		--transaction veritabani sistemlerinde bir islem baslafiginda baslar ve islem bitince sona erer
		--bu islemler veri tabani olusturma ,veri silme,veri guncelleme ,veriyi geri getirme gibi islemler olabilir
		
	
		
		create table ogrenciler2
		(
			id serial,
			isim varchar(50),
			veli_isim varchar (50),
			yazili_notu real
		 
		);
		BEGIN;
		insert into ogrenciler2 values (default,'Ali Can','Hasan Can',75.5);
		insert into ogrenciler2 values (default,'Canan Gul','Ayse Sen ',90.5);
		savepoint x;
		insert into ogrenciler2 values (default,'Kemal Can','Ahmet Can',85.5);
		insert into ogrenciler2 values (default,'Ahmet Sen','Ayse Can ',65.5);
		ROLLBACK to x;
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

--DML -DELETE-
--delete from tablo_adi--> tablomun tum icerigini siler
--veriyi secerek silmek icin WHERE kosulu kullanilir
--delete from tablo_adi where sutun_adi =veri -->tablodaki istedigimiz veriyi siler
create table ogrenciler
(id int,
 isim varchar(50),
 veli_isim varchar (50),
 yazili_notu int
);
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);
select * from ogrenciler; 
	--id si 124 olan ogrenciyi silin	
	
	delete from ogrenciler WHERE id =124;
	--ismi kemal Yasa  olan ogrenciyi silin
	delete from ogrenciler WHERE isim='Kemal Yasa';
	--ismi nesibe yilmaz veya mustafa bak olan kayitlari silelim
	delete from ogrenciler where isim='Nesibe Yilmaz' or isim='Mustafa Bak';
	--soru : ismi Ali can ve id si 123 olan kaydi siliniz
	Delete from ogrenciler where isim ='Ali Can' or id =123
	
	--tablodaki tum ogrencileri silelim
	delete from ogrenciler
	
	--DELETE -TRUNCATE--
	--truncate komutu delete komutu gibi bir tablodaki verilerin tamamini siler
	--ancak secmeli silme yapmaz
	select * from ogrenciler;
	truncate  table ogrenciler
	)