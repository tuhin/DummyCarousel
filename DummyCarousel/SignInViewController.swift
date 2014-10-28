//
//  SignInViewController.swift
//  DummyCarousel
//
//  Created by Tuhin Kumar on 10/27/14.
//  Copyright (c) 2014 Eunoia. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var formImageView: UIImageView!
    @IBOutlet weak var CarouselPitchImageView: UIImageView!
    @IBOutlet weak var signInButtonImage: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        self.emailTextField.alpha = 0
        self.passwordTextField.alpha = 0
        self.formImageView.alpha = 0
        
        [UIView .animateWithDuration(1, animations: { () -> Void in
            self.emailTextField.alpha = 1
            self.passwordTextField.alpha = 1
            self.formImageView.alpha = 1
        })
        ]
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    

    func keyboardWillShow(notification: NSNotification!) {
        [UIView .animateWithDuration(1, animations: { () -> Void in
            self.emailTextField.center.y -= 100
            self.passwordTextField.center.y -= 100
            self.formImageView.center.y -= 100
            self.CarouselPitchImageView.center.y -= 200
            self.CarouselPitchImageView.transform = CGAffineTransformMakeScale(0.1, 0.1)
            self.CarouselPitchImageView.alpha = 0
            self.signInButton.center.y -= 220
            self.signInButtonImage.center.y -= 220
        })
        ]
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        [UIView .animateWithDuration(1, animations: { () -> Void in
            self.emailTextField.center.y += 100
            self.passwordTextField.center.y += 100
            self.formImageView.center.y += 100
            self.CarouselPitchImageView.center.y += 200
            self.CarouselPitchImageView.transform = CGAffineTransformMakeScale(1, 1)
            self.CarouselPitchImageView.alpha = 1
            self.signInButton.center.y += 220
            self.signInButtonImage.center.y += 220
        })
        ]
    }

    
    @IBAction func signInButtonTap(sender: AnyObject) {
        println("the button was tapped")
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if (emailTextField.text == "") || (passwordTextField.text == ""){
            var alertView = UIAlertView(title: "Credentials Required", message: "Please enter your email and password to log in", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (passwordTextField.text == "password"){
           
            var alertView2 = UIAlertView(title:"Signing In...", message: nil, delegate: self, cancelButtonTitle: nil )
            alertView2.show()
            delay(1, { () -> () in
                alertView2.dismissWithClickedButtonIndex(0, animated: true)
            })
            delay(1, { () -> () in
                self.performSegueWithIdentifier("welcomeSegue", sender: self)
            })
            
        } else {
            var alertView2 = UIAlertView(title:"Signing In...", message: nil, delegate: self, cancelButtonTitle: nil )
            alertView2.show()
            delay(2, { () -> () in
                alertView2.dismissWithClickedButtonIndex(0, animated: true)
                var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
                alertView.show()
            })
            
        }
        
    }
    
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        // buttonIndex is 0 for Cancel
        // buttonIndex ranges from 1-n for the other buttons.
    }
    
    @IBAction func tapToDismissGesture(sender: AnyObject) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
