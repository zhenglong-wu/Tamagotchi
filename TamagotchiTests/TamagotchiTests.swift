//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Zhenglong Wu on 22/01/2021.
//

import XCTest

class TamagotchiTests: XCTestCase {

    func testTamagotchiDisplayStatsFunctionReturnsStringOfStats(){
        
        let tamagotchi = Tamagotchi()
        
        let correctStats = """
            Age: 0 mins
            Health: 3/5
            Hunger: 3/5
            Happy: 3/5
            Droppings: 0
            """
        
        XCTAssertEqual(tamagotchi.displayStats(), correctStats)
        
    }
    
    func testTamagotchiGiveAgeFunctionReturnsDefaultAge(){
        
        let tamagotchi = Tamagotchi()
        
        let correctAge: Int = 0
    
        XCTAssertEqual(tamagotchi.giveAge(), correctAge)
        
    }
    
    func testGiveMedicineFunctionGivesTamagotchiOnePlusHealth(){
        
        let tamagotchi = Tamagotchi()
        
        let correctHealth = tamagotchi.health + 1
        
        tamagotchi.takeMedicine()
        
        XCTAssertEqual(tamagotchi.health, correctHealth)
    }
    
    func testGiveMealFunctionGivesTamagotchiTwoPlusHunger(){
        
        let tamagotchi = Tamagotchi()
        
        let correctHunger = tamagotchi.hunger + 2
        
        tamagotchi.eatMeal()
        
        XCTAssertEqual(tamagotchi.hunger, correctHunger)
        
    }
    
    func testGiveSnackFunctionGivesTamagotchiOnePlusHunger(){
        
        let tamagotchi = Tamagotchi()
        
        let correctHunger = tamagotchi.hunger + 1
        
        tamagotchi.eatSnack()
        
        XCTAssertEqual(tamagotchi.hunger, correctHunger)
        
    }
    
    
}
