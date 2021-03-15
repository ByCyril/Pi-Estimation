//
//  PiEstimator.swift
//  Pi-Estimation
//
//  Created by Cyril Garcia on 3/15/21.
//

import Foundation

infix operator **

func **(lhs: Float, rhs: Float) -> Float {
    return pow(lhs, rhs)
}

final class Pi {
    
    func isCoPrime(_ a: Int,_ b: Int) -> Bool {
        return 1 == isCoPrimeHelper(a, b, a / b, a % b)
    }
    
    func isCoPrimeHelper(_ a: Int,_ b: Int,_ q: Int,_ r: Int) -> Int {
        if r == 0 {
            return b
        }
        return isCoPrimeHelper(b, r, b / r, b % r)
    }
    
    func estimate(_ trials: Int = 1000) -> Float {
        
        var x: Float = 0 // number of coprimes found

        for _ in 0..<trials {
            let a = Int.random(in: 1...100_000)
            let b = Int.random(in: 1...100_000)
            
            if a > b {
                x += (isCoPrime(a,b)) ? 1 : 0
            } else {
                x += (isCoPrime(b,a)) ? 1 : 0
            }
        }

        return (Float(6 * trials) / x)**0.5
    }
    
}
