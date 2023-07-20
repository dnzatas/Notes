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