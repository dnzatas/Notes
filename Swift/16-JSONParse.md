## JSON Parse

### JSON Parse with JSONSerialization
```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        
    }
    
    func getUsers(){
        let url = URL(string: "http://kasimadalan.pe.hu/test/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if error != nil || data == nil{
                print("hata")
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    if let kisiler = json["kisiler"] as? [[String:Any]] {
                        for kisi in kisiler {
                            print("ID: \(kisi["kisi_id"]!)")
                            print("Name: \(kisi["kisi_ad"]!)")
                            print("Tel: \(kisi["kisi_tel"]!)")
                        }
                    }

                    if let success = json["success"] {
                        print("message: \(success)")
                    }
                }
            }catch{
                print("cevappp:")
                print(error.localizedDescription)
            }
        }.resume()
    }
}
```

### JSON Parse with JSONDecoder (Codable)
```swift

// ViewController.swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }
    
    func getUsers(){
        let url = URL(string: "http://kasimadalan.pe.hu/test/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if error != nil || data == nil{
                print("hata")
                return
            }
            
            do{
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                for kisi in cevap.kisiler! {
                    print("ID: \(kisi.kisi_id!)")
                    print("Name: \(kisi.kisi_ad!)")
                    print("Tel: \(kisi.kisi_tel!)")
                }
                print("message: \(cevap.success!)")
                
            }catch{
                print("cevappp:")
                print(error.localizedDescription)
            }
        }.resume()
    }
}


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


//  KisilerCevap.swift
import Foundation

class KisilerCevap: Codable {
    
    var kisiler:[Kisiler]?
    var success:Int?
    
    init(kisiler: [Kisiler], success: Int) {
        self.kisiler = kisiler
        self.success = success
    }
}

```