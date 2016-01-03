//
//  ContactViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/9/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit
import AddressBook
import Contacts
import ContactsUI


protocol AddContactViewControllerDelegate {
    func didFetchContacts(contacts: [CNContact])
}

class ContactViewController: UIViewController,CNContactPickerDelegate, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var menuTable : UITableView!

    var contactStore = CNContactStore()
    var delegate: AddContactViewControllerDelegate!

    var menuData : [Dictionary<String, Any>] =  []
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTable.registerClass(UITableViewCell.self,forCellReuseIdentifier: "cell")
        
    }

    @IBAction func showContactPickerAction(sender : UIButton)
    {
        let contactPickerViewController = CNContactPickerViewController()
        //contactPickerViewController.predicateForEnablingContact = NSPredicate(format: "birthday != nil")
        contactPickerViewController.delegate = self
        presentViewController(contactPickerViewController, animated: true, completion: nil)

    }
    
    
    @IBAction func fetchContactAction(sender : UIButton)
    {
        let contactStore = CNContactStore()
       // fetchRequest.unifyResults = true //I think that true is the default option
        do
        {
            try contactStore.enumerateContactsWithFetchRequest(CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactEmailAddressesKey,CNContactNicknameKey, CNContactPhoneNumbersKey,CNContactImageDataKey]))
                {
                    (contact, cursor) -> Void in
                    
                    var dic = [String : Any] ()

                    if (!contact.givenName.isEmpty)
                    {
                        //Add to your array
                        if (!contact.nickname.isEmpty)
                        {
                            dic["name"]  = contact.givenName + " " + contact.familyName + " (" + contact.nickname + ")"
                        }
                        else
                        {
                            dic["name"]  = contact.givenName + " " + contact.familyName
                        }
                       // dic["mobile"] = contact.phoneNumbers
                        
                        //contact.phoneNumbers.CNLabeledValue(lab)
                        for number in contact.phoneNumbers
                        {
                            let phoneNumber = number.value as! CNPhoneNumber
                            dic["mobile"] = phoneNumber.stringValue
                        }
                    }
                    if contact.isKeyAvailable(CNContactImageDataKey)
                    {
                        if(contact.imageData != nil)
                        {
                            let imagePro = UIImage(data: contact.imageData!)
                            dic["img"] = imagePro
                        }
                        else
                        {
                            dic["img"] = UIImage(named: "book.png")
                        }
                    }
                    else
                    {
                        dic["img"] = UIImage(named: "book.png")
                    }
                    self.menuData.append(dic)
            }
            self.menuTable.reloadData()
        }
        catch
        {
            print("Handle the error please")
        }
        print(self.menuData)
    }
    
    // MARK: CNContactPickerDelegate function
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact)
    {
        print(contact.description)
        //delegate.didFetchContacts([contact])
       // navigationController?.popViewControllerAnimated(true)
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
    
    func requestForAccess(completionHandler: (accessGranted: Bool) -> Void)
    {
        let authorizationStatus = CNContactStore.authorizationStatusForEntityType(CNEntityType.Contacts)
        
        switch authorizationStatus
        {
        case .Authorized:
            completionHandler(accessGranted: true)
            
        case .Denied, .NotDetermined:
            self.contactStore.requestAccessForEntityType(CNEntityType.Contacts, completionHandler:
            { (access, accessError) -> Void in
                if access
                {
                    completionHandler(accessGranted: access)
                }
                else
                {
                    if authorizationStatus == CNAuthorizationStatus.Denied
                    {
                        dispatch_async(dispatch_get_main_queue(),
                        { () -> Void in
                            let message = "\(accessError!.localizedDescription)\n\nPlease allow the app to access your contacts through the Settings."
                            self.showMessage(message)
                        })
                    }
                }
            })
            
        default:
            completionHandler(accessGranted: false)
        }
    }

    
    func showMessage(message: String)
    {
        let alertController = UIAlertController(title: "Contacts", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action) -> Void in
        }
        
        alertController.addAction(dismissAction)
        
        let pushedViewControllers = (UIApplication.sharedApplication().keyWindow!.rootViewController as! UINavigationController).viewControllers
        let presentedViewController = pushedViewControllers[pushedViewControllers.count - 1]
        
        presentedViewController.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Table Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : UITableViewCell = menuTable.dequeueReusableCellWithIdentifier("cell")!
       // cell.s
        cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cell")
        
        cell.textLabel?.text = menuData[indexPath.row]["name"] as? String
        cell.detailTextLabel?.text = menuData[indexPath.row]["mobile"] as? String
        cell.imageView?.image = menuData[indexPath.row]["img"] as? UIImage
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Fetched Contacts :"
    }


}
