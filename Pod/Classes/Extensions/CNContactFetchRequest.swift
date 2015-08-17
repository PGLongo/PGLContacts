//
//  File.swift
//  PGLContacts
//
//  Created by Piergiuseppe Longo on 10/08/15.
//  Copyright © 2015 PGL. All rights reserved.
//

import Foundation
import Contacts

public extension CNContactFetchRequest{
    
    public class func createFetchRequest(keysToFetch: [CNKeyDescriptor], sortOrder: CNContactSortOrder) -> CNContactFetchRequest {
        let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
        fetchRequest.sortOrder = sortOrder
        return fetchRequest;
    }
}