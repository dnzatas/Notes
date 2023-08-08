import UIKit


let movie = """
A day in \
the life of \
Apple Engineer
"""
print(movie)
var sayi1 = 10, sayi2 = 15, kelime = "naber"


let character = "Daphne"
print(character.count)
print(character.uppercased())
print(movie.hasPrefix("A day"))
print(movie.hasSuffix("eer"))

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))


var urunId:Int = 2134
var urunAdi:String = "kol saati"
var urunFiyat:Double = 23.4


// Variable in String
var ad = "deniz"
var yas = 29
var myStr = "\(ad) bu sene \(yas) yaşına girecektir."
print(myStr)


// Tanımladıktan sonra değer atayabiliriz
var numara:Int
numara = 20
print(numara)


// Global - Local Variables
class Deneme {
    var x = 10
    var y = 20
    
    func topla(){
        var x = 40
        x = x + y
        print("Local x1: \(x)")
    }
    
    func carp(){
        x = x*y
        print("local x2: \(x)")
    }
}
var den = Deneme()
den.topla()
den.carp()
print(den.x)
print(den.y)

// Type Conversion
var i:Int = 42
var d:Double = 45.23
var f:Float = 44.6
var sonuc1 = Int(d)
var sonuc2 = Double(i)
var sonuc3 = Int(f)
print(sonuc1, sonuc2, sonuc3)

var str1 = String(i)
var str2 = String(d)
print(str1, str2)

// String to Int
var yazi1 = "34"
var yazi2 = "48t"
if let sayi1 = Int(yazi1){
    print("sayi1: ", sayi1)
}
if let sayi2 = Int(yazi2){
    print("sayi2: ", sayi2)
}


// TUPLE
var kisi = ("Mehmet", "Ahmet")
print(kisi.0)
print(kisi.1)
var (M, A) = kisi
print("m: ", M)
print("a: ", A)
var koord = (x:10, y:20)
print(koord.x, koord.y)


// IF
var yas2 = 18
var isim = "Ahmet"

if yas2 >= 18{
    print("reşitsiniz")
}else {
    print("reşit değilsiniz")
}

var sifre = 12345
var kullaniciAdi = "deniz"
if sifre == 1234 && kullaniciAdi == "deniz"{
    print("hoşgeldiniz")
}else {
    print("hatalı giriş")
}

// SWITCH - CASE
var gun = 2
switch gun {
    case 1:
        print("pazartesi")
    case 2:
        print("salı")
    default:
        print("böyle bir gün yok")
}


// FOR
for i in 1...5{
    print(i)
}

for i in stride(from: 0, through:20, by: 5){
    print(i)
}

for i in stride(from: 0, to: 20, by: 5){
    print(i)
}


// WHILE
var sayac = 1
while sayac < 5 {
    print("sayac: \(sayac)")
    sayac += 1
}


for i in stride(from: 8, through: 0, by: -2){
    print("döngü1: \(i)")
}

var sayac2 = 8
while sayac2 >= 0 {
    print("sayac2: \(sayac2)")
    sayac2 -= 2
}

var isim2 = "Abdul"
for i in 1...isim2.count {
    print("\(i). \(isim2)")
}

// Random Number

var rastgeleSayi = Int.random(in: 0...9)
print("rastgeleSayi: \(rastgeleSayi)")


// Date
let tarih = Date()
let takvim = Calendar.current
let yil = takvim.component(.year, from: tarih)
let ay = takvim.component(.month, from: tarih)
let gun1 = takvim.component(.day, from: tarih)
print(tarih)
print(yil, ay, gun1)


// Optional
var str3:String? // ? str3 değer içerebilir veya nil olabilir
str3 = "ahmet"
if str3 != nil {
    print(str3!)
}else {
    print("str nil değeri içeriyor")
}

var str4:String?
str4 = "ali"
if let temp = str4 {
    print(temp)
}else {
    print("str4 nil değer içeriyor")
}

