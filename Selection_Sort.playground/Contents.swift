import UIKit

var arr: [Int] = [7,9,2,5,6,1]

func selection_Sort(_ arr: inout [Int]){
    var min: Int = arr.count-1 // 최소값을 찾기 위해 선언
    
    for i in 0..<arr.count {
        for j in i..<arr.count {
            if arr[min] > arr[j] {
                min = j
            }
        }
        arr.swapAt(i, min)
    }
    
    print(arr)
}

selection_Sort(&arr)
