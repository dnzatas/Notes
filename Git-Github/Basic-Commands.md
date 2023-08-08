## GIT CONFIG

* git config --list     # Buradan config ayarlarını görebilirsin.
* git config --global user.name "Deniz"   //Buradan adını değiştirebilrsin.
* git config --global user.email "denizat@gmail.com"    //mailini değiştirebilirsin.
* git config --global --replace-all user.name "Deniz Atas" // Birden fazla glabal name varsa hepsini değiştirebilirsin.
* git config user.name "FIRST_NAME LAST_NAME"  // Local isim değiştirme. Önce cd ile proje dosyasının içine gir.
* git config user.email "MY_NAME@example.com"  // Local mail değiştirme. Önce cd ile proje dosyasının içine gir.

## LOCAL REPOSITRY - LOCAL REPO

* git init // proje dosyasının içinde çalıştır. Yeni bir git repository initialize etmek için
* git status // dosyaların statüsü ile ilgili bilgi almak için kullanılır.
* nothing to commit, working tree clean --> gibi bir yazı çıkıyorsa demek ki bilgisayarındaki dosylarla gite gönderdiğin dosyalar
arasında hiçbir değişiklik yok, yapılmamış.
* git status -s // statusu kısaca gösterir.
* git add . // Bu işlem ile tüm dosyalarımızı staging'e (geçiş bölgesine) gönderiyoruz.
* git add index.html // Eğer sadece index.html dosyasında değişiklik yapılmışsa bu şekilde eklenir.
* git add -A  // Birden fazla dosyada değişiklik veya dosya ekleme-silme yapmışssan hepsini staging'e eklemek için kullanılır.

* NOT :  "git add -A" command will add all modified and untracked files in the entire repository.
 "git add ." will only add modified and untracked files in the current directory and any sub-directories.

* git commit -m 'Baslangıç Dosyları Gönderildi' // staging'deki dosyaları commit etme yani git'e gönderme. Yaptığın işlemi de açıkla.
* git commit // Bu komut ile vim açılır. En üstte yorum yapabilirsin. Kapatmak için: Esc - :x! - Enter
* git commit -am "css bgcolor chanced"  // hem add işlemini hem commit işlemini beraber yaptık.
* touch text.txt  // text.txt dosyasını oluşturduk.
* rm text.txt // text.txt dosyasını sildik.
* ls -al // tüm dosyaları uzun formatıyla gösterir.
* mv text.txt readme.txt  // text.txt dosyasının ismini readme.txt olarak değiştirdik.
* git restore --staged index.html // değişiklik yaptığımız dosyayı staging'e gönderdikten sonra vazgeçersek ve geri almak istersek
* git restore index.html // değişiklikleri asıl dosyadan da geri almak istediğimizde
* git show // son yapılan commit'i gösterir
* git log //  yapılan tüm commit'leri gösterir  
* "q" veya "z" ye basarak git log sonuçları kapatılır
* git log --oneline  // git commitlerini daha kısa halde gösterir
* git log -p -2 // son iki log'u görmek istersen
* git log --since=30minutes // son 30 dk da yapılan commitleri loglamak için.
* git log --since=5hours / 2days / 4weeks
* git checkout #kod  // bütün kodların #kodunu belirttiğin zamanki hale dönüyor.
* git checkout master // kodların şimdiki haline geri dönüyor
* git revert #kod // sadece o kod'a ait değişikliği geri alabiliyoruz. Sonrasını değiştirmiyor
* git reset --soft #kod // kod kısmına kadar olan tüm değişikleri sadece git'den geri çeker. RİSKLİ
* git reset --mixed #kod // kod kısmına kadar olan tüm değişikleri sadece stagin'den de geri çeker. RİSKLİ
* git reset --hard #kod // kod kısmına kadar olan tüm değişikleri sadece local bilgisayarda da geri alır. RİSKLİ

* touch .gitignore // commit ettiğimde hangi dosyaların değişikliklerini görmek istemiyorsam bunun içine yazarım.
  - Dosya görmek istemiyorsam --> directory/
  - Tüm xyz uzantılı şeyleri görmek istemiyorsam --> *.xyz

###

* git rm -r --cached . // tüm takip ettiği dosyaları bırakıyor. untracked oluyor.
* rm -rf .git // Delete Repository
  - git init   // And create new one


## BRANCH

* git branch cssbranch  // farklı görevlerde bulunanlar için branch oluşturuyoruz
* git branch htmlbranch // farklı görevlerde bulunanlar için branch oluşturuyoruz
* git branch -a  // tüm branchleri gösterir
* git checkout cssbranch // cssbranch'ına gidiyorsun
* git checkout htmlbranch // htmlbranch'ına gidiyorsun. Örneğin htmlbranch'ındaysan cssbranch'ında yapılan değişikleri göremezsin.
* git checkout master // bu tüm branchları kapsıyor. Ancak merge etmezsen
  master branch'ındayken htmlbranch'ında veya cssbranch'ında yapılan değişiklikleri göremezsin
