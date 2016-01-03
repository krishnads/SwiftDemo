//
//  ViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/6/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer
import AVKit
import AVFoundation

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate,AVAudioRecorderDelegate, UINavigationControllerDelegate, AVPlayerViewControllerDelegate
{

    @IBOutlet var menuTable : UITableView!
    
    var pasteBoard = UIPasteboard.generalPasteboard()
    var recorder : AVAudioRecorder!
    var imagePicker : UIImagePickerController = UIImagePickerController()
    var menuData = [
                        "Image picker",
                        "Video picker",
                        "Record Audio",
                        "Audio Picker",
                        "Web View",
                        "Local Notification",
                        "Move KeyBoard Up",
                        "Search with Table View",
                        "Change Image Effect",
                        "Tab Bar View",
                        "Email/Mobile Validation",
                        "iAd Integration",
                        "Page View Controller",
                        "Contacts View List",
                        "Slide Menu",
                        "Action/Alert Sheet",
                        "Core Data",
                        "Date Picker",
                        "UIPicker View"
                    ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuTable.registerClass(UITableViewCell.self,forCellReuseIdentifier: "cell")
    }

    //MARK: - Delegate method for Context menu Starts
    
    func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool
    {
        if (action == Selector("copy:"))
        {
            return true
        }
        return false
    }
    
    func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        pasteBoard.string = cell!.textLabel?.text
    }
    
    //MARK: - Delegate method for Context menu Ends

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = menuTable.dequeueReusableCellWithIdentifier("cell")!
        
        cell.textLabel?.text = menuData[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 0
        {
            let alertAction : UIAlertController = UIAlertController(title: "Select Source", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let action1 : UIAlertAction = UIAlertAction(title: "Image Library", style: UIAlertActionStyle.Default, handler:
            {
                (UIAlertAction) -> Void in
                self.showImagePickerController(UIAlertAction)
                
            })
            
            let action2 : UIAlertAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler:
            {
                    (UIAlertAction) -> Void in
                self.showImagePickerController(UIAlertAction)

            })
            let action3 : UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:nil)
                
            alertAction.addAction(action1)
            alertAction.addAction(action2)
            alertAction.addAction(action3)
            self.presentViewController(alertAction, animated: true, completion: nil)
        }
        else if indexPath.row == 1
        {
            let alertAction : UIAlertController = UIAlertController(title: "Select Source", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let action1 : UIAlertAction = UIAlertAction(title: "Video Library", style: UIAlertActionStyle.Default, handler:
            {
                    (UIAlertAction) -> Void in
                    self.showVideoPickerController(UIAlertAction)
                    
            })
            
            let action2 : UIAlertAction = UIAlertAction(title: "Record", style: UIAlertActionStyle.Default, handler:
            {
                    (UIAlertAction) -> Void in
                    self.showVideoPickerController(UIAlertAction)
                    
            })
            let action3 : UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:nil)
            
            alertAction.addAction(action1)
            alertAction.addAction(action2)
            alertAction.addAction(action3)
            self.presentViewController(alertAction, animated: true, completion: nil)
        }
        else if indexPath.row == 2
        {
            let storyBoard = UIStoryboard(name: "AudioRecord", bundle: nil)
            let audioView  = storyBoard.instantiateInitialViewController()
            self.showViewController(audioView!, sender: nil)
        }
        else if indexPath.row == 3
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let audioPickView  = storyBoard.instantiateViewControllerWithIdentifier("AudioPickerViewController")
            self.showViewController(audioPickView, sender: nil)
        }
        else if indexPath.row == 4
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let webView  = storyBoard.instantiateViewControllerWithIdentifier("WebViewController")
            self.showViewController(webView, sender: nil)
        }
        else if indexPath.row == 5
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let LocalNotiViewController  = storyBoard.instantiateViewControllerWithIdentifier("LocalNotiViewController")
            self.showViewController(LocalNotiViewController, sender: nil)
        }
        else if indexPath.row == 6
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let MoveKeyBoardViewController  = storyBoard.instantiateViewControllerWithIdentifier("MoveKeyBoardViewController")
            self.showViewController(MoveKeyBoardViewController, sender: nil)
        }
        else if indexPath.row == 7
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let SearchTableViewController  = storyBoard.instantiateViewControllerWithIdentifier("SearchTableViewController")
            self.showViewController(SearchTableViewController, sender: nil)
        }
        else if indexPath.row == 8
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let ImageEffectViewController  = storyBoard.instantiateViewControllerWithIdentifier("ImageEffectViewController")
            self.showViewController(ImageEffectViewController, sender: nil)
        }
        else if indexPath.row == 9
        {
            let storyBoard = UIStoryboard(name: "TabBar", bundle: nil)
            let audioView  = storyBoard.instantiateInitialViewController()
            self.showViewController(audioView!, sender: nil)
        }
        else if indexPath.row == 10
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let ValidationViewController  = storyBoard.instantiateViewControllerWithIdentifier("ValidationViewController")
            self.showViewController(ValidationViewController, sender: nil)
        }
        else if indexPath.row == 11
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let iAdViewController  = storyBoard.instantiateViewControllerWithIdentifier("iAdViewController")
            self.showViewController(iAdViewController, sender: nil)
        }
        else if indexPath.row == 12
        {
            let storyBoard = UIStoryboard(name: "PageView", bundle: nil)
            let audioView  = storyBoard.instantiateInitialViewController()
            self.showViewController(audioView!, sender: nil)
        }
        else if indexPath.row == 13
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let ContactViewController  = storyBoard.instantiateViewControllerWithIdentifier("ContactViewController")
            self.showViewController(ContactViewController, sender: nil)
        }
        else if indexPath.row == 14
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let SlideMenuViewController  = storyBoard.instantiateViewControllerWithIdentifier("SlideMenuViewController")
            self.showViewController(SlideMenuViewController, sender: nil)
        }
        else if indexPath.row == 15
        {
            let actionSheet : UIAlertController = UIAlertController(title: "Choose an Action", message: "Action Desc", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            actionSheet.addAction(UIAlertAction(title: "Action 1", style: UIAlertActionStyle.Default, handler:
            {
                (UIAlertAction) -> Void in
                self.showAlertController()

            }))
            
            actionSheet.addAction(UIAlertAction(title: "Action 2", style: UIAlertActionStyle.Default, handler:
            {
                    (UIAlertAction) -> Void in
            }))
            
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:nil))
            self.presentViewController(actionSheet, animated: true, completion: nil)
        }
        else if indexPath.row == 16
        {
            let storyBoard = UIStoryboard(name: "CoreData", bundle: nil)
            let CoreDataViewController  = storyBoard.instantiateInitialViewController()
            self.showDetailViewController(CoreDataViewController!, sender: nil)
        }
        else if indexPath.row == 17
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let DateViewController  = storyBoard.instantiateViewControllerWithIdentifier("DateViewController")
            self.showViewController(DateViewController, sender: nil)
        }
        else if indexPath.row == 18
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let PickerViewController  = storyBoard.instantiateViewControllerWithIdentifier("PickerViewController")
            self.showViewController(PickerViewController, sender: nil)
        }
    }
    
    func showAlertController()
    {
        let alertSheet : UIAlertController = UIAlertController(title: "Alert", message: "You selected Action 1", preferredStyle: UIAlertControllerStyle.Alert)
         alertSheet.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel, handler:nil))
        
        self.presentViewController(alertSheet, animated: true, completion: nil)
    }
    
    func showImagePickerController(sender : UIAlertAction)
    {
        imagePicker.delegate = self
        if sender.title == "Image Library"
        {
            imagePicker.sourceType = .SavedPhotosAlbum
            imagePicker.mediaTypes = [kUTTypeImage as String]

        }
        else if sender.title == "Camera"
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            {
                imagePicker.sourceType = .Camera
            }
            else
            {
                let alert : UIAlertController = UIAlertController(title: "Alert", message: "Camera is not available on your device", preferredStyle: UIAlertControllerStyle.Alert)
                let action : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(action)
                
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func showVideoPickerController(sender : UIAlertAction)
    {
        imagePicker.delegate = self
        
        if sender.title == "Video Library"
        {
            imagePicker.sourceType = .SavedPhotosAlbum
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = true
        }
        else if sender.title == "Record"
        {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            {
                imagePicker.sourceType = .Camera
                imagePicker.mediaTypes = [kUTTypeMovie as String]
            }
            else
            {
                let alert : UIAlertController = UIAlertController(title: "Alert", message: "Camera is not available on your device", preferredStyle: UIAlertControllerStyle.Alert)
                let action : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(action)
                
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        self.dismissViewControllerAnimated(true, completion:
        {
            let mediaType = info[UIImagePickerControllerMediaType] as! NSString
            if mediaType.isEqualToString(kUTTypeImage as String)
            {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let detailView  = storyBoard.instantiateViewControllerWithIdentifier("ImageViewController") as! ImageViewController
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                detailView.image = image
                self.showViewController(detailView, sender: nil)
                UIImageWriteToSavedPhotosAlbum(image, self,"image:didFinishSavingWithError:contextInfo:", nil)
            }
            else if mediaType.isEqualToString(kUTTypeMovie as String)
            {
                let url = (info[UIImagePickerControllerMediaURL] as! NSURL).path
                let moviePlayer = AVPlayerViewController()
                let player = AVPlayer(URL: info[UIImagePickerControllerMediaURL] as! NSURL)
                moviePlayer.player = player
                self.presentViewController(moviePlayer, animated: true, completion: nil)
                if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url!))
                {
                    UISaveVideoAtPathToSavedPhotosAlbum(url!, self,"image:didFinishSavingWithError:contextInfo:", nil)
                }
            }
        })
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
//    {
//    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo:UnsafePointer<Void>)
    {
            if error != nil {
                // Report error to user
            }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

