// MARK: - Modeling

class Player {
    var x: Int
    var y: Int
    
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
    
    var position: String {
        "x: \(x), y: \(y)"
    }
    
    func dribble(x: Int, y: Int) {
        self.x += x
        self.y += y
        print(position)
    }
}

// MARK: - Applying Command Pattern

protocol Command {
    associatedtype Receiver
    
    var receiver: Receiver { get }
    
    func execute()
    func undo()
}

class Invoker {
    private var histories: [any Command] = []
    
    func executeCommand(_ command: some Command) {
        command.execute()
        histories.append(command)
    }
    
    func undoCommand() {
        guard let history = histories.popLast() else {
            return
        }
        history.undo()
    }
}

struct DribbleCommand: Command {
    let receiver: Player
    let x: Int
    let y: Int
    
    func execute() {
        player.dribble(x: x, y: y)
    }
    
    func undo() {
        player.dribble(x: -x, y: -y)
    }
}

// MARK: - Usage

let invoker = Invoker()
let player = Player()

invoker.executeCommand(DribbleCommand(receiver: player, x: 10, y: 10))
invoker.executeCommand(DribbleCommand(receiver: player, x: 10, y: 20))
invoker.executeCommand(DribbleCommand(receiver: player, x: 20, y: 10))
invoker.undoCommand()
invoker.undoCommand()
