// MARK: - Modeling

protocol Player {
    var type: String { get }
    var description: String { get }
}

struct Forward: Player {
    let type: String
    
    var description: String {
        "\(type) forward"
    }
}

struct Defender: Player {
    let type: String
    
    var description: String {
        "\(type) defender"
    }
}

// MARK: - Applying Abstract Factory Pattern

protocol PlayerFactory {
    func createForward() -> Player
    func createDefender() -> Player
}

class FootballPlayerFactory: PlayerFactory {
    func createForward() -> Player {
        Forward(type: "football")
    }
    
    func createDefender() -> Player {
        Defender(type: "football")
    }
}

class FutsalPlayerFactory: PlayerFactory {
    func createForward() -> Player {
        Forward(type: "futsal")
    }
    
    func createDefender() -> Player {
        Defender(type: "futsal")
    }
}

// MARK: - Usage

struct Example {
    let factory: PlayerFactory
    
    func execute() {
        let forward = factory.createForward()
        let defender = factory.createDefender()
        print(forward.description)
        print(defender.description)
    }
}

let football = Example(factory: FootballPlayerFactory())
let futsal = Example(factory: FutsalPlayerFactory())

football.execute()
futsal.execute()
