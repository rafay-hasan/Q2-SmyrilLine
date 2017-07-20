//
//  DestinationTableViewCell.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/8/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import UIKit

class DestinationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var destinationImageView: UIImageView!
    
    @IBOutlet weak var destinationNameLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
