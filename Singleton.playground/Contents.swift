import UIKit

class UserInfo {
    static let shared = UserInfo()
    
    var name: String?
    var age: Int?
    
    private init() {  }
}

let userInfo1 = UserInfo.shared
let userInfo2 = UserInfo.shared

userInfo1.name = "Minion"
print(UserInfo.shared.name, UserInfo.shared.age)
userInfo2.age = 24
print(UserInfo.shared.name, UserInfo.shared.age)

/*
 Swift에서 싱글톤을 쓰는 방법은 간단하다.
 
 static 타입 프로퍼티를 선언히여 Instance를 저장할 프로퍼티를 하나 생성한다.
    여기서 왜 Static을 사용해 선언하냐? -> 전역으로 사용하기 위해 사용한다. 값이 변하지 않는다.
 
 그리고 init()을 private으로 선언해 외부에서 init()을 통해 새로운 인스턴스가 생기지 않도록 한다.
 
 URLSession.shared <- 얘도 싱글톤 패턴을 사용한 것이다.
 UserDefaults.standard <- 얘도 ㅇㅇ
 */


