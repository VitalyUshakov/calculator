//
//  RPN.swift
//  Calculator
//
//  Created by Vitalik Ushakov on 12/6/16.
//  Copyright © 2016 VItalik Ushakov. All rights reserved.
//

import Foundation

class RPN {
    //var asRPN = [String]() // array after convertion to RPN
    
    private var asRPN = [String]() // array after convertion to RPN
    var inputArray = [String]()
    var rpnString = "" // output string after convertion to RPN
    var rpnOutput = [String]()
    static func operatorPriority(oper: String) -> Int {
        switch oper {
        case "(":
            return 0
        case "+", "-":
            return 1
        case "*", "/":
            return 2
        case "^":
            return 3
        case ")":
            return 4
        default: // numbers
            return -1
        }
    }
    
    init(_ input: [String]) {
        self.inputArray = input
        self.toRPN()
    }
    
    func toRPN() {
        var stack = [String]()
        var output = [String]()
        for item in inputArray {
            print("Item = \(item)")
            switch RPN.operatorPriority(oper: item) {
            case -1: output.append(item)
            case 0: stack.append(item)
            case 4:
                while let last = stack.last {
                    
                    if RPN.operatorPriority(oper: last) != 0 {
                        output.append(stack.removeLast())
                    } else {
                        stack.removeLast()
                    }
                }
            default:
                while let last = stack.last {
                    if RPN.operatorPriority(oper: last) >= RPN.operatorPriority(oper: item) {
                        output.append(stack.removeLast())
                    } else {
                        break
                    }
                }
                print("addItem = \(item)")
                stack.append(item)
            }
        }
        while stack.last != nil {
            output.append(stack.removeLast())
        }
        self.asRPN = output
        self.rpnString = output.joined(separator: " ")
        
        var arrOutput = output
        arrOutput = arrOutput.filter(){$0 != ""}
        

//        print("arr = \(arrOutput)")
//        self.rpnOutput = output
       self.rpnOutput = arrOutput
    }
}
