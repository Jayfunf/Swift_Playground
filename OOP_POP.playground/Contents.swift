import Foundation

//struct Power {
//    func power() {
//        print("Power UP!!")
//    }
//}
//
//struct FastRun {
//    func fastRun() {
//        print("Faster than car!!")
//    }
//}
//
//class superman {
//    private let powerup = Power()
//    private let speedup = FastRun()
//
//    func power() {
//        powerup.power()
//    }
//
//    func speed() {
//        speedup.fastRun()
//    }
//}
//
//let Superman = superman()
//Superman.power()
//Superman.speed()

protocol Power {
    func power()
}

extension Power {
    func power() {
        print("PowerUP Activate")
    }
}

protocol FastRun {
    func fastRun()
}

extension FastRun {
    func fastRun() {
        print("FastRun Activate")
    }
}

protocol sayInfo {
    func sayinfo(name: String, age: Int)
}

extension sayInfo {
    func sayinfo(name: String, age: Int) {
        print("\(name),\(age)")
    }
}

class Superman: Power, FastRun, sayInfo {
    var name: String = ""
    var age: Int = 0
    
    init() {
        self.name = name
        self.age = age
    }
}

let superman = Superman()
superman.say
superman.power()
superman.fastRun()
