//
//  NotificationCell.swift
//  Instagram
//
//  Created by HaBV on 01/02/2023.
//

import UIKit

class NotificationCell: UITableViewCell {
  
  @IBOutlet weak var notificationItemView: UIView!
  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var messageView: UIView!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var followButton: UIButton!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    followButton.layer.cornerRadius = 8
    followButton.titleLabel!.text = "Follow"
    
    avatarImage.layer.borderWidth = 1
    avatarImage.layer.masksToBounds = true
    avatarImage.layer.borderColor = UIColor.red.cgColor
    avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
    avatarImage.clipsToBounds = true
    avatarImage.contentMode = .scaleAspectFill
//    avatarImage.image = avatarImage.image?.imageWithInsets(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
  }
  
  @IBAction func onPressedFollow(_ sender: UIButton) {
    print("pressed follow notification")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