* git checkout -b cssbranch  // hem branch'i oluşturursun hem de içine girersin.  


## VSCODE

* code . // Git bash'de dosyanın içine girip code . yazdığında vscode açılır.
* VSCode da terminal kısmında sağda cmd-powershell-git bash seçenekleri var. git-bash'i seçip git bash'i entegre edebiliriz.


## GITHUB


* pwd // hangi dizindeyiz (gitbash)
* mkdir githubprojects  // yeni klasor oluşturduk (gitbash)

* Github'da oluşturduğun repository ismiyle gitbash'de bir klasor oluştur. İçine gir. Alttaki komutu çalıştır.
* echo "# starter" >> README.md // echo bir şeyler yazdırmak için kullanılır. Burada README.md oluştur ve içine # starter yaz dedik.
* git init  // yeni bir git repository oluşturduk.
* git add README.md //staging'e aldık
* git commit -m "ilk commit" // ilk commit'imizi yaptık
* git remote add origin https://github.com/atsdeniz/starter.git  // bilgisayarımda bulunan git repository'i
uzak repository adresine(github) bağlıyorum.

* git push -u origin master  // github'a push ediyoruz

* Örneğin klasörümüzde index.html oluşturduk. Githuba ekleme Adımları:
git add index.html
git commit -m "index.html oluşturuldu"
git push // github'a göndeririz


* Github'da bir repository oluşturduk. Bunu clone'lamak için:
git clone https://github.com/atsdeniz/genesis.git  // kullanılır


* git remote -v  // push veya pull ettiğin url'leri gösterir

* git fetch  // uzaktaki değişikleri sadece alır. Hata varsa gösterir.
* git merge // Uzaktaki değişikleri fetch'den sonra merge eder. Bir nevi bizde de kaydeder.
* :wq  // git mergeden sonra vimden çıkmak için
* git pull = git fetch + git merge  // github'dan veri çekmek için direk git pull kullanabiliriz.

* Örneğin remote'da css dosayasında bir deişiklik, local'de html dosyasında bir değişiklik yaptın. Daha sonra localdeki değişikliği
add ve commit işlemlerinden sonra (bu işlemlerde hata almazsın) push etmek istersen hata alırsın. Önce remote'daki
değişikliği al diye. Önce fetch daha sonra merge (veya pull(fetch+merge)) ile remote'daki değişikliği localde de kaydedersin.
Sonraki adımda localdeki değişikliği push edersin.

* Örneğin hem localde hem remote'da aynı dosyanın aynı yerinde değişiklik yaptın. Hem push hem pull hata verir. Bu hatayı verdikten
localdeki dosyanın içine iki değişikliği de yazar. Hatayı düzeltmek için dosyanın içine girip istemediğin değişikliği silip
kaydedersin. daha sonra add, commit, push işlemlerini yaparsın.


* git push origin branchismi  // bi branch'in içinde add ve commit işlemlerinden sonra push işlemi bu şekilde yapılır.
* Branch'ta yaptığın değişikliği github'a push ettikten ve gerekli onayları verip github'da master'a aldıkktan sonra:
git bash'de master'a geçip git pull yapmalısın.


* git branch -d branchismi   // branch silme işlemi


* Github projene farklı çalışma arkadaşları eklemek için projenin sayfasında "settings" kısmına gir. "Collaborators" ve "add people"
seçenekleri ile yeni kişi ekle. Eklediğin kişi kendi sayfasında onaylamalı.

* Açık kaynak kodlu projelere nasıl katkıda bulunabiliriz. Bi proje buluyorsun "Fork" seçeneğini seçiyorsun. Ve projenin bir kopyası
senin repository sayfana kaydediliyor. Daha sonra "git clone forkprojesi" diyerek projeyi kendi local'ine indirip
üzerinde çalışabilirsin. Gerekli değişikleri yaptıktan sonra kendi sayfana push et ve "pull request" kısmından ilgili
yere değişiklikler için izin gönder. "Spoon-Knife" pull-request için oluşturulan bir sayfa


## GITHUB WEB SAYFASI HOST ETME

* Github'da static web sayfalarımızı host edebiliriz:
- "New Repository" --> githubismin.github.io (githubismin = owner kısmındaki isim , örnek: atsdeniz.github.io)
- README.md olsun --> "create repository"
- "git clone" ile sayfayı kendi localine indir
- Değişiklikler veya eklemelerden sonra githuba push et
- İlgili repositoryde "settings" --> "pages" kısmında web sayfana tıklayıp görebilirsin
