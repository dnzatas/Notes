# User Defaults

```swift

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = UserDefaults.standard
        
        // Veri Yazma
        d.set("Mehmet", forKey: "ad")
        d.set(18, forKey: "yas")
        d.set(true, forKey: "medeniDurum")
        d.set(1.78, forKey: "boy")
        
        let arkadasListesi = ["Ali", "Veli", "Can"]
        d.set(arkadasListesi, forKey: "arkadasListesi")
        
        let sehirler = ["16": "Bursa", "34": "Istanbul"]
        d.set(sehirler, forKey: "sehirlerDict")
        
        
        // Veri Okuma
        let ad = d.string(forKey: "ad") ?? "isim yok"
        let yas = d.integer(forKey: "yas")
        let medeniDurum = d.bool(forKey: "medeniDurum")
        let boy = d.double(forKey: "boy")
        let liste = d.array(forKey: "arkadasListesi") as? [String] ?? [String]()
        let dict = d.dictionary(forKey: "sehirlerDict") as? [String:String]
        
        print(ad, yas, medeniDurum, boy)
        print(liste[0], dict!["16"]!)
        
        // Veri Silme
        d.removeObject(forKey: "ad")
        
        let adKontrol = d.string(forKey: "ad") ?? "isim yok"
        print("adKontrol: ", adKontrol) // return "isim yok
        
    }
}
```
