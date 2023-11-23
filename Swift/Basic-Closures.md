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

### Accept functions as parameters

```swift
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}


func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)
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

### Closure that accepts one parameter and returns nothing

```swift
let payment = { (user: String) in
    print("Paying \(user)…")
}
```

### Closure that accepts one parameter and returns a Boolean
```swift
let payment = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}
```

### Return a value without accepting any parameters
```swift
let payment = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}
```

### Trailing closures and shorthand syntax

```swift
// Long version of closure

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)
```

```swift
// A little bit short version of closure. Remove parameters type and return type

let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
```

```swift
// Remove parameters too

let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
```

```swift
// if closure is simplier. Use like this

let reverseTeam = team.sorted {
    return $0 > $1
}

// Shorter:

let reverseTeam = team.sorted { $0 > $1 }
```

```swift
// Closure example on a filter() function

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly) // ["Tiffany", "Tasha"]
```

* filter() function lets us run some code on every item in the array, and will send back a new array containing every item that returns true for the function

```swift
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam) // ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"]
```

*  map() function lets us transform every item in the array using some code of our choosing, and sends back a new array of all the transformed items


### Accept Closure as a parameters in functions

```swift
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}


// Shorter

animate(duration: 3, animations: {
    print("Fade out the image")
})


// Even shorter

animate(duration: 3) {
    print("Fade out the image")
}

```
#### Another examples of closure as a parameters in functions

```swift
func tendGarden(activities: () -> Void) {
	print("I love gardening")
	activities()
}
tendGarden {
	print("Let's grow some roses!")
}
```

```swift
func repeatAction(count: Int, action: () -> Void) {
	for _ in 0..<count {
		action()
	}
}
repeatAction(count: 5) {
	print("Hello, world!")
}
```

```swift
func goOnVacation(to destination: String, _ activities: () -> Void) {
	print("Packing bags...")
	print("Getting on plane to \(destination)...")
	activities()
}
goOnVacation(to: "Mexico") {
	print("Relax in sun")
	print("Go hiking")
}
```

```swift
let awesomeTalk = {
	print("Here's a great talk!")
}
func deliverTalk(name: String, type: () -> Void) {
	print("My talk is called \(name)")
	type()
}
deliverTalk(name: "My Awesome Talk", type: awesomeTalk)
```

### Accept multiple function parameters and specify multiple trailing closures

* you can make your function accept multiple function parameters if you want, in which case you can specify multiple trailing closures

```swift
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

// When it comes to call:

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
```


### Example of using Closure, filter, sorted and map

```swift
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// output
"""
7 is a lucky number
15 is a lucky number
21 is a lucky number
31 is a lucky number
33 is a lucky number
49 is a lucky number
"""

// a way
let _ = luckyNumbers.filter{!$0.isMultiple(of:2)}.sorted().map{ print("\($0) is a lucky number") }

// another way
let solve = { (numberList: [Int]) in
    numberList.filter{!$0.isMultiple(of: 2)}.sorted().map { print("\($0) is a lucky number")
    }
}

solve(luckyNumbers)
```