/*
 Reference by: 개발자 소들이
 Address: https://babbab2.tistory.com/118
 */

import UIKit

//MARK: 1 저장 프로퍼티(Stored Properties)
/*
 [클래스], [구조체] 에서 사용한다.
 */
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

//MARK: 2.1 지연 저장 프로퍼티의 특징
/*
 지연 저장 프로퍼티의 경우 'var'로만 선언이 가능함. let으로 선언될 경우 우리가 필요한 시점에 초기화를 진행할 수 없음.
 이미 메모리에는 할당되어 있지만, 필요한 시점에 내가 원하는 값으로 초기화 되어야 하기 때문. 당연히 let으로 선언하면 원하는 값으로 변경 불가능
*/

//MARK: 2.2 지연 저장 프로퍼티는 어떨 때 쓸까?
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

//MARK: 3 연산 프로퍼티(Computed Properties)
/*
 [클래스], [구조체], [열거형] 에서 사용할 수 있음. 저장 프로퍼티와 달리 저장 공간을 갖고 있지 않으며,
 다른 "저장 프로퍼티"의 값을 읽어 연산을 실행, 혹은 전달받은 값을 "다른 프로퍼티"에 저장한다.
 무조건 var로 선언해야 한다.
 
 연산 프로퍼티는 값을 저장하는 것이 아니기 때문에 무조건 타입을 명시해줘야 한다.
 왜냐니, Type Annotation이 없는 Type Inference는 저장된 값을 가지고 타입을 추론함. 그런데 연산 프로퍼티는 저장을 하지 X 따라서 추론 불가능.
 */

class withoutStoredP {
    var alias: String {
        get {
            return alias
        }
        set(name) {
            self.alias = name
        }
    }
}

/*
 위처럼 생긴 코드는 정상적으로 동작하지 않는 연산 프로퍼티이다. 연산 프로퍼티는 앞서 "저장 프로퍼티"의 값을 읽어 연산 혹은 값을 "저장 프로퍼티"에 저장한다.
 따라서 이룰 위한 저장 프로퍼티가 필요하다. 아래처럼.
 */

class withStoredP {
    var name: String = "다예"
    
    var alias: String {
        get {
            return self.name + " 바보"
        }
        
        set(name) {
            self.name = name + "는 내 쫀또"
        }
    }
}

let human: withStoredP = .init()

print(human.alias)
human.alias = "다예"
print(human.name)

//MARK: 3.1 newValue: set의 파라미터는 생략이 가능하다.
/*
 위의 코드에서 왜 set의 name에는 타입을 명시해주지 않음?
 set의 name에는 타입을 명시할 필요가 없음. 이미 연산 프로퍼티를 정의하면서 타입을 명시했기에 set으로 들어오는 name이란 파라미터는
 무조건 명시된(코드에서는 String)타입일 것이기 때문.
 
 그리고 set의 파라미터는 단 하나만 존재하며, 원하는 이름 아무거나 가능.
 
 여기서 set의 파라미터를 받는 ()도 날려버려도 됨. 그리고 "newValue"로 접근할 수 있음

set {
    self.name = newValue + "은 이름"
}
 
 이런 느낌.
 */

//MARK: 3.2 get-only 연산 프로퍼티!
/*
 연산 프로퍼티를 사용할 때, set을 사용하지 않는다면 set을 생략하고 get만 가능하게 read-only로 만들 수 있음.
 
 심지어 get도 생략 가능.
 */

class getOnly {
    var name: String = "init"
    var alias: String {
        get {
            return self.name
        }
    }
}

class getOnlySimple {
    var name: String = "init"
    var alias: String {
        return self.name
    }
}

//MARK: 3.3 set-only 연산 프로퍼티?
//불가능함. 반드시 get과 set을 세트로 구현하거나, get-only로만 구현해야 함.

//MARK: 4 프로퍼티 감시자(Property Observers)
//MARK: 4.1 willSet
//MARK: 4.2 didSet
//MARK: 4.3 willSet과 didSet을 같이 구현
//MARK: 4.4 연산 프로퍼티도 프로퍼티 옵저버를 추가할 수 있다.


