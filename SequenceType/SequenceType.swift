// GeneratorType 必須符合兩個要件：
//
// 1. 指定 Element 的型別：
//
//        typealias Element = <指定的型別>
//
// 2. 實作產生下一個 Element 的方法：
//
//        mutating func next() -> Element? { <實作的方法放這裡> }

struct FiboGenerator: GeneratorType {
    
    typealias Element = Int
    
    var fibo = (0,1)
    
    mutating func next() -> Element? {
        fibo = (fibo.1, fibo.0 + fibo.1)
        return fibo.0
    }
}


// SequenceType 必須符合兩個要件：
//
// 1. 指定 Generator 的型別：
//
//        typealias Generator = < Generator 的型別 >
//
// 2. 實作產生 Generator 的方法：
//
//        func generate() -> Generator { <實作的方法放這裡> }

struct FiboSequence: SequenceType {
    
    typealias Generator = FiboGenerator
    func generate() -> Generator { return FiboGenerator() }
    
}



// 測試 FiboGenerator
print("FiboGenerator -------------")

var fiboGen  = FiboGenerator()
while let fibo = fiboGen.next() {
    if fibo > 4 { break }
    print(fibo)
}

// 測試 FiboSequence
print("FiboSequence -------------")

let seq = FiboSequence()

for n in seq {
    if n > 9 { break }
    print(n)
}
