# Search Bar

```swift
//  ViewController.swift

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ulkeSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ulkeSearchBar.scopeButtonTitles = ["Birinci", "İkinci"]
        ulkeSearchBar.showsScopeBar = true
        
        ulkeSearchBar.delegate = self
        
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Aranan Kelime: \(searchText)")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel Tıklandı")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0{
            print("Birinci Seçildi")
        }
        if selectedScope == 1{
            print("İkinci Seçildi")
        }
    }
}

```

## Search Bar with Table View

```swift
//  ViewController.swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ulkeSearchBar: UISearchBar!
    @IBOutlet weak var ulkeTableView: UITableView!
    
    var ulkeler = ["Türkiye", "Moğolistan", "Tacikistan", "Türkmenistan", "İspanya", "İtalya", "Japonya"]
    var arananUlkeler = [String]()
    var ariyorMu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ulkeSearchBar.delegate = self
        ulkeTableView.delegate = self
        ulkeTableView.dataSource = self
        
    }
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        if searchText == ""{
            ariyorMu = false
        }else{
            ariyorMu = true
            // aradığımız kelimeyi herhangi bir yerde içeriyor mu diye sorguladığımızda
            //arananUlkeler = ulkeler.filter({$0.lowercased().contains(searchText.lowercased())})
            
            // aradığımız kelimeyi baş harflerini kıyaslayarak sorgular. Örneğin tü yazdık tü ile başlayan ülkeleri ele elır
            arananUlkeler = ulkeler.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased() })
        }
        
        print("arananUlkeler: ", arananUlkeler)
        ulkeTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if ariyorMu{
            return arananUlkeler.count
        }else{
            return ulkeler.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ulkeHucre", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        if ariyorMu {
            content.text = arananUlkeler[indexPath.row]
        }else{
            content.text = ulkeler[indexPath.row]
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if ariyorMu{
            print("Seçilen Ülke: \(arananUlkeler[indexPath.row])")
        }else{
            print("Seçilen Ülke: \(ulkeler[indexPath.row])")
        }
        
        
    }
}
```