//
//  BusinessCellTableViewCell.swift
//  Yelp
//
//  Created by Patrick Stein on 9/8/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
  @IBOutlet weak var categoriesLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var dollarsLabel: UILabel!
  @IBOutlet weak var reviewLabel: UILabel!
  @IBOutlet weak var ratingView: UIImageView!
  @IBOutlet weak var pictureView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!

  var business: Business! {
    didSet {
      ratingView.setImageWithURL(business.ratingImageURL)
      pictureView.setImageWithURL(business.imageURL)
      nameLabel.text = business.name
      categoriesLabel.text = business.categories
      addressLabel.text = business.address
      dollarsLabel.text = "$$$"
      reviewLabel.text = "\(business.reviewCount!) reviews"
    
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()

    self.layoutMargins = UIEdgeInsetsZero
    self.preservesSuperviewLayoutMargins = false
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
