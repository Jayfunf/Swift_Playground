import UIKit

var arr: [Int] = [7,4,5,1,3,6]

func normal_Bubble_Sort(_ arr: inout [Int]) {
    for _ in 0..<arr.count {
        for j in 0..<arr.count-1 {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
    print("normal: ", arr)
}

func fast_Bubble_Sort(_ arr: inout [Int]) {
    var flag: Bool = false
    for i in 0..<arr.count {
        for j in 0..<arr.count-1-i {
            flag = false
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
                flag = true
            }
        }
        if flag == true { break }
    }
    print("fast: ", arr)
}
normal_Bubble_Sort(&arr)
fast_Bubble_Sort(&arr)
