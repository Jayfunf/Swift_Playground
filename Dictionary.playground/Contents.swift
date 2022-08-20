import UIKit

var dic: [Int: String] = [:]

var dic2: [String: Int] = [:]

var dic3: [String: [String]] = [:]

dic.updateValue("Test1", forKey: 0)
dic.updateValue("Test2", forKey: 1)

dic2.updateValue(10, forKey: "1")
dic2.updateValue(20, forKey: "2")

dic3.updateValue(["test1"], forKey: "1")
dic3.updateValue(["test2"], forKey: "2")
dic3.updateValue(["test3"], forKey: "2")

print(dic3)
