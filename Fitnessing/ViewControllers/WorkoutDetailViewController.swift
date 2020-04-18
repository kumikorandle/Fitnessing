//
//  WorkoutDetailViewController.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class WorkoutDetailViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    //var exercises = [Exercise]()
    var exercises = [1, 2, 3]
    
    let header = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 320
        self.tableView.layer.cornerRadius = 15
        self.tableView.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
        self.tableView.layer.borderWidth = 1
        
        self.title = "Legs"

        self.navigationController?.isNavigationBarHidden = false
        customizeNavBar()
        createBackground()
        createRectangle(topNeighbour: header.topAnchor, leadingNeighbour: self.view.leadingAnchor)
        
    }
    
    // MARK: Table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ExerciseTableViewCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExerciseTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ExerciseTableViewCell
        }
        
        // Fetches the appropriate meal for the data source layout.
        let exercise = exercises[indexPath.row]
                
        cell!.backgroundColor = UIColor.clear
        cell!.num.text = String(indexPath.row + 1) + " of " + String(exercises.count)
        cell!.titleLabel.text = "Hip Thrusts"
        
        return cell!
    }
    
    // MARK: Helper functions
    func formatLabel(label: UILabel, text: String, font: String, alpha: CGFloat, width: CGFloat, height: CGFloat, fontSize: CGFloat) {
         
         label.frame = CGRect(x: 0, y: 0, width: width, height: height)
         label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
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
    
    // MARK: View functions
    func customizeNavBar() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: 0.749, blue: 0.647, alpha: 1)
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(red: 1, green: 0.749, blue: 0.647, alpha: 1)
        navBarAppearance.shadowColor = .clear

        self.navigationController!.navigationBar.standardAppearance = navBarAppearance
        self.navigationController!.navigationBar.scrollEdgeAppearance = navBarAppearance
                
        let editButton = UIButton(type: .custom)
        editButton.setTitle("Edit", for: .normal)
        editButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: editButton), animated: true)
    }
    
    func createBackground() {
        header.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)!, width: self.view.frame.width, height: 225)
        header.backgroundColor = .white
        self.view.addSubview(header)

        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
          UIColor(red: 1, green: 0, blue: 0, alpha: 0.28).cgColor
        ]

        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        
        layer0.position = header.center
        layer0.frame = header.frame
        header.layer.insertSublayer(layer0, at: 0)
        defineConstraints(label: header, width: self.view.frame.width, height: header.frame.height, leadingConstant: 0, topConstant: 0, top: self.view.topAnchor, leading: self.view.leadingAnchor)
    }
    
    func createRectangle(topNeighbour: NSLayoutYAxisAnchor, leadingNeighbour: NSLayoutXAxisAnchor) {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 183, height: 72)
        view.backgroundColor = .white
        
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
        
        let parent = self.view!
        parent.addSubview(view)
        defineConstraints(label: view, width: view.frame.width, height: view.frame.height, leadingConstant: 10, topConstant: 10, top: topNeighbour, leading: leadingNeighbour)
    }
    
    // MARK: Button Methods
    @objc func editAction() {
        print("Clicked edit")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
