# Keep Play Sound with Background Modes
Play mp3 with AVAudioPlayer and keep playing in the background even if the app is closed

```swift


import UIKit
import AVFoundation

class ViewController: UIViewController {

    var soundPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            let filePath = Bundle.main.path(forResource: "shortmusic", ofType: ".mp3")
            soundPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: filePath!))
            soundPlayer.prepareToPlay()
        }catch{
            print(error.localizedDescription)
        }
        
    }

    @IBAction func playMusic(_ sender: Any) {
        soundPlayer.play()
    }
    
    @IBAction func stopMusic(_ sender: Any) {
        soundPlayer.stop()
    }
    
}

```