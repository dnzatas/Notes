###

# Regex Basic Commands

##

* Özel Karakterler --> .[{(^*+$?|
* Genel Karakterler --> \d\D\w\W\s\S
* Sınırlayıcı Karakterler --> \b\B\^\$
* Veya ifadesi --> |
* Gruplandırma --> [] [^] ()
* Quantifiers --> + * ? {k} {max, min} {k,}

##

* \d bütün digitleri temsil eder. [0-9] arası
* \D rakam olmayan diğer tüm ifadeleri temsil eder. [^0-9]
* \w sayıları, rakamları ve alt çizgiyi temsil eder. [a-zA-Z0-9_]
* \W sayılar, rakamlar ve altçizgi dışındakileri temsil eder. [^a-zA-Z0-9_]
* \s boşlukları temsil eder.
* \S boşluklar haricindeki tüm ifadeleri temsil eder.

##

* . tüm karakterleri, harfleri, sayıları temsil eder
* \ bir karekteri ararken önüne \ koyarak ararız.
* \. bu ifadede noktayı temsil eder.
* \[\[   bu ifade [[ temsil eder
* \[\.\. [.. temsil eder

##

* \b stringin başını sonunu temsil eder. Örn: \bdeniz yazarsan başında deniz öncesinde herhangi bir harf, rakam veya _ varsa bulmaz. Boşluk veya karakter olmalı. Sonunda her şey olabilir. denizherzaman, deniz yürür, deniz1234, deniz!'^++%& --> bu  örnekler kabul. _denizherzaman, bendeniz, 1234deniz --> bu örneklerde deniz'i görmez. \bdeniz\b kullanımında denizden sonra da string gelmemeli.
* \B \b'nin tam tersi
* ^ bir satırın ne ile başlayacağını gösterir. ^deniz yazarsan sadece satırın başı deniz ile başlıyorsa deniz'i görür.
* $ satır sonundaki karakterle eşleşiyorsa görür. $34 yazarsan 23445634, deniz34 ü görür. deniz34x'i görmez.
* | örneğin: sadece (123)4567 ve 1234567 ifadesini kabul etmesini istiyorsak. (\(\d\d\d\)|\d\d\d)\d\d\d\d$

##

* [] [a1b4-] --> burada a,1,b,4,- hepsine ayrı ayrı bakıyor.
[0-9]   --> - aradayken kullanımı değişiyor. Burada 0-9 arası tüm rakamları yakalıyor.
[a-z]   --> a'dan z'ye kadar tüm harfleri yakalar.
[a-zA-Z0-9.()-] --> a'dan z'ye küçük harfleri, A'dan Z'ye büyük harfleri, 0-9 arası tüm rakamları, noktayı, parantezi, ve - yi yakalar. - yi yakalaması için başa vea sona yaz.

* [^] [^1-4]      --> 1,2,3,4 dışındaki her şeyi yakalar.
[^a-z] --> a'dan z'ye tüm küçük harfler dışındakileri yakalar.

* () --> Gruplandırma için kullanılır. ar([a-z]|\d) --> ar'dn sonra harf veya rakam gelsin diyoruz.

##

* {k} \d{5} --> 5 tane \d'yi temsil eder. \d\d\d\d\d
* {min, max}  \d{2,5} --> 2'li, 3'lü, 4'lü, 5'li gruplu sayıları okur. 23, 234, 2345, 23456
* {k,} \d{6, } --> 6 ve daha büyük haneli rakamları okur. 123456, 12345677890
* + bir veya daha fazla demek.
deniz\w+     --> deniz'den sonra bir veya daha fazla \w karakteri gelebilir. deniz123345, deniz1 kabul. deniz\w olsaydı deniz'den sonra sadece bir tane karakteri okurdu. deniz12234 --> sadece deniz1'i okur.
* * 0 veya daha fazla varsa kapsar. ab{4}c --> abbbbc'yi temsil eder. Bunun yerine ab*c de kullanılabilir. Örneğin kaç tane b olduğunu bilmiyoruz. Belki 100 belki hiç yoktur. Ama b varsa veya hiç yoksa yakalasın istersek ab*c kullanırız. ac, abc, abbbbbbbc, abbbbbbbbbbbbbbbbbbc hepsini yakalar.
* ? bir karakter var mı yok mu emin değilsek bunu kullanırız.
* \d{3}-?\d{2}-?\d{2} --> hem 123-23-24'ü hem de 2343456'ü yakalamak istiyorsak kulanılır.
* \d{3}(-?|\s)\d{2}(-?|\s)\d{2} --> hem 123-23-24'ü hem 143 34 56'ü hem de 2343456'ü yakalamak istiyorsak kulanılır.

* ^https?:\/\/?[a-zA-Z0-9]+\.[a-zA-Z0-9]+$ --> url ifadesi bulma
* [a-zA-Z0-9.-_]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$ --> mail ifadesi bulma
