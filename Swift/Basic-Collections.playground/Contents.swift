import UIKit

// Arrays

//var dizi = [Int]()
//var dizi2:[Int] = [1,2,3]
//var dizi3 = [Int](repeating: 0, count: 4)
var dizi1:[Int] = [1,2,3]
print(dizi1)

var meyveler:[String] = ["cilek", "elma", "muz"]
for (index, meyve) in meyveler.enumerated() {
    print("\(index). meyve: \(meyve)")
}
meyveler.append("erik")
meyveler += ["kivi"]
meyveler.insert("kiraz", at: 3)
print(meyveler[2])
print(meyveler)

print(meyveler.isEmpty)
print(meyveler.count)
print(meyveler.contains("kivi"))
//print(meyveler.min(), meyveler.max())
meyveler.reverse()
print(meyveler)
meyveler.sort()
print(meyveler)
meyveler.remove(at: 2)
print(meyveler)
meyveler.removeAll()


var sayilar = [1,2,3,4,5,6,7,8,9]
var filtSay2 = sayilar.filter({$0>3 && $0<7})
print(filtSay2)

var toplam = 0
for i in sayilar {
    toplam += i
}
var ort = toplam / (sayilar.count)
print("Ortalama: ", ort)

for (index, sayi) in sayilar.enumerated() {
    sayilar[index] = sayi*5
}
print(sayilar)

var tekSayilar = [Int]()
var ciftSayilar = [Int]()
for i in sayilar {
    if i%2 == 0{
        ciftSayilar.append(i)
    }else {
        tekSayilar.append(i)
    }
}
print(tekSayilar, ciftSayilar)


// Set

// Aynı veriden bir kere ekler. İndexleme yok. Verileri rasgele sıralar.
//var setSayilar = Set <Int>()
//var setSayilar2:Set = [1,2,3,4]
//var setSayilar3:Set<String> = ["1", "2"]
var setSayilar1 = Set <Int>()
setSayilar1.insert(1)
setSayilar1.insert(2)
setSayilar1.insert(1) // tekrar eklenmiyor
print(setSayilar1)

var tekler:Set = [1,3,5,7,9]
var ciftler:Set = [0,2,4,6,8]
var asal:Set = [2,3,5,7]

var tekAndCift = tekler.union(ciftler)
print(tekAndCift.sorted())
var kesisim1 = tekler.intersection(ciftler)
print(kesisim1)
var kesisim2 = tekler.intersection(asal)
print(kesisim2)


//Dictionary

//var dic1 = [Int:String]()
//var dic2 = [3.14:"pi", 2.21:"e"]
//var dic3:[Int:String] = [1:"bir"]

var iller = [10:"Balıkesir",4:"Ağrı"]
iller[17] = "Çanakkale"
print(iller)

iller[4] = "Yeni Ağrı"
iller.updateValue("Kale", forKey: 17)
print(iller)

for (key, value) in iller {
    print("\(key) plakalı il: \(value)")
}

iller.removeValue(forKey: 17)
print(iller)
print(iller.isEmpty, iller.count, iller.first!)

var notlar = [80, 100, 90]
var dersler = ["Tukçe", "Mat", "Bio"]
var dersVeNotlar = Dictionary(uniqueKeysWithValues: zip(notlar, dersler))
print(dersVeNotlar)

var urunFiyatlari:[Double:String] = [2.99: "Kitap", 5.30: "Kalem", 1.05: "Silgi"]
var urun = [String](urunFiyatlari.values)
var fiyat = [Double](urunFiyatlari.keys)
print(urun)
print(fiyat)

var okul:[Int:String] = [154:"Ali", 67:"Mehmet", 871:"Can", 45:"Ali"]
var sonuc1 = okul.filter({$0.key > 70})
print(sonuc1)
var sonuc2 = okul.filter({$0.value == "Ali"})
print(sonuc2)
var sonuc3 = okul.filter({$0.value == "Ali" && $0.key > 70})
print(sonuc3)


var dersNotlari = [String:Int]()
dersNotlari["Mat"] = 100
dersNotlari["Turk"] = 90
dersNotlari["Bio"] = 95
var notToplam = 0
for (key, value) in dersNotlari{
    print("\(key) : \(value)")
    notToplam += value
}
print("Ortalama: \(notToplam / dersNotlari.count)")
