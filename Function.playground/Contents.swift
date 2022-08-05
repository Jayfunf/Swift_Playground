import UIKit
import Foundation

//MARK: Default Parameters
func me(name: String = "Minion", age: Int = 24) { // Argument Label과 Parameter Name을 동시에 사용
    print("My name is \(name). My age is \(age)!")
}
me()
me(name: "Jay", age: 20)

//MARK: Variadic Parameters (가변 파라미터)
func printSum(nums: Int...) {
    print("\(nums[0]+nums[1]+nums[2])")
}
printSum(nums: 1,2,3) // 6

//MARK: 두 개 이상의 가변 파라미터
func doubleVariadic(first: Int..., second: Int...) {
    print(first, second)
}
doubleVariadic(first: 1,2,3,4,5, second: 5,4,3,2,1) // [1, 2, 3, 4, 5] [5, 4, 3, 2, 1]

//MARK: 가변 파라미터 뒤의 파라미터 Argument Label 생략 시 에러
//func test(of first: Int..., _ initValue: Int) {  } // error: A parameter following a variadic parameter requires a label
//
//func test2(first: Int... = 10) {  } // Variadic parameter cannot have a default value

//MARK: In-Out Parameters (입출력 파라미터)
//func someFunction(name: String) {
//    name = "Hi" // Error: Cannot assign to value: 'name' is a 'let' constant
//}
// 위처럼 함수 내에서 파라미터를 변경할 수 없다. 하지만 In-Out 파라미터를 사용하면 변경이 가능하다.
func nameChanger(name: inout String) {
    name = "Minion"
    print("Hello, \(name)")
}
var name: String = "Jay"
nameChanger(name: &name)

//MARK: Value Type & Reference Type in Function
//MARK: - Value Type
func valueFunc(name: String) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("Check #2 : \(name)")
    }
    //print("Hi Value Type: \(name)")
}
var myName: String = "Minion"
valueFunc(name: myName)
myName = "Jay"
print("Check #1 : \(myName)")

//MARK: - Reference Type
class Person {
    var name: String = "Minion"
}

func referenceFunc(person: Person) {
    person.name = "Jay"
}

var minion = Person()
referenceFunc(person: minion)
print("Hi Reference Type: \(minion.name)")

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

//MARK: Function Type
//Parameter X
func someFunction1() {} // () -> ()
//Parameter O
func someFunction2(name: String) {} // (String) -> ()
//Return X
func someFunction3() {} // () -> ()
//Return O
//func someFunction4(name: String) -> String {} // (String) -> (String)
//In-Out
func someFunction5(name: inout String) {} // (inout String) -> ()


