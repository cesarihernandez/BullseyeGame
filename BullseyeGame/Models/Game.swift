//
//  Game.swift
//  BullseyeGame
//
//

import Foundation

struct Game {
  var target: Int = Int.random(in: 1...100)
  var score = 0 // type literals since we do not have a decimal swift will assume it is an Int. We can remove Int
  var round = 1 // type literals
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    
    /* One way to get always get a positive number
     var difference: Int = sliderValue - target
    if difference < 0 {
      difference *= -1
      // other option: difference = difference * -1
    }*/
    
    //calculate points max score (100) - the difference
    let awardedPoints = 100 - difference
    
    return awardedPoints
    
    /**
          With type inference we could get the above line of code to one line
            100 - abs(target - sliderValue)
     */
  }
  
}
