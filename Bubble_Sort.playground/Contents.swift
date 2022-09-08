import UIKit

//var arr: [Int] = [7,4,5,1,3,6]
var arr: [Int] = [1,2,3,4,5]
var Ns = 0
var Fs = 0
func normal_Bubble_Sort(_ arr: inout [Int]) {
    for _ in 0..<arr.count {
        for j in 0..<arr.count-1 {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
            Ns+=1
        }
    }
    print("normal: ", arr)
    print(Ns)
}

func fast_Bubble_Sort(_ arr: inout [Int]) {
    var flag: Bool = false
    for i in 0..<arr.count {
        for j in 0..<arr.count-1-i {
            flag = false
            Fs+=1
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
                flag = true
            }
        }
        if flag == false { break }
    }
    print("fast: ", arr)
    print(Fs)
}
normal_Bubble_Sort(&arr)
fast_Bubble_Sort(&arr)
