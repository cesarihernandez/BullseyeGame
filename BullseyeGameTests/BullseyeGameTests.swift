//
//  BullseyeGameTests.swift
//  BullseyeGameTests
//
//

import XCTest
@testable import BullseyeGame

final class BullseyeGameTests: XCTestCase {
  var game: Game!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    game = Game()
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    game = nil
  }
  
  //test to calculate points if the guess if more than 5 numbers of the answer
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  //test to calculate points if the guess if less than 5 numbers of the answer
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
}
