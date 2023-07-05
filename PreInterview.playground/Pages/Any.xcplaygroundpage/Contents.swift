import Foundation

var some: Any = "Swift"
(some as! String).count

some = 10
some = 3.2

let array: [Any] = [
    5,
    "안녕",
    3.5,
    //    Person(),
]

(array[1] as! String).count


123456789[0] // 9
123456789[1] // 8



extension Int {
    subscript(_ a: Self) -> Self{
        return Array(String(self)).map { character in
            return Int(String(character))!
        }.reversed()[a]
    }
}

extension Double {
    var zeeero: Double { return 0.0 }
}


1.4.zeeero
Double.zero
