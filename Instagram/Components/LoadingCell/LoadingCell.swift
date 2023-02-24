//
//  LoadingCell.swift
//  Instagram
//
//  Created by HaBV on 24/02/2023.
//

import UIKit

class LoadingCell: UITableViewCell {

  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
