import Foundation

// 設定指數運算的結合方向與優先權
infix operator ^^ { associativity left precedence 160 }

/// 指數運算
/// - Warning: -2^^4 == (-2)^^4 == 16
/// - Warning: 「-」運算有最高優先權，所以會比「^^」運算先執行。

public func ^^ (a: Double, x: Double) -> Double {
  return pow(a, x)
}

/// 指數運算

public func ^^ (a: Int, x: Int) -> Double {
  return pow(Double(a), Double(x))
}


infix operator ^^= { associativity right precedence 90 }

/// ```swift
/// var a = 2.0
/// a ^^= 3       // a == a^^3 == 8

public func ^^= (inout a: Double, x: Double) {
  a = a ^^ x
}
