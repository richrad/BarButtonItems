//
//  TableViewController.swift
//  BarButtonItems
//
//  Created by Richard Allen on 3/4/15.
//  Copyright (c) 2015 Lapdog. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Why not just this?
        
            let editItem = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "editMode:")
        
        Alas, you can't change the title of a UIBarButtonSystemItem. They're automatically localized and your edits aren't guaranteed to be. */
        
        let editItem = UIBarButtonItem(title: "Edit", style: .Bordered, target: self, action: "editMode:")
        editItem.possibleTitles = NSSet(array: ["Edit", "Done"])
        
        self.navigationItem.rightBarButtonItem = editItem
        
    }
    
    func editMode(sender: UIBarButtonItem) {
        if self.tableView.editing {
            sender.title = "Edit"
            self.tableView.setEditing(false, animated: true)
        } else {
            sender.title = "Done"
            self.tableView.setEditing(true, animated: true)
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "Yo, I'm a cell here!"
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

}
