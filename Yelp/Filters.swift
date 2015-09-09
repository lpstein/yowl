//
//  Filters.swift
//  Yelp
//
//  Created by Patrick Stein on 9/8/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation

class Filters: NSObject {
  var categories = Set<NSString>()
  var sort = YelpSortMode.BestMatched
  var deals = false
  var distance = "5 miles"
  
  static func filtersFromUserDefaults() -> Filters {
    let storage = NSUserDefaults.standardUserDefaults()
    let filters = Filters()
    
    
    if let cats = storage.objectForKey("yelp_cat") as? NSArray {
      for name in cats {
        filters.categories.insert(name as! NSString)
      }
    }
    if let sort = YelpSortMode(rawValue: storage.integerForKey("yelp_sort")) {
      filters.sort = sort
    }
    filters.deals = storage.boolForKey("yelp_deals")
    
    return filters
  }
  
  func save() {
    let storage = NSUserDefaults.standardUserDefaults()
    
    let cats = Array(categories) as NSArray
    storage.setObject(cats, forKey: "yelp_cat")
    storage.setInteger(sort.rawValue, forKey: "yelp_sort")
    storage.setBool(deals, forKey: "yelp_deals")
    
    storage.synchronize()
  }
}