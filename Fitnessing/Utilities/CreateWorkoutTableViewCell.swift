//
//  ExerciseTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class CreateWorkoutTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    // MARK: Properties
    // Constants
    let cellIdentifier = "SetTableViewCell"
    // View elements
    let num = UILabel()
    let titleLabel = UILabel()
    let background = UIView()
    let addButton = UIButton()
    let deleteButton = UIButton()
    let weightField = UITextField()
    let repsField = UITextField()
    let weightLabel = UILabel()
    let repsLabel = UILabel()
    var tableView : UITableView?
    
    var sharedUser: User!
    var exercise: Exercise?
    var reps: Int!
    var weight: Float!
    var sets: Int!
    var setArray : [[String]] = []
    
    // Strings
    var exerciseNum = "1 of 1"
    var exerciseTitle = "Exercise"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeUser()
        // Adds label to textfield
        weightField.leftViewMode = .always
        repsField.leftViewMode = .always
        
        repsField.delegate = self
        weightField.delegate = self
        
        // If exercises have been added to list
        if sharedUser.getTempExercises().count > 1 {
            
            // Get current exercise
            exercise = sharedUser.getTempExercises()[sharedUser.getTempExercisesIndex()]

            sets = exercise?.getNumSets()
            reps = exercise?.getNumReps()
            weight = exercise?.getWeight()

            setArray = []

            // Create set of reps * weight
            if (sets > 0) {
                for _ in 1...sets {
                    setArray.append([String(reps), String(weight)])
                }
            }
        }
                
        // Initialization code
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height - num.frame.height - titleLabel.frame.height - addButton.frame.height - deleteButton.frame.height - 60))
        
        tableView!.register(SetTableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        self.background.addSubview(tableView!)
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        createBackground()
        createExerciseNum()
        createTitle()
        createRepsField()
        createWeightField()
        
        self.tableView!.rowHeight = 60
        self.tableView!.backgroundColor = .clear
        self.tableView!.allowsSelection = false
        
        // Remove cell separators
        self.tableView!.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        createAddButton()
        createDeleteButton()
        
        tableView!.translatesAutoresizingMaskIntoConstraints = false
        tableView!.widthAnchor.constraint(equalToConstant: tableView!.frame.width).isActive = true
        tableView!.heightAnchor.constraint(equalToConstant: tableView!.frame.height).isActive = true
        tableView!.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        tableView!.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        tableView!.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -10).isActive = true
        
    }
        
    func initializeUser() {
        _ = SharingUser()
        sharedUser = SharingUser.sharedUser.user
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SetTableViewCell  else {
            fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
        }
        
        let set = setArray[indexPath.row]
                
        cell.backgroundColor = UIColor.clear
        cell.setNumLabel.text = "SET " + String(indexPath.row + 1)
        cell.repNumLabel.text = String(set[0]) + "\nreps"
        cell.weightLabel.text = String(set[1]) + "\nlbs"
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: Helper functions
    func formatLabel(label: UILabel, text: String, font: String, alpha: CGFloat, width: CGFloat, height: CGFloat, fontSize: CGFloat) {
         
         label.frame = CGRect(x: 0, y: 0, width: width, height: height)
         label.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: alpha)
         label.font = UIFont(name: font, size: fontSize)
         label.textAlignment = .left
         label.text = text
         label.numberOfLines = 0
         label.lineBreakMode = .byWordWrapping
    
     }/// formatLabel
     
     func defineConstraints(label: UILabel, width: CGFloat, height: CGFloat, leadingConstant: CGFloat, topConstant: CGFloat, top: NSLayoutAnchor<NSLayoutYAxisAnchor>, leading: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
         
         label.translatesAutoresizingMaskIntoConstraints = false
         label.widthAnchor.constraint(equalToConstant: width).isActive = true
         label.heightAnchor.constraint(equalToConstant: height).isActive = true
         label.leadingAnchor.constraint(equalTo: leading, constant: leadingConstant).isActive = true
         label.topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
    
     }/// defineConstraints
    
    func defineConstraints(view: UIView, width: CGFloat, height: CGFloat, leadingConstant: CGFloat, topConstant: CGFloat, top: NSLayoutAnchor<NSLayoutYAxisAnchor>, leading: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
         
         view.translatesAutoresizingMaskIntoConstraints = false
         view.widthAnchor.constraint(equalToConstant: width).isActive = true
         view.heightAnchor.constraint(equalToConstant: height).isActive = true
         view.leadingAnchor.constraint(equalTo: leading, constant: leadingConstant).isActive = true
         view.topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
    
     }/// defineConstraints

    
    //MARK: View functions
    func createExerciseNum() {
        formatLabel(label: num, text: exerciseNum, font: "Roboto-Regular", alpha: 0.8, width: 52, height: 19, fontSize: 16)
        num.sizeToFit()
        self.background.addSubview(num)
        defineConstraints(label: num, width: num.frame.width, height: num.frame.height, leadingConstant: 10, topConstant: 20, top: self.contentView.topAnchor, leading: self.background.leadingAnchor)
    }
    
    func createTitle() {
        formatLabel(label: titleLabel, text: exerciseTitle, font: "Roboto-Bold", alpha: 1, width: 130, height: 28, fontSize: 24)
        titleLabel.sizeToFit()
        self.background.addSubview(titleLabel)
        defineConstraints(label: titleLabel, width: titleLabel.frame.width, height: titleLabel.frame.height, leadingConstant: 10, topConstant: 5, top: self.num.bottomAnchor, leading: self.background.leadingAnchor)
    }

    func createBackground() {
        background.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width - 20, height: self.contentView.frame.height - 15)
        background.backgroundColor = .white
        background.layer.cornerRadius = 15
        background.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
        background.layer.borderWidth = 1
        
        self.contentView.addSubview(background)
        
        defineConstraints(view: background, width: background.frame.width, height: background.frame.height, leadingConstant: 10, topConstant: 10, top: self.contentView.topAnchor, leading: self.contentView.leadingAnchor)
    }
    
    func createWeightField() {
        formatLabel(label: weightLabel, text: "Weight: ", font: "Roboto-Medium", alpha: 1, width: 100, height: 50, fontSize: 16)
        //weightLabel.sizeToFit()
        weightLabel.textColor = .white
        
        weightField.leftView = weightLabel
        weightField.backgroundColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        weightField.layer.cornerRadius = 5
        weightField.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        weightField.textColor = .white
    
        background.addSubview(weightField)
        
        weightField.translatesAutoresizingMaskIntoConstraints = false
        weightField.widthAnchor.constraint(equalToConstant: weightField.frame.width).isActive = true
        weightField.heightAnchor.constraint(equalToConstant: weightField.frame.height).isActive = true
        weightField.trailingAnchor.constraint(equalTo: repsField.leadingAnchor, constant: -5).isActive = true
        weightField.topAnchor.constraint(equalTo: background.topAnchor, constant: 10).isActive = true
    }
    func createRepsField() {
        formatLabel(label: repsLabel, text: "Reps: ", font: "Roboto-Medium", alpha: 1, width: 100, height: 50, fontSize: 16)
        repsLabel.textColor = .white
        //repsLabel.sizeToFit()
        
        repsField.leftView = repsLabel
        repsField.backgroundColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        repsField.layer.cornerRadius = 5
        repsField.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        repsField.textColor = .white
        
        background.addSubview(repsField)
        
        repsField.translatesAutoresizingMaskIntoConstraints = false
        repsField.widthAnchor.constraint(equalToConstant: repsField.frame.width).isActive = true
        repsField.heightAnchor.constraint(equalToConstant: repsField.frame.height).isActive = true
        repsField.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -10).isActive = true
        repsField.topAnchor.constraint(equalTo: background.topAnchor, constant: 10).isActive = true
    }
    
    func createAddButton() {
        addButton.setTitle("ADD SET", for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: self.background.frame.width/2 + 10, height: 60)
        addButton.titleLabel!.font = UIFont(name: "Roboto-Medium", size: 18)
        addButton.backgroundColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        addButton.layer.cornerRadius = 15
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        
        background.addSubview(addButton)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalToConstant:addButton.frame.width).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: addButton.frame.height).isActive = true
        addButton.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 0).isActive = true
        addButton.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: 0).isActive = true
    }
    
    func createDeleteButton() {
        deleteButton.setTitle("DELETE SET", for: .normal)
        deleteButton.frame = CGRect(x: 0, y: 0, width: self.background.frame.width/2 + 10, height: 60)
        deleteButton.titleLabel!.font = UIFont(name: "Roboto-Medium", size: 18)
        deleteButton.backgroundColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        deleteButton.layer.cornerRadius = 15
        deleteButton.addTarget(self, action: #selector(deleteAction), for: .touchUpInside)

        background.addSubview(deleteButton)
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.widthAnchor.constraint(equalToConstant:deleteButton.frame.width).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: deleteButton.frame.height).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: 0).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: Text field functions
    // Method allows only numbers to be written in text fields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // remove non-numerics and compare with original string
        return string == string.filter("0123456789".contains)
    }
    
    // Dismiss keyboard on return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // When user has finished typing, extract user input for weight and reps
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let weight = weightField.text {
            if weight != "" { // If weight field is not empty
                exercise?.setWeight(weight: Float(weight)!) // Set weight for exercise
                if setArray.count > 0 { // Add weight to sets if exercise has more than 0 sets
                    for i in 0...setArray.count-1 {
                        setArray[i][1] = weight
                        tableView!.reloadData()
                    }
                }
            }
        }
        
        if let reps = repsField.text {
            if reps != "" { // If reps field is not empty
                exercise?.setNumReps(reps: Int(reps)!) // Set reps for exercise
                if setArray.count > 0 { // Add reps to sets if exercise has more than 0 sets
                    for i in 0...setArray.count-1 {
                        setArray[i][0] = reps
                        tableView!.reloadData()

                    }
                }
            }
        }
    }
    
    // MARK: Button functions
    @objc func deleteAction() {
        print("Clicked delete set")
        if (exercise!.getNumSets() > 0) { // If sets exist
            exercise!.setNumSets(sets: (exercise?.getNumSets())! - 1) // Decrease number of sets by 1
            setArray.removeLast()  // Remove last set from exercise
        }
        tableView?.reloadData()
    }
    
    @objc func addAction() {
        print("Clicked add set")
        exercise?.setNumSets(sets: (exercise?.getNumSets())! + 1) // Increase number of sets by 1
        setArray.append([String(exercise!.getNumReps()), String(exercise!.getWeight())]) // Add set to array
        tableView?.reloadData() // Reload table so set appears in array
    }

}
