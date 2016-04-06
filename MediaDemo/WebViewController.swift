//
//  WebViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/6/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit

class WebViewController: UIViewController
{
    @IBOutlet var webView : UIWebView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url : NSURL = NSURL(string: "http://www.google.co.in")!
        let request : NSURLRequest = NSURLRequest(URL: url)
        webView.loadRequest(request)
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