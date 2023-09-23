// MARK: - Modeling

struct Team {
    let name: String
    let manager: String
    let coaches: [String]
    
    init(name: String, manager: String, coaches: [String]) {
        self.name = name
        self.manager = manager
        self.coaches = coaches
    }
    
    var description: String {
        "\(name) \(manager) \(coaches)"
    }
}

// MARK: - Applying Builder Pattern

struct TeamDirector {
    func buildProTeam(name: String, manager: String, coaches: [String]) -> Team {
        TeamBuilder()
            .setName(name)
            .setManager(manager)
            .setCoaches(coaches)
            .build()
    }
    
    func buildAmatuerTeam(name: String, manager: String?) -> Team {
        var builder = TeamBuilder()
            .setName(name)
        if let manager = manager {
            builder = builder.setManager(manager)
        }
        return builder.build()
    }
}

class TeamBuilder {
    private var name: String?
    private var manager: String?
    private var coaches: [String]?
    
    func setName(_ name: String) -> Self {
        self.name = name
        return self
    }
    
    func setManager(_ manager: String) -> Self {
        self.manager = manager
        return self
    }
    
    func setCoaches(_ coaches: [String]) -> Self {
        self.coaches = coaches
        return self
    }
    
    func build() -> Team {
        Team(
            name: name ?? "",
            manager: manager ?? "",
            coaches: coaches ?? []
        )
    }
}

// MARK: - Usage

let director = TeamDirector()
let proTeam = director.buildProTeam(name: "Manchester City", manager: "Pep", coaches: ["Arteta"])
let amatuerTeam = director.buildAmatuerTeam(name: "Sindorim FC", manager: "KDB")

print(proTeam.description)
print(amatuerTeam.description)
