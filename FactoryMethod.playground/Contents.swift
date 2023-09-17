// MARK: - Modeling

protocol Player {
    var name: String { get }
    var introduction: String { get }
}

struct FootballPlayer: Player {
    let name: String
    
    var introduction: String {
        "\(name), football player"
    }
}

struct FutsalPlayer: Player {
    let name: String
    
    var introduction: String {
        "\(name), futsal player"
    }
}

// MARK: - Applying Factory Method Pattern

struct PlayerFactory {
    func createPlayer(name: String, type: PlayerType) -> Player {
        switch type {
        case .football:
            return FootballPlayer(name: name)
        case .futsal:
            return FutsalPlayer(name: name)
        }
    }
}

enum PlayerType {
    case football
    case futsal
}

// MARK: - Usage

let factory = PlayerFactory()
let footballPlayer = factory.createPlayer(name: "Neymar", type: .football)
let futsalPlayer = factory.createPlayer(name: "Neymar", type: .futsal)

print(footballPlayer.introduction)
print(futsalPlayer.introduction)
