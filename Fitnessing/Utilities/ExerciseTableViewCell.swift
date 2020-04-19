//
//  ExerciseTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    var sharedUser: User!
    var workout: Workout?
    var exercise: Exercise?
    var reps: Int!
    var weight: Float!
    var sets: Int!
    var setArray : [[String]]!
    
    var exerciseNum = "1 of 1"
    var exerciseTitle = "Exercise"
    let cellIdentifier = "SetTableViewCell"
    
    let num = UILabel()
    let titleLabel = UILabel()
    let background = UIView()
    
    //@IBOutlet weak var tableView: UITableView!
    var tableView : UITableView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeUser()
        workout = sharedUser.getWorkoutCollection()[sharedUser.getCurrentIndex()]
        exercise = workout?.getExercises()[(workout?.getCurrentIndex())!]
        sets = exercise?.getNumSets()
        reps = exercise?.getNumReps()
        weight = exercise?.getWeight()
        
        setArray = []
        
        for _ in 1...sets {
            setArray.append([String(reps), String(weight)])
        }
                
        // Initialization code
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height - num.frame.height - titleLabel.frame.height - 60))
        
        tableView!.register(SetTableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.background.addSubview(tableView!)
        
        createBackground()
        createExerciseNum()
        createTitle()
        
        self.tableView!.rowHeight = 60
        self.tableView!.backgroundColor = .clear
        
        // Remove cell separators
        self.tableView!.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView!.translatesAutoresizingMaskIntoConstraints = false
        tableView!.widthAnchor.constraint(equalToConstant: tableView!.frame.width).isActive = true
        tableView!.heightAnchor.constraint(equalToConstant: tableView!.frame.height).isActive = true
        tableView!.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        tableView!.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
    }
    
    func initializeUser() {
        _ = SharingUser()
        sharedUser = SharingUser.sharedUser.user
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SetTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SetTableViewCell
        }
        
        let set = setArray[indexPath.row]
                
        cell!.backgroundColor = UIColor.clear
        cell!.setNumLabel.text = "SET " + String(indexPath.row + 1)
        cell!.repNumLabel.text = String(set[0]) + "\nreps"
        cell!.weightLabel.text = String(set[1]) + "\nlbs"
        
        return cell!
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
        self.background.addSubview(num)
        defineConstraints(label: num, width: num.frame.width, height: num.frame.height, leadingConstant: 10, topConstant: 20, top: self.contentView.topAnchor, leading: self.background.leadingAnchor)
    }
    
    func createTitle() {
        formatLabel(label: titleLabel, text: exerciseTitle, font: "Roboto-Bold", alpha: 1, width: 130, height: 28, fontSize: 24)
        self.background.addSubview(titleLabel)
        defineConstraints(label: titleLabel, width: titleLabel.frame.width, height: titleLabel.frame.height, leadingConstant: 10, topConstant: 10, top: self.num.bottomAnchor, leading: self.background.leadingAnchor)
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
}
