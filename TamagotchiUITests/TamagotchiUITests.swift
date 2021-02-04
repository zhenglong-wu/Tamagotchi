//
//  TamagotchiUITests.swift
//  TamagotchiUITests
//
//  Created by Zhenglong Wu on 22/01/2021.
//

import XCTest

class TamagotchiUITests: XCTestCase {

    func testWhenAppLaunchesAllButtonsCleanUpAreEnabled() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = XCUIApplication().tables
        
        XCTAssertEqual(tablesQuery.buttons["Give meal"].isEnabled, true)
        
        XCTAssertEqual(tablesQuery.buttons["Give snack"].isEnabled, true)
        
        XCTAssertEqual(tablesQuery.buttons["Give medicine"].isEnabled, true)
        
        XCTAssertEqual(tablesQuery.buttons["Clean up"].isEnabled, false)
        
        XCTAssertEqual(tablesQuery.buttons["Play game"].isEnabled, true)
        
    }
    
    func testWhenTamagotchiDiesAllButtonsAreDisabled() throws {
        
        let app = XCUIApplication()
        app.launch()
                
        let tablesQuery = XCUIApplication().tables
        
        let playGameElement = XCUIApplication().tables.cells["Play game"].otherElements.containing(.button, identifier:"Play game").element
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        playGameElement.tap()
        
        XCTAssertEqual(tablesQuery.buttons["Give meal"].isEnabled, false)
        
        XCTAssertEqual(tablesQuery.buttons["Give snack"].isEnabled, false)
        
        XCTAssertEqual(tablesQuery.buttons["Give medicine"].isEnabled, false)
        
        XCTAssertEqual(tablesQuery.buttons["Clean up"].isEnabled, false)
        
        XCTAssertEqual(tablesQuery.buttons["Play game"].isEnabled, false)
        
    }
    
    func testWhenTamagotchiDiesGameEndButtonIsEnabled() throws {
        
        let app = XCUIApplication()
        app.launch()
            
        let tablesQuery = app.tables
        tablesQuery.cells["Play game"].otherElements.containing(.button, identifier:"Play game").element.tap()
        
        let playGameButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Play game"]/*[[".cells[\"Play game\"].buttons[\"Play game\"]",".buttons[\"Play game\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
        playGameButton.tap()
     
        XCTAssertEqual(app.buttons["Continue"].isEnabled, true)
    
    }
    
}
