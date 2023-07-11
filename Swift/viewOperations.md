# SWIFT

Go back in **Present Modally**

```swift
@IBAction func back(_ sender: Any) {
    self.dismiss(animated: true)
}

```

Go another ViewController in **Present Modally**
```swift
@IBAction func goto2(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let goController = storyboard.instantiateViewController(withIdentifier: "page2") as! ViewController2
    self.present(goController, animated: true, completion: nil)
}

```

Go back in **Show(Push) Segue**

```swift
@IBAction func back(_ sender: Any) {
    navigationController?.popViewController(animated: true)
}
```

Go another ViewController in **Show(Push) Segue**

```swift
@IBAction func goto1(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let goController = storyboard.instantiateViewController(withIdentifier: "page1") as! ViewController
    navigationController?.pushViewController(goController, animated: true)
}
```

Go back to first page **Show(Push) Segue**
```swift
@IBAction func basaDon(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
}
```

Hide Back Button in **Show(Push) Segue**

```swift
override func viewDidLoad(){
    super.viewDidLoad()

    self.navigationItem.hidesBackButton = true
}
```
 
Listening to transitions between pages

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "go3to1"{
        print("3'ten 1'e geçiş yapıldı")
    }
    if segue.identifier == "go3to2"{
        print("3'ten 2'ye geçiş yapıldı")
    }
}
```

### Data Transfer between Views

Completely with Code -- Present Modaly

```swift
// First View
// Create a TextField and a Button 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()  
    }
    
    // This is the important part
    @IBAction func sendDataAct(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        controller.labelText = textField.text
        self.present(controller, animated: true, completion: nil)
    }
}

// Second View 
// Create a Label

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelField: UILabel!
    var labelText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelField.text = labelText   
    }
}
```

Completely with Code -- Show

```swift
// First View
// Create a TextField and a Button 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()  
    }
    
    // This is the important part
    @IBAction func sendDataAct(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        controller.labelText = textField.text
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// Second View 
// Create a Label
import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelField: UILabel!
    var labelText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelField.text = labelText   
    }
}
```

Object Transfer between Views

```swift

//Create Kisiler.swift file
import Foundation

class Kisiler {
    var kisiId: Int?
    var kisiAd: String?
    
    init(){}
    
    init(kisiId:Int, kisiAd:String){
        self.kisiId = kisiId
        self.kisiAd = kisiAd
    }
}


// First View
// Create a Button 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()  
    }
    
    // This is the important part
    @IBAction func sendDataAct(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let kisi1 = Kisiler(kisiId: 10, kisiAd: "Deniz")
        controller.kisi = kisi1
        self.navigationController?.pushViewController(controller, animated: true)
        //self.present(controller, animated: true, completion: nil) // we can do with present modaly
    }
}

// Second View 
// Create two Labels

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var kisiIdLabel: UILabel!
    @IBOutlet weak var kisiAdLabel: UILabel!
    var kisi = Kisiler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kisiIdLabel.text = String(kisi.kisiId!)
        kisiAdLabel.text = kisi.kisiAd!  
    }
}
```