# SQLite 

```swift
//  ViewController.swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        copyDatabase()
        
        //Kisilerdao().kisiEkle(kisi_ad: "Pinar", kisi_yas: 30)
        //Kisilerdao().kisiEkle(kisi_ad: "Melisa", kisi_yas: 26)
        //Kisilerdao().kisiEkle(kisi_ad: "Buğra", kisi_yas: 43)
        
        //Kisilerdao().kisiSil(kisi_id: 3)
        
        //Kisilerdao().kisiGuncelle(kisi_id: 2, kisi_ad: "Buğra", kisi_yas: 19)
        
        //let sonuc = Kisilerdao().kisiKontrol(kisi_ad: "Pinar")
        //print("Sonuc: \(sonuc)")
        
//        let tumKisiler = Kisilerdao().tumKisileriAl()
//        for kisi in tumKisiler {
//            print("ID: \(kisi.kisi_id!), Ad: \(kisi.kisi_ad!), Yas: \(kisi.kisi_yas!)")
//        }
        
        let aramaSonucuKisiler = Kisilerdao().kisilerAramaYap(kisi_ad: "e")
        for kisi in aramaSonucuKisiler{
            print("ID: \(kisi.kisi_id!), Ad: \(kisi.kisi_ad!), Yas: \(kisi.kisi_yas!)")
        }
        
        
    }
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "kisilergiris", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let pathToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("kisilergiris.sqlite")
        
        if fileManager.fileExists(atPath: pathToCopy.path){
            print("Database is exists. No need to copy")
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: pathToCopy.path)
            }catch{
                print(error)
            }
        }
        
    }


}

```


```swift
//  Kisilerdao.swift
import Foundation

class Kisilerdao{
    
    let db:FMDatabase?
    
    init(){
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let pathToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("kisilergiris.sqlite")
        
        db = FMDatabase(path: pathToCopy.path)
    }
    
    func kisiEkle(kisi_ad:String, kisi_yas:Int){
        db?.open()
        
        do{
            try db?.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_yas) VALUES (?,?)", values: [kisi_ad, kisi_yas])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func kisiGuncelle(kisi_id:Int, kisi_ad:String, kisi_yas:Int){
        db?.open()
        
        do{
            try db?.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_yas = ? WHERE kisi_id = ?", values: [kisi_ad, kisi_yas, kisi_id])
        }catch{
            
        }
        
        db?.close()
    }
    
    func kisiSil(kisi_id:Int){
        db?.open()
        
        do{
            try db?.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
        }catch{
            
        }
        
        db?.close()
    }
    
    
    func tumKisileriAl() -> [Kisiler] {
        var kisilerListe = [Kisiler]()
        db?.open()
        
        do{
            //let rs = try db!.executeQuery("SELECT * FROM kisiler LIMIT 2", values: nil) // 2 veri alır
            //let rs = try db!.executeQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 2", values: nil) // rastgele 2 kisiyi alır
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while rs.next(){
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id")!)!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_yas: Int(rs.string(forColumn: "kisi_yas")!)!)
                kisilerListe.append(kisi)
            }
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return kisilerListe
    }
    
    func kisilerAramaYap(kisi_ad:String) -> [Kisiler] {
        var kisilerListe = [Kisiler]()
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad LIKE '%\(kisi_ad)%'", values: nil)
            while rs.next(){
                let kisi = Kisiler(kisi_id: Int(rs.string(forColumn: "kisi_id")!)!, kisi_ad: rs.string(forColumn: "kisi_ad")!, kisi_yas: Int(rs.string(forColumn: "kisi_yas")!)!)
                kisilerListe.append(kisi)
            }
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return kisilerListe
    }
    
    func kisiKontrol(kisi_ad:String) -> Int{
        var sonuc = 0
        
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT count(*) as sonuc FROM kisiler WHERE kisi_ad = ?", values: [kisi_ad])
            while rs.next(){
                sonuc = Int(rs.string(forColumn: "sonuc")!)!
            }
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        return sonuc
    }
}

```

```swift
//  Kisiler.swift
import Foundation


class Kisiler{
    
    var kisi_id:Int?
    var kisi_ad:String?
    var kisi_yas:Int?
    
    init(){
        
    }
    
    init(kisi_id:Int, kisi_ad:String, kisi_yas:Int){
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_yas = kisi_yas
    }
    
}
```