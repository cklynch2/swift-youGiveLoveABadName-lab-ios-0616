//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bonJovi: UIImageView!
    var bonJoviHeight : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bonJoviHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.5)
        bonJoviHeight?.active = true
    }

    /* Make Bon Jovi grow in the expandButtonTapped(_:) method. You'll need to build a keyframe animation that implements the "bounce" effect. It will have steps close to this:
        1. Shrink slightly below the starting height
        2. Grow slightly beyond the height of the screen
        3. Shrink back down to the exact height of the screen
    */
    
    func expandBonJovi() {
        UIView.animateKeyframesWithDuration(0.6, delay: 0, options: .CalculationModeLinear, animations: {
            
            let minimumHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.4)
            let originalHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.5)
            let maximumHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 1.1)
            let viewHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor)
            
            let expansionHeights = [originalHeight, minimumHeight, maximumHeight, viewHeight]
            
            for (index, constraint) in expansionHeights.enumerate() {
                UIView.addKeyframeWithRelativeStartTime(Double(index)/Double(expansionHeights.count), relativeDuration: 1.0/Double(expansionHeights.count), animations: {
                    self.bonJoviHeight?.active = false
                    self.bonJoviHeight? = constraint
                    self.bonJoviHeight?.active = true
                    self.view.layoutIfNeeded()
                })
            }
            
        }) { (true) in
            self.bonJoviHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor)
            self.bonJoviHeight?.active = true
        }
    }
    
    /* Now make the expandButtonTapped(_:) method toggle between the full-height and normal sizes of the image view. You'll probably have to add a flag property so you know whether to expand or shrink. The shrink animation should be the exact opposite of the expansion one:
     1. Grow slightly beyond the height of the screen
     2. Shrink down to slightly below the final height of the image
     3. Return to the exact starting height
     */
    
    func shrinkBonJovi() {
        UIView.animateKeyframesWithDuration(0.6, delay: 0, options: .CalculationModeLinear, animations: {
            
            let minimumHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.4)
            let originalHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.5)
            let maximumHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 1.1)
            let viewHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor)
            
            let expansionHeights = [viewHeight, maximumHeight, minimumHeight, originalHeight]
            
            for (index, constraint) in expansionHeights.enumerate() {
                UIView.addKeyframeWithRelativeStartTime(Double(index)/Double(expansionHeights.count), relativeDuration: 1.0/Double(expansionHeights.count), animations: {
                    self.bonJoviHeight?.active = false
                    self.bonJoviHeight? = constraint
                    self.bonJoviHeight?.active = true
                    self.view.layoutIfNeeded()
                })
            }
            
        }) { (true) in
            self.bonJoviHeight = self.bonJovi.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.5)
            self.bonJoviHeight?.active = true
        }
    }
    
    @IBAction func expandButtonTapped(sender: AnyObject) {
        
        // Starting from original height, should expand:
        if bonJoviHeight?.multiplier == 0.5 {
            print("We entered the if statement for expanding.")
            expandBonJovi()
        
        // Starting from full view height, should shrink:
        } else if bonJoviHeight?.multiplier == 1.0 {
            print("We entered the if statement for shrinking.")
            shrinkBonJovi()
        }
    }
   
    
}

