-- LİMİT --
-- Kisiler tablosundan ilk 5 veriyi listeleyiniz
select * from personel limit 5

--ilk iki veriden sonra 5 veriyi listeleyiniz
select*from personel limit 5 offset 2
-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from  personel
where id>5
limit 5
--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select * from personel order by  maas desc limit 3
-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from personel order by maas desc limit 3 offset 3
