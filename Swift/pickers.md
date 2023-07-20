# Date Picker

```swift
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    var datePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        /* // if want use classic datepicker view. use this code block
        if #available(iOS 13.4, *){
            datePicker?.preferredDatePickerStyle = .wheels
        }
        */
        dateTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(self.showDate(_:)), for: .valueChanged)
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaAct))
        view.addGestureRecognizer(dokunmaAlgilama)
       
    }
    
    @objc func showDate(_ dataPicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let alinanTarih = dateFormatter.string(from: dataPicker.date)
        dateTextField.text = alinanTarih
    }
    
    @objc func dokunmaAlgilamaAct(){
        view.endEditing(true)
    }
}
```


# Time Picker

```swift

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        /* // if want use classic time picker view. use this code block
        if #available(iOS 13.4, *){
            timePicker?.preferredDatePickerStyle = .wheels
        }
        */
        timeTextField.inputView = timePicker
        timePicker?.addTarget(self, action: #selector(showTime(timePicker:)), for: .valueChanged)
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokunmaAlgilamaAct))
        view.addGestureRecognizer(dokunmaAlgilama)
       
    }
    
    @objc func showTime(timePicker:UIDatePicker){
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        let alinanSaat = timeFormatter.string(from: timePicker.date)
        timeTextField.text = alinanSaat
    }
    
    @objc func dokunmaAlgilamaAct(){
        view.endEditing(true)
    }
}
```

# Picker View

```swift
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var ulkelerLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var ulkeler = [String]()
    var secilenUlke:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        ulkeler = ["Türkiye", "Japonya", "Almanya", "Tayland", "Amerika"]
        
    }
    
    // Sütun sayısı
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Satır sayısı
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    // Picker View'de görünecek veriler
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    // Seçilen veriyi label'a atama 
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        secilenUlke = ulkeler[row]
        ulkelerLabel.text = secilenUlke
    }

    // Butona bastığımızda seçilen veriyi ekrana yazdırma
    @IBAction func gosterAct(_ sender: Any) {
        print("secilenUlke: ", secilenUlke!)
    }
    
}

```

## Use Picker View with TextField
When click TextField Picker View opens and then selected item seem in TextField

```swift
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var ulkeTextField: UITextField!
    var pickerView: UIPickerView?
    var ulkeler = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ulkeler = ["Almanya", "Fransa", "İtalya", "İspanya", "İzlanda"]

        pickerView = UIPickerView()
        pickerView?.delegate = self
        pickerView?.dataSource = self
        
        ulkeTextField.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ulkeTextField.text = ulkeler[row]
    }
}
```

## Add Button on Picker View

```swift
//
//  ViewController.swift
//  Picker View
//
//  Created by deniz on 20.07.2023.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var ulkeTextField: UITextField!
    var pickerView: UIPickerView?
    var ulkeler = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ulkeler = ["Almanya", "Fransa", "İtalya", "İspanya", "İzlanda"]
        
        pickerView = UIPickerView()
        pickerView?.delegate = self
        pickerView?.dataSource = self
        ulkeTextField.inputView = pickerView
        
        let toolbar = UIToolbar()
        toolbar.tintColor = .red
        toolbar.sizeToFit()
        
        let tamamButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.tamamTikla))
        let boslukButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let iptalButton = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(self.iptalTikla))
        
        toolbar.setItems([iptalButton, boslukButton, tamamButton], animated: true)
        ulkeTextField.inputAccessoryView = toolbar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ulkeTextField.text = ulkeler[row]
    }
    
    @objc func tamamTikla(){
        view.endEditing(true)
    }
    
    @objc func iptalTikla(){
        ulkeTextField.text = ""
        ulkeTextField.placeholder = "Ülke Seç"
        view.endEditing(true)
    }
}


```
