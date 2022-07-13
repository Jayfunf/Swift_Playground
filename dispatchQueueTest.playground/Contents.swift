import UIKit
import Foundation

MARK: - Serial/Concurrent + Async/Sync
print("serial+async")
var numbers1 = [0,1,2,3,4,5,6,7]
let dispatchQ1 = DispatchQueue(label:"serial") //Custom serial queue
(0..<8).forEach({ index in
    dispatchQ1.async {
        print(numbers1[index])
    }
})
print("concurrent+async")
var numbers2 = [0,1,2,3,4,5,6,7]
let dispatchQ2 = DispatchQueue(label:"concurrent", attributes: .concurrent) //Custom concurrent queue
(0..<8).forEach({ index in
    dispatchQ2.async {
        print(numbers2[index])
    }
})
print("serial+sync")
var numbers3 = [0,1,2,3,4,5,6,7]
let dispatchQ3 = DispatchQueue(label:"serial")
(0..<8).forEach({ index in
    dispatchQ3.sync {
        print(numbers3[index])
    }
})
print("concurrent+sync")
var numbers4 = [0,1,2,3,4,5,6,7]
let dispatchQ4 = DispatchQueue(label:"concurrent", attributes: .concurrent)
(0..<8).forEach({ index in
    dispatchQ4.sync {
        print(numbers4[index])
    }
})

MARK: - Async/Sync
var arr = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ"]
DispatchQueue.global().sync {
    for i in arr {
        print(i)
    }
}

for i in 1...5 {
    print(i)
}

var arr = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ"]
DispatchQueue.global().async {
    for i in arr {
        print(i)
    }
}

for i in 1...5 {
    print(i)
}

DispatchQueue.main.async {
    <#code#>
}

DispatchQueue.global().async {
    <#code#>
}

let customSerialDispatchQueue = DispatchQueue(label: "serial")

let customConcurrentDispatchQueue = DispatchQueue(label: "concurrent",attributes: .concurrent)
