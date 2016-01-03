//
//  ValidationViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/7/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit

class ValidationViewController: UIViewController,UITextFieldDelegate
{

    @IBOutlet var emailTxt : UITextField!
    @IBOutlet var mobileTxt : UITextField!
    
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
    
    
    @IBAction func validateAction(sender: UIButton)
    {
        //MARK: - trimming whitespaces
        
        let trimmedStr = emailTxt.text?.trim
        print(trimmedStr)
        
        if (emailTxt.text?.isBlank == true || mobileTxt.text?.isBlank == true)
        {
            let alert : UIAlertController = UIAlertController(title: "Alert", message: "Fill all the fields", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if(emailTxt.text?.isEmail == false)
        {
            let alert : UIAlertController = UIAlertController(title: "Alert", message: "Please Enter valid Email", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if(mobileTxt.text?.isPhoneNumber == false)
        {
            let alert : UIAlertController = UIAlertController(title: "Alert", message: "Please Enter valid Mobile Number", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            let alert : UIAlertController = UIAlertController(title: "Alert", message: "Validation is successful. Now you can proceed", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
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

extension String
{
    //MARK: - trim string
    var trim: String
    {
        get
        {
            let trimmed = stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            return trimmed
        }
    }
    
    
    //MARK: - To check text field or String is blank or not
    var isBlank: Bool
    {
        get
        {
            let trimmed = stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            return trimmed.isEmpty
        }
    }
    
    //MARK: - Validate Email
    var isEmail: Bool
    {
        do
        {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .CaseInsensitive)
            return regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        }
        catch
        {
            return false
        }
    }
    
    //MARK: - validate PhoneNumber
    var isPhoneNumber: Bool
    {
        let charcter  = NSCharacterSet(charactersInString: "+0123456789").invertedSet
        var filtered:NSString!
        let inputString:NSArray = self.componentsSeparatedByCharactersInSet(charcter)
        filtered = inputString.componentsJoinedByString("")
        return  self == filtered
    }
}