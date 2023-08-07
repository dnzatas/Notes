# Table View

```swift

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var ulkeler = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye","Tayvan", "Tayland", "Türkmenistan", "Tacikistan", "Tunus", "Tanzanya"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulkeler.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        if #available(iOS 14.0, *){
            var content = cell.defaultContentConfiguration()
            content.text = ulkeler[indexPath.row]
            cell.contentConfiguration = content
        }else{
            cell.textLabel?.text = ulkeler[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(ulkeler[indexPath.row])
    }
}
```

## Add action on Table View

```swift
func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let silAction = UIContextualAction(style: .destructive, title: "Sil"){
        (contextualAction, view, boolValue) in
        print("\(self.ulkeler[indexPath.row]) yi sil")
    }
        
    let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
        (contextualAction, view, boolValue) in
        print("\(self.ulkeler[indexPath.row]) yi düzenle")
    }
        
    return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])       
}
```

## Use Table View with Extensions
```swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var ulkeler = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeler = ["Türkiye","Tayvan", "Tayland", "Türkmenistan", "Tacikistan", "Tunus", "Tanzanya"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ulkeler.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
        if #available(iOS 14.0, *){
            var content = cell.defaultContentConfiguration()
            content.text = ulkeler[indexPath.row]
            cell.contentConfiguration = content
        }else{
            cell.textLabel?.text = ulkeler[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(ulkeler[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            (contextualAction, view, boolValue) in
            print("\(self.ulkeler[indexPath.row]) yi sil")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            (contextualAction, view, boolValue) in
            print("\(self.ulkeler[indexPath.row]) yi düzenle")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
}

```

## Work with Multiple Table View
```swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var countryTableView: UITableView!
    
    var countries:[String] = [String]()
    var cities:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["Spain", "England", "Egypt", "Germany", "France"]
        cities = ["Madrid", "London", "Cairo", "Berlin", "Paris"]
        
        countryTableView.delegate = self
        countryTableView.dataSource = self
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows:Int?
        
        if tableView == cityTableView{
            numberOfRows = cities.count
        }
        if tableView == countryTableView{
            numberOfRows = countries.count
        }
        return numberOfRows!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == countryTableView{
            cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
            var content = cell?.defaultContentConfiguration()
            content?.text = countries[indexPath.row]
            cell?.contentConfiguration = content
        }
        if tableView == cityTableView{
            cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
            var content = cell?.defaultContentConfiguration()
            content?.text = cities[indexPath.row]
            cell?.contentConfiguration = content
        }
        return cell!
    }
}
```

## Multiple Section in Table View

```swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var optionTableView: UITableView!
    
    var sections = ["Meyveler", "Renkler", "Hayvanlar"]
    var sectionDatas = [["Erik", "Muz", "Elma", "Ayva", "Karpuz"], ["Mavi", "Sarı", "Yeşil"], ["Aslan", "Kedi", "Vaşak", "Çıta"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionTableView.delegate = self
        optionTableView.dataSource = self
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("sectionDatas[section].count: ", sectionDatas[section].count)
        return sectionDatas[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = sectionDatas[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
}
```

## Custom Cell in Table View
Create UserTableViewCell.swift and link this page with TableViewCell in main.storyboard. And add label in TableViewCell to UserTableViewCell.swift with arrow.
```swift

//ViewController.swift
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    
    var users = [Users]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTableView.delegate = self
        userTableView.dataSource = self
        
        let u1 = Users(userId: 1, userName: "John", userPhone: "0864432326")
        let u2 = Users(userId: 2, userName: "Mary", userPhone: "9878675645")
        let u3 = Users(userId: 3, userName: "Ken", userPhone: "8840902334")
        let u4 = Users(userId: 4, userName: "Barbie", userPhone: "1238675645")
        let u5 = Users(userId: 5, userName: "Kylie", userPhone: "0474432326")
        let u6 = Users(userId: 6, userName: "Kim", userPhone: "3858675645")
        
        users.append(u1)
        users.append(u2)
        users.append(u3)
        users.append(u4)
        users.append(u5)
        users.append(u6)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        cell.userLabel.text = users[indexPath.row].userName
     
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(users[indexPath.row].userId!): \(users[indexPath.row].userName!)")
    }
}

// UserTableViewCell.swift
import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// Users.swift
import Foundation

class Users {
    
    init(){
    }
    
    var userId:Int?
    var userName:String?
    var userPhone:String?
    
    init(userId:Int, userName:String?, userPhone:String) {
        self.userId = userId
        self.userName = userName
        self.userPhone = userPhone
    }
}

```

## Add Button on Custom Cell in Table View

```swift
//ViewController.sift
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    
    var cellProtocol: UserTableViewCellProtocol?
    var indexPath: IndexPath?
    
    var users = [Users]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTableView.delegate = self
        userTableView.dataSource = self
        
        let u1 = Users(userId: 1, userName: "John", userPhone: "0864432326")
        let u2 = Users(userId: 2, userName: "Mary", userPhone: "9878675645")
        let u3 = Users(userId: 3, userName: "Ken", userPhone: "8840902334")
        let u4 = Users(userId: 4, userName: "Barbie", userPhone: "1238675645")
        let u5 = Users(userId: 5, userName: "Kylie", userPhone: "0474432326")
        let u6 = Users(userId: 6, userName: "Kim", userPhone: "3858675645")
        
        users.append(u1)
        users.append(u2)
        users.append(u3)
        users.append(u4)
        users.append(u5)
        users.append(u6)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UserTableViewCellProtocol {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        cell.userLabel.text = users[indexPath.row].userName
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(users[indexPath.row].userId!): \(users[indexPath.row].userName!)")
    }
    
    func buttonTabed(indexPath: IndexPath){
        print("User Name: \(users[indexPath.row].userName!)")
        print("User Phone: \(users[indexPath.row].userPhone!)")
        
    }
}


//  UserTableViewCell.swift
import UIKit

protocol UserTableViewCellProtocol {
    func buttonTabed(indexPath: IndexPath)
}

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    
    var cellProtocol:UserTableViewCellProtocol?
    var indexPath:IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buttonAct(_ sender: Any) {
        cellProtocol?.buttonTabed(indexPath: indexPath!)
    } 
}
```