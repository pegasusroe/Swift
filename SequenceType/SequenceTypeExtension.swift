// 擴充元素為 Int 的 SequenceType
extension SequenceType where Generator.Element == Int {

    // 讓 SequenceType 擁有「連乘」的功能
    // 注意：如果用在無限數列，應該會掛掉！
    func product() -> Int {
        return self.reduce(1) { $0 * $1 }
    }
    
}

var n = 1

// 做一個會產生 1 ~ 5 的 Generator
let numberGenerator = anyGenerator {
    return n <= 5 ? n++ : nil
}

// 用產生器新增數列：[1,2,3,4,5]
let a = Array(numberGenerator)

a.product()         // 120
