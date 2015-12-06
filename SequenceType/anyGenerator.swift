var n = 0

var naturalNumbers = anyGenerator{ ++n }

naturalNumbers.next()    // Optional(1)
naturalNumbers.next()    // Optional(2)
naturalNumbers.next()    // Optional(3)
