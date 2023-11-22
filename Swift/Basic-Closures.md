# Closures



<b><span style='color: orange;'>Functions Using</span></b>

```swift
func greetUser() {
    print("Hi there!")
}
greetUser()

var greetCopy = greetUser
greetCopy()

var greetCopyTypeAnnotation: () -> Void = greetUser
```

```swift
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)  // we didn't use for. Because we are not calling a function directly
print(user)
```


<b><span style='color: orange;'>Closures Using</span></b>

 ```swift
let sayHello = {
    print("Hi there!")
}
sayHello()
 ```


```swift
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello("Taylor")
```

<b><span style='color: orange;'>Note</span></b>

* External parameter names only matter when we’re calling a function directly, not when we create a closure or when we take a copy of the function first.

```swift
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)


let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
```