//MARK: 5 타입 프로퍼티(Type Properties)
/*
 [클래스], [구조체], [열거형] 에서 사용한다.
 저장 '타입' 프로퍼티와 연산 '타입' 프로퍼티가 존재하며, 저장 타입 프로퍼티의 경우 선언할 당시 원하는 값으로 항상 초기화가 되어 있어야 한다.
 왜냐하면, static으로 선언되는 저장 타입 프로퍼티의 경우 초기화할 때 값을 할당해주는 initializer가 없다.
 잉? name은 타입 프로퍼티이지만, 클래스 내부에 있고 클래스의 인스턴스가 생성될 때 initializer에 의해 모든 프로퍼티가 초기화 되지 않나요?
 타입 프로퍼티는 인스턴스 생성시 매번 생성되는 기존의 프로퍼티와 달리 언제 누군가 한번 불러서 메모리에 올라오면, 그 뒤로는 생성되지 않고 언제 어디서든
 이 타입 프로퍼티에 접근할 수 있음. 전역변수같은 느낌.
 
 "static"을 사용해 선언하며, 자동으로 lazy로 작동한다(lazy를 붙일 필요가 없다. 자동으로 붙는다.)
 */
class Developer {
    static let name: String = "Minion"
    static var alias: String {
        return name + "의 분야는 iOS입니다."
    }
}

let minion: Developer = .init()
/*
 이렇게 인스턴스를 생성한 후 minion. <- 이렇게 해도 self이외에 아무것도 나오지 않는다.
 */

print(Developer.name) // 이렇게 타입 이름을 통해 직접 접근이 가능하다.

/*
 정리하자면 타입 프로퍼티는 인스턴스와 아무런 관련이 없다. 따라서 인스턴스 생성시 불리는 init과도 연관이 없으며,
 초기값이 없을 경우, 초기 값을 세팅할 방법이 없기 때문에 초기값이 없으면 안된다.
 
 또 누가 호출해야 메모리에 올라간다는 부분은 lazy와 똑같다. (당연한게 자동으로 lazy로 작동하기 때문.)
 
 그리고 static은 기본이 lazy동작인데 지연 프로퍼티와 다르게 let으로 선언해도 상관이 없다.
 
 static이 아닌 일반 저장 프로퍼티는 인스턴스 프로퍼티로, init함수가 불리는 시점에 모든 값이 초기화 되어야 한다.
 lazy의 경우 초기화 단계에서 값이 없음으로 설정 되었다가, 실제 해당 프로퍼티가 불릴 때 원하는 값으로 초기화한다. 따라서 let으로 선언하면 없음 -> 원하는 값
 이렇게 변경할 수 없어서 지연 저장 프로퍼티에서는 let을 사용할 수 없다.
 
 하지만 static의 경우 타입 프로퍼티는 인스턴스 프로퍼티처럼 초기화 구문(initializer)의 영향을 받지 않으며 독립적이다. 즉 init이 불리든 말든 상관 없다.
 따라서 타입 프로퍼티의 경우 초기화 구문에서 값이 없음으로 초기화 되지 않고, "실제 사용"시 값이 초기화 되기 때문에 let으로 선언해도 상관 없다.
 */

//MARK: 5.1 타입 프로퍼티의 접근
class typeProperties {
    static var name = "None"
    static let type = "Static"
}

typeProperties.name // "None"
typeProperties.name = "Type Property"
typeProperties.name // "Type Property"

typeProperties.type // "Static"

//MARK: 5.2 연산 타입 프로퍼티의 오버라이딩
/*
 연산 타입 프로퍼티는 오버라이딩이 가능하다. 단 앞에 class냐 static이냐에 따라서 다르다.
 */

class overClass {
    class var alias: String {
        return "overClass Type Property"
    }
}

class overClassMinion: overClass {
    override class var alias: String {
        return "Minion Type Property"
    }
}

overClass.alias
overClassMinion.alias

/*
 이렇게 Class로 선언한 연산 타입 프로퍼티의 경우 오버라이딩이 가능하다. 하지만 static으로 선언할 경우 오버라이딩이 불가능하다.
 */

//MARK: 5.3 타입 프로퍼티는 왜 쓸까?
/*
 보통 모든 타입이 공통적인 값을 정의하는 데 유용하게 쓰인다. 대표적인 예로 싱글톤 패턴이 있다.
 싱글톤은 아래 링크를 참조하자.
 Address: https://babbab2.tistory.com/66?category=828998
 */
