// MARK: - Modeling

struct Team {
    let id: String
    let name: String
}

// MARK: - Applying Flyweight Pattern

class TeamFactory {
    private static var teams: [Team] = []
    
    func getTeam(id: String, name: String? = nil) -> Team {
        if let team = Self.teams.first(where: { $0.id == id }) {
            return team
        } else {
            let team = Team(id: id, name: name ?? "")
            defer { Self.teams.append(team) }
            return team
        }
    }
}

// MARK: - Usage

let factory = TeamFactory()
let realMadrid = factory.getTeam(id: "RMA", name: "Real Madrid")
let fcBarcelona = factory.getTeam(id: "FCB", name: "FC Barcelona")
let atleticoMadrid = factory.getTeam(id: "ATM", name: "Atletico Madrid")
let atm = factory.getTeam(id: "ATM", name: "Automated Tellar Machine")

[realMadrid, fcBarcelona, atleticoMadrid, atm].forEach {
    print("\($0.id) - \($0.name)")
}
