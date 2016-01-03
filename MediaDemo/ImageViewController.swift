//
//  ImageViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/6/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{
    @IBOutlet var selImage : UIImageView!
    
    var image : UIImage!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selImage.image = image
        
        //MARK: - Make image Circle
        selImage.layer.borderWidth = 2.0
        selImage.layer.masksToBounds = false
        selImage.layer.borderColor = UIColor.whiteColor().CGColor
        selImage.layer.cornerRadius = selImage.frame.size.width/2
        selImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
