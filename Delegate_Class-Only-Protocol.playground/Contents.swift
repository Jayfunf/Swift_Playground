import UIKit

protocol ClassOnlyProtocol: class { // class와 AnyObject 둘 다 같은 기능을 한다. XCode에서는 class를 AnyObject로 바꾸길 권장한다.
    func greeting()
}

class Person: ClassOnlyProtocol {
    var name: String = ""
    var age: Int = 0
    
    func greeting() {
        print("I am \(self.name) man")
    }
}

// 에러 발생: Non-class type 'Human' cannot conform to class protocol 'ClassOnlyProtocol'
// 당연히 Class Protocol인 ClassOnlyProtocol을 채택하려 했기에 에러
//struct Human: ClassOnlyProtocol {
// ...
//}

/* *********************************** */

//MARK: - Delegate Pattern
protocol PrepareParty: AnyObject { // 이 프로토콜을 채택하는 클래스는 아래의 함수에 해당하는 일을 해야함.
    func prepareFood()
    func prepareSong()
}

class partyDirector {
    weak var delegate: PrepareParty?
    
    func order() {
        self.delegate?.prepareFood()
        self.delegate?.prepareSong()
    }
}

class firstWorker: PrepareParty {
    init(director: partyDirector) {
        director.delegate = self // 파티 책임자가 시키는(위임하는) 일을 자신이(self) 하겠다고 선언
    }
    
    func prepareFood() {
        print("Pizza")
    }
    
    func prepareSong() {
        print("Coldplay - Yellow")
    }
}

class secondWorker: PrepareParty {
    init(director: partyDirector) {
        director.delegate = self // 파티 책임자가 시키는(위임하는) 일을 자신이(self) 하겠다고 선언
    }
    
    func prepareFood() {
        print("Chicken")
    }
    
    func prepareSong() {
        print("Frank Sinatra - New York")
    }
}

let Minion = partyDirector()

let slaveOne = firstWorker(director: Minion)
Minion.order()

let slaveTwo = secondWorker(director: Minion)
Minion.order()
