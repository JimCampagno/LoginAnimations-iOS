//
//  ViewController.swift
//  AnimationFun
//
//  Created by James Campagno on 10/14/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldWidthConstraint: NSLayoutConstraint!
    
    var originalCenterXConstant: CGFloat = 0.0
    var originalWidthConstraint: CGFloat = 0.0

    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveTextFieldOffScreen()
    }
    
    func fadeOutView() {
        
        view.backgroundColor = UIColor.blue
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        
        spin(button: sender)
        
        UIView.animate(withDuration: 0.8) { 
            self.view.backgroundColor = sender.backgroundColor
        }
        
        
    }
    
  
    
    @IBAction func login(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1.2, animations: {
            
            
            sender.alpha = 0.0
            
            
            }) { success in
                
                
                
                
        }
       
        UIView.animate(withDuration: 1.2, animations: {
            
            sender.alpha = 0.0
            
            }) { success in
                
                self.displayTextField()
                
        }
    }
    
    func moveTextFieldOffScreen() {
        originalCenterXConstant = textFieldCenterXConstraint.constant
        
        textFieldCenterXConstraint.constant = (textFieldWidthConstraint.constant + view.frame.size.width) * -1
    }
    
    func displayTextField() {
        
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            
            self.textFieldCenterXConstraint.constant = self.originalCenterXConstant
            self.view.layoutIfNeeded()
            
        }) { success in
            
            self.loginTextField.becomeFirstResponder()
            
        }
    }
    
    func spin(button: UIButton) {
        
        
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0.0, options: .calculationModeLinear, animations: {
            
        
            button.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            button.layer.borderWidth = 4.0
            button.layer.borderColor = UIColor.black.cgColor
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3.0, animations: {
                button.transform = CGAffineTransform(rotationAngle: .pi + (.pi / 4))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/3.0, relativeDuration: 1/3.0, animations: {
                button.transform = CGAffineTransform(rotationAngle: .pi - (.pi / 4))
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/3.0, relativeDuration: 1/3.0, animations: {
                button.transform = CGAffineTransform(rotationAngle: 0.0)
            })
            

        
        }) { success in
        
//                button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                button.layer.borderWidth = 0.0
        }
        
    }
    
    
}

