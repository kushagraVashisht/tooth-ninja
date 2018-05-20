//
//  GameViewController.swift
//  tooth-ninja
//
//  Created by David Lopez on 7/4/18.
//  Copyright © 2018 David Lopez. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController
{
    @IBOutlet weak var healthBar: UIImageView!
    static var hitNumber: Int
    {
        set
        {
            GameViewController.hitNumber = hitNumber
        }
        get
        {
            return GameViewController.hitNumber
        }
    }
    static var collided: Bool = false
    //var health_bar = SKShapeNode(rectOf: CGSize(width: 300, height: 100)
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        skView.isMultipleTouchEnabled = false
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        if(GameViewController.hitNumber == 6)
        {
            healthBar.image = UIImage(named: "lifebar_5.png")
        }
        else if(GameViewController.hitNumber == 5)
        {
            healthBar.image = UIImage(named: "lifebar_4.png")
        }
        else if(GameViewController.hitNumber == 4)
        {
            healthBar.image = UIImage(named: "lifebar_3.png")
        }
        else if(GameViewController.hitNumber == 3)
        {
            healthBar.image = UIImage(named: "lifebar_2.png")
        }
        else if(GameViewController.hitNumber == 2)
        {
            healthBar.image = UIImage(named: "lifebar_1.png")
        }
        else if(GameViewController.hitNumber == 1)
        {
            healthBar.image = UIImage(named: "lifebar_nolife.png")
        }
        else
        {
            GameViewController.collided = false
            GameViewController.hitNumber = 1
            exit(1)
        }
        
//        HealthBar = SKSpriteNode(color:SKColor .yellow, size: CGSize(width: 200, height: 30))
//        HealthBar.position = CGPoint(x: 70, y:  200)
//        HealthBar.anchorPoint = CGPoint(x: 0.0, y: 0.5)
//        HealthBar.zPosition = 4
//        scene.addChild(HealthBar)
//
////         //CGPointMake(scene.frame.size.width / 3, scene.frame.size.height / 1.05)
////       HealthBar = SKSpriteNode(color:SKColor.yellow, size: CGSize(width: 200, height: 30))
////        HealthBar.position = CGPoint(x: scene.frame.size.width / 6, y: scene.frame.size.height / 1.05)
////        HealthBar.anchorPoint = CGPoint(x: 0, y: 0.5)
////        //HealthBar.zPosition = 4
////        scene.addChild(HealthBar)
////        //        if #available(iOS 10.0, *) {
//////            GameViewController().HealthBar.scale(to: CGSize(width: GameScene().health, height: 30))
//////        } else {
//////            // Fallback on earlier versions
//////        }
////        //add it to the screem
////        //scene.addChild(HealthBar)
//
//
        
        
       
    }
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
}

