// MARK: - Modeling

class Referee {
    func receiveComplaints() -> Bool {
        true
    }
}

class AssistanceReferee {
    func checkOffside() -> Bool {
        true
    }
}

class VARCam {
    func checkOffside() -> Bool {
        false
    }
}

// MARK: - Applying Facade Pattern

class OffsideDecisionFacade {
    let referee: Referee
    let assistanceReferee: AssistanceReferee
    let varCam: VARCam
    
    init(referee: Referee, assistanceReferee: AssistanceReferee, varCam: VARCam) {
        self.referee = referee
        self.assistanceReferee = assistanceReferee
        self.varCam = varCam
    }
    
    func execute() -> Bool {
        if referee.receiveComplaints() {
            return varCam.checkOffside()
        } else {
            return assistanceReferee.checkOffside()
        }
    }
}

// MARK: - Usage

let referee = Referee()
let assistanceReferee = AssistanceReferee()
let varCam = VARCam()
let offsideDecision = OffsideDecisionFacade(referee: referee, assistanceReferee: assistanceReferee, varCam: varCam)

print(offsideDecision.execute())
