## Google Maps IOS SDK

<b>App Delegate </b>
```swift
//  AppDelegate.swift

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyDnYjeYZReDWv7cmahUsxBPLU6yap0rGlA")
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
```

<b>First Example </b>
```swift
import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet var gmsMapView:GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}
```
<b>Second Example </b>
```swift
import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet var gmsMapView:GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 40.5119594, longitude: 27.4883113, zoom:15)
        gmsMapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.5119594, longitude: 27.4883113)
        marker.title = "Avşa"
        marker.snippet = "Avşa Adası"
        marker.map = gmsMapView
    }
}
```