//
//  ContactsTableViewController.swift
//  PGLContacts
//
//  Created by Piergiuseppe Longo on 10/08/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import UIKit
import PGLContacts
import Contacts

class ContactsTableViewController: UITableViewController {

    var contacts = [CNContact]()
    
    
    func initCell (){
        let keys = [CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName), CNContactImageDataKey, CNContactThumbnailImageDataKey, CNContactPhoneNumbersKey, CNContactIdentifierKey];
        let fetchRequest =  CNContactFetchRequest.createFetchRequest(keys, sortOrder: CNContactSortOrder.UserDefault)
        contacts = PGLStore.allContacts(fetchRequest)
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch CNContactStore.authorizationStatusForEntityType(CNEntityType.Contacts) {
        case .Authorized:
            print("Permission granted")
            self.initCell()
        case .Denied, .Restricted:
            print("has no Permission")
        case .NotDetermined:
            print("Request Permission")

            PGLStore.requestAccessForEntityType(CNEntityType.Contacts) { hasPermission, error in
                if error != nil {
                    print(error!)
                }
            }
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier") as UITableViewCell?
        if (nil == cell)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
        }
        let contact = contacts[indexPath.row]
        cell!.textLabel?.text = contact.fullName!
        cell!.imageView?.image = contact.thumbnailImage

        return cell!
    }

}
