import XCTest
import SwiftTreeSitter
import TreeSitterVim

final class TreeSitterVimTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_vim())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Vim grammar")
    }
}
