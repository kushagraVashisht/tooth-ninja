    //
    //  GameViewController.swift
    //  tooth-ninja
    //
    //  Created by David Lopez on 7/4/18.
    //  Copyright © 2018 David Lopez. All rights reserved.
    //

    import UIKit
    import SpriteKit
    import PaperOnboarding

    protocol Controller {
        func levelCompleted()
        func levelFailed()
    }

    /* GameViewController is in charge of managing the game. This includes creating and
     * changing levels, access to main menu, etc.
     */
    class GameViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate
    {
        
        @IBOutlet var onboardingView: OnboardingView!
        @IBOutlet var getStartedButton: UIButton!
        
        var currentLevel: Level? = nil
        var config: GameConfiguration?
        var skView: SKView?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            onboardingView.dataSource = self
            onboardingView.delegate = self
            
            let skView = initialiseSKView()
            do
            {
                config = try GameConfiguration(file: "level_json_sample", size: skView.bounds.size)
            }
            catch let error
            {
                print("Level cannot be loaded!")
                print(error)
            }

            let teethArray = config!.getTeethByLevel(id: 1)
            let objectArray = config!.getObjectsByLevel(id: 1)
            print(objectArray[0])
            
            // Use the JSON file to open level 1
            
            currentLevel = Level(size: skView.bounds.size, bgFile: "background2.png",
                                 teethArray: teethArray, otherArray: objectArray, c: self as! Controller)

            currentLevel?.scaleMode = SKSceneScaleMode.resizeFill

            skView.presentScene(currentLevel)
        }
        
        func onboardingItemsCount() -> Int
        {
            return 1
        }
        
        func onboardingItem(at index: Int) -> OnboardingItemInfo
        {
            let backgroundColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
            let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
            let backgroundColorThree = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
            
            let rocket  = UIImage(named: "rocket") as UIImage!  // implicitly unwrapped
            let brush = UIImage(named: "brush") as UIImage!
            let notification = UIImage(named: "notification") as UIImage!
            
            
            return [
                OnboardingItemInfo(informationImage: rocket!,
                                   title: "A Great Rocket Start",
                                   description: "Caramels cheesecake bonbon bonbon topping. Candy halvah cotton candy chocolate bar cake. Fruitcake liquorice candy canes marshmallow topping powder.",
                                   pageIcon: rocket!,
                                   color: backgroundColorOne,
                                   titleColor: UIColor.white,
                                   descriptionColor: UIColor.white,
                                   titleFont: UIFont(name: "AvenirNext-Bold", size: 24)!,
                                   descriptionFont: UIFont(name: "AvenirNext-Regular", size: 18)!),
                
                ][index]
            
//                                    (informationImage: brush!,
//                                     title: "Design your Experience",
//                                     description: "Caramels cheesecake bonbon bonbon topping. Candy halvah cotton candy chocolate bar cake. Fruitcake liquorice candy canes.",
//                                     pageIcon: brush!,
//                                     color: backgroundColorTwo,
//                                     titleColor: UIColor.white,
//                                     descriptionColor: UIColor.white,
//                                     titleFont: UIFont(name: "AvenirNext-Bold", size: 24)!,
//                                     descriptionFont: UIFont(name: "AvenirNext-Regular", size: 18)!),
//
//                                    (informationImage: notification!,
//                                     title: "Stay Up To Date",
//                                     description: "Get notified of important updates.",
//                                     pageIcon: notification!,
//                                     color: backgroundColorThree,
//                                     titleColor: UIColor.white,
//                                     descriptionColor: UIColor.white,
//                                     titleFont: UIFont(name: "AvenirNext-Bold", size: 24)!,
//                                     descriptionFont: UIFont(name: "AvenirNext-Regular", size: 18)!)][index]
        }
        
        override var prefersStatusBarHidden: Bool {
            return true
        }

        /* Initialises the SKView where we display the game */
        private func initialiseSKView() -> SKView
        {
            let skView = view as! SKView
            skView.showsFPS = true
            skView.showsPhysics = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            skView.isMultipleTouchEnabled = false
            return skView
        }

        /* This method is called by the currentLevel when it is completed */
        func levelCompleted() {
            // check if there exists a higher level than currentLevel.id
            // change to next level or present winning screen
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            let gameOverScene = GameOverScene(size: skView!.bounds.size, won: false)
            skView?.presentScene(gameOverScene, transition: reveal)
        }

        func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int)
        {
            
        }
     
        func onboardingWillTransitonToIndex(_ index: Int)
        {
            if index == 1
            {
                if self.getStartedButton.alpha == 1
                {
                    UIView.animate(withDuration: 0.2, animations:
                    {
                            self.getStartedButton.alpha = 0
                    })
                }
            }
        }
        
        func onboardingDidTransitonToIndex(_ index: Int)
        {
            if index == 2
            {
                UIView.animate(withDuration: 0.4, animations:
                {
                    self.getStartedButton.alpha = 1
                })
            }
        }
        
        /* This method is called by the currentLevel when it is failed */
        func levelFailed() {
            // present losing screen
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            let gameOverScene = GameOverScene(size: skView!.bounds.size, won: false)
            skView?.presentScene(gameOverScene, transition: reveal)
        }
        
    }

