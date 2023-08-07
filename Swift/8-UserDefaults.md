# User Defaults

## Veri Yazma, Çekme, Silme
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
## Veri Yazmadan Veri Çekme

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sayacLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = UserDefaults.standard
        
        // String olduğunda ilk değeri vermelisin
        // var sayacStr = d.string(forKey: "sayacStr") ?? "ilk deger"
        
        // Sayacı set etmeden çektim. Integer olduğu için otomatik sıfır atadı
        var sayac = d.integer(forKey: "sayac")
        sayac += 1
        
        d.set(sayac, forKey: "sayac")
        
        sayacLabel.text = "Sayac: \(sayac)"
    }
}
```

## UserDefaults ile Başka Sayfaya Geçiş

UserDefaults'ta kayıtlı olan name ve password kontrolü yapılır. Değer varsa SecondViewController sayfasına gider. Yoksa name ve password girişi yapılır.

```swift

//  ViewController.swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel:UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let d = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = d.string(forKey: "savedName") ?? ""
        let password = d.string(forKey: "savedPassword") ?? ""
        
        if isValid(name, password){
            navigateToSecondScreen(name:name)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        nameLabel.text = ""
        passwordField.text = ""
        
        nameLabel.becomeFirstResponder()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let name = nameLabel.text ?? ""
        let password = passwordField.text ?? ""
        
        if isValid(name, password){
            d.set(name, forKey: "savedName")
            d.set(password, forKey: "savedPassword")
            navigateToSecondScreen(name:name)
        }else{
            showAlert(message: "Invalid name or password")
        }
        
    }
    
    func isValid(_ name:String, _ password:String) -> Bool{
        return !name.isEmpty && !password.isEmpty
    }
    
    func showAlert(message: String){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func navigateToSecondScreen(name:String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        controller.nameText = name
        self.navigationController?.pushViewController(controller, animated: true)
    }
        
}


//  SecondViewController.swift
import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondNameLabel: UILabel!
    let d = UserDefaults.standard
    var nameText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondNameLabel.text = nameText
        
    }
    
    @IBAction func exitButton(_ sender: Any) {
        print("exitttt")
        d.removeObject(forKey: "savedName")
        d.removeObject(forKey: "savedPassword")
        
        navigationController?.popViewController(animated: true)
        
    }
    
}

```