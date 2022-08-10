/*
 Reference by: 개발자 소들이
 Address: https://babbab2.tistory.com/118
 */

import UIKit

//MARK: 1 저장 프로퍼티(Stored Properties)
class Human {
    let name: String = "unknown"
    var age: Int = 0
}

struct Person {
    let name: String = "unknown"
    var age: Int = 0
}

//MARK: 1.1 클래스 인스턴스
//let minion: Human? = .init()
//minion?.name = "minion" // name 변경 불가능.
//minion?.age = 24

/*
name을 변경할 수 없는 이유가 name은 let으로 선언했기 때문 아님?
그럼 name과 age의 변/상수를 따지기 이전에 minion 인스턴스를 let, 즉 상수로 선언했는데 왜 age는 변경 가능?
class는 reference 타입이라 Heap에 저장됨. 지역 상수인 minion은 스택에 할당 되고 실제 Human인스턴스들은 Heap에 할당 됨.
여기서 인스턴스를 let으로 선언하는 이유는 메모리에서 공부한 스택 -주소-> 힙에서 이 주소값을 변경할 수 없다는 말임.
따라서 '클래스'의 경우, 인스턴스 생성 당시 let으로 선언하든 var로 선언하든 상관X 접근이 가능함.
*/

//minion = nil // nil 할당 불가능. 옵셔널인데 왜? -> 상수로 선언 했기에 변경X

//let clone: Human? = .init()

//minion = clone // 다른 인스턴스 할당 불가능. 왜? minion은 let으로 선언하여 갖고 있는 주소를 변경할 수 없음.

/*물론 minion을 var로 선언하면 let을 갖는 name프로퍼티는 변경이 불가능하지만 그 외 나머지 nil 할당, 인스턴스 할당 다 가능.*/

//MARK: 1.2 스트럭트 인스턴스
//let jay: Person? = .init()
//jay?.name = "jay" // name 변경 불가능.
//jay?.age = 24 // age 변경 불가능.

/*
왜 age는 분명 var인데 왜 변경이 불가능 해영?!?
class와 struct에서 공부한 그 내용임.
일단 struct는 value type임. 그렇기에 값이 기본적으로 Heap이 아닌 Stack영역에 할당 됨.
그래서 reference type은 (내부 프로퍼티의 값이 var이냐 let이냐에 따라 달라지지만) 기본적인 인스턴스 자체는 주소를 제외하고 변경이 가능했음.
하지만 value type은 인스턴스 자체가 Stack영역에 저장되어 통째로 값 변경이 불가능함.
물론 구조체 인스턴스도 마찬가지로 var로 선언한다면 nil 할당, 인스튼서 할당 모두 가능함.
*/

//MARK: 2 지연 저장 프로퍼티(Lazy Stored Properties)
/*프로퍼티가 호출되기 전까지 선언만 될 뿐 초기화되지 않다가, 호출되는 순간 초기화 되는 저장 프로퍼티*/

class Contacts {
    var email: String = "init"
    var address: String = "init"
    
    init() {
        print("Contacts Init")
    }
}

class withoutEmployee {
    var name: String = "unknown"
    var contacts: Contacts = .init()
}

let withoutMinion: withoutEmployee = .init() // 이럴 경우 "Contacts Init" 출력

class withEmployee {
    var name: String = "unknown"
    lazy var contacts: Contacts = .init()
}

let withMinion: withEmployee = .init() // lazy를 사용하여 초기화 메세지 출력 X

print(withMinion.contacts.email) // 이렇게 변수에 처름으로 접근하고자 하면 그때 출력 1
withMinion.contacts.email = "gmail" // 이렇게 변수에 처름으로 접근하고자 하면 그때 출력 2

//MARK: 지연 저장 프로퍼티의 특징
/*
 지연 저장 프로퍼티의 경우 'var'로만 선언이 가능함. let으로 선언될 경우 우리가 필요한 시점에 초기화를 진행할 수 없음.
 이미 메모리에는 할당되어 있지만, 필요한 시점에 내가 원하는 값으로 초기화 되어야 하기 때문. 당연히 let으로 선언하면 원하는 값으로 변경 불가능
*/

//MARK: 지연 저장 프로퍼티는 어떨 때 쓸까?
/*
 만약 Contacts란 클래스에 100,000개의 Element를 갖는 email이란 저장 프로퍼티를 선언 했다고 해보자.
 그런데 모든 유저가 Contacts에 대한 정보가 있는 것이 아니라 반만 있다면,
 필요하지 않을 Contacts란 인스턴스를 유저 수만큼 10,000개를 만들어 낭비하는 셈이다.
 
 하지만 lazy를 사용하면 저장 프로퍼티에 값을 저장할 (Contacts정보가 있는 User) 사람만 접근하고,
 이를 통해 필요한 수 만큼만 인스턴스를 생성할 수 있다.
 */

class manyContacts {
    var email: [String] = .init(repeating: "", count: 100000)
    var address: String = ""
    
    init() {
        print("manyContacts Init")
    }
}

class User {
    let name: String = "unknown"
    lazy var contacts: manyContacts = .init()
}

//MARK: 연산 프로퍼티(Computed Properties)

//MARK: 프로퍼티 감시자(Property Observers)

//MARK: 타입 프로퍼티(Type Properties)
