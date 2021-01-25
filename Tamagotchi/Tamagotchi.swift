//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Zhenglong Wu on 22/01/2021.
//

import Foundation
import SwiftUI

class Tamagotchi {
    
    var age: Int
    var weight: Double
    var name: String
    
    var health: Int {
        didSet{
            if health >= 5 {
                print("max health reached")
            }
        }
    }
    var hunger: Double
    var happy: Int
    
    var isDead: Bool
    var isIll: Bool
    
    var isAsleep: Bool
    var lightLevel: Bool
    
    init(age: Int, weight: Double, name: String, health: Int, hunger: Double, happy: Int, isDeadL: Bool, isIll: Bool, isAsleep: Bool, lightLevel: Bool) {
        
        self.age = 0
        self.weight = 0.5
        self.name = name
        
        self.health = 5
        self.hunger = 5
        self.happy = 5
        
        self.isDead = false
        self.isIll = false
        
        self.isAsleep = false
        self.lightLevel = true
        
    }
    
    private func eatMeal(hunger: Int){
        
        self.hunger += 1
        
    }
    
    private func eatSnack(hunger: Int){
        
        self.hunger += 0.5
    }
    
    private func playGame(happy: Int, discipline: Int){
        
        self.happy += 1
        self.hunger -= 1
        
    }
    
    private func sleep(lightLevel: Bool, isAsleep: Bool){
        
        if lightLevel == false{
            self.isAsleep = true
        }
        else{
            print("The lights are still on!")
        }
        
    }
    
    private func giveMedicine(health: Int, isIll: Bool){
        
        self.health += 1
        self.isIll = false
        
    }
    
    private func cleanDroppings(happy: Int){
        
        self.happy += 1
        
    }
    
    func displayStats(age: Int, weight: Double, name: String, health: Int, hunger: Double, happy: Int){
        print("""
            Age: \(age)
            Weight: \(weight)kg
            Name: \(name)
            
            Health: \(health)
            Hunger: \(hunger)
            Happy: \(happy)
            """)
    }
    
}
