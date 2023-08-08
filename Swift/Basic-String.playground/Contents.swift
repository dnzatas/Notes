import UIKit

// String oluşturma
var str1 = "Merhaba str1"
var str2 = String("Merhaba str2")
var str3 = """
Merhaba Dünya
Bu bir deneme yazısı olup \
oldukça uzundur
"""

print(str1, str2)
print(str3)


// Boş string oluşturma
var bosStr1 = ""
var bosStr2 = String()
print(bosStr1.isEmpty, bosStr2.isEmpty)


// String'e veri ekleme \()
let a = 10
let b = 20
var abCarpim = "\(a) x \(b) = \(a*b)"
print(abCarpim)


// String birleştirme
var strBirl1 = "Merhaba "
var strBirl2 = "Dünya"
var strBirl3 = strBirl1 + strBirl2 // pek tavsiye edilen bir yöntem değil. Veri ekleme yöntemiyle daha performanslı
print(strBirl3)


// String harf sayısı bulma
print(strBirl3.count)

// String içinden harf alma
var harfAl = "Merhaba"
for a in harfAl{
    print(a, terminator: "-")
}


// String contains
var strContain = "Merhaba"
if strContain.contains("er"){
    print("içeriyor")
}

// Stringe harf ekleme
strContain.insert("c", at: strContain.index(strContain.startIndex, offsetBy: 4))
print(strContain)


// Harf silme
strContain.remove(at: strContain.index(strContain.startIndex, offsetBy: 4))
print(strContain)


// String tersten yazdırma - Uzun yol
var str4 = "Deniz"
var harfArray = [Character]()
var reverseStr = ""

for harf in str4{
    harfArray.append(harf)
}

var sayac = str4.count
for i in stride(from: (str4.count-1), through: 0, by: -1){
    reverseStr.insert(harfArray[i], at: reverseStr.index(reverseStr.startIndex, offsetBy: (i+1-sayac)))
    sayac -= 2
}
print("reverseStr: ", reverseStr)
