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

    
    override func setUp() {
        super.setUp()
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
       app  = XCUIApplication()

           }
    
    
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

/*
    func testButton1() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["1"].tap()
 
        XCTAssertEqual(txtField.value as! String, "1")
    }
    
    func testButton2() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["2"].tap()
        
        XCTAssertEqual(txtField.value as! String, "2")
    }
    
    func testButton3() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["3"].tap()
        
        XCTAssertEqual(txtField.value as! String, "3")
    }
    
    func testButton4() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["4"].tap()
        
        XCTAssertEqual(txtField.value as! String, "4")
    }

    func testButton5() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["5"].tap()
        
        XCTAssertEqual(txtField.value as! String, "5")
    }
    
    func testButton6() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["6"].tap()
        
        XCTAssertEqual(txtField.value as! String, "6")
    }

    func testButton7() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["7"].tap()
        
        XCTAssertEqual(txtField.value as! String, "7")
    }

    func testButton8() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["8"].tap()
        
        XCTAssertEqual(txtField.value as! String, "8")
    }

    func testButton9() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["9"].tap()
        
        XCTAssertEqual(txtField.value as! String, "9")
    }

    func testButtonDot() {
        
        let txtField = app.textFields["textField"]
        
        XCTAssertEqual(txtField.value as! String, "0")
        
        app.buttons["4"].tap()
        app.buttons["."].tap()
        
        XCTAssertEqual(txtField.value as! String, "4.")
    }

    func testButtonClear() {
 
        let txtField = app.textFields["textField"]
        
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        
        XCTAssertEqual(txtField.value as! String, "123")
        
        app.buttons["C"].tap()

        
        XCTAssertEqual(txtField.value as! String , "0")
    }
    
    func testButtonAdd() {
        
        XCTAssertEqual(app.buttons["+"].label , "+")
    
    }
    
    func testButtonSub() {
        
        XCTAssertEqual(app.buttons["-"].label , "-")
    }
    
    func testButtonMul() {
        
        
        XCTAssertEqual(app.buttons["✕"].label , "✕")
    }
    
    func testButtonDiv() {
        
        XCTAssertEqual(app.buttons["÷"].label , "÷")
    }
    
    func testButtonEqual() {
        
        XCTAssertEqual(app.buttons["="].label , "=")
        XCTAssertFalse(app.buttons["="].label  == "÷")
    }
*/
    func testCalcFuctionAll(){
        let txtField = app.textFields["textField"]

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
    
    func testExpression(){
        let txtField = app.textFields["textField"]
        
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
