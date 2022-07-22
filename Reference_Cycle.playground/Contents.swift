import UIKit
import Foundation

class Person {
    let name: String
    weak var apartment: Apartment?

    init(name: String){
        self.name = name
        print("\(name) is being Init")
    }
    deinit {
        print("\(name) is being Deinit")
    }
}

class Apartment {
    let unit: String
    var tenant: Person?

    init(unit: String){
        self.unit = unit
        print("\(unit) is being Init")
    }

    deinit {
        print("\(unit) is being Deinit")
    }
}

var Minion: Person?
var unit4A: Apartment?

Minion = Person(name: "Minion")
unit4A = Apartment(unit: "4A")

Minion?.apartment = unit4A
unit4A?.tenant = Minion

Minion = nil
unit4A = nil

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
        print("\(name) is being Initialized")
    }
    deinit {
        print("\(name) is being Deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
        print("\(number) is being Initialized")
    }
    deinit {
        print("Card #\(number) is being Deinitialized")
    }
}

var Jay: Customer?

Jay = Customer(name: "Jay")
Jay!.card = CreditCard(number: 1234_5678_9012_3456, customer: Jay!)
Jay = nil
