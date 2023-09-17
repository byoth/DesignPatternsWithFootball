// MARK: - Modeling with Strategy Pattern

class Player {
    var kickType: KickStrategy
    
    init(kickType: KickStrategy) {
        self.kickType = kickType
    }
    
    func kick() {
        kickType.kick()
    }
}

protocol KickStrategy {
    func kick()
}

struct InstepKick: KickStrategy {
    func kick() {
        print("Kick hard!")
    }
}

struct InsideKick: KickStrategy {
    let curve: Int
    
    func kick() {
        print("Kick with curve \(curve).")
    }
}

// MARK: - Usage

let player = Player(kickType: InstepKick())

player.kick()
player.kickType = InsideKick(curve: 30)
player.kick()
