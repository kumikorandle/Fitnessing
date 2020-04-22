//
//  AddExerciseTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-19.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class AddExerciseTableViewCell: UITableViewCell {
    // MARK: Properties
    var colours = [UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1), UIColor(red: 1, green: 0.773, blue: 0.729, alpha: 1), UIColor(red: 1, green: 0.723, blue: 0.671, alpha: 1)]

    // View elements
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var addIcon: UIImageView!
    
    @IBOutlet weak var muscleOne: UILabel!
    @IBOutlet weak var muscleTwo: UILabel!
    @IBOutlet weak var muscleThree: UILabel!
    @IBOutlet weak var muscleFour: UILabel!
    @IBOutlet weak var muscleFive: UILabel!
    @IBOutlet weak var muscleSix: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.cornerRadius = 5
        background.backgroundColor = .white
        background.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
        background.layer.borderWidth = 1
       
        exerciseName.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
        
        // Set colour and format muscle labels
        formatMuscleLabel(muscleLabel: muscleOne, colour: colours[0])
        formatMuscleLabel(muscleLabel: muscleTwo, colour: colours[1])
        formatMuscleLabel(muscleLabel: muscleThree, colour: colours[2])
        formatMuscleLabel(muscleLabel: muscleFour, colour: colours[0])
        formatMuscleLabel(muscleLabel: muscleFive, colour: colours[1])
        formatMuscleLabel(muscleLabel: muscleSix, colour: colours[2])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func formatMuscleLabel(muscleLabel: UILabel, colour: UIColor) {
        muscleLabel.textColor = .white
        muscleLabel.font = UIFont(name: "Roboto-Regular", size: 16)
        muscleLabel.backgroundColor = colour
        muscleLabel.textAlignment = .center
        muscleLabel.sizeToFit()
        muscleLabel.layer.cornerRadius = 10
        
        background.addSubview(muscleLabel)
        muscleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
