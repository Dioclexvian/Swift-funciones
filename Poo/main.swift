// ESTRUCTURAS Y CLASES


struct someStruct {
// la definición de la estructura aquí 
// contenedores de datos que no hagan muchas cosas

}

class  someClass {
// la definicón de la clase aquí
    
}

struct resolucion{
    var width = 0 
    var height = 0 
}

class videoMode {
    var resolution = resolucion()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}

let someResolucion =  resolucion()
let someVideoMode = videoMode()
print(someResolucion.width)

someVideoMode.resolution.width = 1280

print (someVideoMode.resolution.width)


someVideoMode.frameRate = 60.0

print (someVideoMode.frameRate)

let vga = resolucion(width: 640, height: 480)

print( vga.width)
print( vga.height)

let hd = resolucion(width: 1920, height: 1080)

var cinema =  hd

print("\(cinema.width) X \(cinema.height)")
cinema.width = 2048
print("\(cinema.width) X \(cinema.height)")
print("\(hd.width) X \(hd.height)")

// estructuras y enumerados lo que se hace es copiar son lo valores, 
// lo valores se copia de un lado a otro


enum compassPoint {
    case norte, sur, este, oeste

}

var currentDirection = compassPoint.norte
let oldDirection = currentDirection
currentDirection = .sur
print(currentDirection)
print(oldDirection)


// las clases no copia valores, son datos referenciados,
// la segunda variable referencia a la primera


let tenEighty = videoMode()

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

print (tenEighty.frameRate)

let alsoTenEighty = tenEighty

alsoTenEighty.frameRate = 30.0

print (alsoTenEighty.frameRate)

print (tenEighty.frameRate) //el valor se ve modificado debido a la referencia de él

print (someVideoMode.frameRate) // este es un objeto diferente

if tenEighty === alsoTenEighty { // '!==' diferente, se compara con tres '='
    print("son el mismo el objeto")
} else {
    print("no son el mismo objeto")
}

if tenEighty !== someVideoMode {
    print("no son el mismo el objeto")
} else {
    print("si son el mismo objeto")
}


// propiedades 

struct fixedLengthRange {
    var firstValue : Int
    let length : Int
}
var rangeOfThreeitems = fixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeitems.firstValue = 6 

let rangeOfFourItems = fixedLengthRange(firstValue: 0, length: 4)

// rangeOfFourItems.firstValue = 5 // esto da error es una constante no se puede cambiar



// LAZZY STORED PROPERTIES 

class dataImporter{
    var fileName = "data.txt"

}

class dataManager {
    lazy var importer = dataImporter()
    var data = [String]() // no crea la variable de una vez, no malgasta espacio
}

let manager =  dataManager()
manager.data.append ("algo de datos")
manager.data.append ("mas datos")
// hasta esta linea el importer no se ha creado (nil)
// manager.importer.fileName // creacion del importer

//computed properties

struct point {
    var x = 0.0, y = 0.0

}

struct size {
    var width = 0.0, height = 0.0
}

struct rect {
    var origin = point()
    var Size = size()
    var center : point{
        
        get {
            point(x: origin.x + Size.width/2, y: origin.y + Size.height/2)
        }
        set (newCenter){ // sin llamar a una variable, el valor de la variable intera es "newValue"
            origin.x = newCenter.x - Size.width/2
            origin.y = newCenter.y - Size.height/2
        }
        
    }
}

var square = rect(origin: point(x: 0, y: 0), Size: size(width: 10, height: 10))

print(square.center)

let initialSquareCenter = square.center
square.center = point(x: 20, y: 20)

struct cuboide {
    var Width = 0.0, Height = 0.0, Depth = 0.0
    var volumen: Double{
            return Width * Height * Depth
        // valor de solo lectura no se puede modificar
    }
}

let cubo = cuboide(Width: 4.0, Height: 5.0, Depth: 2.0)
print (cubo.volumen)
// cuboide.volumen = 59.9 error, variable solo lectura



//OBSERVADORES
//willset se ejecuta justo antes de cambiar el valor de una propiedad

//didset se ejecuta justo después de cambiar el valor de una propiedad


class stepCounter{
    var totalSteps: Int = 0 {
        
        willSet (newTotalSteps){
            print("el numero de pasos va subir hasta \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("el numero de passo ha incrementado \(totalSteps - oldValue) \n")
            }
        }
    }
}

let stepCounters = stepCounter()

stepCounters.totalSteps = 200
stepCounters.totalSteps = 520
stepCounters.totalSteps += 1234


struct algunaEstructura {
    var counter = 0 
    static var storedTypeProperty = "some VALUE" //static, no dependen del objeto, comunes entoda la clase
    static var computedTypeProperty: Int {
        return 1
    }
}

var instanceStr = algunaEstructura()

var otherInstanceStr = algunaEstructura()

// algunaEstructura.computedTypeProperty // se accede desde la misma estructura 

enum someEnum {
    static var storedTypeProperty = "some VALue"
    static var computedTypeProperty: Int {
        return 5
    }
}

// someEnum.storedTypeProperty

class someClase {
    static var storedTypeProperty = "some VaLuEE"
    static var computedTypeProperty: Int { // está no es sobre escribible ni para padre ni para hijo
        return -9
    }
    class var overrideableComputedTypeProperty: Int { // se usa class var para que los hijos puedan modificar los statics
        return 108
    } // la clase hijo puede sobre escribir esta variable
}




