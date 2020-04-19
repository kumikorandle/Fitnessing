//
//  ProfileViewController.swift
//  Fitnessing
//
//  Created by Justin Harrott on 2020-04-12.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	
	// MARK: Property Initialization
	var sharedUser: User!
	
	// Title
	var welcomeLabel = UILabel()
	var nameLabel = UILabel()
	
	let line1 = UIView()
	let line2 = UIView()
	var line3 = UIView()
	
	var box1 = UIView()
	var box2 = UIView()
	var box3 = UIView()
	var dateBox = UIView()
	var exerciseBox = UIView()
	
	// Subtitles
	var workoutsCompleted = UILabel()
	var currentWeight = UILabel()
	var hoursWorked = UILabel()
	var prevWorkout = UILabel()
	var workoutTitle = UILabel()
	var exercises = UILabel()
	var myWorkoutsLabel = UILabel()
	var firstWorkoutTitle = UILabel()
	var workoutDate = UILabel()
	
	// Numbers
	var numWorkouts = UILabel()
	var weight = UILabel()
	var workouts = UILabel()
	var month = UILabel()
	var day = UILabel()
	
	var arrow = UIImageView()
	var prevWorkoutButton = UIButton()
	var showAll = UIButton()
	var workoutsTableView : UITableView!
	
	// Subtitle strings
	let workoutsSubtitle = "workouts\ncompleted"
	let weightSubtitle = "current\nweight"
	let hoursSubtitle = "worked\nout"
	let myWorkoutsSubtile = "MY WORKOUTS"
	let prevSubtitle = "Previous Workout"
	
	var workoutTitleSubtitle = "LEGS & ABS"
	var exercisesSubtitle = "6 exercises completed"
	var firstWorkout = "Back & Biceps"
	var workoutDateSubtitle = "Sat, Jan 11"
	
	// Button String
	let showAllButton = "Show All"
	
	var monthString = "JAN"
	var dayString = "1"
	
	// Title
	let welcome = "Welcome"
	
	// Tracker variables
	var selectedButton: UIButton?
	var destinationController: UITableViewController?
	
	
	//MARK: viewDidLoad
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		initializeUser()
		createBackground()
		createTitle(name: sharedUser.getFirstName())
		createLine(line: line1, topNeighbour: nameLabel)
		
		
	}/// viewDidLoad
	
	override func viewDidAppear(_ animated: Bool) {
		self.navigationController?.isNavigationBarHidden = true
	}/// viewDidAppear
	
	
	//MARK: Utility Functions
	
	func initializeUser() {
		
		_ = SharingUser()
		
		SharingUser.sharedUser.loadUser() // un-archive data
		
		if (SharingUser.sharedUser.user == nil) {
			SharingUser.sharedUser.user = User(firstName: "First Name", lastName: "Last Name", heightCM: 0, weightLBS: 0, totalHoursWorked: 0, totalWeightLifted: 0, workoutCollection: [])
		}
		
		sharedUser = SharingUser.sharedUser.user
		
	}/// initializeUser
	
	//MARK: create view functions
	func createBackground() {
		
		let background = UILabel()
		background.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
		background.backgroundColor = .white
		self.view.insertSubview(background, at: 0)
		
		let layer0 = CAGradientLayer()
		layer0.colors = [
			UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
			UIColor(red: 1, green: 0, blue: 0, alpha: 0.28).cgColor
		]
		
		layer0.locations = [0, 1]
		layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
		layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
		
		layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
		
		layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
		
		layer0.position = background.center
		layer0.frame = self.view.bounds
		
		background.layer.addSublayer(layer0)
		
	}/// createBackground
	
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
	
	func createTitle(name: String) {
		
		formatLabel(label: welcomeLabel, text: welcome, font: "Roboto-Regular", alpha: 0.75, width: 200, height: 56, fontSize: 48)
		formatLabel(label: nameLabel, text: name, font: "Roboto-Bold", alpha: 1, width: 164, height: 56, fontSize: 48)
		nameLabel.sizeToFit()
		nameLabel.textAlignment = .left
		
		self.view.addSubview(welcomeLabel)
		self.view.addSubview(nameLabel)
		
		// Constraints
		defineConstraints(label: welcomeLabel, width: welcomeLabel.frame.width, height: welcomeLabel.frame.height, leadingConstant: 36, topConstant: 75, top: self.view!.topAnchor, leading: self.view!.leadingAnchor)
		defineConstraints(label: nameLabel, width: 164, height: 56, leadingConstant: 36, topConstant: 5, top: welcomeLabel.bottomAnchor, leading: self.view.leadingAnchor)
	}/// createTitle
	
	func createLine(line: UIView, topNeighbour: Any?) {
		let lineWidth = self.view.frame.width - 60
		
		line.frame = CGRect(x: 0, y: 0, width: lineWidth, height: 0)
		line.backgroundColor = .white
		
		let stroke = UIView()
		stroke.bounds = line.bounds.insetBy(dx: -0.5, dy: -0.5)
		stroke.center = line.center
		line.addSubview(stroke)
		line.bounds = line.bounds.insetBy(dx: -0.5, dy: -0.5)
		stroke.layer.borderWidth = 1
		stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		
		self.view.addSubview(line)
		
		line.translatesAutoresizingMaskIntoConstraints = false
		line.widthAnchor.constraint(equalToConstant: lineWidth).isActive = true
		line.heightAnchor.constraint(equalToConstant: 0).isActive = true
		line.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35).isActive = true
		
		if let label = topNeighbour as? UILabel {
			line.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15).isActive = true
		} else if let button = topNeighbour as? UIButton {
			line.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 1).isActive = true
		} else if let view = topNeighbour as? UIView {
			line.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 30).isActive = true
		}
	}/// createLine
	
}/// ProfileViewController

