// MARK: - Modeling

protocol Unit {
}

struct Player: Unit {
    let name: String
    let position: String
    
    init(name: String, position: String) {
        self.name = name
        self.position = position
    }
}

struct Team: Unit {
    let name: String
    let players: [Player]
    
    init(name: String, players: [Player]) {
        self.name = name
        self.players = players
    }
}

// MARK: - Applying Visitor Pattern

protocol Visitor {
    func visit(_ unit: Unit)
}

extension Unit {
    func accept(visitor: Visitor) {
        visitor.visit(self)
    }
}

struct DescriptionVisitor: Visitor {
    func visit(_ unit: Unit) {
        switch unit {
        case let player as Player:
            print("- \(player.name) \(player.position)")
        case let team as Team:
            print("Players of \(team.name):")
            for player in team.players {
                player.accept(visitor: self)
            }
        default:
            break
        }
    }
}

// MARK: - Usage

let forward = Player(name: "Kane", position: "Forward")
let defender = Player(name: "Minjae", position: "Defender")
let team = Team(name: "Bayern Munich", players: [forward, defender])
let visitor = DescriptionVisitor()

visitor.visit(forward)
visitor.visit(defender)
visitor.visit(team)
