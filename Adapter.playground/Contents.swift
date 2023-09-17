// MARK: - Modeling

class Squad {
    var goalkeeper: Goalkeeper
    var fieldPlayers: [Player]
    
    init(goalkeeper: Goalkeeper, fieldPlayers: [Player]) {
        self.goalkeeper = goalkeeper
        self.fieldPlayers = fieldPlayers
    }
}

class Player {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func tackle() {
        print("\(name) tackled 🦶")
    }
    
    func getEjected() {
        print("\(name) got ejected 😨")
    }
}

class Goalkeeper: Player {
    func dive() {
        print("\(name) dived and saved 🙌")
    }
}

// MARK: - Applying Adapter Pattern

class GoalkeeperAdapter: Goalkeeper {
    let player: Player
    
    init(player: Player) {
        self.player = player
        super.init(name: player.name)
    }
    
    override func dive() {
        print("\(name) dived but failed to save 🙌")
    }
}

// MARK: - Usage

let lloris = Goalkeeper(name: "Hugo Lloris")
let kane = Player(name: "Harry Kane")
let spurs = Squad(goalkeeper: lloris, fieldPlayers: [kane])

lloris.dive()
lloris.tackle()
lloris.getEjected()

let kaneGoalkeeper = GoalkeeperAdapter(player: kane)
spurs.goalkeeper = kaneGoalkeeper
spurs.fieldPlayers.removeAll { $0 === kane }

kaneGoalkeeper.dive()
