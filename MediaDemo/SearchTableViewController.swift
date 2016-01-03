//
//  SearchTableViewController.swift
//  MediaDemo
//
//  Created by Krishana on 11/6/15.
//  Copyright © 2015 Krishna. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController,UITableViewDataSource,UISearchResultsUpdating
{
    @IBOutlet var searchTable : UITableView!
    
    let tableData = ["One","Two","Three","Twenty-One"]
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchTable.registerClass(UITableViewCell.self,forCellReuseIdentifier: "cell")

        self.resultSearchController = (
        {
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.searchTable.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        // Reload the table
        self.searchTable.reloadData()
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
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int
     {
        // Return the number of sections.
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
        if (self.resultSearchController.active)
        {
            return self.filteredTableData.count
        }
        else
        {
            return self.tableData.count
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
     {
        let cell : UITableViewCell = searchTable.dequeueReusableCellWithIdentifier("cell")!
        
        if (self.resultSearchController.active)
        {
            cell.textLabel?.text = filteredTableData[indexPath.row]
            return cell
        }
        else
        {
            cell.textLabel?.text = tableData[indexPath.row]
            return cell
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredTableData.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredTableData = array as! [String]
        
        self.searchTable.reloadData()
    }
}
