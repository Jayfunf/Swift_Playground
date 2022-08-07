import UIKit
import os
import Foundation

//func helloGenerator(message: String) -> (String, String) -> String {
//    return { ( firstName: String , lastName: String) -> String in
//        return lastName + firstName + message
//    }
//}
//
//func helloGenerator(message: String) -> (String, String) -> String {
//    return { firstName, lastName in
//        return lastName + firstName + message
//    }
//}
//
//func helloGenerator(message: String) -> (String, String) -> String {
//    return {
//        return $1 + $0 + message
//    }
//}
//
//func helloGenerator(message: String) -> (String, String) -> String {
//    return { $1 + $0 + message }
//}

//let someVariable = helloGenerator(message: "님 어서오세요.")
//print(someVariable("Minhyun ", "Cho "))
//
//var closureVariable: (String, String) -> String = { $1 + $0 + "님 어서오세요."}
//print(closureVariable("Minhyun ", "Cho "))

//let closure = { (name: String) -> String in
//    return "Hello, \(name)"
//}
//
//let hello = { () -> () in
//    print("Hello")
//}
//
//let hello2 = hello
//
//closure("Minion")
//hello()
//hello2()
//
//func doSome() -> () -> () {
//    return { () -> () in
//        print("Hello")
//    }
//}
//
//doSome()
//let DO = doSome()
//
//DO()
//
//let someClosure: (String) -> String
//
//someClosure = { (name: String) in
//    return "Hello, \(name)"
//}
//
//someClosure("Minion")

//MARK: Closure
let helloClosure = { (name: String) -> String in
    return "Hello, \(name)"
}
helloClosure("Minion")

//MARK: Function
func helloFunction(name: String) -> String {
    return "Hello, \(name)"
}
helloFunction(name: "Minion")

//MARK: Closure in Function's Parameter1
let helloPrintClosure = { (name: String) in
    print("Hello, \(name)")
}

func doSomeThing(name: String, closure: (String) -> ()){
    closure(name)
}
doSomeThing(name: "Minion", closure: helloPrintClosure)

//MARK: Closure in Function's Parameter2
func doSomeThing2(closure: () -> ()){
    closure()
}
doSomeThing2(closure: {
    print("Hello")
})

//MARK: Closure in Closure
let normalClosure = { () -> Void in
    print("Hello, closureInClosure")
}
let closureInClosure = { (closure: () -> ()) -> Void in
    return closure()
}
closureInClosure(normalClosure)

//MARK: 일회용 클로저
({ () -> () in
    print("일회용")
})()

//MARK: Trailing Closure
func withoutTrailing(closure: () -> ()){
    closure()
}
withoutTrailing(closure: { () -> () in
    print("withoutTrailing")
})

func withTrailing(closure: () -> ()) {
    closure()
}
withTrailing() { () -> () in
    print("withTrailing")
}

//MARK: Multiple Closure in Parameter with Trailing Closure
//Without Trailing
func fetchWithoutTrailing(success: () -> (), fail: () -> ()) -> Void {
    //some Codes
}

fetchWithoutTrailing(success: { () -> () in
    print("Success")
}, fail: { () -> () in
    print("Fail")
})

//With Trailing
func fetchWithTrailing(success: () -> (), fail: () -> ()) -> Void {
    //some Codes
}

fetchWithTrailing(success: { () -> () in
    print("Success")
}) { () -> () in
    print("Fail")
}

//MARK: 반환 타입 유추, 매개변수 타입 유추

//MARK: 매개변수 생략
//MARK: return 키워드 생략
