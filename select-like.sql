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
