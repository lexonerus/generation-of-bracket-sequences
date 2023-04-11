//
//  main.swift
//  task1
//
//  Created by Alexey Krzywicki on 11.04.2023.
//

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    
    func backtrack(_ str: String, open: Int, close: Int) {
        if str.count == n * 2 {
            result.append(str)
            return
        }
        
        if open < n {
            backtrack(str + "(", open: open + 1, close: close)
        }
        
        if close < open {
            backtrack(str + ")", open: open, close: close + 1)
        }
    }
    
    backtrack("", open: 0, close: 0)
    
    return result
}

print("Please enter number to choose length:")
let n = Int(readLine()!)!
let result = generateParenthesis(n)
print()
result.forEach { print($0) }
print()

