//
//  ViewController.swift
//  Calculator
//
//  Created by HENRY on 2022/05/05.
//

import UIKit

//MVC
//Model, View, Controller
//Model - 계산하는 일
//View - User Interface 버튼, 디스플레이
//Controller - Model View를 연결


class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet private weak var display: UILabel!
    // MARK: 변수들
    private var model: CalcultorModel = CalcultorModel()
    private var isTypingDigit: Bool = false
    private var displayValue: Double {
        get {
            guard let text = display.text else { return 0 }
            return Double(text) ?? 0
        }
        set {
            display.text = "\(newValue)"
        }
    }

    //MARK: = IBAction
    @IBAction private func performOperation(_ sender: UIButton) {
        guard let operation = sender.titleLabel?.text
        else { return }
        model.setOperand(operand: displayValue)
        model.performOperation(symbol: operation)
        displayValue = model.result
        isTypingDigit = false
    }
    
    @IBAction private func TouchDigit(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text,
        let textCurretlyDisplay = display.text else {return}
        
        if isTypingDigit{
        display.text = textCurretlyDisplay + digit
        } else {
            display.text = digit
        }
        isTypingDigit = true

        }
}

