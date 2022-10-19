import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            MiscSymbols.forAll
            "x"
            BinaryRelation.in
            LaTeXText("R")
                .font(.mathbf)
            ":"
            Spacer.qquad
            "x" ^ 2
            >=
            0
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
