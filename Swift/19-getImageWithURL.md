# Get Image With URL

### Get image with URL and show in app

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button1Act(_ sender: Any) {
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/thehatefuleight.png"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }
    }
    
    @IBAction func button2Act(_ sender: Any) {
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler/resimler/django.png"){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }
    }
}
```