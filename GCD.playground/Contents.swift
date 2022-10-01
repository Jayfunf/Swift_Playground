import UIKit

let group = DispatchGroup()
let queueOne = DispatchQueue.global()
let queueTwo = DispatchQueue.global()

func taskOne() {
    for _ in 0..<9900 {
        print("TaskOne")
    }
    print("**************************")
}

func taskTwo() {
    for _ in 0..<10000 {
        print("TaskTwo")
    }
}

queueOne.async(group: group) {
    taskOne()
}

queueTwo.async(group: group) {
    taskTwo()
}

group.notify(queue: .main) {
    print("작업 종료")
}
