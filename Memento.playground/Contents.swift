// MARK: - Modeling

class Player {
    var name: String
    var age: Int
    var power: Int
    var speed: Int
    
    init(name: String, age: Int, power: Int, speed: Int) {
        self.name = name
        self.age = age
        self.power = power
        self.speed = speed
    }
    
    var description: String {
        "\(name) \(age) \(power) \(speed)"
    }
    
    func getOld() {
        age += 1
        power -= Int.random(in: 0 ... 10)
        speed -= Int.random(in: 0 ... 10)
    }
}

// MARK: - Applying Memento Pattern

extension Player {
    struct Memento {
        let power: Int
        let speed: Int
    }
    
    func createMemento() -> Memento {
        Memento(power: power, speed: speed)
    }
    
    func restoreMemento(_ memento: Memento) {
        power = memento.power
        speed = memento.speed
    }
}

// MARK: - Usage

let dele = Player(name: "Dele Alli", age: 20, power: 90, speed: 90)
var memento: Player.Memento!

memento = dele.createMemento()
dele.getOld()
dele.getOld()
dele.getOld()
print(dele.description)
dele.restoreMemento(memento)
print(dele.description)
