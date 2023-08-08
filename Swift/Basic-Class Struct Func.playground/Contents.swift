import UIKit


// struct
struct Urun {
    var ad:String?
    var fiyat:Double?
}

var laptop = Urun()
laptop.ad = "macbook"
laptop.fiyat = 1099.99
print("\(laptop.ad!) fiyatı: \(laptop.fiyat!)")


// class
class Arac {
    var renk:String?
    var kapasite:Int?
}

var bmw = Arac()
bmw.renk = "mavi"
bmw.kapasite = 4
print("bmw nin rengi: \(bmw.renk!), kapasitesi: \(bmw.kapasite!)")

if let temp = bmw.renk {
    print(temp)
}


// class ve structure farkı. class referans tipi, struct değer tipidir
class Ogrenci {
    var ad:String?
}
var ogrenci1 = Ogrenci()
ogrenci1.ad = "Ahmet"
var ogrenci2 = ogrenci1
print(ogrenci1.ad!, ogrenci2.ad!)
ogrenci2.ad = "Ali"
print(ogrenci1.ad!, ogrenci2.ad!) // ogrenci2'nin adı değişince ogrenci1 de değişti

struct Kopek {
    var renk:String?
}
var kopek1 = Kopek()
kopek1.renk = "beyaz"
var kopek2 = kopek1
print(kopek1.renk!, kopek2.renk!)
kopek2.renk = "kahve"
print(kopek1.renk!, kopek2.renk!) // kopek2'nin rengi değişince kopek1'in rengi değişmedi



// class - Initialization
class Kisiler {
    var ad:String?
    var yas:Int?
    init(){}
    init(ad:String, yas:Int){
        self.ad = ad
        self.yas = yas
    }
}

var kisi1 = Kisiler()
kisi1.ad = "Deniz"
kisi1.yas = 28
print(kisi1.ad!, kisi1.yas!)

var kisi2 = Kisiler(ad:"Su", yas:30)
print(kisi2.ad!, kisi2.yas!)



class Araba {
    var renk:String?
    var hiz:Int?
    var calisiyorMu:Bool?
    
    func calistir(){
        calisiyorMu = true
    }
    func durdur(){
        calisiyorMu = false
        hiz = 0
    }
    func hizlan(kacKm:Int){
        hiz! += kacKm
    }
    func yavaslat(kacKm:Int){
        hiz! -= kacKm
    }
    func bilgiAl(){
        print("Renk         : \(renk!)")
        print("Hız          : \(hiz!)")
        print("Calışıyor mu : \(calisiyorMu!)")
    }
}

var jeep = Araba()
jeep.renk = "Yeşil"
jeep.hiz = 280
jeep.calistir()
jeep.bilgiAl()
jeep.durdur()
jeep.bilgiAl()
jeep.calistir()
jeep.hizlan(kacKm: 50)
jeep.bilgiAl()
jeep.yavaslat(kacKm: 10)
jeep.bilgiAl()


class Maas{
    var maas = 1000.0
    var bonus = 1.10
    
    var haftalikMaasHesapla:Double {
        get {
            return (maas*bonus)/52
        }
        set (yeniHaftalikMaas) {
            self.maas = yeniHaftalikMaas*52
        }
    }
}

var m = Maas()
print(m.haftalikMaasHesapla)
m.haftalikMaasHesapla = 600
print(m.maas)
print(m.haftalikMaasHesapla)


// Function
func selamla(){
    let sonuc = "Hello World"
    print(sonuc)
}
selamla()

func selamla1() -> String {
    let sonuc = "Hello Ocean"
    return sonuc
}
var slm1 = selamla1()
print(slm1)

func selamla2(isim:String) -> String {
    let sonuc = "Hello \(isim)"
    return sonuc
}
var slm2 = selamla2(isim: "Deniz")
print(slm2)

func toplama(sayi1: Int, sayi2: Int) -> Int {
    let toplam = sayi1 + sayi2
    return toplam
}
var toplam1 = toplama(sayi1: 5, sayi2: 3)
print(toplam1)


// Overloading
class Hesaplayici {
    func topla(sayi1:Int, sayi2:Int){
        print("Integer toplamı: \(sayi1 + sayi2)")
    }
    func topla(sayi1:Int, sayi2:Double){
        print("Double toplamı: \(Double(sayi1) + sayi2)")
    }
    func topla(sayi1:Int, sayi2:Int, isim:String){
        print("Toplayan kisi: \(isim), toplam: \(sayi1+sayi2) ")
    }
    func topla(sayi1:Double, sayi2:Double) -> Double {
        return sayi1 + sayi2
    }
}

