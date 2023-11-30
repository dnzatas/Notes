```swift
import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    func request() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }.resume()
    }

}

```

```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.request()
    }
}
```