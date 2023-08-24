## Core Location 

```swift
import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var enlemLabel: UILabel!
    @IBOutlet weak var boylamLabel: UILabel!
    @IBOutlet weak var hizLabel: UILabel!
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum:CLLocation = locations[locations.count - 1]
        enlemLabel.text = "Enlem: \(sonKonum.coordinate.latitude)"
        boylamLabel.text = "Boylam: \(sonKonum.coordinate.longitude)"
        hizLabel.text = "Hız: \(sonKonum.speed)"
    }
}
```