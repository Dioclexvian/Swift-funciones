import Swift
import Foundation

// func greeting(person: String) -> String{
//   let greet = "uuuuuoooola \(person)"
//   return greet
// }

// print(greeting(person: "Ricaardo"))

// func sayHolaMundo() -> String {
//   return "Hola Mundo"

// }

// print(sayHolaMundo())

// func minMax(array:[Int]) -> (min: Int, max: Int)?{
//   if array.isEmpty{return nil}
//   var currentMin = array[0]
//   var currentmax = array[0]
//   for value in array[1..<array.count]{
//     if value < currentMin{
//       currentMin = value
//     }else if value > currentmax{
//       currentmax = value
//     } 
//   }
//   return (currentMin, currentmax)
// }

// let bounds = minMax(array: [6,5,4,23,-1,5,12,3,23,24,23,1923,8123,76423,785234,871253,125,-12,-123,-123123,345572,-2348612,12896123,123,12,3,12])
// print("los valores estan entre \(bounds.min) y \(bounds.max)")

// func someFunction(f1 fisrtParamName: Int, f2 secondParamName: Int = 6 ){

//   print(fisrtParamName + secondParamName)
// }

// someFunction(f1: 5, f2: 1)
// someFunction(f1: 7)

// func greeting(_ person: String,from hometown: String) -> String{
//   return "hola \(person) un placer que nos visites desde \(hometown)"
// }

// print(greeting("Juan Gabriel", from: "Mallorca"))

// func mean(_ numbers: Double...)-> Double {

//   var total : Double = 0 
//   for number in numbers {
//     total += number
//   }
//   return total / Double(numbers.count)
// }

// print( mean (1,2,3,4,5,6,7,8))
// print( mean (1.123,123.123, 5634.5412, 123123.1232, 955463.2342, 312312.774))
// print( mean (1,2,3.5,4,5.5,6.5,7,8.5))

// func geom(_ numbers: Double...) -> Double{
//   var total : Double = 1
//   let c  = numbers.count
//   let n : Double = 1.0/Double(c)
//   for number in numbers {
//     total *= number 
//   }
//   print("total: \(total), n: \(n), c: \(c)")
//   return pow(total, n)
// }

// print(geom(6.0,7.0,8.0,9.0,10.0))


// func swapTwoInts(_ a: inout Int, _ b: inout Int){
//   let tempA = a
//   a = b
//   b = tempA
// }
// var someInt = 3
// var otherInt = 7

// print("some int: \(someInt), other int: \(otherInt)")
// swapTwoInts(&someInt, &otherInt)
// print("una hogrra mas targgde: some int: \(someInt), other int: \(otherInt)")




// func addTwoInts (_ a: Int, _ b: Int) -> Int {
//   return a + b
// }
// func multiplyTwoInts (_ a: Int, _ b: Int) -> Int {
//   return a * b
// }
// var mathFunction: (Int, Int) -> Int = addTwoInts
// func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int){
// print("Resultado: \(mathFunc(a,b))")
// }
// printMathResult(multiplyTwoInts,5,9)


// func chooseStepFunction(backward: Bool) -> (Int) -> Int{
// //Nested function 
//   func stepForward (_ input: Int) -> Int {
//   return input + 1
// }
// //nested function
// func stepBackward (_ input: Int) -> Int {
//   return input - 1
// }

//   return backward ? stepBackward : stepForward
// }
// var value = 7 
// let moveNearerZero = chooseStepFunction(backward: value > 0)
// while value != 0 {
//   print("\(value)...")
//   value = moveNearerZero(value)
// }



// var names = ["Cristian","Fredy","Gabriel","Paulo"]

// func backward ( _ s1: String, _ s2: String) -> Bool{
//     return s1>s2
// }

// var reversedNames = names.sorted(by: backward)

// //Closure

// /*
//     {
//         (parametros) -> return type in
//         //codigo
//     }

// */
// reversedNames = names.sort(by:{(s1: String, s2: String) -> Bool in return s1>s2}) 
// reversedNames = names.sort(by:{s1, s2 in s1>s2})
// reversedNames = names.sort(by:{$0>$1}) 
// reversedNames = names.sort(by: >) 
////Trailingclosure
// reversedNames = names.sort {$0>$1}

// func somefunctionTakesAClosure(closure: () -> Void){
// }

// someFunctionTakesAClosure(closure: {
// })

// //trailing closures
// // someFunctionTakesAClosure {
// // }

let digitNames = [0:"cero ", 1:"uno ", 2:"dos ", 3:"tres ",
                4:"cuatro ", 5:"cinco ", 6:"seis ",
                7:"siete ",8:"ocho ", 9:"nueve "]
let numbers = [16, 58, 510, 2127,-17]

let numberStrings = numbers.map {
    (number) -> String in
    var number = number 
    var output = ""
    let menos = "minus"
    if number < 0 {
        output = menos
        number *= -1
        repeat{
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    }else{
    repeat{
        output = digitNames[number%10]! + output
        number /= 10
    } while number > 0
    }
    return output
}
print(numberStrings)

 // con numeros negativos


