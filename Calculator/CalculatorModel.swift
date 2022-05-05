//
//  CalculatorModel.swift
//  Calculator
//
//  Created by HENRY on 2022/05/05.
//

import Foundation

class CalcultorModel {
    private var accumulator: Double = 0.0
    private var lastOperation: String?
    
    func setOperand(operand: Double){
        if lastOperation == "+" {
            lastOperation = nil
            accumulator = accumulator + operand
        }
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        switch symbol {
        case "π":
            accumulator = Double.pi
        case "√":
            accumulator = sqrt(accumulator)
        case "+":
            lastOperation = symbol
        default:
            break
        }
    }
    
    var result: Double{
        get {
            return accumulator
        }
    }
    
}
