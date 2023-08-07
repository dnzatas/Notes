# Notifications

```swift
//  ViewController.swift

import UIKit
import UserNotifications

class ViewController: UIViewController {

    var permissionControl:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound] , completionHandler: { (granted, error) in
            
            self.permissionControl = granted
            
            if self.permissionControl{
                print("Permisson is successful")
            }else{
                print("Permisson is not successful")
            }
            
        })
    }
    
    // Notification works background
    @IBAction func createNotificationAct(_ sender: Any) {
        
        if permissionControl {
            
            // Create notification actions
            let yes = UNNotificationAction(identifier: "yes", title: "Yes", options: .foreground)
            let no = UNNotificationAction(identifier: "no", title: "No", options: .foreground)
            let delete = UNNotificationAction(identifier: "delete", title: "Delete", options: .destructive)
            
            let category = UNNotificationCategory(identifier: "cat", actions: [yes,no,delete], intentIdentifiers: [], options:[])
            UNUserNotificationCenter.current().setNotificationCategories([category])
            
            let content = UNMutableNotificationContent()
            content.title = "Title"
            content.subtitle = "Sub Title"
            content.body = "5, 4'ten büyük mü?"
            content.badge = 1
            content.sound = UNNotificationSound.default
            content.categoryIdentifier = "cat"
            /*
            var date = DateComponents()
            date.minute = 30
            date.hour = 8
            date.day = 20
            date.month = 4
            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true) // every 4. month and 20. day at 8.30 will be triggered
            */
            
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true) // will be repeat every minute
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false) // trigger once after 10 seconds
            
            let notificationRequest = UNNotificationRequest(identifier: "Notification Request", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(notificationRequest, withCompletionHandler: nil)
        }
    }
}

// Notification also works background
extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
    
    // When click yes or no or delete this part will run
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "yes"{
            print("Doğru Cevap")
        }
        if response.actionIdentifier == "no"{
            print("Yanlış Cevap")
        }
        if response.actionIdentifier == "delete"{
            print("Cevap Verilmedi")
        }
    }
}
``````