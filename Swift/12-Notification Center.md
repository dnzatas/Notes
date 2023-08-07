# Notification Center

Send data from SecondPageViewController.swift to ViewController with Notification Center

```swift
//  ViewController.swift

import UIKit

extension Notification.Name {
    static let broadName = Notification.Name("myBroadcast")
}

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showInfo(notification:)), name: .broadName, object: nil)
    }

    @objc func showInfo(notification: NSNotification){
        let message = notification.userInfo?["message"]
        let date = notification.userInfo?["Date"]
        let user = notification.userInfo?["user"] as! Users
        
        infoLabel.text = "User: \(user.userName!) - Date: \(date!) - Message: \(message!)"
    }
}
```

```swift
//  SecondPageViewController.swift

import UIKit

class SecondPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()   
    }
    
    @IBAction func sendInfoAction(_ sender: Any) {
        let user = Users(userName: "Deniz", userAge: 29)
        
        NotificationCenter.default.post(name: .broadName, object: nil, userInfo: ["message": "Hi", "Date": Date(), "user": user])
        dismiss(animated: true, completion: nil)
    }  
}
```

```swift
//  Users.swift

import Foundation

class Users {
    var userName:String?
    var userAge:Int?
    
    init(){
        
    }
    
    init(userName:String, userAge:Int) {
        self.userName = userName
        self.userAge = userAge
    }
}
```