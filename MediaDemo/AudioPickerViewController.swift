//
//  AudioPickerViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/6/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit
import MediaPlayer


class AudioPickerViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doGo (sender:AnyObject!)
    {
        self.presentPicker(sender)
    }
    
    func presentPicker (sender:AnyObject)
    {
        let picker = MPMediaPickerController(mediaTypes:.Music)
        picker.showsCloudItems = false
        picker.delegate = self
        picker.allowsPickingMultipleItems = true
        picker.modalPresentationStyle = .Popover
        picker.preferredContentSize = CGSizeMake(self.view.frame.width,self.view.frame.height)
        self.presentViewController(picker, animated: true, completion: nil)
        if let pop = picker.popoverPresentationController
        {
            if let b = sender as? UIBarButtonItem
            {
                pop.barButtonItem = b
            }
        }
    }
}

extension AudioPickerViewController : MPMediaPickerControllerDelegate
{
    // must implement these, as there is no automatic dismissal
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection)
    {
        print("did pick")
        let player = MPMusicPlayerController.applicationMusicPlayer()
        player.setQueueWithItemCollection(mediaItemCollection)
        player.play()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController)
    {
        print("cancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension AudioPickerViewController : UIBarPositioningDelegate
{
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition
    {
        return .TopAttached
    }
}


