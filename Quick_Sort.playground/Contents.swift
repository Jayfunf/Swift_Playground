import UIKit

var arr:[Int] = [5,3,8,4,9,1,6,2,7]
//var arr: [Int] = [7,9,2,5,6,1]

func quick_Sort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    let pivot = arr.first
    var low: [Int] = []
    var high: [Int] = []
    
    for i in 0..<arr.count { // pivot을 기준으로 작으면 low, 크면 high에 삽입.
        if arr[i] < pivot! {
            low.append(arr[i])
        } else if arr[i] > pivot! {
            high.append(arr[i])
        }
    }
    //print(low, pivot!, high)
    return quick_Sort(low) + [pivot!] + quick_Sort(high)
}

print(quick_Sort(arr))
