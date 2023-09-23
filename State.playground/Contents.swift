// MARK: - Modeling with State Pattern

class Player {
    var speed: Int = 0
    lazy var state: State = StayState(player: self)
    
    func sprint() {
        state.sprint()
    }
    
    func run() {
        state.run()
    }
    
    func stay() {
        state.stay()
    }
}

class State {
    let player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    func sprint() {
        player.state = SprintState(player: player)
        print("sprint speed: \(player.speed)")
    }
    
    func run() {
        player.state = RunState(player: player)
        print("run speed: \(player.speed)")
    }
    
    func stay() {
        player.state = StayState(player: player)
        print("stay speed: \(player.speed)")
    }
}

class SprintState: State {
    override func sprint() {
        player.speed = 30
        super.sprint()
    }
    
    override func run() {
        player.speed = 15
        super.run()
    }
    
    override func stay() {
        player.speed = 5
        super.stay()
    }
}

class RunState: State {
    override func sprint() {
        player.speed = 25
        super.sprint()
    }
    
    override func run() {
        player.speed = 10
        super.run()
    }
    
    override func stay() {
        player.speed = 0
        super.stay()
    }
}

class StayState: State {
    override func sprint() {
        player.speed = 20
        super.sprint()
    }
    
    override func run() {
        player.speed = 10
        super.run()
    }
    
    override func stay() {
        player.speed = 0
        super.stay()
    }
}

// MARK: - Usage

let player = Player()

player.run()
player.stay()
player.sprint()
player.stay()
player.sprint()
player.sprint()
