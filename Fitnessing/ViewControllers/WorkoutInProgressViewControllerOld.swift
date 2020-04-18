//
//  WorkoutInProgressViewController.swift
//  Fitnessing
//
//  created by Justin Harrott on 04-17-2020.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit


class WorkoutInProgressViewControllerOld: UIViewController {
	
//MARK: viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createBackground()
		
		createClockLabel()
		
		createEditWorkout()
		
		createFinishWorkout()
		
		createGroup37()
		
		createGroup38()
		
		createInProgress()
		
		createLine()
		
		createLowerBodyLabel()
		
		createRectangle26()
		
		createTimeLabel()
		
		createUnion()
		
	}
	
	
	// Rectangle 26
	func createRectangle26() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0.983, green: 0.983, blue: 0.983, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 414).isActive = true
		view.heightAnchor.constraint(equalToConstant: 896).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
	}
	
	
	// Background
	func createBackground() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 414, height: 156)
		view.backgroundColor = .white
		
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
		layer0.position = view.center
		view.layer.addSublayer(layer0)
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 414).isActive = true
		view.heightAnchor.constraint(equalToConstant: 156).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
	}
	
	
	// Line
	func createLine() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 16, height: 9)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		var stroke = UIView()
		stroke.bounds = view.bounds.insetBy(dx: -0.75, dy: -0.75)
		stroke.center = view.center
		view.addSubview(stroke)
		view.bounds = view.bounds.insetBy(dx: -0.75, dy: -0.75)
		stroke.layer.borderWidth = 1.5
		stroke.layer.borderColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
	}
	
	
	// Edit Workout
	func createEditWorkout() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 80, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.text = "Edit Workout"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 80).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 309).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 176).isActive = true
	}
	
	
	// Finish Workout
	func createFinishWorkout() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 93, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.text = "Finish Workout"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 93).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 295).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 28).isActive = true
	}
	
	
	// In Progress
	func createInProgress() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 71, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.text = "In Progress"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 71).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 108).isActive = true
	}
	
	
	// Lower Body
	func createLowerBodyLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 190, height: 42)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 36)
		
		// Line height: 42 pt
		
		view.text = "Lower Body"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 190).isActive = true
		view.heightAnchor.constraint(equalToConstant: 42).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 66).isActive = true
	}
	
	
	// 0:00
	func createTimeLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 27, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "0:00"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 27).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 57).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 175).isActive = true
	}
	
	
	/* Clock
	
	Time
	*/
	func createClockLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
		view.backgroundColor = .white
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 20).isActive = true
		view.heightAnchor.constraint(equalToConstant: 20).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 32).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 174).isActive = true
	}
	
	
	// Group 37
	func createGroup37() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 397, height: 371)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 397).isActive = true
		view.heightAnchor.constraint(equalToConstant: 371).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 9).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 214).isActive = true
	}
	
	
	// Group 38
	func createGroup38() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 397, height: 371)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 397).isActive = true
		view.heightAnchor.constraint(equalToConstant: 371).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 9).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 605).isActive = true
	}
	
	
	// Union
	func createUnion() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 15.59, height: 15.59)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1).cgColor
		view.layer.cornerRadius = 1
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 15.59).isActive = true
		view.heightAnchor.constraint(equalToConstant: 15.59).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 289).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 176).isActive = true
	}
	
}/// WorkoutInProgressViewController
