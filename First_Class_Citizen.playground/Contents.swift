import UIKit

//MARK: 변수 or 상수에 함수 대입
func sayHello(name: String) {
    print("안녕 \(name)!")
}

var Hi = sayHello(name: "Minion")
let Hello: (String) -> () = sayHello

Hello("Jay")

print("\n")

//MARK: 함수를 반환 값으로 사용
func plus(firstNum: Int, secondNum: Int) -> Int {
    print(firstNum+secondNum)
    return firstNum+secondNum
}

func calCulate() -> (Int, Int) -> Int {
    return plus
}

let nums = calCulate()

nums(10, 20) // 대입 후 호출
calCulate()(10, 20) // 직접 호출

print("\n")

//MARK: 인자로 함수를 전달 가능
func minus(firstNum: Int, secondNum: Int) -> Int {
    print(firstNum - secondNum)
    return firstNum - secondNum
}

func calCulate2(firstNum: Int, secondNum: Int, fn: (Int, Int) -> Int) -> Int {
    return fn(firstNum, secondNum)
}

calCulate2(firstNum: 20, secondNum: 10, fn: minus)
