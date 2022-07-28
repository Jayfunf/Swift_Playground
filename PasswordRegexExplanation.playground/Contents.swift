import UIKit
import Foundation

//class passwordConfirm {
//    func isValidPassword(password: String) -> Bool {
//        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[~!@#$%^&*])(?=.*[0-9]).{8,16}"
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
//        return passwordTest.evaluate(with: password)
//    }
//}

let exTestString = "asdHelloTest123$$$@!"
// reference: https://eunjin3786.tistory.com/12
extension String {
    func getArratAfterRegex(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex...,in: self))
            
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
print(exTestString.getArratAfterRegex(regex: "[A-Za-z0-9]"))


let testStrings = "1231"
let reg1 = "^[0-9]*$"

print(testStrings.count)

if testStrings.count == 4 || testStrings.count == 6 {
    print(testStrings.range(of: reg1, options: .regularExpression) != nil)
} else {
    print("false")
}


print(testStrings.range(of: reg1, options: .regularExpression) != nil)




func solution(_ s:String) -> Bool {
    let reg = "^[0-9]*$"
    if s.count == 4 && s.count == 6{
        return (s.range(of: reg, options: .regularExpression) != nil)
    }
    return false
}
