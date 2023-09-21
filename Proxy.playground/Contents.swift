// MARK: - Modeling

protocol Team {
    func printPlayers()
    func buyPlayer(name: String)
}

class DefaultTeam: Team {
    var players: [String]
    
    init(players: [String] = []) {
        self.players = players
    }
    
    func printPlayers() {
        print(players.joined(separator: ", "))
    }
    
    func buyPlayer(name: String) {
        players.append(name)
    }
}

// MARK: - Applying Proxy Pattern

class TeamProxy: Team {
    private var team: Team?
    private var players: [String] = []
    
    func printPlayers() {
        team?.printPlayers()
    }
    
    func buyPlayer(name: String) {
        if let team = team {
            team.buyPlayer(name: name)
        } else {
            players.append(name)
            if players.count >= 4 {
                self.team = DefaultTeam(players: players)
            }
        }
    }
}

// MARK: - Usage

let team: Team = TeamProxy()

team.buyPlayer(name: "Kane")
team.buyPlayer(name: "Musiala")
team.buyPlayer(name: "Minjae")
team.printPlayers()
team.buyPlayer(name: "Neuer")
team.printPlayers()
