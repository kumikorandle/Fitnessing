//
//  ExerciseTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class CreateWorkoutTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    // MARK: Properties
    // constants
    let cellIdentifier = "SetTableViewCell"
    let num = UILabel()
    let titleLabel = UILabel()
    let background = UIView()
    let addButton = UIButton()
    let deleteButton = UIButton()
    
    var sharedUser: User!
    var exercise: Exercise?
    var reps: Int!
    var weight: Float!
    var sets: Int!
    var setArray : [[String]] = []
    
    var exerciseNum = "1 of 1"
    var exerciseTitle = "Exercise"

    var tableView : UITableView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeUser()
        
        if sharedUser.getTempExercises().count > 1 {
            exercise = sharedUser.getTempExercises()[sharedUser.getTempExercisesIndex()]

            sets = exercise?.getNumSets()
            reps = exercise?.getNumReps()
            weight = exercise?.getWeight()

            setArray = []

            if (sets > 0) {
                for _ in 1...sets {
                    setArray.append([String(reps), String(weight)])
                }
            }
        }
                
        // Initialization code
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width-20, height: self.contentView.frame.height - num.frame.height - titleLabel.frame.height - addButton.frame.height - deleteButton.frame.height - 60))
        
        tableView!.register(SetTableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.background.addSubview(tableView!)
        
        createBackground()
        createExerciseNum()
        createTitle()
        
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
        cell!.selectionStyle = .none
        
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
    
    // MARK: Button functions
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
    
    @objc func deleteAction() {
        print("Clicked delete set")
        if (exercise!.getNumSets() > 0) {
            exercise!.setNumSets(sets: (exercise?.getNumSets())! - 1)
            setArray.removeLast()
        }
        tableView?.reloadData()
    }
    
    @objc func addAction() {
        print("Clicked add set")
        exercise?.setNumSets(sets: (exercise?.getNumSets())! + 1)
        setArray.append([String(exercise!.getNumReps()), String(exercise!.getWeight())])
        tableView?.reloadData()
    }
}
