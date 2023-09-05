# Protocols and Generics

## Protocols

* A protocol is a set of standards that classes, structs, or enums can choose to implement in their own ways. Classes, structs, and enums can conform to protocols by providing an implementation of the protocol’s functions and properties.
* When a struct conforms to a protocol, it must implement a set of methods or properties, then it gains a set of abilities


<b><span style='color: orange;'>Protocols Using</span></b>

```swift
protocol WelcomeMessagePrinting {
    var helloMessage: String { get }
    func printHello()
}

struct Hello: WelcomeMessagePrinting {
    var helloMessage: String {
        return "Welcome"
    }
    
    func printHello() {
        print(helloMessage)
    }
}
```


<b><span style='color: orange;'>Protocols in the Swift Standard Library</span></b>

* The Swift standard library includes many useful protocols that you can have your structures, classes, or enums conform to. A useful example is Hashable.
* The Hashable protocol is used to make structs, classes, and enums able to be added to Sets and Dictionaries. 

 ```swift
 struct Store: Hashable {
  let name: String
  let products: [String]
}

let jaysPizza = Store(name: "Jay's Pizza", products: ["Pizza", "Soda", "Salad"])
var salesByStore: [Store: Double] = [jaysPizza: 100]
 ```



<b><span style='color: orange;'>Protocol Inheritance</span></b>

* A protocol can inherit from another protocol, like a class can inherit from another class. Protocols can even inherit from multiple protocols at the same time!
* A struct, class, or enum that conforms to a protocol must implement all requirements from the protocol as well as any of the protocols that it inherits from.

```swift
protocol CustomStringConvertible {
  var description: String {get}
}

protocol Car: CustomStringConvertible {
    var model: String { get }
    var topSpeed: Double { get }
    var description: String { get }
}

protocol ElectricCar: Car {
    var range: Double { get }
}

protocol GasCar: Car {
    var milesPerGallon: Double { get }
}

struct Oldsmobile: GasCar {
    let model: String
    let topSpeed: Double
    let milesPerGallon: Double
    var description: String {
        "This is an Oldsmobile \(model) with a top speed of \(topSpeed) that gets \(milesPerGallon) miles per gallon"
    } 
}

struct Tesla: ElectricCar {
    let model: String
    let range: Double
    let topSpeed: Double
    var description: String {
        "This is a Telsa \(model) with a top speed of \(topSpeed) and a range of \(range)"
    }
}

let modelX = Tesla(model: "Model X", range: 350, topSpeed: 155)
let achieva = Oldsmobile(model: "Achieva", topSpeed: 139, milesPerGallon: 32)
    
let cars: [Car] = [modelX, achieva]
for car in cars {
    print(car.description)
}
```
<b><span style='color: orange;'>Protocol Extensions</span></b>

* When defining a protocol, we might want to provide a default implementation of its properties and functions. This is useful in cases where the implementation of the functions and properties remain the same across the classes, structs, and enums that conform to this protocol

```swift
protocol IceCreamSelling {
    var flavors: [String] { get }
}

extension IceCreamSelling {
  var flavors: [String] {
    ["Vanilla", "Chocolate"]
  }
}

struct IceCreamTruck: IceCreamSelling {
    let name: String
}

struct IceCreamParlor: IceCreamSelling {
    let name: String
    var flavors: [String] {
      ["Mint Chip", "Strawberry", "Cookie Dough"]
    }
}

let misterSoftee = IceCreamTruck(name: "Mister Softee")
let popTates = IceCreamParlor(name: "Pop Tate's")

print(misterSoftee.flavors)
print(popTates.flavors)
```


## Generics

* Generics allow developers to write functions, classes, structs, and enums that can use different data types.

<b><span style='color: orange;'>Generic Functions</span></b>

* Generics allow us to create functions that make few assumptions about the underlying data types of its arguments and can be used with multiple data types.

```swift
func max<T: Comparable>(x: T, y: T) -> T {
    return x > y ? x : y
}

let maxInt = max(x: 10, y: 12)
let maxDouble = max(x: 22.87, y: 66.23)
```

```swift
func buildSingleEntryDictionary<Key, Value>(withKey key: Key, andValue value: Value) -> [Key: Value] {
    var dict = [Key: Value]()
    dict[key] = value
    return dict
}
 
let populations = buildSingleEntryDictionary(withKey: "India", andValue: 1.37)
let classes = buildSingleEntryDictionary(withKey: "Ms. Frizzle", andValue: ["Arnold", "Carlos", "Dorothy"])
```

```swift
func tripleValues<T: Numeric>(in nums: [T]) -> [T] {
    return nums.map { $0 * 3 }
}

let intArr = [1,2,3]
let doubleArr = [1.0, 2.5, 3.9]

print(tripleValues(in: intArr))
print(tripleValues(in: doubleArr))
```

<b><span style='color: orange;'>Generic Types</span></b>

* Classes, structs, and enums can also be generic, which means they can work with many different types.
* When creating instances of generic types, the instance is locked into the type it used. It can’t be assigned to an instance of the same struct with a different underlying type.

