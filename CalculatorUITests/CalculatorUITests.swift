//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Vitalik Ushakov on 12/3/16.
//  Copyright © 2016 VItalik Ushakov. All rights reserved.
//

import XCTest
@testable import Calculator


class CalculatorUITests: XCTestCase {
    
    var app : XCUIApplication!
    var txtField : XCUIElement!
    
    override func setUp() {
        super.setUp()
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app  = XCUIApplication()
        txtField = app.textFields["textField"]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testFuctionAddSubClearMulDivAndViewError(){
    //Add
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["."].tap()
        app.buttons["2"].tap()
        
        XCTAssertEqual(txtField.value as! String, "10.2")
        
        app.buttons["+"].tap()
        
        app.buttons["3"].tap()
        app.buttons["."].tap()
        app.buttons["4"].tap()
        
        XCTAssertEqual(txtField.value as! String, "3.4")
        
        app.buttons["="].tap()
        
        XCTAssertEqual(txtField.value as! String, "13.6")
        
    //Sub
        app.buttons["-"].tap()
        
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
            
        XCTAssertEqual(txtField.value as! String, "7.8")
        
        app.buttons["="].tap()

        XCTAssertEqual(txtField.value as! String, "5.8")

    //Clear
        app.buttons["C"].tap()
        
        XCTAssertEqual(txtField.value as! String, "0")
        
    //Mul
        app.buttons["9"].tap()
        
        XCTAssertEqual(txtField.value as! String, "9")
        
        app.buttons["✕"].tap()
        
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        
        XCTAssertEqual(txtField.value as! String, "10")

        app.buttons["="].tap()
        
        XCTAssertEqual(txtField.value as! String, "90.0")
        
    //Div
        app.buttons["÷"].tap()
        
        app.buttons["5"].tap()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(txtField.value as! String, "18.0")
        
    //Div by 0
        app.buttons["5"].tap()
        app.buttons["÷"].tap()
        
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["DivBy0"].label, "DivBy0")
        XCTAssertEqual(app.buttons["Close"].label , "Close")
        
        app.buttons["Close"].tap()
    }
    
    func testInputExpressionAndViewError(){
        app.textFields["inputField"].tap()
     
        app.typeText("2+2*2")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(txtField.value as! String, "6.0")
        
        app.textFields["inputField"].tap()
        app.typeText("2+/2*2")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(app.staticTexts["invalExp"].label, "invalExp")
        XCTAssertEqual(app.buttons["Close"].label , "Close")
        
        app.buttons["Close"].tap()
    }
}
