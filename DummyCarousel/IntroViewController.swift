//
//  IntroViewController.swift
//  DummyCarousel
//
//  Created by Tuhin Kumar on 10/26/14.
//  Copyright (c) 2014 Eunoia. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    var tileArray :[UIImageView] = []
    
    
    // Range values for all the image offsets. Original/Final position is 0 because of storyboard.
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.delegate = self
        introScrollView.contentSize = CGSize(width: 320, height: 1136)
        
        tileArray = [tile1, tile2, tile3, tile4, tile5, tile6]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        var offset = Float(scrollView.contentOffset.y)
        
        for (index,tile) in enumerate(tileArray){
            var tx = CGFloat(convertValue(offset, 0, 568, xOffsets[index], 0))
            var ty = CGFloat(convertValue(offset, 0, 568, yOffsets[index], 0))
            var scale = CGFloat(convertValue(offset, 0, 568, scales[index], 1))
            var rotate = CGFloat(convertValue(offset, 0, 568, rotations[index], 0))
            var rotation = CGFloat(Double(rotate) * M_PI / 180)

            tile.transform = CGAffineTransformMakeTranslation(tx, ty)
            tile.transform = CGAffineTransformScale(tile.transform, scale, scale)
            tile.transform = CGAffineTransformRotate(tile.transform, rotation)
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
