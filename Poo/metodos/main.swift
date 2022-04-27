

class contador {
    var count = 0

    func increment(){
        self.count += 1
        print(count)
        
    }

    func increment(by amount: Int) {
        self.count += amount
        print(count)
    }
    func reset (){
        self.count  = 0 
        print(count)
    }
}

let counter = contador()
counter.increment()
counter.increment()
counter.increment()
counter.increment()
counter.increment(by: 9)
counter.reset()


struct point {
    var x = 0.0, y = 0.0

    func isToTheRight(of x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        // self.x += deltaX
        // self.y += deltaY
        self = point(x: self.x + deltaX, y: self.y + deltaY)
    }
    // una funcion no puede cambiar los valores de la estructura
    // a menos que se coloque mutating, permite usar las variables 
    // del encabezado de la estructura
}

var somePoint = point(x: 4, y: 5)
print ( somePoint.isToTheRight(of: 1))
print ( somePoint.isToTheRight(of: 8))
somePoint.moveBy(x: 2, y: -3)
somePoint.x = 9

enum differentStateSwitch {
    case off, low, high
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low :
            self = .high
        case .high:
            self = .off
        }
    }
}

var controllerStatus = differentStateSwitch.off
controllerStatus.next()
controllerStatus.next()
controllerStatus.next()


// clases 

class someClass {

    class func someMethod () {
        print ( "hola")
    }
}

someClass.someMethod()

struct Leveltracker {
    static var highestUnlockedLevel = 1 
    var currentLevel = 1

    static func unlock (_ level: Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked ( _ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    mutating func advance (to level: Int) -> Bool{
        if Leveltracker.isUnlocked(level){ //acceder al nombre de structura para llamar a isUnlocked
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class player {
    var tracker = Leveltracker()
    let playerName: String 
    func complete(level: Int){
        Leveltracker.unlock(level + 1)
        tracker.advance(to : level + 1)
    }
    init(name: String){
        self.playerName = name
    }
}

var jugador = player(name: "Dio")

jugador.complete(level: 1)


if jugador.tracker.advance(to: 7){
    print("Podemos avanzar hasta el nivel 7")
}else {
    print("no podemos avanza al nivel 7")
}

jugador.complete(level: 7)

if jugador.tracker.advance(to: 7){
    print("Podemos avanzar hasta el nivel 7")
}else {
    print("no podemos avanza al nivel 7")
}




