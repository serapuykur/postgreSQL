-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir
REGEX : Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır 
PostgreSQL'de "~" karakteri ile kullanılır.
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
    INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
select * from kelimeler
--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya işlemi için | karakteri kullanılır
--SIMILAR TO ile
select * from kelimeler where kelime SIMILAR TO '%(at|ot|At|Ot|aT|oT)%'
--like ile 
select * from kelimeler where kelime ilike '%at%' or kelime ilike '%ot%'
select * from kelimeler where kelime ~~*'%at%' or kelime ~~* '%ot%'
--REGEX ile
select * from kelimeler where kelime  ~*'ot' or kelime ~*'at'

-- 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime similar to 'ho%|hi%'
--like ile
select * from kelimeler where kelime ~~* 'hi%' or kelime ~~* 'ho%'
--regex ile 
select * from kelimeler where kelime ~* 'h[oi](.*)'
--Regex'te ".(nokta) bir karakteri temsil eder"
--Regex'de ikinci karakter için köşeli parantez kullanılır. * hepsi anlamında kullanılır

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%t|%m'
--regex ile
select * from kelimeler where kelime ~* '(.*)[tm]$'--$isareti bitisi gosterir


--h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--similar to ile
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t'
--like ile
select * from kelimeler where kelime ~~* 'h_t'
--regex ile
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t'










