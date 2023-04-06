//
//  Skill.swift
//  0706012110014-DEVANO-AFL 1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation
//
//  Enemy.swift
//  0706012110014-DEVANO-AFL 1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

class Skill {
    var name: String
    var damage: Int
    var mpCost: Int
    
    init(name: String, damage: Int, mpCost: Int) {
        self.name = name
        self.damage = damage
        self.mpCost = mpCost
    }
}
//skill basic
class PhysicalAttack: Skill {
    init() {
        super.init(name: "Physical Attack", damage: 5, mpCost: 0)
    }
}
//skill meteor
class Meteor: Skill {
    init() {
        super.init(name: "Meteor", damage: 50, mpCost: 15)
    }
}
    //skill shield
class Shield: Skill {
    init() {
        super.init(name: "Shield", damage: 1, mpCost: 10)
    }
}
