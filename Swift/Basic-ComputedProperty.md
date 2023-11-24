
# Computed Property

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