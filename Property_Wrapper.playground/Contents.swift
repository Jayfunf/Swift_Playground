import UIKit

struct Address {
    private var _town: String = ""
    
    var town: String {
        get { self._town.uppercased() }
        set { self._town = newValue }
    }
    
    init(town: String) {
        self.town = town
    }
}

struct Person {
    private var _name: String = ""
    
    var name: String {
        get { self._name.uppercased() }
        set { self._name = newValue }
    }
    
    init (name: String) {
        self.name = name
    }
}

let address = Address(town: "earth")
let minion = Person(name: "minion")

print(address.town, minion.name)

/* **************************************************** */

@propertyWrapper
struct Uppercase {
    
    private var value: String = ""
    
    var wrappedValue: String {
        get { self.value }
        set { self.value = newValue.uppercased() }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Address2 {
    @Uppercase var town: String
}

struct Person2 {
    @Uppercase var name: String
}

let address2 = Address2(town: "earth")
let minion2 = Person2(name: "minion")

print(address2.town, minion2.name)
