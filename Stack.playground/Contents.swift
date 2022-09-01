import UIKit

struct Stack<T> {
    var elements: [T] = []
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    func top() -> T? {
        elements.last
    }
    
    func printAll() {
        for i in 0..<elements.count {
            print(elements[i])
        }
    }
}

var myStack = Stack<Int>()

myStack.push(10)
myStack.push(20)
myStack.push(30)
myStack.pop()
myStack.push(40)
myStack.push(50)
myStack.top()
myStack.printAll()
