
# Alamofire

## GET

```swift

//  ViewController.swift
import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tumKisiler()
    }
    
    
    func tumKisiler(){
        AF.request("http://kasimadalan.pe.hu/test/tum_kisiler.php", method: .get).response { response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    
                    if let gelenList = cevap.kisiler {
                        for k in gelenList {
                            print("ID: \(k.kisi_id!)")
                            print("Adı: \(k.kisi_ad!)")
                            print("Tel: \(k.kisi_tel!)")
                        }
                    }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
```

## POST

```swift
import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        kisiAra()
    }

    func kisiAra(){
        let params:Parameters = ["kisi_ad": "a"]
        
        AF.request("http://kasimadalan.pe.hu/test/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(KisiCevap.self, from: data)
                    //let cevap = try JSONSerialization.jsonObject(with: data) // serialize without KisiCevap - silme, güncelleme, insert etme işlemlerinde bu yöntemi kullan.
                    //let cevap = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    if let gelenListe = cevap.kisiler {
                        for k in gelenListe {
                            print("ID: \(k.kisi_id!)")
                            print("Ad: \(k.kisi_ad!)")
                            print("Tel: \(k.kisi_tel!)")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
```

## Kisiler and KisiCevap Object
```swift
//  Kisiler.swift
import Foundation

class Kisiler: Codable {
    var kisi_id:String?
    var kisi_ad:String?
    var kisi_tel:String?
    
    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}


//  KisiCevap.swift
import Foundation

class KisiCevap: Codable {
    
    var kisiler:[Kisiler]?
    var success:Int?
    
    init(kisiler: [Kisiler], success: Int) {
        self.kisiler = kisiler
        self.success = success
    }
}
```