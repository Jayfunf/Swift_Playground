import UIKit

//MARK: 블로그, 노션용 코드를 작성하기 위한 공간
/*
 MARK 주석으로 []<-안에 노션인지 블로그인지 작성 + 어디에 사용하는 코드인지 작성
 그 밑에 일반 주석으로 세부적인 사항 작성
 ex:
 //MARK: OOP와 PP설명용 코드
 // 상속에 대한 코드
 */


//MARK: [NOTION] OOP 설명
// 상속성에 대한 코드
class Person {
    var name: String = ""
    
    func selfIntroduce() {
        print("저는 \(name) 입니다.")
    }
    
    // final 키워드를 사용하여 재정의를 방지할 수 있다.
    final func sayHello() {
        print("Hello !!!")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("Person type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("Person type method - class")
    }
    
    // 재정의 가능한 class 메서드라도
    // final 키워드를 사용하면 재정의 할 수 없다.
    // 메서드 앞의 static 과 final class 는 똑같은 역할을 한다.
    final class func finalCalssMethod() {
        print("Person type method - final class")
    }
}

class Student: Person {
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name) 이고, 제 전공은 \(major)입니다.")
    }
    
    override class func classMethod() {
            print("Student overriden type method - class")
    }
}

let jay = Person()
let minion = Student()

jay.name = "Jay"
minion.name = "Minion"
minion.major = "Software"

jay.selfIntroduce() // 저는 Jay 입니다.
minion.selfIntroduce() // 저는 Minion 이고, 제 전공은 Software입니다.

// 오버라이딩에 대한 코드
class Dog {
  func bark() { print("멍멍") }
}
class Poodle: Dog {
  override func bark() { print("왈왈") }
}
class Husky: Dog {
  override func bark() { print("으르르") }
}
class Bulldog: Dog {
  override func bark() {
    super.bark()
    print("bowwow")
  }
}

var dog: Dog = Dog()
dog.bark() // 멍멍

dog = Poodle()
dog.bark() // 왈왈

dog = Husky()
dog.bark() // 으르르

dog = Bulldog()
dog.bark() // 멍멍, bowwow

// 오버로드에 대한 코드
func sum(a: Int, b: Int) {
    print(a+b)
}

func sum(a: Int, b: Int, c: Int) {
    print(a+b+c)
}

sum(a: 1, b: 2) // 3
sum(a: 1, b: 2, c: 3) // 6

//// SRP(Single Responsibility Principle)에 대한 코드
//// 하나의 클래스에서 검색, 정제, 검색 모두 담당한다. 이는 잘못된 방식.
//class Search {
//    func search() -> String {}
//
//    func filter(result: [String]) -> [String] {}
//
//    func find(_ result: [String]) -> String {}
//}
//
//// 수정하면,
//class CorrectSearch {
//    var search = SearchHandler()
//    var filter = FilterHandler()
//    var find = findHandler()
//
//    init(search: SearchHandler, filter: FilterHandler, find: findHandler) {
//        self.search = search
//        self.filter = filter
//        self.find = find
//    }
//
//    func searchResult() -> String {}
//}
//
//class SearchHandler {
//    func search() -> String {}
//}
//
//class FilterHandler {
//    func filter(result: [String]) -> [String] {}
//}
//
//class findHandler {
//    func find(_ result: [String]) -> String {}
//}

