import Foundation

func naiveFibo(_ n: Int) -> Int {
    if n <= 1 { return n }
    return naiveFibo(n - 1) + naiveFibo(n - 2)
}

//MARK: Bottom-Up
func bottom_Up_DP_Fibo(_ n: Int) -> Int {
    var arr: [Int] = [0, 1]
    
    for i in 2...n {
        arr.append(arr[i - 1] + arr[i - 2])
    }
    
    return arr[n]
}

//MARK: Top-Down
var arr2 = [Int](repeating: 0, count: 100)
arr2[1] = 1
arr2[2] = 1

func top_Down_DP_Fibo(_ n : Int) -> Int {
    
    if arr2[n] != 0 {
        return arr2[n]
    }
    
    arr2[n] = top_Down_DP_Fibo(n - 1) + top_Down_DP_Fibo(n - 2)
    return arr2[n]
}

//MARK: Call Count Test + Running Time Test with Async
DispatchQueue.global().async {
    print("Naive Fibo: ", naiveFibo(25))
}
DispatchQueue.global().async {
    print("Bottom-Up_Fibo: ",bottom_Up_DP_Fibo(25))
}
DispatchQueue.global().async {
    print("Top-Down_Fibo: ",top_Down_DP_Fibo(25))
}
