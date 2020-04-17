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
    @IBOutlet weak var workoutDate: UILabel!
    @IBOutlet weak var workoutTitle: UILabel!
    @IBOutlet weak var timesCompleted: UILabel!
    @IBOutlet weak var timesCompletedLabel: UILabel!
    
    // Graph bars
    @IBOutlet weak var bar1: UIView!
    @IBOutlet weak var bar2: UIView!
    @IBOutlet weak var bar3: UIView!
    @IBOutlet weak var bar4: UIView!
    @IBOutlet weak var bar5: UIView!
    @IBOutlet weak var graphLine: UILabel!
    
    // Graph Labels
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var zeroLabel: UILabel!
    
    @IBOutlet weak var startButtonLabel: UIButton!
    @IBAction func startButton(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        workoutDate.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        workoutTitle.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        fiveLabel.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        threeLabel.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        oneLabel.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        zeroLabel.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        timesCompleted.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        timesCompletedLabel.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        startButtonLabel.setTitleColor(.white, for: .normal)
        startButtonLabel.layer.cornerRadius = 15
        startButtonLabel.backgroundColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        
        bar1.backgroundColor = UIColor(red: 1, green: 0.723, blue: 0.671, alpha: 1)
        bar2.backgroundColor = UIColor(red: 1, green: 0.706, blue: 0.62, alpha: 1)
        bar3.backgroundColor = UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1)
        bar4.backgroundColor = UIColor(red: 1, green: 0.773, blue: 0.729, alpha: 1)
        bar5.backgroundColor = UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1)
        graphLine.backgroundColor = UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
