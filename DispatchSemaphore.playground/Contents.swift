import UIKit
import Foundation

let semaphore = DispatchSemaphore(value: 2)

for i in 1...3 {
    DispatchQueue.global().async {
        semaphore.wait()

        print("CS 접근 \(i)")
        sleep(3)

        print("CS 해제 \(i)")
        semaphore.signal()
    }
}


let semaphore2 = DispatchSemaphore(value: 0)

DispatchQueue.global().async {
    print("task A 시작!")
    print("task A 진행중..")
    print("task A 끝!")
    sleep(2)
    
    semaphore2.signal()
}

semaphore2.wait()
sleep(2)
print("기다림")
