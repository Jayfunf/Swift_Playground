import UIKit

protocol Animal {
    associatedtype MyType
    
    var name: MyType { get }
}

struct dog: Animal {
    var name: String {
        return "Dog"
    }
}

struct bird: Animal {
    var name: Int {
        return 10
    }
}

struct cat: Animal {
    var name: Character {
        return "A"
    }
}

var test = dog()

var test2 = bird()

var test3 = cat()

print(test.name)

print(test2.name)

print(test3.name)
