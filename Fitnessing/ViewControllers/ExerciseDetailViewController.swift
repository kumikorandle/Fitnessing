//
//  ExerciseDetailViewController.swift
//  Fitnessing
//
//  Created by Justin Harrott on 04-16-2020.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class ExerciseDetailViewController: UIViewController {
	
//MARK: viewDidLoad
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		createBackground()

		createHeader()
		
		createLine()
		
		createPerimeterBorder()
		
		deadLift()
		
		descLabel()
		
		description()
		
		group17()
		
		group18()
		
		group19()
		
		group20()
		
		highlight_off_24px()
		
		howTo()
		
		line2()
		
		line3()
		
		musclesInvolved()
		
		rect1()
		
	}/// viewDidLoad
	
	
//MARK: create view functions
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
	
	
	
	// Rectangle 57
	func createPerimeterBorder() {
	
		let backdrop = UILabel()
		backdrop.frame = CGRect(x: 0, y: 0, width: 377, height: 705)
		backdrop.backgroundColor = .white
		
		backdrop.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		backdrop.layer.cornerRadius = 20
		backdrop.layer.borderWidth = 1
		backdrop.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 377).isActive = true
		view.heightAnchor.constraint(equalToConstant: 705).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 18).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 177).isActive = true
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
	
	
	// highlight_off_24px
	func highlight_off_24px() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
		view.backgroundColor = .white
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 24).isActive = true
		view.heightAnchor.constraint(equalToConstant: 24).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 361).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 30.97).isActive = true
	}
	
	
	// Deadlift
	func deadLift() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 127, height: 42)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 36)
		
		// Line height: 42 pt
		
		view.text = "Deadlift"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 127).isActive = true
		view.heightAnchor.constraint(equalToConstant: 42).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 57).isActive = true
	}
	
	
	// Rectangle 1
	func rect1() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 342, height: 213)
		view.backgroundColor = .white
		
		let image0 = UIImage(named: "image.png")?.cgImage
		let layer0 = CALayer()
		layer0.contents = image0
		layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.11, b: 0, c: 0, d: 1, tx: -0.06, ty: 0))
		layer0.bounds = view.bounds
		layer0.position = view.center
		view.layer.addSublayer(layer0)
		
		view.layer.cornerRadius = 20
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 342).isActive = true
		view.heightAnchor.constraint(equalToConstant: 213).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 193).isActive = true
	}
	
	
	// Deadlift How-to
	func howTo() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 127, height: 21)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 18)
		
		// Line height: 21 pt
		// (identical to box height)
		
		view.text = "Deadlift How-to"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 127).isActive = true
		view.heightAnchor.constraint(equalToConstant: 21).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 143).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 427).isActive = true
	}
	
	
	// Muscles Involved
	func musclesInvolved() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 126, height: 19)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 16)
		
		// Line height: 19 pt
		// (identical to box height)
		
		view.text = "Muscles Involved"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 126).isActive = true
		view.heightAnchor.constraint(equalToConstant: 19).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 500).isActive = true
	}
	
	
	// Description
	func description() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 83, height: 19)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 16)
		
		// Line height: 19 pt
		// (identical to box height)
		
		view.text = "Description"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 83).isActive = true
		view.heightAnchor.constraint(equalToConstant: 19).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 639).isActive = true
	}
	
	
	// Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
	func descLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 344, height: 193)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
		view.font = UIFont(name: "Roboto-Medium", size: 16)
		view.numberOfLines = 0
		view.lineBreakMode = .byWordWrapping
		
		// Line height: 19 pt
		
		view.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\n"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 344).isActive = true
		view.heightAnchor.constraint(equalToConstant: 193).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 37).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 667).isActive = true
	}
	
	
	// Line 2
	func line2() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 347, height: 0)
		view.backgroundColor = .white
		
		let stroke = UIView()
		stroke.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
		stroke.center = view.center
		view.addSubview(stroke)
		view.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
		stroke.layer.borderWidth = 1
		stroke.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 347).isActive = true
		view.heightAnchor.constraint(equalToConstant: 0).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 31).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 474).isActive = true
	}
	
	
	// Line 3
	func line3() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 347, height: 0)
		view.backgroundColor = .white
		
		let stroke = UIView()
		stroke.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
		stroke.center = view.center
		view.addSubview(stroke)
		view.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
		stroke.layer.borderWidth = 1
		stroke.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 347).isActive = true
		view.heightAnchor.constraint(equalToConstant: 0).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 30).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 613).isActive = true
	}
	
	
	// Group 17
	func group17() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 105.45, height: 31)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 105.45).isActive = true
		view.heightAnchor.constraint(equalToConstant: 31).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 537).isActive = true
	}
	
	
	// Group 18
	func group18() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 77.94, height: 31)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 77.94).isActive = true
		view.heightAnchor.constraint(equalToConstant: 31).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 267.06).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 537).isActive = true
	}
	
	
	// Group 19
	func group19() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 105.45, height: 31)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 105.45).isActive = true
		view.heightAnchor.constraint(equalToConstant: 31).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 151.53).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 537).isActive = true
	}
	
	
	// Group 20
	func group20() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 105.45, height: 31)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 105.45).isActive = true
		view.heightAnchor.constraint(equalToConstant: 31).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 36).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 563).isActive = true
	}
	
}
