//
//  BusinessCellTableViewCell.swift
//  Yelp
//
//  Created by Patrick Stein on 9/8/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!

  var business: Business! {
    didSet {
      nameLabel.text = business.name
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
