import Foundation

func naiveFibo(_ n: Int) -> Int {
    if n <= 1 { return n }
    return naiveFibo(n - 1) + naiveFibo(n - 2)
}

func dpFibo(_ n: Int) -> Int {
    var arr: [Int] = [0, 1]
    
    guard n > 1 else {
        return n
    }
    
    for i in 2...n {
        arr.append(arr[i - 1] + arr[i - 2])
    }
    
    return arr[n]
}
DispatchQueue.global().async {
    print("Naive Fibo: ", naiveFibo(25))
}
DispatchQueue.global().async {
    print("Dynamic Fibo: ",dpFibo(25))
}
