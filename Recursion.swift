// 參考：https://www.weheartswift.com/recursion/

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



/**************************************************
 *
 *    二元搜尋 (Binary Search)
 *
 **************************************************/

// 在已經排序好的陣列中搜尋

func binarySearch(

    key: Int,                       // 要搜尋的對象
    _ array: [Int],                 // 已排序好的陣列（遞增數列）
    left: Int = 0,                  // 搜尋範圍
    var right: Int = -1             // 預設範圍：0 ~ array.count - 1
    
) -> Bool {
    
    // 第一次進入搜尋程序，先設定右邊界
    if right == -1 { right = array.count - 1 }
    
    // 先找出中間項，並計算差異
    let index = (left + right)/2
    let m = array[index]
    
    // 
    print("搜尋範圍：\(array[left...right])")
    
    // 如果一致，則傳回 true
    if key == m { return true }
    
    // 如果不一致，而且也沒有項目可以搜尋了，則傳回 false
    if left == right { return false }
    
    // 還有項目可以搜尋，則搜尋適當的一半陣列
    if m < key {
        return binarySearch(key, array, left: index + 1, right: right)
    } else {
        return binarySearch(key, array, left: left, right: index - 1)
    }
    
}

// 測試碼
let ans = binarySearch(7, [1,3, 4, 7, 8, 10])

// 搜尋範圍：[1, 3, 4, 7, 8, 10]
// 搜尋範圍：[7, 8, 10]
// 搜尋範圍：[7]

print(ans)      // true
