// MARK: - Modeling with Template Method Pattern

class OneTwoPass {
    let player1: Player
    let player2: Player
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    final func execute() {
        print(getTitle())
        pass(from: player1, to: player2)
        makeSpace(playerOffTheBall: player1)
        pass(from: player2, to: player1)
    }
    
    func getTitle() -> String {
        "One-Two Pass"
    }
    
    func pass(from passer: Player, to receiver: Player) {
        passer.pass(to: receiver)
    }
    
    func makeSpace(playerOffTheBall: Player) {
    }
}

class BuildUpOneTwoPass: OneTwoPass {
    override func getTitle() -> String {
        "Build Up " + super.getTitle()
    }
    
    override func makeSpace(playerOffTheBall: Player) {
        playerOffTheBall.move(speed: 10)
    }
}

class AttackingOneTwoPass: OneTwoPass {
    override func getTitle() -> String {
        "Attacking " + super.getTitle()
    }
    
    override func makeSpace(playerOffTheBall: Player) {
        playerOffTheBall.move(speed: 30)
    }
}

class Player {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func pass(to receiver: Player) {
        print("\(name) passed to \(receiver.name)")
    }
    
    func move(speed: Int) {
        print("\(name) moved with speed \(speed)")
    }
}

// MARK: - Usage

let defender1 = Player(name: "Puyol")
let defender2 = Player(name: "Busquets")
let buildUp = BuildUpOneTwoPass(player1: defender1, player2: defender2)

let attacker1 = Player(name: "Messi")
let attacker2 = Player(name: "Neymar")
let attacking = AttackingOneTwoPass(player1: attacker1, player2: attacker2)

buildUp.execute()
attacking.execute()
