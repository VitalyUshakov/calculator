//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Vitalik Ushakov on 12/3/16.
//  Copyright © 2016 Vitalik Ushakov. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateInitialViewController() as! ViewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Dot is Present
        func testIsDot () {
            _ = ViewController()
            let str = "59.0"
            XCTAssertTrue(ViewController().isDot(str: str))
        }
        
        // Dot is't Present
        func testIsNotDot () {
            _ = ViewController()
            let str = "4535535"
            XCTAssertFalse(ViewController().isDot(str: str))
        }
        
        func testroundAndViewResultWith5NumberAccuracy() {
            _ = ViewController()
            let doubleInput = 12345.1234567890
            let intKoeff = 5
            let result = ViewController().roundAndViewResult(input: doubleInput, accuracy: intKoeff)
            XCTAssertTrue(result == "12345.12346")
        }
        func testroundAndViewResultWith7NumberAccuracy() {
            _ = ViewController()
            let doubleInput = 12345.1234567890
            let intKoeff = 7
            let result = ViewController().roundAndViewResult(input: doubleInput, accuracy: intKoeff)
            XCTAssertTrue(result == "12345.1234568")
        }
        
        
        func testAnswerAdd() {
            vc.newNumber = false
            var num1 = 5.0
            var num2 = 8.0
            vc.operationItem = "+"
            vc.firstNumber = 5.0
            vc.secondNumber = 8.0
            vc.accuracyNumber = 5
            var result = vc.answer()
            XCTAssertTrue(result == String(num1 + num2))
            
            num1 = 8.0
            num2 = -5.0
            vc.firstNumber = 8.0
            vc.secondNumber = -5.0
            result = vc.answer()
            XCTAssertTrue(result == String(num1 + num2))
            
            num1 = 8.0
            num2 = -8.0
            vc.firstNumber = 8.0
            vc.secondNumber = -8.0
            result = vc.answer()
            XCTAssertTrue(result == String(num1 + num2))

            
            
        }
        
        func testAnswerSub() {
            vc.newNumber = false
            var num1 = 5.0
            var num2 = 8.0
            vc.operationItem = "-"
            vc.firstNumber = 5.0
            vc.secondNumber = 8.0
            var result = vc.answer()
            XCTAssertTrue(result == String(num1 - num2))
            
            num1 = 8
            num2 = -5
            vc.firstNumber = 8
            vc.secondNumber = -5
            result = vc.answer()
            XCTAssertTrue(result == String(num1 - num2))
            
            num1 = 8.0
            num2 = -8.0
            vc.firstNumber = 8.0
            vc.secondNumber = -8.0
            result = vc.answer()
            XCTAssertTrue(result == String(num1 - num2))
        }
        
        func testAnswerMul() {
            vc.newNumber = false
            var num1 = 5.0
            var num2 = 8.0
            vc.operationItem = "✕"
            vc.firstNumber = 5.0
            vc.secondNumber = 8.0
            var result = vc.answer()
            XCTAssertTrue(result == String(num1 * num2))
            
            num1 = 8.0
            num2 = -5.0
            vc.firstNumber = 8.0
            vc.secondNumber = -5.0
            result = vc.answer()
            XCTAssertTrue(result == String(num1 * num2))
            
            num1 = 8.0
            num2 = -8.0
            vc.firstNumber = 8.0
            vc.secondNumber = -8.0
            result = vc.answer()
            XCTAssertTrue(result == String(num1 * num2))
        }
        
        func testAnswerDiv() {
            vc.newNumber = false
            vc.operationItem = "÷"
            vc.firstNumber = 5.0
            vc.secondNumber = 3.0
            var result = vc.answer()
            XCTAssertTrue(result == "1.66667")
            
            vc.firstNumber = 8.0
            vc.secondNumber = 0.0
            result = vc.answer()
            XCTAssertTrue(result == "")
        }


        
        

 //   }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
}
