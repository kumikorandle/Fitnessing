//
//  ExerciseTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    var sets : [[Int]] = [[8, 350], [8, 350], [8, 350], [8, 350]]
    
    var exerciseNum = "1 of 1"
    var exerciseTitle = "Exercise"
    
    let num = UILabel()
    let titleLabel = UILabel()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 60
        
        createExerciseNum()
        createTitle()
        
        // Remove cell separators
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SetTableViewCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SetTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SetTableViewCell
        }
        
        // Fetches the appropriate meal for the data source layout.
        let set = sets[indexPath.row]
                
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
         label.textAlignment = .center
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
    
    //MARK: View functions
    func createExerciseNum() {
        formatLabel(label: num, text: exerciseNum, font: "Roboto-Regular", alpha: 0.8, width: 52, height: 19, fontSize: 16)
        self.contentView.addSubview(num)
        defineConstraints(label: num, width: num.frame.width, height: num.frame.height, leadingConstant: 10, topConstant: 10, top: self.contentView.topAnchor, leading: self.contentView.leadingAnchor)
    }
    
    func createTitle() {
        formatLabel(label: titleLabel, text: exerciseTitle, font: "Roboto-Bold", alpha: 1, width: 130, height: 28, fontSize: 24)
        self.contentView.addSubview(titleLabel)
        defineConstraints(label: titleLabel, width: titleLabel.frame.width, height: titleLabel.frame.height, leadingConstant: 10, topConstant: 10, top: self.num.bottomAnchor, leading: self.contentView.leadingAnchor)
    }

}
