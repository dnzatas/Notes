## Protocol Usage for Data 

Data showing in ViewController
```swift
//  ViewController.swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()   
    }

    @IBAction func goDetayAction(_ sender: Any) {
        performSegue(withIdentifier: "toDetay", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            let detayViewController = segue.destination as! DetayViewController
            detayViewController.delegate = self
        }
    }
    
}

extension ViewController: DetayToViewControllerProtocol {
    func sendData(message: String) {
        dataLabel.text = message
    }
}
```

Send Data from DetayViewController to ViewController with DetayToViewControllerProtocol
```swift
//  DetayViewController.swift

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    var delegate:DetayToViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sendDataAction(_ sender: Any) {
        if let message = dataTextField.text {
            delegate?.sendData(message: message)
        }
        navigationController?.popViewController(animated: false)
    }
}
```
Use DetayToViewControllerProtocol for Data Transfer
```swift
//  Protocols.swift

import Foundation

protocol DetayToViewControllerProtocol {
    func sendData(message:String)
}
```