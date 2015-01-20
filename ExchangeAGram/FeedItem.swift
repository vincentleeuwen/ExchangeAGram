//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Vincent van Leeuwen on 20/01/15.
//  Copyright (c) 2015 Vincent van Leeuwen. All rights reserved.
//

import Foundation
import CoreData

@objc (FeedItem)
class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData

}
