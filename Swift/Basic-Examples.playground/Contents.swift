import UIKit

// celsius to fahrenheit
class Donusum {
    
    func celsToFahr(cels:Double) -> Double {
        var fahr = cels * 1.8 + 32
        return fahr
    }
}

var donustur = Donusum()
var celsius = 30.0
var fahren = donustur.celsToFahr(cels:celsius)
print("\(celsius) celsius is \(fahren) fahrenheit")



// factorial
func factorial(sayi:Int) -> Int {
    var fac = 1
    for i in stride(from: sayi, through: 1, by: -1){
        fac *= i
    }
    return fac
}
var facResult = factorial(sayi: 4)
print("factorial result: \(facResult)")



// kelime içinde harf bulma
func findWord(word:Character, text:String) -> Int {
    var count = 0
    for char in text {
        if char == word {
            count += 1
        }
    }
    return count
}
var wordCount = findWord(word: "a", text:"Today we will go to bazaar")
print("Word occurs \(wordCount) times in text")



// Kota aşımı hesaplama
func kotaAsimiHesapla(kullanim:Int) -> Int {
    var toplamOdeme = 100
    if kullanim > 50 {
        toplamOdeme += (kullanim - 50)*4
    }
    return toplamOdeme
}
var kotaAsimFiyati = kotaAsimiHesapla(kullanim: 30)
print("Kota aşımıya toplam ödemeniz: \(kotaAsimFiyati)")

