//
//  ViewController.swift
//  PLS-sliderguess
//
//  Created by Tinkertanker on 27/11/19.
//  Copyright © 2019 Tinkertanker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var rand: Double!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet var tapGestureRecogniser: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        restartGame()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func screenTapped(_ sender: Any) {
        restartGame()
    }
    func restartGame() {
        tapGestureRecogniser.isEnabled = false
        rand = round(1000*Double.random(in: 0...1))/10
        titleLabel.text = "Get the slider to \(rand!)%!"
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        var value = Double(sender.value)
        value = round(100*value)/100
        print(value)
        let diff = abs(value - rand)
        if diff < 1 {
                titleLabel.text = "Your slider value of \(value)% is within 1% of \(rand!)%! Good job! \n Tap to continue."
            } else if diff < 3 {
                titleLabel.text = "Your slider value of \(value)% is within 3% of \(rand!)%! Pretty good! \n Tap to continue."
            } else if diff < 5 {
                titleLabel.text = "Your slider value of \(value)% is within 5% of \(rand!)%! Not bad! \n Tap to continue."
            } else {
                titleLabel.text = "Your slider value of \(value)% is pretty far off \(rand!)%. Try again. \n Tap to continue."
        }
        tapGestureRecogniser.isEnabled = true
    }
    
}