var h = Hesaplayici()
h.topla(sayi1: 3, sayi2: 3)
h.topla(sayi1: 4, sayi2: 2.4)
h.topla(sayi1: 1, sayi2: 1, isim: "deniz")
var doubleTopla = h.topla(sayi1: 1.1, sayi2: 1.1)
print("doubleTopla: ", doubleTopla)


// Variadic Paramaetre
func variadicParam(sayilar:Int...) -> Int {
    var toplam = 0
    print("sayilar: \(sayilar)")
    for sayi in sayilar{
        toplam += sayi
    }
    return toplam
}

var variadicToplam = variadicParam(sayilar: 1,2,3,4,5)
print("variadicToplam: ", variadicToplam)


// Birden fazla dönüş değeri olan fonksiyon
func islem(sayilar:[Int]) -> (toplam:Int, carpim:Int){
    var topla = 0
    var carp = 1
    for sayi in sayilar {
        topla += sayi
        carp *= sayi
    }
    return (topla, carp)
}

var islemSonuc = islem(sayilar: [1,2,3,5])
print("islemToplam: ", islemSonuc.toplam)
print("islemCarpma: ", islemSonuc.carpim)


// Fonksiyon Geri Dönüş Değerinin Optional Olması
func hesapla(sayi1:Int, sayi2:Int) -> Int?{
    var sonuc = sayi1*2 + sayi2*4
    return sonuc
}
var hes = hesapla(sayi1: 3, sayi2: 1)
if let t = hes{
    print("t: \(t)")
}



// Static Değişken ve Metod
class Asinifi {
    static var x = 10
    static func metod(){
        print("Hello World")
    }
}
print(Asinifi.x)
Asinifi.metod()



// Enumeration
enum WeatherType {
    case sun
    case cloud
    case rain
    case snow
}

func getHaterStatus(weather:WeatherType) -> String? {
    switch weather{
    case .sun:
        return nil
    case .cloud:
        return "ehh"
    case .rain, .snow:
        return "hate"
    }
}

var haterStatus = getHaterStatus(weather: .rain)
print(haterStatus!)




//Composition
class KisiBilgi {
    var ad:String?
    var yas:Int?
    var adres:Adres?
    
    init(ad:String, yas:Int, adres:Adres){
        self.ad = ad
        self.yas = yas
        self.adres = adres
    }
}

class Adres {
    var il:String?
    var ilce:String?
    
    init(il:String, ilce:String){
        self.il = il
        self.ilce = ilce
    }
}

var adres = Adres(il: "Bursa", ilce: "Nilufer")
var kisiBilgi1 = KisiBilgi(ad: "Memo", yas: 20, adres: adres)
print(kisiBilgi1.ad!, kisiBilgi1.yas!, kisiBilgi1.adres!.il!, kisiBilgi1.adres!.ilce!)




// Inheritance - Kalıtım
class Araclar {
    var renk:String?
    var vites:String?
    init(renk:String, vites:String){
        self.renk = renk
        self.vites = vites
    }
}

class Arabalar:Araclar {
    var kasaTipi:String?
    init(kasaTipi:String, renk:String, vites:String) {
        self.kasaTipi = kasaTipi
        super.init(renk:renk, vites:vites)
    }
}

class Nissan:Arabalar {
    var model:String?
    init(model:String, kasaTipi:String, renk:String, vites:String){
        self.model = model
        super.init(kasaTipi:kasaTipi, renk:renk, vites:vites)
    }
}

var arac1 = Araclar(renk: "mavi", vites:"manuel")
var araba1 = Arabalar(kasaTipi: "Sedan", renk:"yesil", vites:"manuel")
var nissan = Nissan(model: "t2", kasaTipi:"Sedan", renk:"beyaz", vites:"otomatik")
print(arac1.renk!, araba1.vites!, nissan.kasaTipi!)




// Override
class Hayvan {
    func sesCikar(){
        print("Ses çikar")
    }
}

class Memeli:Hayvan {

}
var mem1 = Memeli()
mem1.sesCikar()

class Kedi:Memeli{
    override func sesCikar() {
        print("miyav miyav")
    }
}
var kedi1 = Kedi()
kedi1.sesCikar()

class Kopekk:Memeli{
    override func sesCikar() {
        print("Hav hav")
    }
}
var kopek11 = Kopekk()
kopek11.sesCikar()

// Polymorphizm --> Hayvan class'ı gibi görünse de Kopekk class'ı gibi çalışır
var hayvan1:Hayvan = Kopekk()
hayvan1.sesCikar() // çıktı: Hav hav

