import UIKit
import Foundation

//MARK: Default Parameters
func me(name: String = "Minion", age: Int = 24) {
    print("My name is \(name). My age is \(age)!")
}
me()
me(name: "Jay", age: 20)

//MARK: Variadic Parameters
func printSum(nums: Int...) {
    print("\(nums[0]+nums[1]+nums[2])")
}
printSum(nums: 1,2,3) // 6

//MARK: 두 개 이상의 가변 파라미터
func doubleVariadic(first: Int..., second: Int...) {
    print(first, second)
}
doubleVariadic(first: 1,2,3,4,5, second: 5,4,3,2,1) // [1, 2, 3, 4, 5] [5, 4, 3, 2, 1]

//MARK: 가변 파라미터 뒤의 파라미터 Argument Label 생략
//func test(of first: Int..., _ initValue: Int) {  } // error: A parameter following a variadic parameter requires a label
//
//func test2(first: Int... = 10) {  } // Variadic parameter cannot have a default value

//MARK: In-Out Parameters
func sayHello(name: inout String) {
    name = "Minion"
    print("Hello, \(name)")
}
var name: String = "Jay"
sayHello(name: &name)

//func someFunction(name: String) {
//    name = "Hi" // Error: Cannot assign to value: 'name' is a 'let' constant
//}

//MARK: Value Type & Reference Type in Function
func valueFunc(name: String) {}
var myName: String = "Minion"
valueFunc(name: myName)

struct Person {
    var name: String
}

func referenceFunc(person: Person) {
    //person.name = "Jay"
}

let minion = Person.init(name: "Minion")
referenceFunc(person: minion)
print(minion.name)

//MARK: Nested Function
func calcul(firstNum: Int, funcName: String ,secondNum: Int) {
    
    var result: Int = 0
    
    func plus(f: Int, s: Int) -> Int {
        return f + s
    }
    
    if funcName == "+" {
        result = plus(f: firstNum, s: secondNum)
    }
    
    print(result)
}

calcul(firstNum: 10, funcName: "+", secondNum: 20)
