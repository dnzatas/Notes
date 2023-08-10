## URLSession


### GET
Get all user with using GET
```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        
    }

    func getUsers(){
        // var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/test/tum_kisiler.php")!)
        // request.httpMethod = "GET"
        
        let url = URL(string: "http://kasimadalan.pe.hu/test/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if error != nil || data == nil{
                print("hata")
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    print("result: ", json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
```

### POST
Add new user with using POST
```swift
    func addUser(){
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/test/tum_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=testTel&kisi_tel=testTel"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if error != nil || data == nil{
                print("hata")
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
```