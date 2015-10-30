//
//  ViewController.swift
//  BullsEye
//
//  Created by Vasyl Kotsiuba on 10/22/15.
//  Copyright © 2015 Vasyl Kotsiuba. All rights reserved.
//

import UIKit



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
        
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let points = 100 - difference
        score += points
        
        /*
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        + "\nThe difference is: \(difference)"
        */
    
        let message = "You scored \(points) points"
        let alert = UIAlertController (title: "Hello, Word",
                                    message: message,
                                preferredStyle: .Alert)
        
        let action = UIAlertAction (title: "Ok", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        //print("The value of the slider is now: \(slider.value)")
    }

}

