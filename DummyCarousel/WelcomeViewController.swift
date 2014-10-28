//
//  WelcomeViewController.swift
//  DummyCarousel
//
//  Created by Tuhin Kumar on 10/27/14.
//  Copyright (c) 2014 Eunoia. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var welcomeScrolView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeForSpinButtonView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeScrolView.delegate = self
        welcomeScrolView.contentSize = CGSize (width: 1280, height: 568)
        self.takeForSpinButtonView.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        if (page == 3) {
            println("should show button")
            delay(0.2, { () -> () in
                UIView.animateWithDuration(1, animations: { () -> Void in
                    self.takeForSpinButtonView.alpha = 1
                })
            })
        } else {
            self.takeForSpinButtonView.alpha = 0
        }
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
