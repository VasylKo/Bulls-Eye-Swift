//
//  ViewController.swift
//  BullsEye
//
//  Created by Vasyl Kotsiuba on 10/22/15.
//  Copyright © 2015 Vasyl Kotsiuba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //prinrln ("i cant wait to start")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let alert = UIAlertController (title: "Hello, Word",
                                    message: "This is my first swift app",
                                preferredStyle: .Alert)
        
        let action = UIAlertAction (title: "Ok", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }

}

