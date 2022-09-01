import UIKit

class Node<T> {
    var data: T?
    var next: Node?
    
    init(data: T?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList<T: Equatable> {
    private var head: Node<T>?
    
    func append(data: T?) {
        //head가 없는 경우 Node를 생성 후 head로 지정한다
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    func insert(data: T?, at index: Int) {
        //head가 없는 경우 Node를 생성 후 head로 지정한다
        if head == nil {
            head = Node(data: data)
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next == nil { return }
            node = node?.next
        }
        // NodeA와 NodeB사이에 NodeC를 넣는다고 가정ㄹ하면
        let nextNode = node?.next // 여기서 nextNode는 NodeA.next인 NodeB인 것이다.
        node?.next = Node(data: data) // NodeA가 가르키고 있던 NodeB의 자리에 새 노드 즉, NodeC를 넣어준다.
        node?.next?.next = nextNode // 그리고 NodeA의 다음인 NodeC의 다음에 NodeB를 넣는다.
    }
    
    func removeLast() {
        if head == nil { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        
        while node?.next?.next != nil {
            node = node?.next
        }
        node?.next = node?.next?.next
    }
    
    func remove(at index: Int) {
        if head == nil { return }
        
        if index == 0 || head?.next == nil {
            head = nil
            return
        }
        
        var node = head
        for _ in 0..<(index - 1) {
            if node?.next?.next == nil { break }
            node = node?.next
        }
        
        node?.next = node?.next?.next
    }
    
    func searchNode(from data: T?) -> Node<T>? {
        if head == nil { return nil }
        
        var node = head
        while node?.next != nil {
            if node?.data == data { break; }
            node = node?.next
        }
        return node
    }
    
    func printAll() {
        if head == nil { return }
        
        var node = head
        while node?.next != nil {
            print(node?.data)
            node = node?.next
        }
        print(node?.data)
        print("-------------------")
    }
}

var myLL = LinkedList<Int>()

myLL.append(data: 10)
myLL.append(data: 20)
myLL.append(data: 30)
myLL.append(data: 40)
myLL.printAll()
myLL.insert(data: 25, at: 2)
myLL.insert(data: 23, at: 2)
myLL.printAll()
myLL.remove(at: 2)
myLL.printAll()

/* 변경 전
 Optional(10)
 Optional(20)
 Optional(30)
 Optional(40)
 -------------------
 Optional(10)
 Optional(20)
 Optional(23)
 Optional(25)
 Optional(30)
 Optional(40)
 -------------------
 Optional(10)
 Optional(20)
 -------------------
 */
/* 변경 후
 Optional(10)
 Optional(20)
 Optional(30)
 Optional(40)
 -------------------
 Optional(10)
 Optional(20)
 Optional(23)
 Optional(25)
 Optional(30)
 Optional(40)
 -------------------
 Optional(10)
 Optional(20)
 Optional(25)
 Optional(30)
 Optional(40)
 -------------------
 */
