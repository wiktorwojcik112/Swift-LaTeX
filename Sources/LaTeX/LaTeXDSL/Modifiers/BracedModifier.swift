//
//  Braced Modifier.swift
//  
//
//  Created by Vaida on 10/21/22.
//


struct BracedModifier<T: LaTeXComponent>: LaTeXModifier {
    
    let position: Position
    
    let value: Group<T>
    
    func modify(_ component: some LaTeXComponent) -> String {
        "\\\(self.position.rawValue){\(component.latexExpression)}\(position == .overBrace ? "^" : "_")\(value.latexExpression)"
    }
    
    init(position: Position, value: T) {
        self.position = position
        self.value = Group(value)
    }
    
    enum Position: String {
        case overBrace = "overbrace"
        case underBrace = "underbrace"
    }
    
}


public extension LaTeXComponent {
    
    func overBraced(_ value: some LaTeXComponent) -> some LaTeXComponent {
        self.modifier(BracedModifier(position: .overBrace, value: value))
    }
    
    func underBraced(_ value: some LaTeXComponent) -> some LaTeXComponent {
        self.modifier(BracedModifier(position: .underBrace, value: value))
    }
    
}