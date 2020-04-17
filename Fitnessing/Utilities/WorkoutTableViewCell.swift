//
//  WorkoutTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-12.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var Background: UIView!
    @IBOutlet weak var test: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
