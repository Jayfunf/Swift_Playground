import UIKit

//MARK: Default Parameters
func me(name: String = "Minion", age: Int = 24) {
    print("My name is \(name). My age is \(age)!")
}
me()
me(name: "Jay", age: 20)

//MARK: In-Out Parameters
func sayHello(name: inout String) {
    name = "Hi"
}

var name1: String = "Hello"

sayHello(name: &name1)
print(name1)

//MARK: Variadic Parameters
func printSum(of nums: Int...) {
    print("\(nums)")
}

printSum(of: 1,2,3,4)

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
