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