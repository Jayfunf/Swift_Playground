import UIKit
import Foundation

class MainClass {
    var number: Int = 0
    
    deinit {
        print("해제")
    }
}

struct MainStruct {
    var number: Int = 0
}

//MARK: - 클래스
var class1 = MainClass()
var class2 = class1
var class3 = class1
class3.number = 10

//MARK: - 구조체
var struct1 = MainStruct()
var struct2 = struct1
var struct3 = struct1
struct3.number = 10

print("class1 number:",class1.number)
print("class2 number:",class2.number)
print("class3 number:",class3.number)
print("struct1 number:",struct1.number)
print("struct2 number:",struct2.number)
print("struct3 number:",struct3.number)
