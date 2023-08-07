# Core Data

```swift

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate


class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    var usersList = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //saveUser()
        //readUsers()
        //deleteUser()
        //updateUser()
        //readUsers()
        //readSortedUser()
        readFilteredUser()
    }
    
    func saveUser(){
        let kisi = Kisiler(context: context)
        kisi.kisi_ad = "Memet"
        kisi.kisi_yas = 77
        
        appDelegate.saveContext()
    }
    
    func readUsers(){
        do{
            usersList = try context.fetch(Kisiler.fetchRequest())
        }catch{
            print("Error occured when Users fetch")
        }
        print(usersList[0])
        for user in usersList{
            print("Name: \(user.kisi_ad!) Age: \(user.kisi_yas)")
        }
    }
    
    func deleteUser(){
        let delUser = usersList[2]
        context.delete(delUser)
        appDelegate.saveContext()
    }
    
    func updateUser(){
        let upUser = usersList[2]
        upUser.kisi_yas = 15
        
        appDelegate.saveContext()
    }
    
    func readSortedUser(){
        let fetchRequest:NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        let sort = NSSortDescriptor(key: #keyPath(Kisiler.kisi_yas), ascending: false)
        fetchRequest.sortDescriptors = [sort]
        
        do{
            usersList = try context.fetch(fetchRequest)
        }catch{
            print("Error occured when sorted Users fetch")
        }
        
        for user in usersList{
            print("Name: \(user.kisi_ad!) Age: \(user.kisi_yas)")
        }
        
    }

    func readFilteredUser(){
        let fetchRequest:NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        //fetchRequest.predicate = NSPredicate(format: "kisi_yas == %i", 15)
        //fetchRequest.predicate = NSPredicate(format: "kisi_yas > %i", 15)
        //fetchRequest.predicate = NSPredicate(format: "kisi_ad == %@ and kisi_yas == %i", "Memet", 77)
        //fetchRequest.predicate = NSPredicate(format: "kisi_ad CONTAINS %@", "a")
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "kisi_ad", "Fadime")
        
        do{
            usersList = try context.fetch(fetchRequest)
        }catch{
            print("Error occured when filtered Users fetch")
        }
        
        for user in usersList{
            print("Name: \(user.kisi_ad!) Age: \(user.kisi_yas)")
        }
    }
}
```