//
//  SetTableViewCell.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class SetTableViewCell: UITableViewCell {
    var setNumLabel = UILabel()
    var repNumLabel = UILabel()
    var weightLabel = UILabel()
    var starLabel = UILabel()
    
    var setNum = "Set 1"
    var weight = "0\nlbs"
    var repNum = "0\nreps"
    var star = "*"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSetNum()
        createRepNum()
        createStar()
        createWeight()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    func createSetNum() {
        formatLabel(label: setNumLabel, text: setNum, font: "Roboto-Regular", alpha: 1, width: 50, height: 50, fontSize: 16)
        self.contentView.addSubview(setNumLabel)
        defineConstraints(label: setNumLabel, width: setNumLabel.frame.width, height: setNumLabel.frame.height, leadingConstant: 20, topConstant: 10, top: self.contentView.topAnchor, leading: self.contentView.leadingAnchor)
    }
    
    func createRepNum() {
        formatLabel(label: repNumLabel, text: repNum, font: "Roboto-Bold", alpha: 1, width: 100, height: 50, fontSize: 18)
        self.contentView.addSubview(repNumLabel)
        defineConstraints(label: repNumLabel, width: repNumLabel.frame.width, height: repNumLabel.frame.height, leadingConstant: 10, topConstant: 10, top: self.contentView.topAnchor, leading: setNumLabel.trailingAnchor)
    }
    
    func createStar() {
        formatLabel(label: starLabel, text: star, font: "Roboto-Bold", alpha: 1, width: 20, height: 50, fontSize: 18)
        self.contentView.addSubview(starLabel)
        defineConstraints(label: starLabel, width: starLabel.frame.width, height: starLabel.frame.height, leadingConstant: 10, topConstant: 10, top: self.contentView.topAnchor, leading: repNumLabel.trailingAnchor)
    }
    
    func createWeight() {
        formatLabel(label: weightLabel, text: weight, font: "Roboto-Bold", alpha: 1, width: 100, height: 50, fontSize: 18)
        self.contentView.addSubview(weightLabel)
        defineConstraints(label: weightLabel, width: weightLabel.frame.width, height: weightLabel.frame.height, leadingConstant: 10, topConstant: 10, top: self.contentView.topAnchor, leading: starLabel.trailingAnchor)
    }
}
