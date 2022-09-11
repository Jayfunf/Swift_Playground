import UIKit

//MARK: 반복문과 재귀로 구현하는 피보나치 수 + DP
//반복문
func loopFibo(_ num: Int) -> Int {
    var current: Int = 1
    var before: Int = 1
    var temp: Int = 0
    guard num != 0 else { return 0 }
    guard num >= 3 else { return 1 }
    for _ in 2..<num {
        temp = current
        current += before
        before = temp
    }
    return current
}

//재귀
func recursiveFibo(_ num: Int) -> Int {
    guard num != 0 else { return 0 }
    guard num >= 3 else { return 1 }
    
    return recursiveFibo(num-1) + recursiveFibo(num-2)
}

//DP
func dpFibo(_ num: Int) -> Int {
    var arr: [Int] = [0,1]
    
    for i in 2...num {
        arr.append(arr[i - 1] + arr[i - 2])
    }
    return arr[num]
}

print(loopFibo(6))
print(recursiveFibo(6))
print(dpFibo(6))

//MARK: 반복문과 재귀로 구현하는 팩토리얼 + DP
//반복문
func loopFactorial(_ num: Int) -> Int {
    var answer: Int = 1
    
    for i in 2...num {
        answer *= i
    }
    return answer
}

//재귀
func recursiveFactorial(_ num: Int) -> Int {
    if num > 1 {
        return recursiveFactorial(num - 1) * num
    }
    return 1
}

//DP
func dpFactorial(_ num: Int) -> Int {
    var arr: [Int] = [0,1]
    
    for i in 2...num {
        arr.append(arr[i-1] * i)
    }
    return arr[num]
}

print(loopFactorial(6))
print(recursiveFactorial(6))
print(dpFactorial(6))


