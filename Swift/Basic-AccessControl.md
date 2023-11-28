# Access Control

* Access control **restricts access** to parts of your code from code in other source **files and modules**. This feature enables you to hide the implementation details of your code, and to specify a preferred interface through which that code can be accessed and used.

* You can assign specific access levels to individual types (**classes, structures, and enumerations**), as well as to **properties, methods, initializers, and subscripts** belonging to those types. Protocols can be restricted to a certain context, as can global constants, variables, and functions.

* Access Control Types: private, fileprivate, internal, open, public

### Private Access (class-level access control)

* A entity that we define with **private** should be accessible **only** inside the **struct or class** – by methods that belong to the struct or method, as well as any computed properties, property observers, and so on.
* Use private for “don’t let anything outside the struct or class use this.”

```swift
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
```

* Now accessing funds from outside the struct isn’t possible, but it is possible inside both deposit() and withdraw(). If you try to read or write funds from outside the struct Swift will refuse to build your code.

* There’s one extra option that is sometimes useful, which is this: **private(set)**. This means “l**et anyone read this property, but only let my methods write it.**” If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only **deposit()** and **withdraw()** could actually change the value.

* **Important**: If you use private access control for one or more properties, chances are you’ll need to create your own initializer.

```swift
struct Contributor {
	private var name = "Anonymous"
}
let paul = Contributor()
```

```swift
struct App {
	var name: String
	private var sales = 0
	init(name: String) {
		self.name = name
	}
}
let spotify = App(name: "Spotify")
```

```swift
// This usage is not correct

struct Doctor {
	var name: String
	var location: String
	private var currentPatient = "No one"
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")



// This usage is correct

struct Doctor {
	var name: String
	var location: String
	private var currentPatient = "No one"
	
	init(name: String, location: String) {
		self.name = name
		self.location = location
	}
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")


```

### File-private Access (file-level access control)

* It restricts the use of an entity to its own defining source file. fileprivate makes a declaration visible within the entire file that it’s defined in, while hiding it from all other code.
* Use fileprivate for “don’t let anything outside the current file use this.”

```swift
struct Person {
    fileprivate var name = "Can"
}

// in the same file
struct Car {
    let owner = Person().name
}

```

### Internal Access (module-level access control)

* internal is the **default access level**, and makes a declaration visible within the whole module that it’s defined in.
* It enables entities to be used within any source file from their defining module, but not in any source file outside of that module


### Public Access (more restrictive than open)

* Public access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use public access when specifying the public interface to a framework. 

### Open Access (less restrictive)

* Open access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open access when specifying the public interface to a framework.

* Open access applies only to classes and class members, and it differs from public access by allowing code outside the module to subclass and override, as discussed below in Subclassing.


#### Open access is the highest (least restrictive) access level and private access is the lowest (most restrictive) access level.