import UIKit

struct Heap {
    var Heap:[Int] = [0]
    
    mutating func insert(_ data: Int) {
        Heap.append(data)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {               // 루트 노드일 때
                return false
            }
            let parentIndex: Int = insertIndex / 2
            return Heap[insertIndex] > Heap[parentIndex] ? true : false
        }
        
        var selfIndex = Heap.count-1
        while isMoveUp(selfIndex) {
            let pIndex = selfIndex/2
            Heap.swapAt(selfIndex, pIndex)
            selfIndex = pIndex
        }
        print(Heap)
    }
    
    enum moveDownStatus { case none, left, right }
     
    mutating func pop() -> Int {
        if Heap.count <= 1 { return 0 }
        
        let returnData = Heap[1]
        Heap.swapAt(1, Heap.count - 1)
        Heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = (poppedIndex * 2)
            let rightChildIndex = leftChildIndex + 1
            
            // case 1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= Heap.count {
                return .none
            }
            
            // case 2. 왼쪽 자식 노드만 있는 경우
            if rightChildIndex >= Heap.count {
                return Heap[leftChildIndex] > Heap[poppedIndex] ? .left : .none
            }
            
            // case 3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
            // case 3-1. 자식들이 자신보다 모두 작은 경우
            if (Heap[leftChildIndex] < Heap[poppedIndex]) && (Heap[rightChildIndex] < Heap[poppedIndex]) {
                return .none
            }
            
            // case 3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
            if (Heap[leftChildIndex] > Heap[poppedIndex]) && (Heap[rightChildIndex] > Heap[poppedIndex]) {
                return Heap[leftChildIndex] > Heap[rightChildIndex] ? .left : .right
            }
            
            // case 3-3. 왼쪽 & 오른쪽 중 한 자식만 자신보다 큰 경우
            return Heap[leftChildIndex] > Heap[poppedIndex] ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                print(Heap)
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                Heap.swapAt(poppedIndex, leftChildIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                Heap.swapAt(poppedIndex, rightChildIndex)
                poppedIndex = rightChildIndex
            }
        }
    }
}

var test = Heap.init()
test.insert(10)
test.insert(20)
test.insert(40)
test.insert(35)
test.insert(5)
test.pop()
/*
 [0, 10]
 [0, 20, 10]
 [0, 40, 10, 20]
 [0, 40, 35, 20, 10]
 [0, 40, 35, 20, 10, 5]
 [0, 35, 10, 20, 5]
 */
