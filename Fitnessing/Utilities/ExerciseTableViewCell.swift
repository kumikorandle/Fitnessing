//
//  ExerciseTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    // MARK: Properties
    var sharedUser: User!
    
    var workout: Workout?
    var exercise: Exercise?
    
    var reps: Int!
    var weight: Float!
    var sets: Int!
    var setArray : [[String]]! = []
    
    // Strings
    var exerciseNum = "1 of 1"
    var exerciseTitle = "Exercise"
    let cellIdentifier = "SetTableViewCell"
    
    // View Elements
    let num = UILabel()
    let titleLabel = UILabel()
    let background = UIView()
    
    var tableView : UITableView?
    
    var minHeight: CGFloat?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        initializeUser()
        createBackground()
        createExerciseNum()
        createTitle()
        setUpTable()
        setUpArray()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)

        setUpTable()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        guard let minHeight = minHeight else { return size }
        return CGSize(width: size.width, height: max(size.height, minHeight))
    }
    
    func setUpArray() {
        // Assumes that workout already exists in workout collection (editing existing workout)
        workout = sharedUser.getWorkoutCollection()[sharedUser.getCurrentIndex()] // Get current workout
        exercise = workout?.getExercises()[(workout?.getCurrentIndex())!] // Get current exercise
                
        sets = exercise?.getNumSets()
        reps = exercise?.getNumReps()
        weight = exercise?.getWeight()
        
        setArray = []
        
        // Create array of sets (reps * weight)
        if (sets > 0) { // If exercise has more than 0 sets...
            for _ in 1...sets {
                // Add pair reps * weight to array
                setArray.append([String(reps), String(weight)])
            }
        }
    }
    
    func setUpTable() {
        // Table initialization
        self.tableView = UITableView()
        
        self.tableView!.register(SetTableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        self.background.addSubview(self.tableView!)
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        self.tableView!.rowHeight = 60
        self.tableView!.backgroundColor = .clear
        self.tableView!.allowsMultipleSelection = true
        
        // Remove cell separators
        self.tableView!.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpArray()
        tableView?.reloadData()
        self.tableView!.frame = CGRect(x: self.background.frame.minX, y: self.num.frame.height + self.titleLabel.frame.height + 20, width: self.contentView.frame.width-40, height: self.background.frame.height - self.num.frame.height - self.titleLabel.frame.height - 50)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeUser()
        createBackground()
        createExerciseNum()
        createTitle()
        setUpTable()
        setUpArray()
        tableView?.reloadData()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SetTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SetTableViewCell.")
        }
        
        let set = setArray[indexPath.row]
                
        cell.backgroundColor = UIColor.clear
        // Set ? of ?
        cell.setNumLabel.text = "SET " + String(indexPath.row + 1)
        cell.repNumLabel.text = String(set[0]) + "\nreps"
        cell.weightLabel.text = String(set[1]) + "\nlbs"
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SetTableViewCell
        cell.backgroundColor = UIColor(red: 1, green: 0.969, blue: 0.965, alpha: 1)
        cell.accessoryType = UITableViewCell.AccessoryType.checkmark // Adds checkmark to set if selected to mark as done
        cell.tintColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SetTableViewCell
        cell.backgroundColor = .clear
        cell.accessoryType = UITableViewCell.AccessoryType.none // Removes checkmark from selected
        cell.tintColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)

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
    
    func defineConstraints(label: UILabel, height: CGFloat, leadingConstant: CGFloat, topConstant: CGFloat, top: NSLayoutAnchor<NSLayoutYAxisAnchor>, leading: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
         
         label.translatesAutoresizingMaskIntoConstraints = false
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
        formatLabel(label: num, text: exerciseNum, font: "Roboto-Regular", alpha: 0.8, width: 100, height: 19, fontSize: 16)
        self.background.addSubview(num)
        defineConstraints(label: num, width: num.frame.width, height: num.frame.height, leadingConstant: 10, topConstant: 20, top: self.contentView.topAnchor, leading: self.background.leadingAnchor)
    }
    
    func createTitle() {
        formatLabel(label: titleLabel, text: exerciseTitle, font: "Roboto-Bold", alpha: 1, width: 130, height: 28, fontSize: 24)
        titleLabel.sizeToFit()
        self.background.addSubview(titleLabel)
        defineConstraints(label: titleLabel, height: titleLabel.frame.height, leadingConstant: 10, topConstant: 10, top: self.num.bottomAnchor, leading: self.background.leadingAnchor)
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
