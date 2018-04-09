//
//  GameViewController.swift
//  SWBladeDemo
//
//  Created by Julio Montoya on 28/01/17.
//  Copyright © 2017 Julio Montoya. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()    
    let scene = GameScene(size: CGSize(width: 1024, height: 768))
    let skView = self.view as! SKView
    skView.showsFPS = true
    skView.showsNodeCount = true
    skView.ignoresSiblingOrder = true
    skView.isMultipleTouchEnabled = false
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)
  }

  override var shouldAutorotate: Bool {
    return true
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if UIDevice.current.userInterfaceIdiom == .phone {
        return .allButUpsideDown
    } else {
        return .all
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
}
