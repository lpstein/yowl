//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var tableView: UITableView!
  let searchBar = UISearchBar()
  
  var businesses: [Business] = []
  var searchTerm: String!
  var filters = Filters.filtersFromUserDefaults()

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.titleView = searchBar
    searchBar.delegate = self
    searchBar.placeholder = "Restaurants"
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100
    tableView.separatorInset = UIEdgeInsetsZero
    
    searchTerm = "thai"
    searchBar.text = searchTerm
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    update()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let target = segue.destinationViewController as? FilterViewController {
      target.filters = self.filters
    }
  }
  
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    searchTerm = searchText
    update()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return businesses.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("com.shazam.BusinessCell", forIndexPath: indexPath) as! BusinessTableViewCell
    if indexPath.row < businesses.count {
      cell.business = businesses[indexPath.row]
    }
    return cell
  }
  
  private func update() {
    var categories: [String] = []
    for cat in filters.categories {
      categories.append(String(cat))
    }
    
    Business.searchWithTerm(searchTerm, sort: filters.sort, categories: categories, deals: filters.deals, completion: { (businesses: [Business]!, error: NSError!) -> Void in
      if let error = error {
        NSLog(error.description)
        return
      }
      
      self.businesses = businesses
      
      if let tableView = self.tableView {
        tableView.reloadData()
      }
    })
  }
}
