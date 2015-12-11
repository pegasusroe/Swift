/**************************************************
 *
 *    列出一個整數的每一個位數
 *
 **************************************************/

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


/**************************************************
 *
 *    最大公因數
 *
 **************************************************/

func gcd(a: Int, _ b: Int) -> Int {
    
    // (0,0) 沒有最大公因數
    guard !(a == 0 && b == 0) else { return 0 }
    
    // 將負數調為正數
    guard a >= 0 else { return gcd(-a, b) }
    guard b >= 0 else { return gcd(a, -b) }
    
    // 將大的數調到前面
    guard a >= b else { return gcd(b, a) }
    
    // base case
    if b == 0 { return a }
    
    // other cases
    let r = a % b
    return gcd(b, r)
}


// 測試碼
let d = gcd(789, 123)           // 3
print(d)
