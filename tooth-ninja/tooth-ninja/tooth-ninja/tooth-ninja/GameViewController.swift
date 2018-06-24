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
    
    var menuShowing = false
    
    @IBOutlet var menuView: UIView!
    @IBOutlet var leading: NSLayoutConstraint!
    @IBOutlet var health_bar: UIView!
    //var health_bar = SKpriteNode()
    //var health_bar = SKShapeNode(rectOf: CGSize(width: 300, height: 100))
    @IBAction func openMenu(_ sender: Any)
    {
        print("TRIGGERED")
        if(menuShowing)
        {
            leading.constant = -170
        }
        else
        {
            leading.constant = 0
            
            UIView.animate(withDuration: 0.3, animations:
                {
                    self.view.layoutIfNeeded()
                })
        }
        menuShowing = !menuShowing
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let longPressGestRecg = UILongPressGestureRecognizer(target: self, action: #selector(openMenu(press:)))
        longPressGestRecg.minimumPressDuration = 3.0
        
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        skView.isMultipleTouchEnabled = false
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        
//        health_bar = SKSpriteNode(rectOf: CGSize(width: 300, height: 100))
//        health_bar.name = "health_bar_name"
//        //health_bar.fillColor = SKColor.green
//        health_bar.position = CGPoint(x: 70, y: 400)
//        scene.addChild(health_bar)
        
        
        
        //CGPointMake(scene.frame.size.width / 3, scene.frame.size.height / 1.05)
//       HealthBar = SKSpriteNode(color:SKColor.yellow, size: CGSize(width: 200, height: 30))
//        HealthBar.position = CGPoint(x: scene.frame.size.width / 6, y: scene.frame.size.height / 1.05)
//        HealthBar.anchorPoint = CGPoint(x: 0, y: 0.5)
//        //HealthBar.zPosition = 4
//        scene.addChild(HealthBar)
//
////        if #available(iOS 10.0, *) {
////            GameViewController().HealthBar.scale(to: CGSize(width: GameScene().health, height: 30))
////        } else {
////            // Fallback on earlier versions
////        }
//        //add it to the screem
//        //scene.addChild(HealthBar)
    }
    func openMenu(press: UILongPressGestureRecognizer)
    {
        if press.state == .began
        {
            print("TRIGGERED")
            if(menuShowing)
            {
                leading.constant = -170
            }
            else
            {
                leading.constant = 0
                
                UIView.animate(withDuration: 0.3, animations:
                    {
                        self.view.layoutIfNeeded()
                })
            }
            menuShowing = !menuShowing
        }
    }
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
}

