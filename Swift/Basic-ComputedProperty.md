
# Computed Property

## Get - Set

```swift
// vacationRemaining is computed property

struct Employee {
    var name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated) // 9

```

```swift
struct Content {
    var name: String
    let fileExtension: String
    
    // A computed property to generate a filename.
    var filename: String {
        get {
            name + "." + fileExtension
        }
    }
}

let content = Content(name: "swiftlee", fileExtension: "png")
print(content.filename) // Prints: "swiftlee.png"
```



## didSet - willSet

```swift
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1
```

```swift
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)") // first call: Current value is: []
            print("New value will be: \(newValue)") // first call: New value will be: ["Adrian E"]
        }

        didSet {
            print("There are now \(contacts.count) contacts.") // first call: There are now 1 contacts.
            print("Old value was \(oldValue)") // Old value was []"
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
```

```swift
struct BankAccount {
	var name: String
	var isMillionnaire = false
	var balance: Int {
		didSet {
			if balance > 1_000_000 {
				isMillionnaire = true
			} else {
				isMillionnaire = false
			}
		}
	}
}
```