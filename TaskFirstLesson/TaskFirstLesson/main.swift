var str: String = "Swift"
var ch: Character = "S"
var mass = [String]()

for symb in str {
    mass.append(String(symb))
}

var dict1: Dictionary = ["One": (100,101), "Two": (200,201)]
var dict4 = Dictionary(uniqueKeysWithValues: [(1,2), (3,4), (5,6)])
var dict5 = ["Alex": 1989, "John": 2002, "Harold": 1951]

//Array


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("Resolution width is \(someResolution.width)")

someVideoMode.resolution.width = 1280

print("Resolution width is \(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)

var cinema = hd

cinema.width = 2048

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirect = CompassPoint.west
let remeberedDirect = currentDirect

currentDirect.turnNorth()

print("My direct \(currentDirect)")

/*
 class VideoMode {
     var resolution = Resolution()
     var interlaced = false
     var frameRate = 0.0
     var name: String?
 }
 */

let tenEight = VideoMode()
tenEight.resolution = hd
tenEight.interlaced = true
tenEight.name = "1080i"
tenEight.frameRate = 25.0

let alsoTenEight = tenEight
alsoTenEight.frameRate = 30.0

print("FrameRate is \(tenEight.frameRate)")

if tenEight === alsoTenEight {
    print("same")
}

struct Fixed {
    var firstValue: Int
    var length: Int
}

var range = Fixed(firstValue: 0, length: 4)
range.firstValue = 6

class DataImport {
    var fileName = "data.txt"
    
}

class ManagerData {
    lazy var importer = DataImport()
}

class Counter {
    var count = 0
    func increment() {
        self.count += 1
    }
    func incrementByAmount(amount: Int) {
        self.count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementByAmount(amount: 5)
counter.reset()

print(counter.count)

struct Point {
    var x = 0.0
    var y = 0.0
    func isToRight(x: Double) -> Bool {
        return self.x > x
    }
}
