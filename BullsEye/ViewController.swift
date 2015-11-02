//
//  ViewController.swift
//  BullsEye
//
//  Created by Vasyl Kotsiuba on 10/22/15.
//  Copyright © 2015 Vasyl Kotsiuba. All rights reserved.
//

import UIKit
import QuartzCore


class ViewController: UIViewController {
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var currentValue: Int = 0
    //var targetValue: Int = 0
    //OR
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //prinrln ("i cant wait to start")
        //currentValue = lroundf(slider.value)
        //targetValue = 1 + Int(arc4random_uniform(100))
        
        startNewGame()
        customizeSlider()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeSlider() {
        let thumbImageNormal = UIImage(imageLiteral:"SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlighted = UIImage(imageLiteral: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14.0, bottom: 0, right: 14.0)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }
    
    // MARK: - Game logic
    
    func startNewRound () {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        //slider.value = Float(currentValue)
        slider.setValue(Float(currentValue), animated: true)
        round++
        
        //Update UI
        self.updateLabels()
    }
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    // MARK: - Update UI
    func updateLabels () {
        self.targetLabel.text = String(self.targetValue)
        // OR
        //targetLabel.text = "\(targetValue)"
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    // MARK: - Actions
    @IBAction func showAlert() {
        /*
        var difference: Int
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        */
        
        //OR
        /*
        var difference = currentValue - targetValue
        if difference < 0 {
            difference *= -1
        }
        */
        
        //OR
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        
        /*
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        + "\nThe difference is: \(difference)"
        */
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            
            //Point bonus
            points += 100
            
            if difference == 1 {
                points += 50
            }
            
        } else if difference < 5 {
            title = "You almost had it!"
            
            //Point bonus
            if difference == 1 {
                points += 50
            }
            
        } else if difference < 10 {
            title = "Pretty god!"
        } else {
            title = "Not even close..."
        }
        
        score += points
    
        let message = "You scored \(points) points"
        let alert = UIAlertController (title: title,
                                    message: message,
                                preferredStyle: .Alert)
        
        /*
        let action = UIAlertAction (title: "Ok", style: .Default, handler:{
            print($0)
            print("Inside closure with short sintax")
        })
        */
        
        //OR
        let action = UIAlertAction (title: "Ok", style: .Default, handler:{
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        //print("The value of the slider is now: \(slider.value)")
    }

    @IBAction func startOver(buttom: UIButton) {
        self.startNewGame()
    
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    
    
    }
    
}

