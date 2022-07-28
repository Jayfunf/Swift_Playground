import UIKit

//func helloGenerator(message: String) -> (String, String) -> String {
//    return { ( firstName: String , lastName: String) -> String in
//        return lastName + firstName + message
//    }
//}

//func helloGenerator(message: String) -> (String, String) -> String {
//    return { firstName, lastName in
//        return lastName + firstName + message
//    }
//}

//func helloGenerator(message: String) -> (String, String) -> String {
//    return {
//        return $1 + $0 + message
//    }
//}

func helloGenerator(message: String) -> (String, String) -> String {
    return { $1 + $0 + message }
}

let someVariable = helloGenerator(message: "님 어서오세요.")
print(someVariable("Minhyun ", "Cho "))

var closureVariable: (String, String) -> String = { $1 + $0 + "님 어서오세요."}
print(closureVariable("Minhyun ", "Cho "))
