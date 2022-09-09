import UIKit

var arr: [Int] = [7,9,2,5,6,1]

func insert_Sort(_ arr: inout [Int]) {
    var key: Int = 1
    for i in 1..<arr.count {
        key = i
        for j in stride(from: i-1, through: 0, by: -1){
            if arr[key] < arr[j] {
                arr.swapAt(key, j)
                key = j
            }
        }
    }
    print(arr)
}
insert_Sort(&arr)
