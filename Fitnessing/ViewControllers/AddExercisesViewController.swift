//
//  AddExercisesViewController.swift
//  Fitnessing
//
//  Created by Justin Harrott on 04-17-2020.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit


class AddExerciseViewController: UIViewController {
	
	//MARK: viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createBackground()
		
		createAddExercises()
		
		createAddSelected()
		
		createEllipse()
		
		createGroup20()
		
		createGroup21()
		
		createGroup23()
		
		createGroup24()
		
		createGroup25()
		
		createGroup26()
		
		createGroup27()
		
		createGroup28()
		
		createHeader()
		
		createLine()
		
		createSearch()
		
	}
	
	// Background
	func createBackground() {
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
	
	
	// Header
	func createHeader() {
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
		let stroke = UIView()
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
	
	
	// Add Selected
	func createAddSelected() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 83, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.text = "Add Selected"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 83).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 303).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 23).isActive = true
	}
	
	
	// Search
	func createSearch() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 43, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.text = "Search"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 43).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 58).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 118).isActive = true
	}
	
	
	// Ellipse
	func createEllipse() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
		view.backgroundColor = .white
		
		let stroke = UIView()
		stroke.bounds = view.bounds.insetBy(dx: -1, dy: -1)
		stroke.center = view.center
		view.addSubview(stroke)
		view.bounds = view.bounds.insetBy(dx: -1, dy: -1)
		stroke.layer.borderWidth = 2
		stroke.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
	}
	
	
	// 24 / basic / options
	func createBasicOptions() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
		view.backgroundColor = .white
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
	}
	
	
	// Add Exercises
	func createAddExercises() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 230, height: 42)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 36)
		
		// Line height: 42 pt
		
		view.text = "Add Exercises"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 230).isActive = true
		view.heightAnchor.constraint(equalToConstant: 42).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 32).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 57).isActive = true
	}
	
	
	// Group 20
	func createGroup20() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 84)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 84).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 171).isActive = true
	}
	
	
	// Group 21
	func createGroup21() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 100)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 100).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 263).isActive = true
	}
	
	
	// Group 23
	func createGroup23() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 84)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 84).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 371).isActive = true
	}
	
	
	// Group 28
	func createGroup28() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 84)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 84).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 838).isActive = true
	}
	
	
	// Group 24
	func createGroup24() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 84)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 84).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 463).isActive = true
	}
	
	
	// Group 25
	func createGroup25() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 84)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 84).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 555).isActive = true
	}
	
	
	// Group 26
	func createGroup26() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 91.43)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 91.43).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 647).isActive = true
	}
	
	
	// Group 27
	func createGroup27() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 392, height: 84)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 392).isActive = true
		view.heightAnchor.constraint(equalToConstant: 84).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 11).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 746).isActive = true
	}
	
	
}/// WorkoutDetailViewController

