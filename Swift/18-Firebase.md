# Firebase

## Add Value to Firebase Realtime Database

```swift
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        kisiEkle()
    }

    func kisiEkle(){
        let yeniKisi = Kisiler(kisi_ad: "Can", kisi_yas: 14)
        let dict:[String:Any] = ["kisi_ad": yeniKisi.kisi_ad!, "kisi_yas": yeniKisi.kisi_yas!]
        
        let newRef = ref?.child("kisiler").childByAutoId()
        newRef?.setValue(dict)
    }

}
```

## Delete Value from Firebase Realtime Database

```swift
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        kisiSil()
    }

    func kisiSil(){
        ref?.child("kisiler").child("-NbtKg_oOhYe9dIKdme4").removeValue()
    }

}
```

## Update Value on Firebase Realtime Database

```swift
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        kisiGuncelle()
    }

    func kisiGuncelle(){
        //let yeniKisi:[String:Any] = ["kisi_ad": "Talha", "kisi_yas": 35] // yeniKisi updateChildValues kısmına direk yaz
        ref?.child("kisiler").child("-NbtJwGI4oBt55k7Ku70").updateChildValues(["kisi_ad": "Talha"])
    }
}
```

## Get All Values from Firebase Realtime Database

```swift
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        tumKisiler()
    }

    func tumKisiler(){
        ref?.child("kisiler").observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yas: \(kisi_yas)")
                        print("******************")
                    }
                }
            }
            
        })
    }

}
```

## Get Values that equal we define value from Firebase Realtime Database 

```swift
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        kisiEqualSorgu()
    }

    func kisiEqualSorgu(){
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_ad").queryEqual(toValue: "Ali")
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yas: \(kisi_yas)")
                        print("******************")
                    }
                }
            }
            
        })
    }

}
```

## Get Last Value with Limit from Firebase Realtime Database

```swift
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        kisiLimitSorgu()
    }

    func kisiLimitSorgu(){
        let sorgu = ref?.child("kisiler").queryLimited(toLast: 1)
        sorgu!.observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yas: \(kisi_yas)")
                        print("******************")
                    }
                }
            }
            
        })
    }
}
```

## Get Values that range of we define values from Firebase Realtime Database 

```swift
import UIKit
import Firebase

class ViewController: UIViewController {

    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        degerAraligiSorgu()
    }

    func degerAraligiSorgu(){
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_yas").queryStarting(atValue: 30).queryEnding(atValue: 35)
        
        sorgu!.observe(.value, with: { snapshot in
            if let gelenVeriButunu = snapshot.value as? [String:AnyObject] {
                
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let key = gelenSatirVerisi.key
                        let kisi_ad = sozluk["kisi_ad"] as? String ?? ""
                        let kisi_yas = sozluk["kisi_yas"] as? Int ?? 0
                        
                        print("Key: \(key)")
                        print("Ad: \(kisi_ad)")
                        print("Yas: \(kisi_yas)")
                        print("******************")
                    }
                }
            }
            
        })
    }
}
```

## Kisiler Object
```swift
import Foundation

class Kisiler {

    var kisi_ad:String?
    var kisi_yas:Int?
    
    init(){  
    }
    
    init(kisi_ad: String, kisi_yas: Int) {
        self.kisi_ad = kisi_ad
        self.kisi_yas = kisi_yas
    }
}
```