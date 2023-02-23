//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by HaBV on 22/02/2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  @IBOutlet weak var postView: UIView!
  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var userLabel: UILabel!
  @IBOutlet weak var moreButton: UIButton!
  
  @IBOutlet weak var coverImage: UIImageView!
  @IBOutlet weak var heartButton: UIButton!
  @IBOutlet weak var messageButton: UIButton!
  @IBOutlet weak var sendButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    moreButton.titleLabel?.text = ""
    heartButton.titleLabel?.text = ""
    messageButton.titleLabel?.text = ""
    sendButton.titleLabel?.text = ""
  }
  
  @IBAction func onPressedFollow(_ sender: UIButton) {
    print("pressed follow notification")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
    
}
