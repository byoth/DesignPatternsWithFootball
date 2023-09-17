protocol Mediator {
    func notify(participant: Participant)
}

class Tactic: Mediator {
    let centerForward: CenterForward
    let wingForward: WingForward
    let wingBack: WingBack
    
    init(centerForward: CenterForward, wingForward: WingForward, wingBack: WingBack) {
        self.centerForward = centerForward
        self.wingForward = wingForward
        self.wingBack = wingBack
        centerForward.mediator = self
        wingForward.mediator = self
        wingBack.mediator = self
    }
    
    func notify(participant: Participant) {
        if let cf = participant as? CenterForward {
            if cf.isOnFrontLine {
                wingForward.spreadOutside()
            } else {
                wingForward.cutInside()
            }
        }
        
        if let wf = participant as? WingForward {
            if wf.isCuttingInside {
                wingBack.overlap()
            } else {
                wingBack.underlap()
            }
        }
    
        if let wb = participant as? WingBack {
            if wb.isOverlapping {
                centerForward.stayOnFrontLine()
            }
        }
    }
}

class Participant {
    var mediator: Mediator?
}

class CenterForward: Participant {
    private(set) var isOnFrontLine: Bool = false {
        didSet {
            mediator?.notify(participant: self)
        }
    }
    
    func stayOnFrontLine() {
        print("Center Forward is on the front line")
        isOnFrontLine = true
    }
    
    func playAsFalseNine() {
        print("Center Forward plays as a false nine")
        isOnFrontLine = false
    }
}

class WingForward: Participant {
    private(set) var isCuttingInside: Bool = false {
        didSet {
            mediator?.notify(participant: self)
        }
    }
    
    func cutInside() {
        print("Wing Forward is cutting inside")
        isCuttingInside = true
    }
    
    func spreadOutside() {
        print("Wing Forward is spreading outside")
        isCuttingInside = false
    }
}

class WingBack: Participant {
    private(set) var isOverlapping: Bool = false {
        didSet {
            mediator?.notify(participant: self)
        }
    }
    
    func overlap() {
        print("Wing Back is overlapping")
        isOverlapping = true
    }
    
    func underlap() {
        print("Wing Back is underlapping")
        isOverlapping = false
    }
}

let centerForward = CenterForward()
let wingForward = WingForward()
let wingBack = WingBack()
let tactic = Tactic(centerForward: centerForward, wingForward: wingForward, wingBack: wingBack)

centerForward.stayOnFrontLine()
print("===")
wingForward.cutInside()
print("===")
wingBack.overlap()
