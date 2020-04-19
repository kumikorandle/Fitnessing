//
//  CreateWorkoutViewController.swift
//  Fitnessing
//
//  Created by Justin Harrott on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	//var exercises = [Exercise]()
	var exercises = [1, 2, 3]
        
    let finishButton = UIButton(type: .custom)

	var header = UILabel()
	var subtitle = UILabel()
    var workoutTitle = UITextField()
    var addButton = UIButton()

	@IBOutlet weak var tableView: UITableView!

	
	//MARK: viewDidLoad
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		self.tableView.rowHeight = 365
		self.tableView.backgroundColor = .clear
		
		// Remove cell separators
		self.tableView!.separatorStyle = UITableViewCell.SeparatorStyle.none
		
		self.title = "New Workout"
		
		self.navigationController?.isNavigationBarHidden = false
		customizeNavBar()
		createBackground()
		createSubtitle()
        createAddExercise()
        
        self.navigationItem.setRightBarButtonItems([self.editButtonItem, UIBarButtonItem(customView: finishButton)], animated: true)
        
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 50).isActive = true
		
	}/// veiwDidLoad
	
	
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return exercises.count
	}/// numberOfRowsInSection
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// Table view cells are reused and should be dequeued using a cell identifier.
		let cellIdentifier = "ExerciseTableViewCell"
		
		var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExerciseTableViewCell
		
		if cell == nil {
			tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
			cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ExerciseTableViewCell
		}
		
		// Fetches the appropriate exercise for the data source layout.
		let exercise = exercises[indexPath.row]
		
		cell!.backgroundColor = UIColor.clear
		cell!.num.text = String(indexPath.row + 1) + " of " + String(exercises.count)
		cell!.titleLabel.text = "Hip Thrusts"
		
		return cell!
	}/// cellForRowAt
	
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("in here")
        if editingStyle == .delete {
            // Delete the row from the data source
            exercises.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
	// MARK: Formatting Functions
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
	
	func formatLabel(label: UILabel, text: String, font: String, alpha: CGFloat, width: CGFloat, height: CGFloat, fontSize: CGFloat) {
		
		label.frame = CGRect(x: 0, y: 0, width: width, height: height)
		label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
		label.font = UIFont(name: font, size: fontSize)
		label.textAlignment = .left
		label.text = text
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		
	}/// formatLabel
	
	
	// MARK: View functions
	func createBackground() {
		
		header.frame = CGRect(x: 0,
							  y: (self.navigationController?.navigationBar.bounds.height)!,
							  width: self.view.frame.width, height: 230)
		header.backgroundColor = .white
		self.view.addSubview(header)
		
		let layer0 = CAGradientLayer()
		layer0.colors = [
			UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
			UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
			UIColor(red: 1, green: 0, blue: 0, alpha: 0.28).cgColor
		]
		
		layer0.locations = [0, 0.5, 2]
		layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
		layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
		
		layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
		
		layer0.position = header.center
		layer0.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.bounds.height)!, width: self.view.frame.width, height: 230 - (self.navigationController?.navigationBar.frame.height)!)
		
		header.layer.insertSublayer(layer0, at: 0)
		defineConstraints(label: header, width: self.view.frame.width, height: header.frame.height, leadingConstant: 0, topConstant: -10, top: self.view.topAnchor, leading: self.view.leadingAnchor)
	}/// createBackground
	
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
		
		finishButton.setTitle("Save", for: .normal)
		finishButton.addTarget(self, action: #selector(finishAction), for: .touchUpInside)
    
	}/// customizeNavBar
	
	func createSubtitle() {
		formatLabel(label: subtitle, text: "Workout Name:", font: "Roboto-Bold", alpha: 0.8, width: 125, height: 25, fontSize: 16)
        workoutTitle.frame = CGRect(x: 0, y: 0, width: 225, height: 25)
        workoutTitle.layer.cornerRadius = 5
        workoutTitle.textColor = .white
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 25-1, width: 225, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        workoutTitle.borderStyle = UITextField.BorderStyle.none
        workoutTitle.layer.addSublayer(bottomLine)
        
        self.view.addSubview(workoutTitle)
		self.view.addSubview(subtitle)
        
		defineConstraints(label: subtitle, width: subtitle.frame.width, height: subtitle.frame.height, leadingConstant: 20, topConstant: 140, top: self.view.topAnchor, leading: self.view.leadingAnchor)
        
        workoutTitle.translatesAutoresizingMaskIntoConstraints = false
        workoutTitle.widthAnchor.constraint(equalToConstant: workoutTitle.frame.width).isActive = true
        workoutTitle.heightAnchor.constraint(equalToConstant: workoutTitle.frame.height).isActive = true
        workoutTitle.leadingAnchor.constraint(equalTo: subtitle.trailingAnchor, constant: 0).isActive = true
        workoutTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 140).isActive = true
	}/// customizeNavBar
	
    func createAddExercise() {
        addButton.setTitle("Add Exercises", for: .normal)
        addButton.setTitleColor(UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1), for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 150, height: 16)
        addButton.titleLabel?.textAlignment = .right
        addButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        
        self.view.addSubview(addButton)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalToConstant: addButton.frame.width).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: addButton.frame.height).isActive = true
        addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        addButton.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
    }
	
	// MARK: Button functions
	@objc func finishAction() {
		print("Clicked save")
		self.navigationController?.popViewController(animated: true)
	}
    
    @objc func addAction() {
        print("Clicked add exercises")
        let destinationController = self.storyboard!.instantiateViewController(withIdentifier: "addExercises") as! AddExerciseViewController
        self.navigationController!.pushViewController(destinationController, animated: true)
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
