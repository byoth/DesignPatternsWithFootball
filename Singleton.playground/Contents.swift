// MARK: - Modeling with Singleton Pattern

final class Ball {
    static let shared = Ball()
    
    private init() {
    }
}

struct Player {
    let name: String
    
    func kick(ball: Ball) {
        print("\(name) kicked the ball \(ObjectIdentifier(ball))")
    }
}

// MARK: - Usage

let ball = Ball.shared
let players = ["A", "B", "C"].map { Player(name: $0) }

players.forEach {
    $0.kick(ball: ball)
}