//Type Casting-Upcasting-Downcasting
class Ev {
    var pencereSayisi:Int?
    init(pencereSayisi:Int){
        self.pencereSayisi = pencereSayisi
    }
}

class Saray:Ev {
    var kuleSayisi:Int?
    init(kuleSayisi:Int, pencereSayisi:Int){
        self.kuleSayisi = kuleSayisi
        super.init(pencereSayisi: pencereSayisi)
    }
}

let topkapi:Saray = Saray(kuleSayisi: 5, pencereSayisi: 45)
if topkapi is Saray { // Tip kontrolü
    print("Bu bir saraydır")
}else{
    print("Bu bir saray değildir")
}

let ev1:Ev = Saray(kuleSayisi: 5, pencereSayisi: 30) as Ev // Upcasting --> Saray nesnesini ev nesnesine dönüştürdük.
var ev2 = Ev(pencereSayisi: 3)
//var saray2:Saray = ev2 as! Saray  // Downcasting --> Ev nesnesini Saray nesnesine zorunlu dönüştürmeye çalıştık. Hata aldım.
var saray3:Saray? = ev2 as? Saray // Downcasting --> Ev nesnesini Saray nesnesine optional olarak dönüştürmeye çalıştık. Hata aldım
print(saray3!) // nil döndü



// Polymorphism-Type Casting-Type Checking
class Personel {
    func iseAlindi(){
        print("personel mutlu")
    }
}

class Mudur:Personel {
    func iseAl(p:Personel){
        p.iseAlindi()
    }
    
    func terfiEttir(p:Personel){
        if p is Ogretmen {
            (p as! Ogretmen).maasArttir()
        }
        if p is Isci {
            print("isçi terfi ettirilemez")
        }
        
    }
}

class Ogretmen:Personel{
    func maasArttir(){
        print("Maas artti. Ogretmen mutlu")
    }
}

class Isci:Personel{
    
}

var mudur = Mudur()
var ogretmen:Personel = Ogretmen()
var isci:Personel = Isci()
mudur.iseAl(p:ogretmen)
mudur.iseAl(p: isci)

mudur.terfiEttir(p: ogretmen)
mudur.terfiEttir(p: isci)



// Extension
extension String {
    func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func yerDegistir(yeniHarf:String, eskiHarf:String) -> String{
        return self.replacingOccurrences(of: yeniHarf, with: eskiHarf)
    }
    
    var lines:[String] {
        self.components(separatedBy: .newlines)
    }
    
}

var quote = "  The truth is rarely pure and never simple   "
var trimmedString = quote.trimmed()
print(trimmedString)

var meyve1 = "ankara"
var degisenMeyve = meyve1.yerDegistir(yeniHarf: "a", eskiHarf: "e")
print(degisenMeyve)

var lyric = """
But i keep crush
Cant stop wait stop
its gonna be right
be happy
"""
var strArray = lyric.lines
print(strArray)



//protocol
protocol Squazable {
    func howToSquaze()
}
protocol Eatable {
    func howToEat()
}

class Aslan {
    
}

class Tavuk:Eatable{
    func howToEat(){
        print("Fırında Kızart")
    }
}

class Elma:Eatable,Squazable {
    func howToSquaze(){
        print("Blendır ile sık")
    }
    func howToEat(){
        print("Dilimle ye")
    }
}

class AmasyaElmasi:Elma {
    override func howToEat(){
        print("yıka ye")
    }
}

var aslan = Aslan()
var tavuk:Eatable = Tavuk()
var elma = Elma()
var amasyaElmasi:Elma = AmasyaElmasi()

var nesneler = [aslan, tavuk, elma, amasyaElmasi] as [Any]
for nesne in nesneler {
    if nesne is Eatable{
        (nesne as! Eatable).howToEat()
    }
    if nesne is Squazable{
        (nesne as! Squazable).howToSquaze()
    }
}



// closure
let ifade = {
    print("Bu bir closure dur")
}
ifade()

let toplama = {
    (sayi1:Int, sayi2:Int) -> Int in
    return sayi1 + sayi2
}

var sonuc2 = toplama(10, 20)
print(sonuc2)

var arr2:[Int] = [1,5,2,9,17]
var buyuktenKucuge1 = arr2.sorted(by: {sayi1,sayi2 in sayi1 > sayi2})
var buyuktenKucuge2 = arr2.sorted(by: {$0 > $1})

var kucuktenBuyuge1 = arr2.sorted(by: {n1,n2 in n1 < n2})
var kucuktenBuyuge2 = arr2.sorted(by: < )
print(buyuktenKucuge1, kucuktenBuyuge1)
print(buyuktenKucuge2, kucuktenBuyuge2)



