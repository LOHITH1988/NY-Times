//
//  NewsArticleTableViewCell.swift
//  NY Times
//
//  Created by Lohith on 13/03/2020.
//  Copyright © 2020 Lohith. All rights reserved.
//

import Foundation
import UIKit

class NewsArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.selectionStyle = .none
        logoImageView.layer.cornerRadius = 30
        logoImageView.backgroundColor = .darkGray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell( _ article : NewsArticleModel ){
        
        titleLabel.text = article.title
        detailsLabel.text = article.description
        authorNameLabel.text = article.authourName
        dateLabel.text = article.publishedDate
    }
    
}
