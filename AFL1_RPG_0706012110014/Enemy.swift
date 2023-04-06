//
//  Enemy.swift
//  0706012110014-DEVANO-AFL 1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

protocol Enemy {
    var healthPoints: Int { get set }
    func attack() -> Int
}
//musuh troll (forest)
class Troll: Enemy {
    var healthPoints: Int = 500
    
    
    func attack() -> Int {
            let damage = Int.random(in: 1...10)
            return damage
        }
}
//musuh golem (mountian)
class Golem: Enemy {
    var healthPoints: Int = 1000
    
    func attack() -> Int {
            let damage = Int.random(in: 1...10)
            return damage
        }
}
