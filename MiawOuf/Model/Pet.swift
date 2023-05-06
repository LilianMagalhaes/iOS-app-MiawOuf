

import Foundation

struct Pet {
    enum Gender {
        case male, female
    }
    
    var name: String?
    var hasMajority: Bool
    var phone: String?
    var race: String?
    var gender: Gender
}

extension Pet{
    enum Status {
        case accepted
        case rejected(String)
    }

    var status: Status {
        guard let name = name, name.isEmpty == false else {
            return .rejected("Vous n'avez pas indiqué votre nom !")
        }
        guard let phone = phone, phone.isEmpty == false else {
            return .rejected("Vous n'avez pas indiqué votre téléphone !")
        }
        guard let race = race, race.isEmpty == false else {
            return .rejected("Quel est votre race ?")
        }
        guard hasMajority else {
            return .rejected("Les mineurs ne sont pas admis.")
        }
        return .accepted
    }
}
