var n = 0

var naturalNumbers = anyGenerator{ ++n }

naturalNumbers.next()    // Optional(1)
naturalNumbers.next()    // Optional(2)
naturalNumbers.next()    // Optional(3)


enum Dwarf: Int {
    
    case Bashful = 1, Happy, Sleepy, Sneezy
    
    static var members : [Dwarf] { 
        var i = 1
        return Array(anyGenerator{ Dwarf(rawValue: i++) })
    }
    
}

print(Dwarf.members)
// [Dwarf.Bashful, Dwarf.Happy, Dwarf.Sleepy, Dwarf.Sneezy]
