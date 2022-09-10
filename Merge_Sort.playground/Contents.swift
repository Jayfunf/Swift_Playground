import UIKit

var arr: [Int] = [7,9,2,5,6,1]

func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    let center = arr.count / 2
    let left = Array(arr[0..<center])
    let right = Array(arr[center..<arr.count])

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result: [Int] = []

        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        
        if !left.isEmpty {
            result.append(contentsOf: left)
        }
        
        if !right.isEmpty {
            result.append(contentsOf: right)
        }
        return result
    }
    return merge(mergeSort(left), mergeSort(right))
}

print(mergeSort(arr))
