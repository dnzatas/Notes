import UIKit


// guard
// guard koşul ifadesi false ise çalışır. return veya throw ifadesi ile kullanılır

func kisiTanima1(ad:String){
    if ad == "Ahmet"{
        print("Hoşgeldin Ahmet")
    }else {
        print("Tanınmayan kişi")
    }
}

func kisiTanima2(ad:String){
    guard ad == "Ahmet" else {
        print("Tanınmayan kişi")
        return
    }
    print("Hoşgeldin Ahmet")
}

kisiTanima1(ad:"Ahmetx")
kisiTanima1(ad:"Ahmet")


func buyukHarfYap1(str:String?){
    if let temp = str {
        print(temp.uppercased())
    }else{
        print("String degeri nil")
    }
}

func buyukHarfYap2(str:String?){
    guard let temp = str, temp.count > 0 else {
        print("String degeri nil")
        return
    }
    print(temp.uppercased())
}

buyukHarfYap1(str: "deniz")
buyukHarfYap2(str: nil)


// Exception - throws - do/try/catch
// 1. Örnek
enum PasswordError: Error {
    case short, obvious
}

let password = "12345"

func checkPassword(_ password:String) throws -> String {
    if password.count < 5 {throw PasswordError.short}
    if password == "12345" {throw PasswordError.obvious}
    
    if password.count < 8 {
        return "OK"
    }else if password.count < 10{
        return "Good"
    }else{
        return "Excellent"
    }
}

//var aa = checkPassword(password)
//print("aa", aa)

do{
    let result = try checkPassword(password)
    print(result)
}catch PasswordError.short{
    print("Use longer password ")
}catch PasswordError.obvious{
    print("This password is very simple")
}catch {
    print("there was error")
}

//let result2 = try! checkPassword(password)
//print(result2)

// 2. Örnek
enum IslemHatalari: Error {
    case sifiraBolunmeHatasi
}

func sayiBolme(sayi1: Int, sayi2:Int) throws -> Int {
    if sayi2 == 0 {
        throw IslemHatalari.sifiraBolunmeHatasi
    }
    return sayi1 / sayi2
}


do {
    let result = try sayiBolme(sayi1: 10, sayi2: 0)
    print(result)
}catch IslemHatalari.sifiraBolunmeHatasi {
    print("Sıfıra bölünme hatası")
}


// dispatch queue (THREAD)
var queue1 = DispatchQueue(label: "label1", qos: DispatchQoS.userInitiated)
var queue2 = DispatchQueue(label: "label2", qos: DispatchQoS.background)

queue1.async {
    for i in 1...10{
        print(i)
    }
}

queue2.async {
    for i in 100...110{
        print(i)
    }
}

for i in 100...110{
    print(i)
}

//dispatch queue - gecikme
var queue3 = DispatchQueue(label: "label3", qos: DispatchQoS.userInitiated)
var gecikme:DispatchTimeInterval = .seconds(2)
print(Date())
queue3.asyncAfter(deadline: .now()+gecikme){
    print(Date())
}
