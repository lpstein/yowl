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
  var businesses: [Business] = []
  let searchBar = UISearchBar()

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.titleView = searchBar
    searchBar.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    Business.searchWithTerm(searchText, completion: { (businesses: [Business]!, error: NSError!) -> Void in
      self.businesses = businesses
      
      self.update()
    })
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
    if let tableView = tableView {
      tableView.reloadData()
    }
  }
}
