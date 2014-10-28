//
//  SettingsViewController.swift
//  DummyCarousel
//
//  Created by Tuhin Kumar on 10/27/14.
//  Copyright (c) 2014 Eunoia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsScrollView.contentSize = settingsImageView.image!.size
        
        settingsScrollView.contentInset.bottom = 64
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeSettingsButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion:nil)
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
