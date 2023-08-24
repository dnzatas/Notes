## Map Kit 

```swift
import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let konum = CLLocationCoordinate2D(latitude:  40.5113891, longitude: 27.5025037)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "Avşa"
        pin.subtitle = "Avşa Adası"
        
        mapView.addAnnotation(pin)
        
    }
}
```