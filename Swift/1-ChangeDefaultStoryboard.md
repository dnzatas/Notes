## Change the Default Storyboard

* Delete **Main.storyboard** and **ViewController.swift** 
* Search **main** in search bar and delete all mains that find
* Create new **NewMainViewController.storyboard** and **NewMainViewController.swift** 
* open **NewMainViewController.storyboard** and with **class** option on the right bar connect them each other 
* open **NewMainViewController.storyboard** and in **StoryboardID** option on the right bar write storyboard id like this: **NewMainViewController**

after these steps in the SceneDelegate write these codes

```swift

//
//  SceneDelegate.swift
//  Universal News
//
//  Created by deniz on 9.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let storyboard = UIStoryboard(name: "NewMainViewController", bundle: nil)
        
        guard let MainViewController = storyboard.instantiateViewController(withIdentifier: "NewMainViewController") as? NewMainViewController else {
            return
        }
        window.rootViewController = UINavigationController(rootViewController: MainViewController)
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
```