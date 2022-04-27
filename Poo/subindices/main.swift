// subindeces :D solo en swift perras
// subscripts 
// intrinsecamente estan lo subscripts en los dir, array, conjuntos

struct timesTable {
    let multiplier: Int
    subscript(index: Int) -> Int{
        return self.multiplier * index
    }
    
}

let threeTimesTables = timesTable(multiplier: 3)
print("6x3 = \(threeTimesTables[6])")


for idx in 1...10 {
    print("\(idx)x3 = \(threeTimesTables[idx])")
}


enum planetas : Int {
    case mercurio = 1, venus, tierra, marte, jupiter, saturno, urano, neptuno
    static subscript ( n: Int) -> planetas{
        return planetas(rawValue: n)! //
    }
}


let marte = planetas[3]
print(marte)


// matrices con subindices 


struct Matrix {

    let rows : Int, columns : Int
    var grid : [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func  indexIsValid (row: Int, column: Int) -> Bool {
        return row>=0 && column>=0 && row < rows && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[ (row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column),"Index out of range" )
            return grid[ (row * columns) + column] = newValue
        }
    } 
}

var matrix = Matrix(rows: 8, columns: 8)

matrix[0, 1] = 1.5
matrix[1, 0] = 2.5
print("\(matrix.grid)  \n")
for row in 0..<matrix.rows {
    for col in 0..<matrix.columns{
        print(matrix[row, col], terminator: "\t")
    }
    print("\n")
}