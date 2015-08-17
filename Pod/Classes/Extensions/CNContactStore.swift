//
//  CNContactStore.swift
//  PGLContacts
//
//  Created by Piergiuseppe Longo on 10/08/15.
//  Copyright © 2015 PGL. All rights reserved.
//

import Foundation
import Contacts

public extension CNContactStore {
    
    func allContacts (contactFetchRequest: CNContactFetchRequest) -> [CNContact]{
        var contacts = [CNContact]()
        do {
            try PGLStore.enumerateContactsWithFetchRequest(contactFetchRequest, usingBlock: {
                contact, error in
                    if (error != nil){
                        contacts.append(contact)
                    }
                }
            )
        }
        catch{
            print("Something went wrong!")
        }
        return contacts
    }

}