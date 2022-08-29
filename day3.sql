CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50)-- UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int-- NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
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
delete from calisanlar where id='10002'
delete from adresler where adres_id='10002';-->child
drop table calisanlar;

--ON DELETE CASCADE
--her defasinda once child tablodaki verileri silmek icin
--on delete cascade silme ozelligini aktif hale getirebiliriz
-- bunun icin fk olan satirin en sonuna ON DELETE CASCADE komutunu yazmamiz yeterli 
CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler
select * from notlar
delete from notlar where talebe_id='123'
delete from talebeler where id='126'--on delete cascade kullandigimiz icin parent tableden direk
--silebildik Parent tableden sildigimiz iicn child tableden de silinmis oldu
delete from talebeler
drop table talebeler cascade;--parent tabloyu kaldirmak istersek drop table_adi ndan sonra
--cascade komutunu kullaniriz
--talebeler tablosundaki isim sutununa nott null ekleyeiniz ve veri tipini varchar(30)olarak degistirinizz
alter  table talebeler 
alter colomn isim type varchar(30),
alter column isim set not null;
--talebeler tablosundaki yazili notu sutununa 60 dan buyuk rakam girilebilsin
alter table talebeler
add constraint sinir check(yazili_notu>60)
--check kisitlamasi ile tablodaki istedigimiz sutunu sinirlandirabilirz
--Açiklama : -- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi
insert into talebeler values (128,'Mustafa Can','Hasan',45);

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;
select * from ogrenciler 
select * from ogrenciler_adres

--tablodaki bir sutunu bir sutuna  primary key ekleme
alter table ogrenciler
add primary key(id);

--primary olusturmada 2.yol

alter table ogrenciler
add constraint pk_id primary key(id);

--pk dan sonra fk atama 
alter table ogrenci_adres
add foreign key (id)references ogrenciler;
-- child tabloyu parent tablodan olusturdugumuz icin sutun adi verilmedi
 
--pk yi constraint silme
alter  table ogrenciler drop Constraint  pk_id;
--fk yi silme constraint silme  
alter table ogrenci_adres drop constraint ogrenci_adres_id_fkey;
--yazili notu 85 den buyuk talebe bilgilerini getir
select  * from talebeler where yazili_notu>85;
--ismi mustafa bak olan talebenin tum billgilerini getir
select * from talebeler where isim='Mustafa Bak'

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

/*
    AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sınav2 > 50
Hem sınav1 hemde sınav2 alanı, 50'den büyük olan kayıtları listeler
    OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler    
*/
select * from  personel
--id si 1003 ile1005 arasinda olan personel bilgisini listeleyiniz

select * from personel where id BETWEEN '1003' and '1005';

--2.yol

select * from personel where id>='1003' and id<='1005';

--derya soylu ile yavuz Bal arasindaki personel bilgisini liste;e
--select * from personel where between 'Derya Soylu' and 'Yavuz Bal'
--maasi 70 bin olan ve ismi sena olan personeli listele
select * from personel where maas =70000 or isim ='Sena Beyaz'


--IN KOSULU Birden fazla mantiksal ifsde ile tanimlayabilecegimiz durumlari tek komutta yazbilme 
--imkani verir farkli sutunlar icn in kullanilmaz
--id si 1001,1002 ve 1004 olan personelin bilgilerini listele 

select * from personel where id ='1001' or id='1002'or id='1004';
--2.yol
select * from personel where id in ('1001','1002','1004');
\
--maasi sadece 70bin,100bin olan personeli listele
select from personel where maas In (70000,100000);

/*
SELECT-LIKE kosulu
like:sorgulama yaparken belirli (pattern kalip)kalip ifadeleri kullanabilmemizi saglar
ILIKE : sorgulama yaparken buyuk/kucuk harfe duyarli olarak eslestirir
Like:~~
ilike:~~*
not like: !~~
NOT ILIKE: !~~*

%--> 0 veya daha fazla karakteri belirtir
_:tek bir karakteri belirtir
*/
--ismi a harfi ile baslayan personeli listele

select *from personel where isim like 'A%';
--ismi t harfi ile biten personeli listele
select * from  personel where isim like '%t';--basi ne olursa olsun sonu t ile bitsin

--ismini  2 harfi E olan personeli listele

select * from personel where isim like '_e%'
-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select isim from personel WHERE isim ~~* 'a%n'
-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select isim from personel WHERE isim ilike '_a_u%'
-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%' and isim ~~* '%r%'
-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel WHERE isim like '_e%y%'
-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel WHERE isim ~~* 'A______a%'
--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select * from personel WHERE isim like '%r_'
