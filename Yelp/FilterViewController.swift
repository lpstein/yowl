//
//  FilterViewController.swift
//  Yelp
//
//  Created by Patrick Stein on 9/8/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
  @IBOutlet weak var mexicanSwitch: UISwitch!
  @IBOutlet weak var italianSwitch: UISwitch!
  @IBOutlet weak var newAmericanSwitch: UISwitch!
  @IBOutlet weak var afghanSwitch: UISwitch!
  @IBOutlet weak var sortChoice: UISegmentedControl!
  @IBOutlet weak var dealSwitch: UISwitch!
  @IBOutlet weak var distanceChoice: UISegmentedControl!
  
  var filters: Filters?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
  
    if let filters = self.filters {
      
      mexicanSwitch.setOn(filters.categories.contains("mexican"), animated: false)
      italianSwitch.setOn(filters.categories.contains("italian"), animated: false)
      newAmericanSwitch.setOn(filters.categories.contains("newamerican"), animated: false)
      afghanSwitch.setOn(filters.categories.contains("afghani"), animated: false)
      
      dealSwitch.setOn(filters.deals, animated: false)
      
      switch filters.sort {
      case .BestMatched:
        sortChoice.selectedSegmentIndex = 0
      case .Distance:
        sortChoice.selectedSegmentIndex = 1
      case .HighestRated:
        sortChoice.selectedSegmentIndex = 2
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  private func nameForSwitch(sw: UISwitch) -> String? {
    if mexicanSwitch == sw {
      return "mexican"
    } else if italianSwitch == sw {
      return "italian"
    } else if newAmericanSwitch == sw {
      return "newamerican"
    } else if afghanSwitch == sw {
      return "afghani"
    }
    return nil
  }
  
  @IBAction func categorySwitchChanged(sender: AnyObject) {
    if let filters = self.filters {
      if let sender = sender as? UISwitch, name = nameForSwitch(sender) {
        if sender.on {
          filters.categories.insert(name)
        } else {
          filters.categories.remove(name)
        }
        
        filters.save()
      }
    }
  }
}
