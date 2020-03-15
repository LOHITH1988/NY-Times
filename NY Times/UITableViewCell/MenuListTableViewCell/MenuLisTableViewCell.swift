//
//  MenuLisTableViewCell.swift
//  NY Times
//
//  Created by Lohith on 15/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import UIKit

class MenuLisTableViewCell: UITableViewCell {
    
    @IBOutlet weak var displayTextLabel : UILabel!
    @IBOutlet weak var checkMarkImageView : UIImageView!
    @IBOutlet weak var checkMarkStackView : UIStackView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
