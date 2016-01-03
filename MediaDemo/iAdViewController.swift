//
//  iAdViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/7/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit
import iAd

class iAdViewController: UIViewController,ADBannerViewDelegate
{
    var rectangleAdView: ADBannerView?

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.canDisplayBannerAds = true
        rectangleAdView = ADBannerView(adType: ADAdType.MediumRectangle)
        rectangleAdView?.delegate = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!)
    {
        self.view.addSubview(banner)
        self.view.layoutIfNeeded()
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!)
    {
        print(error.userInfo)
        banner.removeFromSuperview()
        self.view.layoutIfNeeded()
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
