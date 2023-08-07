# File Operations

File/Image write, read, delete 

```swift
//  ViewController.swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func yaz(_ sender: Any) {
        
        let mesaj = textField.text
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "dosyam.txt")
            
            do{
                try mesaj?.write(to: dosyaYolu, atomically: false, encoding: String.Encoding.utf8)
                textField.text = ""
            }catch{
                print("Yazma İşlemi Gerçekleşmedi")
            }
        }
        
        
    }
    
    @IBAction func oku(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "dosyam.txt")
            
            do{
                textField.text = try String(contentsOf: dosyaYolu, encoding: String.Encoding.utf8)
            }catch{
                print("Okuma İşlemi Gerçekleşmedi")
            }
        }
        
    }
    
    @IBAction func sil(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "dosyam.txt")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                    textField.text = ""
                }catch{
                    print("Silme İşlemi Gerçekleşmedi")
                }
            }
        }
    }
    
    @IBAction func resimKaydet(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "resim.png")
            let resim = UIImage(named: "zebra")
            do{
                try resim?.pngData()?.write(to: dosyaYolu)
            }catch{
                print("Resim Kaydetme İşlemi Gerçekleşmedi")
            }
        }
    }
    
    @IBAction func resimGoster(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "resim.png")
            self.imageView.image = UIImage(contentsOfFile: dosyaYolu.path)
        }
    }
    
    @IBAction func resimSil(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appending(path: "resim.png")
            
            if FileManager.default.fileExists(atPath: dosyaYolu.path){
                do{
                    try FileManager.default.removeItem(at: dosyaYolu)
                }catch{
                    print("Resim Silme İşlemi Gerçekleşmedi")
                }
            }
        }
    }
    
    
}

```