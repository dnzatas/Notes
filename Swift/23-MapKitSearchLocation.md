## Search Location with SearchBar

```swift
import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    let request = MKLocalSearch.Request()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        mapView.delegate = self
        
        let konum = CLLocationCoordinate2D(latitude: 41.0370018, longitude: 28.9850917)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        
        request.region = mapView.region
    }
}


extension ViewController: UISearchBarDelegate, MKMapViewDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        request.naturalLanguageQuery = searchBar.text!
        
        if mapView.annotations.count > 0 {
            mapView.removeAnnotations(mapView.annotations)
        }
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: { (response, error) in
            if error != nil {
                print("hata")
            }else if response!.mapItems.count == 0 {
                print("mekan yok")
            }else{
                for place in response!.mapItems{
                    if let name = place.name, let phone = place.phoneNumber{
                        print("Name: \(name)")
                        print("Phone: \(phone)")
                        print("Latitude: \(place.placemark.coordinate.latitude)")
                        print("Longitude: \(place.placemark.coordinate.longitude)")
                        
                        let pin = MKPointAnnotation()
                        pin.coordinate = place.placemark.coordinate
                        pin.title = name
                        pin.subtitle = phone
                        
                        self.mapView.addAnnotation(pin)
                    }
                }
            }
        })
    }
}
```