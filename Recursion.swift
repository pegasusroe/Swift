// 將整數轉變為每一個位數的陣列
func digits(n: Int) -> [Int] {

    // 考慮負數
    guard n >= 0 else { return [-1] + digits(-n) }

    // base case
    if n < 10 { return [n] }
    
    // 
    return digits(n/10) + [n%10]
}

// 測試碼
let b = digits(-54321)
print(b)                    // [-1, 5, 4, 3, 2, 1]
