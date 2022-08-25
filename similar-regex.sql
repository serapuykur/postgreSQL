-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir
REGEX : Herhangi bir kod, medin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
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
   
   --icerisinde 'ot' veya 'at'
-- bulunan kelimeleri yaz 
--veya islemi icin | karakteri kullanilir
select * from kelimeler where kelime similar to '%(at|ot)%'
select * from kelimeler where  kelime ILIKE '%at%' or kelime ILIKE '%ot%';

select * from kelimeler where kelime ~~* '%at%' or kelime ~~*'%ot%'

--regex
select * from kelimeler where kelime ~*'ot' or kelime ~*'at'

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
select * from kelimeler where kelime similer to 'ho%| hi%'
--LIKE ile yapimi
select * from kelimeler where kelime ~~* 'ho%' or kelime ~~*'hi%'

--regex ile
select * from kelimeler where kelime ~* 'h[oi](.*)'--regex te ". nokta bir karakteri temsil eder"
--regex te ikinci parantez icin koseli parantez kullanilir * hepsi anlaminda kullanilir

--sonu t veya m ile bitenleri listele

--similar to ile 
select * from kelimeler where kelime similar to '%t|%m'
--regex ile

select * from kelimeler where kelime ~* '(.*)[tm]$'--$ karakteri bitisi gosterir
-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--similar to ile
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
--like ile
select * from kelimeler where kelime ~~* 'h_t';
--REGEX ile
select * from kelimeler where kelime ~*'h[a-z,A-Z,0-9]t,'

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
--similar ile
select kelime from kelimeler where kelime similar to 'h[a-e](.*)%t'
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[say](.*)'

--son karakterleri m a veya f olan kelime degerlerini cagirin

select * from kelimeler where  kelime ~'(.*)[maf]$'--'[maf]$'ile de calisir

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--similar to ile
select  * from kelimeler where kelime similar to 'h[a|i]t'
--regex ile
select * from kelimeler where kelime ~'^h[a|i]t$'
--İlk harfi 'A' dan ‘M' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)'

--içerisinde en az 2 adet o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][l]%'
select * from kelimeler where kelime similar to '%[o]{2}%'--suslu prantez icinde blirttigimz rakam bir onceki
--koseli parantez icinde kactane old belirtir
--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%'
select * from kelimeler where kelime similar to '%[o]{2}%' -- Süslü parantez içinde belirttiğimiz rakam bir önceki
                                                           --köşeli parantez içinde kaçtane olduğunu belirtir

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler WHERE kelime SIMILAR TO '%[o]{4}%'
--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.

SELECT kelime FROM kelimeler WHERE kelime ~ '^[a|s|y](.*)[m|f]$';