//
//  GameScene.swift
//  SWBladeDemo
//
//  Created by Julio Montoya on 28/01/17.
//  Copyright © 2017 Julio Montoya. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
  // This optional variable will help you to easily access the blade
  var blade: SWBlade?
  
  // This will help you to update the position of the blade
  // Set the initial value to 0
  var delta: CGPoint = .zero
  
  override func didMove(to view: SKView) {
    backgroundColor = .black
  }
  
  // MARK: - SWBlade Functions
  
  // This will help you to initialize our blade
  func presentBladeAtPosition(_ position:CGPoint) {
    blade = SWBlade(position: position, target: self, color: .white)
    
    guard let blade = blade else {
      fatalError("Blade could not be created")
    }
    
    addChild(blade)
  }
  
  // This will help you to remove the blade and reset the delta value
  func removeBlade() {
    guard let blade = blade else {
      return
    }
    
    blade.removeFromParent()
    delta = .zero
  }
  
  // MARK: - Touch Events
  
  // initialize the blade at touch location
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else {
      return
    }
    let touchLocation = touch.location(in: self)
    presentBladeAtPosition(touchLocation)
  }
  
  // delta value will help you later to properly update the blade position,
  // Calculate the difference between currentPoint and previousPosition and store that value in delta
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else {
      return
    }
    let currentPoint = touch.location(in: self)
    let previousPoint = touch.previousLocation(in: self)
    delta = CGPoint(x: currentPoint.x - previousPoint.x, y: currentPoint.y - previousPoint.y)
  }
  
  // Remove the Blade if the touches have been cancelled or ended
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    removeBlade()
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    removeBlade()
  }
  
  // MARK: - FPS
  
  override func update(_ currentTime: TimeInterval) {
    // if the blade is not available return
    guard let blade = blade else {
      return
    }
    
    // Here you add the delta value to the blade position
    let newPosition = CGPoint(x: blade.position.x + delta.x, y: blade.position.y + delta.y)
    // Set the new position
    blade.position = newPosition
    // it's important to reset delta at this point,
    // You are telling the blade to only update his position when touchesMoved is called
    delta = .zero
  }
}
