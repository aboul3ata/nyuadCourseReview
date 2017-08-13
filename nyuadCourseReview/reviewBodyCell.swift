//
//  reviewBodyCell.swift
//  nyuadCourseReview
//
//  Created by Ali Abouelatta on 8/13/17.
//  Copyright © 2017 Ali Abouelatta. All rights reserved.
//

import UIKit

class reviewBodyCell: UITableViewCell {

    @IBOutlet weak var reviewBody: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell (review:String) {
        reviewBody.text = "         '' \(review)''"
    }

}
