/*
 *  Singleton Pattern
 *
 */

class MySingleton {
    
    // 1. 使用 static let 讓此屬性變成「唯一無法變更的」物件
    static let sharedInstance = MySingleton(name: "Shared")
    
    var name: String
    
    // 2. 使用 private init() 讓其他檔案的程式無法新增此類物件
    private init(name: String) {
        self.name = name
    }
    
    func hello(){
        print("Hello, \(name) !")
    }
    
}

// 測試碼

MySingleton.sharedInstance.hello()              // Hello, Shared !

// 注意：
//     private init() 只能阻擋「其他檔案」的程式碼無法新增此類物件，
//     但無法阻擋自己所在的檔案內新增此類物件！

// Access Control:
//      private: accessible only within that particular "FILE"
//     internal: accessible only within the module (project)
//       public: accessible from anywhere

let s = MySingleton(name: "Other")
s.hello()                                       // Hello, Other !

let isSame = s === MySingleton.sharedInstance   // false
