//
//  ViewController.swift
//  Calculator
//
//  Created by Vitalik Ushakov on 12/3/16.
//  Copyright © 2016 VItalik Ushakov. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate{
    
    var firstNumber:Double = 0.0
    var secondNumber:Double = 0.0
    var accuracyNumber = 5
    var operationItem = ""
    
    var newNumber = false
    
    var flagDotPress = 0
    var tmpNumber = ""
    
    var inputString = ""
    
    var errDivisionByZero = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        expretionInput.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var expretionInput: UITextField! = nil
    @IBOutlet weak var resultView: UITextField!
    
    func solveRPN(expression: Array<String>) -> String {
        var inputExp = expression
        var outputStack = Array<Double>()
        var currentValue = ""
        
        var tempVar1 = Double()
        var tempVar2 = Double()
        var tempOperation = String()
        var unexpectedValue = false
        var tmpResult = Double()
        
        while inputExp.count != 0 {
            currentValue = inputExp.removeFirst()
            let isNumber: Double? = Double(currentValue)
            
            if isNumber != nil {
                outputStack.append(isNumber!)
            }else {
                
                if outputStack.count >= 2{
                    tempVar2 = outputStack.removeLast()
                    tempVar1 = outputStack.removeLast()
                    tempOperation = currentValue
                    
                    switch tempOperation {
                    case "+":
                        tmpResult = tempVar1 + tempVar2
                    case "-":
                        tmpResult = tempVar1 - tempVar2
                    case "*":
                        tmpResult = tempVar1 * tempVar2
                    case "/":
                        
                        if tempVar2 == 0.0 {
                            errDivisionByZero = true
                            //view pop-up window with error
                            
                            viewPopUpErrorDevisionByZero()
                        }else{
                            tmpResult = tempVar1 / tempVar2
                        }
                    default:
                        unexpectedValue = true
                    }
                    outputStack.append(tmpResult)
                } else{
                    viewPopUpErrorExpression()
                    return ""
                }
            }
        }
        if outputStack.count != 1 || unexpectedValue {
            
            //open popUp Window with error            
            viewPopUpErrorExpression()
            return ""
        }else {
            return "\(outputStack[0])"
        }
    }

//MARK: inputStringToArray
    func inputStringToArray(string: String) -> Array<String>{
        let inputString = Array(string.characters)
        var arrayOut: [String] = Array<String>()
        var strFor = ""
        
        for i in 0 ..< inputString.count {
            switch inputString[i] {
            case "(":
                if strFor != "" {
                    arrayOut.append(strFor)
                }
                arrayOut.append(String(inputString[i]))
                strFor = ""
            case ")":
                if strFor != "" {
                    arrayOut.append(strFor)
                }
                arrayOut.append(String(inputString[i]))
                strFor = ""
            case "+":
                if strFor != "" {
                    arrayOut.append(strFor)
                }
                arrayOut.append(String(inputString[i]))
                strFor = ""
            case "-":
                if strFor != "" {
                    arrayOut.append(strFor)
                }
                arrayOut.append(String(inputString[i]))
                strFor = ""
            case "*":
                if strFor != "" {
                    arrayOut.append(strFor)
                }
                arrayOut.append(String(inputString[i]))
                strFor = ""
            case "/":
                arrayOut.append(strFor)
                arrayOut.append(String(inputString[i]))
                strFor = ""
            case " ": print(strFor)
            default:
                strFor = strFor + String(inputString[i])
                if i == inputString.count - 1 {
                    arrayOut.append(strFor)
                }
            }
        }
        return arrayOut
    }
    
    //exit from pop up keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        let inputExpression = expretionInput.text
        
        if inputExpression != "" {
            let arrExpression: Array = inputStringToArray(string: inputExpression!)
            let rpn = RPN.init(arrExpression)
            let result = String(solveRPN(expression: rpn.rpnOutput))

            if result != "" {
                resultView.text = roundAndViewResult(input: Double(result!)!, accuracy: accuracyNumber)
            }
        }
        return false
    }
    
    //clean text field befor insert a new value
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    @IBAction func digitalPress(_ sender: UIButton) {
        if newNumber{
            if flagDotPress <= accuracyNumber{
                tmpNumber = tmpNumber + sender.currentTitle!
                resultView.text = tmpNumber
            }
            if flagDotPress > 0{
                flagDotPress = flagDotPress + 1
            }
        }else {
            tmpNumber = sender.currentTitle!
            resultView.text = tmpNumber
            newNumber = true
        }
    }

    //check string for Dot
    func isDot (str: String) -> Bool {
        var dotPresent = false
        
        for i in str.characters{
            if i == "." {
                dotPresent = true
            }
        }
        return dotPresent
    }
    
    @IBAction func dotPress(_ sender: UIButton) {
        if !isDot(str: resultView.text!){
            tmpNumber = tmpNumber + sender.currentTitle!
            resultView.text = tmpNumber
        }
        flagDotPress =  1
    }
    
    @IBAction func operationPress(_ sender: UIButton) {
        operationItem = sender.currentTitle!
        newNumber = false
        firstNumber = Double(resultView.text!)!
        flagDotPress = 0
    }
    
    @IBAction func resetAll(_ sender: UIButton) {
        firstNumber = 0.0
        secondNumber = 0.0
        newNumber = false
        resultView.text = "0"
        operationItem = ""
        flagDotPress = 0
    }
    
    func answer() -> String {
        var result = ""
        
        if newNumber {
            secondNumber = Double(tmpNumber)!
        }
        switch operationItem {
        case "+":
            result = String(firstNumber + secondNumber)
        case "-":
            result = String(firstNumber - secondNumber)
        case "✕":
            result = String(firstNumber * secondNumber)
        case "÷":
            if secondNumber == 0.0 {
                errDivisionByZero = true
                result = "0.0"
                //view pop-up window with error
                
                viewPopUpErrorDevisionByZero()
            }else{
                result = String(firstNumber / secondNumber)
            }
        default:
            break
        }
        
        if !errDivisionByZero{
            result = roundAndViewResult(input: Double(result)!, accuracy: accuracyNumber)
        }
        errDivisionByZero = false
        flagDotPress = 0
        newNumber = false
    return result
    }
    
    @IBAction func viewAnswer(_ sender: UIButton) {
        resultView.text = self.answer()
    }

    //round result and view
    func roundAndViewResult(input: Double, accuracy: Int) -> String {
        let koeff: Double = pow(10.0, Double(accuracy))
        return String(round(Double(input) * koeff) / koeff)
    }
    
    //view pop-up window Division by Zero
    func viewPopUpErrorDevisionByZero() {
        let popUpOverVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        self.addChildViewController(popUpOverVC)
        
        popUpOverVC.view.frame = self.view.frame
        
        self.view.addSubview(popUpOverVC.view)
        popUpOverVC.didMove(toParentViewController: self)
    }
    
    //view pop-up window with error
    func viewPopUpErrorExpression() {        
        let popUpOverVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID102") as! PopUpErrorExpression
        self.addChildViewController(popUpOverVC)
        
        popUpOverVC.view.frame = self.view.frame
        
        self.view.addSubview(popUpOverVC.view)
        popUpOverVC.didMove(toParentViewController: self)
    }
}