```swift
struct InformationWrapper<T> {
    var information: T
}

var stringWrapper = InformationWrapper(information: "Hello!")
var intWrapper = InformationWrapper(information: 5)
stringWrapper = InformationWrapper(information: 4.0) // ERROR: Cannot convert value of type 'Double' to expected argument type 'String'
```

* Just like for generic functions, you can also specify that the type must conform to one or more protocols:

```swift
struct HashableInformationWrapper<T: Hashable> {
    var information: T
}
```

* Many structs in the Swift standard library are generic! Arrays are one major example. The syntax below isn’t as common, but is a valid way to define arrays:

```swift
let strArr: Array<String> = Array()
let intArr: Array<Int> = Array()
```

```swift
struct GameResult<Score: Comparable> {
    let playerOne: String
    let playerTwo: String
    let playerOneScore: Score
    let playerTwoScore: Score
    func printWinner() {
        if playerOneScore > playerTwoScore {
            print("\(playerOne) Wins!")
        } else if playerOneScore < playerTwoScore {
            print("\(playerTwo) Wins!")
        } else {
            print("It's a tie!")
        }
    }
}

let ufcResult = GameResult(playerOne: "Forrest Griffin",
                           playerTwo: "Stephan Bonnar",
                           playerOneScore: 29,
                           playerTwoScore: 28)
ufcResult.printWinner()


let chessResult: GameResult<Double> = GameResult(playerOne: "Boris Spassky",
                           playerTwo: "Bobby Fischer",
                           playerOneScore: 8.5,
                           playerTwoScore: 12.5)

chessResult.printWinner()
```

<b><span style='color: orange;'>Associated Types</span></b>

```swift
protocol ValuePrinting {
    var value: String { get }
    func printValue()
}
```

* This protocol works only with a value of type String. If someone wanted to conform to ValuePrinting with a value of an Int, they would have to write a separate protocol. The above problem could be solved using a generic protocol that can accept data of any type.

```swift
protocol ValuePrinting {
   associatedtype T
   var value: T { get }
   func printValue()
}
```
* In the above definition, we have used associatedtype T, which means it is left to the conforming class or struct to specify what that type should be. 

```swift
struct StringPrinter: ValuePrinting {
    let value: String
    
    func printValue() {
        print("My string value is \(value)")
    }
}



struct DoublePrinter: ValuePrinting {
    let value: Double
    
    func printValue() {
        print("My double value is \(value)")
    }
}
```

```swift
protocol SummableCollection {
  associatedtype T: AdditiveArithmetic
  var elements: [T] { get }
  var total: T { get }
}

extension SummableCollection {
  var total: T {
    elements.reduce(T.zero, +)
  }
}

struct IntCollection: SummableCollection {
  var name: String
  var elements: [Int]
}

struct DoubleCollection: SummableCollection {
  var name: String
  var elements: [Double]
}

let revenue = DoubleCollection(name: "Monthly Revenue in Thousands", elements: [1.5, 3.2, 1.8])
let homeRuns = IntCollection(name: "Home Runs", elements: [1,0,2])

print(revenue.total)
print(homeRuns.total)
```

<b><span style='color: orange;'>Opaque Types</span></b>

<span style="color: orange;">This text appears orange.</span>
<span style="color: red;">This text appears orange.</span>

*  Protocols can be used as types

```swift
let favoriteNumber: Int = 7
let length: Double = 423.4
let purchase: String = "chair"

let describableThings: [CustomStringConvertible] = [5, "hello", [1,2,3]]

for thing in describableThings {
    print(thing.description)
}
// prints, 5, "hello", [1,2,3]
```

* Protocols can also be used as return types in functions

```swift
func getDescribableThing() -> CustomStringConvertible {
    return Bool.random() ? "hello" : 3
}

print(getDescribableThing()) // prints "hello" or 3
```

* Opaque types are introduced in Swift 5.1 and offer a powerful way to handle complex types in a more abstract and flexible manner.

###
###
sample 1
```swift
protocol Car {
  associatedtype Identifier
  var id: Identifier {get}
}

struct BMW: Car {
  let id: String
  init(id: String){
    self.id = id
  }
}

struct Volvo: Car {
  let id: Int
  init(id: Int){
    self.id = id
  }
}

func getCar() -> some Car {
//return Volvo(id: 123) // works
  return BMW(id: "aaa") // works
}

var car = getCar()
print(car) // BMW(id: "aaa")
```
###
###
sample 2
```swift
protocol ResettableCollection {
    associatedtype T
    var elements: [T] { get }
    mutating func resetAllElements()
}

struct ResettableStringArray: ResettableCollection {
    var elements = [String]()
    mutating func resetAllElements() {
        elements = elements.map { _ in "" }
    }
}

func getResettableCollection() -> some ResettableCollection{
  let rs = ResettableStringArray(elements: ["aa", "bb"])
  return rs
}

var collection = getResettableCollection()
collection.resetAllElements()
print(collection) // ResettableStringArray(elements: ["", ""])
```