//
//  DateViewController.swift
//  MultipleDemo
//
//  Created by Krishana on 11/16/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit

class DateViewController: UIViewController
{

    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var selectedDate: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func datePickerAction(sender: AnyObject)
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.selectedDate.text = strDate
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
