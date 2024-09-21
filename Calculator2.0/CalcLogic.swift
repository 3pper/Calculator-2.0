//
//  CalcLogic.swift
//  Calculator2.0
//
//  Created by Egor on 05.06.2024.
//

import Foundation

struct CalcLogic {
    
    private var number: Double?
    
    var intCalclulation : (calcMethod: String, n1: Double)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculation(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intCalclulation = (calcMethod: symbol, n1: n)
            }
            
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intCalclulation?.n1, let operation = intCalclulation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "x":
                return n1 * n2
            default:
                fatalError("dont work calculation")
            } 
        }
        return nil
    }
}


/* Bugs
Нельзя вычислить -5 * 6, т.к. - является вичислительным значением
*/
