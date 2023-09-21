// MARK: - Modeling with Chain of Responsibility Pattern

protocol Handler: AnyObject {
    var nextHandler: Handler? { get set }
    
    func handle(command: String)
}

extension Handler {
    func setNext(handler: Handler) {
        if nextHandler == nil {
            nextHandler = handler
        } else {
            nextHandler?.setNext(handler: handler)
        }
    }
}

class BuildUp {
    private var firstHandler: Handler?
    
    func addHandler(_ handler: Handler) {
        if firstHandler == nil {
            firstHandler = handler
        } else {
            firstHandler?.setNext(handler: handler)
        }
    }
    
    func execute(command: String) {
        firstHandler?.handle(command: command)
    }
}

class DefenderHandler: Handler {
    var nextHandler: Handler?
    
    func handle(command: String) {
        if command == "defense" {
            print("Defender is having a ball")
        } else {
            nextHandler?.handle(command: command)
        }
    }
}

class MidfielderHandler: Handler {
    var nextHandler: Handler?
    
    func handle(command: String) {
        if command == "midfield" {
            print("Midfielder is having a ball")
        } else {
            nextHandler?.handle(command: command)
        }
    }
}

class AttackerHandler: Handler {
    var nextHandler: Handler?
    
    func handle(command: String) {
        if command == "attack" {
            print("Attacker is having a ball")
        } else {
            nextHandler?.handle(command: command)
        }
    }
}

// MARK: - Usage

let buildUp = BuildUp()
let defender = DefenderHandler()
let midfielder = MidfielderHandler()
let attacker = AttackerHandler()

buildUp.addHandler(defender)
buildUp.addHandler(midfielder)
buildUp.addHandler(attacker)

buildUp.execute(command: "defense")
buildUp.execute(command: "midfield")
buildUp.execute(command: "attack")
