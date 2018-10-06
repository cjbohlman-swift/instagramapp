//
//  PostCell.swift
//  instagram
//
//  Created by Mely Bohlman on 10/6/18.
//  Copyright © 2018 Chris Bohlman. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: PFImageView!
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    @IBOutlet weak var photoView: PFImageView!
    
    var instagramPost: PFObject! {
        didSet {
            print("DID SET!!!")
            self.postImage.file = instagramPost["image"] as? PFFile
            self.postImage.loadInBackground()
            self.postCaptionLabel.text = instagramPost["caption"] as! String
            print(self.postCaptionLabel.text)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
