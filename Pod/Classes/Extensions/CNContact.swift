//
//  CNContact.swift
//  PGLContacts
//
//  Created by Piergiuseppe Longo on 10/08/15.
//  Copyright © 2015 PGL. All rights reserved.
//

import Foundation
import UIKit
import Contacts

public extension CNContact {
    
    public var fullName : String? {
        get {
            return CNContactFormatter.stringFromContact(self, style: .FullName)
        }
    }
    
    var image :UIImage? {
        get {
            if let data = self.imageData
            {
                return UIImage(data: data)
            }
            return nil
        }
    }
    
    var thumbnailImage :UIImage? {
        get {
            if let data = self.thumbnailImageData
            {
                return UIImage(data: data)
            }
            return nil
        }
    }
        
    public var phoneNumberStrings : [String] {
        get {
            var numbers = [String]()
            for number in self.phoneNumbers {
                let numberString = number.value as! CNPhoneNumber
                numbers.append(numberString.stringValue)
            }
            return numbers
        }
    }
    
}
