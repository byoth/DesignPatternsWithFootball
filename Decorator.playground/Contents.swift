// MARK: - Modeling

protocol Employee {
    var salary: Int { get }
    
    func work()
}

class Player: Employee {
    let salary: Int
    
    init(salary: Int) {
        self.salary = salary
    }
    
    func work() {
        print("Play football and receive a salary of \(salary)")
    }
}

// MARK: - Applying Decorator Pattern

protocol EmployeeDecorator: Employee {
    var wrappee: Employee { get }
}

class CoachDecorator: EmployeeDecorator {
    let wrappee: Employee
    let salary: Int
    
    init(wrappee: Employee, salary: Int) {
        self.wrappee = wrappee
        self.salary = salary
    }
    
    func work() {
        print("Coach players and receive a salary of \(salary)")
    }
}

// MARK: - Usage

let player = Player(salary: 50)
player.work()

let coach = CoachDecorator(wrappee: player, salary: 100)
coach.work()
