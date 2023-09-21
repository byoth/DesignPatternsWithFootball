// MARK: - Modeling with Prototype Pattern

protocol Prototype: AnyObject {
    init(prototype: Self)
}

extension Prototype {
    func clone() -> Self {
        type(of: self).init(prototype: self)
    }
}

class Uniform: Prototype {
    let name: String
    let number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    required convenience init(prototype: Uniform) {
        self.init(name: prototype.name, number: prototype.number)
    }
    
    var description: String {
        "\(ObjectIdentifier(self))\n\(name)\n\(number)"
    }
}

// MARK: - Usage

let uniform = Uniform(name: "LEE KANG IN", number: 19)
let replica = Uniform(prototype: uniform)

print(uniform.description)
print(replica.description)