// ORNEK: class - array olusturma - array buyukten kucuge sıralama
class Ogrenciler {
    var no:Int?
    var ad:String?
    var sinif:String?
    
    init(no:Int, ad:String, sinif:String){
        self.no = no
        self.ad = ad
        self.sinif = sinif
    }
}

var o1 = Ogrenciler(no:100, ad:"Ali", sinif:"11F")
var o2 = Ogrenciler(no:104,ad: "Veli", sinif: "12C")
var o3 = Ogrenciler(no:130,ad: "Ahmet", sinif: "9A")
var o4 = Ogrenciler(no:90,ad: "Can", sinif: "11F")
var o5 = Ogrenciler(no:150,ad: "Tan", sinif: "9A")

var ogrenciListesi = [Ogrenciler]()
ogrenciListesi.append(o1)
ogrenciListesi.append(o2)
ogrenciListesi.append(o3)
ogrenciListesi.append(o4)
ogrenciListesi.append(o5)

for ogr in ogrenciListesi {
    print("**************")
    print("Öğrenci No: \(ogr.no!)")
    print("Öğrenci Ad: \(ogr.ad!)")
    print("Öğrenci Sınıf: \(ogr.sinif!)")
}

print("No'lara göre büyükten küçüğe sıralama")
var buyuktenKucugeNo = ogrenciListesi.sorted(by: {$0.no! > $1.no!})
for ogr in buyuktenKucugeNo {
    print("**************")
    print("Öğrenci: \(ogr.no!), \(ogr.ad!), \(ogr.sinif!)")
}



// ORNEK: class - composition - array oluşturma
class PersonelAdres {
    var il:String?
    var ilce:String?
    init(il:String, ilce:String){
        self.il = il
        self.ilce = ilce
    }
}

class PersonelBilgi {
    var personelNo:Int?
    var personelIsim:String?
    var perAdres: PersonelAdres?
    
    init(personelNo:Int, personelIsim:String, perAdres:PersonelAdres){
        self.personelNo = personelNo
        self.personelIsim = personelIsim
        self.perAdres = perAdres
    }
}

var a1 = PersonelAdres(il: "Bursa", ilce: "Osmangazi")
var a2 = PersonelAdres(il: "Istanbul", ilce: "Kadiköy")
var a3 = PersonelAdres(il: "Van", ilce: "Edremit")

var p1 = PersonelBilgi(personelNo: 100, personelIsim:"Ali", perAdres:a1)
var p2 = PersonelBilgi(personelNo: 110, personelIsim:"Ahmet", perAdres:a2)
var p3 = PersonelBilgi(personelNo: 90, personelIsim:"Ali", perAdres:a3)

var personelListe = [PersonelBilgi]()
personelListe.append(p1)
personelListe.append(p2)
personelListe.append(p3)

for per in personelListe {
    print(per.personelNo!, per.personelIsim!, per.perAdres!.il!, per.perAdres!.ilce!)
}


// ORNEK: class - Set - Hashable - Equatable
class Student: Hashable, Equatable {
    var no:Int?
    var name:String?
    
    init(no:Int, name:String){
        self.no = no
        self.name = name
    }
    
    var hashValue: Int {
        get {
            return no.hashValue
        }
    }
    
    static func == (lhs:Student, rhs:Student)-> Bool {
        return lhs.no == rhs.no
    }
}

var s1 = Student(no:100, name: "John")
var s2 = Student(no:130, name: "Dennis")
var s3 = Student(no:100, name:"Taylor")

var studentSet = Set <Student>()
studentSet.insert(s1)
studentSet.insert(s2)
studentSet.insert(s3)

for std in studentSet{
    print("no: \(std.no!), name: \(std.name!)")
}




// class - dictionary

class Students {
    var no:Int?
    var ad:String?
    var sinif:String?
    
    init(_ no:Int, _ ad:String, _ sinif:String){
        self.no = no
        self.ad = ad
        self.sinif = sinif
    }
}

var st1 = Students(100, "Deniz", "11F")
var st2 = Students(130, "Ali", "12T")
var st3 = Students(90, "Can", "9A")

var studentsDict = [Int:Students]()
studentsDict[st1.no!] = st1
studentsDict[st2.no!] = st2
studentsDict[st3.no!] = st3

for (studentNo, student) in studentsDict{
    print("Öğrenci No    Öğrenci Adı    Öğrenci Sınıfı")
    print("    \(studentNo)           \(student.ad!)          \(student.sinif!)")
    print("------------------------")
}




