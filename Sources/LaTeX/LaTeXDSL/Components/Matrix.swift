//
//  LaTeX Matrix.swift
//  
//
//  Created by Vaida on 10/20/22.
//


public struct LaTeXMatrix: LaTeXComponent {
    
    let isBounded: Bool
    let contents: [[any LaTeXComponent]]
    
    public var latexExpression: String {
        let matrixName = isBounded ? "bmatrix" : "matrix"
        
        var result = "\\begin{\(matrixName)}"
        
        for row in contents {
            result += row.map(\.latexExpression).joined(separator: " & ") + "\\\\"
        }
        
        return result + "\\end{\(matrixName)}"
    }
    
    public init(isBounded: Bool = true, contents: () -> [[any LaTeXComponent]]) {
        self.isBounded = isBounded
        self.contents = contents()
    }
    
}