// MARK: - Modeling with Bridge Pattern

protocol Playing {
    var player: Player { get }
    
    func play()
}

protocol Player {
    func attack()
    func defend()
}

struct Attack: Playing {
    let player: Player
    
    func play() {
        player.attack()
    }
}

struct Defence: Playing {
    let player: Player
    
    func play() {
        player.defend()
    }
}

struct FullCourtPlayer: Player {
    func attack() {
        print("Attack the opponent side")
    }
    
    func defend() {
        print("Defend our side")
    }
}

struct HalfCourtPlayer: Player {
    func attack() {
        print("Attack the same side")
    }
    
    func defend() {
        print("Defend the same side")
    }
}

// MARK: - Usage

let fullCourtPlayer = FullCourtPlayer()
let halfCourtPlayer = HalfCourtPlayer()
let fullCourtAttack = Attack(player: fullCourtPlayer)
let fullCourtDefence = Defence(player: fullCourtPlayer)
let halfCourtAttack = Attack(player: halfCourtPlayer)
let halfCourtDefence = Defence(player: halfCourtPlayer)

fullCourtAttack.play()
fullCourtDefence.play()
halfCourtAttack.play()
halfCourtDefence.play()
