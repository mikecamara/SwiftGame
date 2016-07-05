//
//  ViewController.swift
//  Project2
//
//  Created by Mike Camara on 31/10/2015.
//  Copyright © 2015 Mike Camara. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add flags to the countries array
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        // more efficient way of doing the same thing, which is to create it all on one line.
       // countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).CGColor
        
        
        askQuestion(nil)

    }
    
    func askQuestion(action: UIAlertAction!) {
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
    }
    
    
    /*
    This method:
    - Check whether the answer was correct.
    - Adjust the player's score up or down.
    - Show a message telling them what their new score is.
    */
    @IBAction func buttonTapped(sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            ++score
        } else {
            title = "Wrong"
            --score
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

