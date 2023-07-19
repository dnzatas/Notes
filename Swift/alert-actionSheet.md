# Alert

Simple Alert 

```Swift
@IBAction func simpleAlertShow(_ sender: Any) {
        
    let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
    let iptalAction = UIAlertAction(title: "iptal", style: .cancel){
        action in
        print("iptal tıklandı")
    }
    alertController.addAction(iptalAction)
        
    let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){
        action in
        print("Tamam Tıklandı")
    }
    alertController.addAction(tamamAction)
        
    present(alertController, animated: true)
        
}
```

Advanced Alert 

```Swift
@IBAction func advancedAlertShow(_ sender: Any) {
        
    let alertController = UIAlertController(title: "Giriş", message: "Bilgileri Giriniz", preferredStyle: .alert)
        
        alertController.addTextField { textfield in
            textfield.placeholder = "Email"
            textfield.keyboardType = .emailAddress
        }
        alertController.addTextField { textfield in
            textfield.placeholder = "Password"
            textfield.isSecureTextEntry = true
        }
        
        let kaydetAction = UIAlertAction(title: "Kaydet", style: .destructive){action in
            let alinanEmail = (alertController.textFields![0] as! UITextField).text!
            let alinanSifre = (alertController.textFields![1] as! UITextField).text!
            self.labelField.text = "Email: \(alinanEmail) Sifre: \(alinanSifre)"
            
            print("Email: \(alinanEmail) \n Sifre: \(alinanSifre)")
        }
        alertController.addAction(kaydetAction)
        present(alertController, animated: true)
}
```
# Action Sheet


```Swift
@IBAction func actionSheetShow(_ sender: Any) {
        
    let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)
        
        let iptalSheet = UIAlertAction(title: "İptal", style: .cancel){action in
            print("IPTAL")
        }
        alertController.addAction(iptalSheet)
        
        let tamamSheet = UIAlertAction(title: "Tamam", style: .destructive){action in
            print("TAMAM")
        }
        alertController.addAction(tamamSheet)
        
        present(alertController, animated: true)
}
```