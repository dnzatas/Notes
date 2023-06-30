# SWIFT

Go back in **Present Modally**

```swift
@IBAction func back(_ sender: Any) {
    self.dismiss(animated: true)
}

```

Go another ViewController in **Present Modally**
```swift
@IBAction func goto2(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let goController = storyboard.instantiateViewController(withIdentifier: "page2") as! ViewController2
    self.present(goController, animated: true, completion: nil)
}

```

Go back in **Show(Push) Segue**

```swift
@IBAction func back(_ sender: Any) {
    navigationController?.popViewController(animated: true)
}
```

Go another ViewController in **Show(Push) Segue**

```swift
@IBAction func goto1(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let goController = storyboard.instantiateViewController(withIdentifier: "page1") as! ViewController
    navigationController?.pushViewController(goController, animated: true)
}
```

Go back to first page **Show(Push) Segue**
```swift
@IBAction func basaDon(_ sender: Any) {
    navigationController?.popToRootViewController(animated: true)
}
```

 
    