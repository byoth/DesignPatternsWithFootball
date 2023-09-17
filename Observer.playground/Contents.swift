// MARK: - Modeling with Observer Pattern

class Publisher {
    private var observers: [Observer] = []
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        observers.removeAll(where: { $0 === observer })
    }
    
    func notifyObservers() {
        observers.forEach { $0.update() }
    }
}

protocol Observer: AnyObject {
    func update()
}

class Match: Publisher {
    let homeTeam: String
    let awayTeam: String
    private(set) var scores: (Int, Int) = (0, 0) {
        didSet {
            notifyObservers()
        }
    }
    
    init(homeTeam: String, awayTeam: String) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
    }
    
    var summary: String {
        "\(homeTeam) \(scores.0) : \(scores.1) \(awayTeam)"
    }
    
    func scoreByHomeTeam() {
        scores = (scores.0 + 1, scores.1)
    }
    
    func scoreByAwayTeam() {
        scores = (scores.0, scores.1 + 1)
    }
}

class Broadcasting: Observer {
    let name: String
    let match: Match
    
    init(name: String, match: Match) {
        self.name = name
        self.match = match
        match.addObserver(self)
    }
    
    deinit {
        match.removeObserver(self)
    }
    
    func update() {
        print("\(name) \(match.summary)")
    }
}

// MARK: - Usage

let match = Match(homeTeam: "FCB", awayTeam: "RMA")
let espn = Broadcasting(name: "ESPN", match: match)
let disney = Broadcasting(name: "Disney", match: match)

match.scoreByHomeTeam()
match.scoreByAwayTeam()
match.scoreByHomeTeam()
