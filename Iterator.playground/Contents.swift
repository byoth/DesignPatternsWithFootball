// MARK: - Modeling

struct GOATAggregator {
    let root: GOAT
}

class GOAT {
    let name: String
    var next: GOAT?
    
    init(name: String) {
        self.name = name
    }
}

// MARK: - Applying Iterator Pattern

extension GOATAggregator: Sequence {
    struct Iterator: IteratorProtocol {
        private var current: GOAT?
        
        init(start: GOAT) {
            self.current = start
        }
        
        mutating func next() -> GOAT? {
            let actual = current
            current = current?.next
            return actual
        }
    }
    
    func makeIterator() -> Iterator {
        Iterator(start: root)
    }
}

// MARK: - Usage

let pele = GOAT(name: "Pele")
let maradona = GOAT(name: "Maradona")
let messi = GOAT(name: "Messi")
let goats = GOATAggregator(root: pele)

pele.next = maradona
maradona.next = messi

for goat in goats {
    print(goat.name)
}
