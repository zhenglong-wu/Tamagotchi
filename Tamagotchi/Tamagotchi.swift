//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Zhenglong Wu on 22/01/2021.
//

import Foundation

import SwiftUI

class Tamagotchi: ObservableObject {
    
    @Published var age: Int   
    
    @Published var health: Int {
        didSet {
            if health > 5 {
                health = 5
            }
            else if health < 0 {
                health = 0
            }
        }
    }
    @Published var hunger: Int {
        didSet {
            if hunger > 5 {
                hunger = 5
            }
            else if hunger < 0 {
                hunger = 0
            }
        }
    }
    @Published var happy: Int {
        didSet {
            if happy > 5 {
                happy = 5
            }
            else if happy < 0 {
                happy = 0
            }
        }
    }
    
    @Published var isIll: Bool
    @Published var droppings: Int {
        didSet {
            if droppings < 0 {
                droppings = 0
            }
        }
    }
        
    init(){
        age = 0
        health = 3
        hunger = 3
        happy = 3
        isIll = false
        droppings = 0
    }
    
    func eatSnack(){
        hunger += 1
    }
    
    func eatMeal(){
        hunger += 2
    }
    
    func playGame(){
        happy += 1
        hunger -= 1
        
        let randomInt = Int.random(in: 0..<5)
        
        if randomInt == 1{
            getHurt()
        }
    }
    
    func takeMedicine(){
        health += 1
    }
    
    func beCleanedUp(){
        droppings -= 1 
    }
    
    func grow(){
        age += 1
    }
    
    func drop(){
        droppings += 1
    }
    
    func beIll(){
        isIll = true
    }
    
    func getHurt(){
        health -= 1
    }
    
    func getUnHappy(){
        happy -= 1
    }
    
    func getHungry(){
        hunger -= 1
    }
    
    func giveAge() -> Int {
        return age
    }
    
    func displayStats() -> String {
        return("""
            Age: \(age) mins
            Health: \(health)/5
            Hunger: \(hunger)/5
            Happy: \(happy)/5
            Droppings: \(droppings)
            """)
    }
    
}
