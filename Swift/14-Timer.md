# Timer

```swift
//  ViewController.swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sayacLabel: UILabel!
    
    var sayici:Timer?
    var sayac1:Int = 1
    var sayac2:Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sayacLabel.text = ""
    }

    @IBAction func sayacBaslat(_ sender: Any) {
        sayici = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sayacArttir), userInfo: nil, repeats: true)
    }
    
    @objc func sayacArttir(){
        sayacLabel.text = String(sayac1)
        sayac1 += 1
        
        if sayac1 > 6 {
            sayici?.invalidate()
            sayacLabel.text = "Süre Bitti"
            sayac1 = 1
        }
    }
    
    @objc func sayacAzalt(){
        sayacLabel.text = String(sayac2)
        sayac2 -= 1
        
        if sayac2 < 0 {
            sayici?.invalidate()
            sayacLabel.text = "Süre Bitti"
            sayac2 = 5
        }
    } 
}

``````