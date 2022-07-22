import UIKit
import Foundation

class Human {
    var name: String?
    var age: Int?
    
    init(name: String?, age: Int?) {
        self.name = name
        self.age = age
        print("\(name!) is being initialized")
    }
    
    deinit {
        print("\(name!) is being deinitialized")
    }
}
 
var reference1: Human?
var reference2: Human?
var reference3: Human?

reference1 = Human(name: "Minion", age: 24)

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil
