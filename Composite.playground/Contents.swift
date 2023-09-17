// MARK: - Modeling with Composite Pattern

protocol PlayerGroup {
    var name: String { get }
    var playersCount: Int { get }
}

struct League: PlayerGroup {
    let name: String
    let teams: [Team]
    
    var playersCount: Int {
        teams
            .map { $0.playersCount }
            .reduce(0, +)
    }
}

struct Team: PlayerGroup {
    let name: String
    let playersCount: Int
}

// MARK: - Usage

let mnc = Team(name: "Manchester City", playersCount: 40)
let liv = Team(name: "Liverpool FC", playersCount: 36)
let ars = Team(name: "Arsenal", playersCount: 32)
let pl = League(name: "Premier League", teams: [mnc, liv, ars])
let groups: [PlayerGroup] = [pl, mnc, liv, ars]

groups.forEach {
    print("\($0.name) - \($0.playersCount) players")
}
