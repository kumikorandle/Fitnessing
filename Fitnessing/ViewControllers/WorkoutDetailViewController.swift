//
//  WorkoutDetailViewController.swift
//  Fitnessing
//
//  Created by Justin Harrott on 04-17-2020.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit


class WorkoutDetailViewController: UIViewController {
	
//MARK: viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		create0()
		
		create11()
		
		create1k()
		
		create24CircleChecked()
		
		create3()
		
		create3k()
		
		create5()
		
		create5k()
		
		create7()
		
		createAccessTime()
		
		createAvgDuration()
		
		createBackground()
		
		createDateLabel()
		
		createDateRange()
		
		createEdit()
		
		createExercisesLabel()
		
		createGroup37()
		
		createHRSWorkedOut()
		
		createJan1()
		
		createLegs()
		
		createLine()
		
		createLine3()
		
		createLine4()
		
		createLine5()
		
		createMenuBar()
		
		createRectangle19()
		
		createRectangle20()
		
		createRectangle21()
		
		createRectangle22()
		
		createRectangle23()
		
		createRectangle24()
		
		createRectangle25()
		
		createRectangle26()
		
		createRectangle27()
		
		createRectangle28()
		
		createRectangle29()
		
		createRectangle3()
		
		createRectangle31()
		
		createStart()
		
		createWeightIcon()
		
		createWeightLiftedLabel()
		
		createWorkoutsCompletedLabel()
		
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
		view.frame = CGRect(x: 0, y: 0, width: 414, height: 373)
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
		view.heightAnchor.constraint(equalToConstant: 373).isActive = true
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
	
	
	// Rectangle 31
	func createRectangle31() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 414, height: 74)
		view.backgroundColor = .white
		
		let layer0 = CAGradientLayer()
		layer0.colors = [
		UIColor(red: 1, green: 0.737, blue: 0.643, alpha: 1).cgColor,
		UIColor(red: 0.992, green: 0.616, blue: 0.604, alpha: 1).cgColor
		]
		layer0.locations = [0, 1]
		layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
		layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
		layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 31.3, tx: 0, ty: -14.65))
		layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
		layer0.position = view.center
		view.layer.addSublayer(layer0)
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 414).isActive = true
		view.heightAnchor.constraint(equalToConstant: 74).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 299).isActive = true
	}
	
	
	// Edit
	func createEdit() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 24, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.text = "Edit"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 24).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 353).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 28).isActive = true
	}
	
	
	// Legs
	func createLegs() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 79, height: 42)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 36)
		
		// Line height: 42 pt
		
		view.text = "Legs"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 79).isActive = true
		view.heightAnchor.constraint(equalToConstant: 42).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 35).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 66).isActive = true
	}
	
	
	// START
	func createStart() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 61, height: 23)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
		view.font = UIFont(name: "Roboto-Medium", size: 20)
		
		// Line height: 23 pt
		
		view.text = "START"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 61).isActive = true
		view.heightAnchor.constraint(equalToConstant: 23).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 177).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 326).isActive = true
	}
	
	
	// Sat, Jan 11
	func createDateLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 89, height: 21)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.67)
		view.font = UIFont(name: "Roboto-Regular", size: 18)
		
		// Line height: 21 pt
		// (identical to box height)
		
		view.textAlignment = .center
		view.text = "Sat, Jan 11"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 89).isActive = true
		view.heightAnchor.constraint(equalToConstant: 21).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 35).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 108).isActive = true
	}
	
	
	// Rectangle 19
	func createRectangle19() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 56, height: 96)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 0.723, blue: 0.671, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 56).isActive = true
		view.heightAnchor.constraint(equalToConstant: 96).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 78).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 203).isActive = true
	}
	
	
	// Rectangle 20
	func createRectangle20() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 55, height: 105)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 0.706, blue: 0.62, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 55).isActive = true
		view.heightAnchor.constraint(equalToConstant: 105).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 134).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 194).isActive = true
	}
	
	
	// Rectangle 25
	func createRectangle25() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 55, height: 105)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 0.706, blue: 0.62, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 55).isActive = true
		view.heightAnchor.constraint(equalToConstant: 105).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 134).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 194).isActive = true
	}
	
	
	// Rectangle 21
	func createRectangle21() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 56, height: 118)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 56).isActive = true
		view.heightAnchor.constraint(equalToConstant: 118).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 189).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 181).isActive = true
	}
	
	
	// Rectangle 22
	func createRectangle22() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 55, height: 109)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 0.773, blue: 0.729, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 55).isActive = true
		view.heightAnchor.constraint(equalToConstant: 109).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 245).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 190).isActive = true
	}
	
	
	// Rectangle 23
	func createRectangle23() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 56, height: 118)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 56).isActive = true
		view.heightAnchor.constraint(equalToConstant: 118).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 298).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 181).isActive = true
	}
	
	
	// 0
	func create0() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 8, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "0"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 8).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 31).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 285).isActive = true
	}
	
	
	// 1k
	func create1k() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 15, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "1k"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 15).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 28).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 243).isActive = true
	}
	
	
	// 3k
	func create3k() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 15, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "3k"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 15).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 28).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 200).isActive = true
	}
	
	
	// 5k
	func create5k() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 15, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "5k"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 15).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 28).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 156).isActive = true
	}
	
	
	// Jan 1
	func createJan1() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 35, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "Jan 1"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 35).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 88).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true
	}
	
	
	// 3
	func create3() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 8, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "3"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 8).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 156).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true
	}
	
	
	// 5
	func create5() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 8, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "5"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 8).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 211).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true
	}
	
	
	// 7
	func create7() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 8, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "7"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 8).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 268).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true
	}
	
	
	// 11
	func create11() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.74)
		view.font = UIFont(name: "Roboto-Regular", size: 14)
		
		// Line height: 16 pt
		
		view.textAlignment = .center
		view.text = "11"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 16).isActive = true
		view.heightAnchor.constraint(equalToConstant: 16).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 317).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 138).isActive = true
	}
	
	
	// Rectangle 24
	func createRectangle24() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 414, height: 527)
		view.backgroundColor = .white
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 414).isActive = true
		view.heightAnchor.constraint(equalToConstant: 527).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 373).isActive = true
	}
	
	
	// Line 3
	func createLine3() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 414, height: 0)
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
		view.widthAnchor.constraint(equalToConstant: 414).isActive = true
		view.heightAnchor.constraint(equalToConstant: 0).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 532).isActive = true
	}
	
	
	// Line 4
	func createLine4() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 414, height: 0)
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
		view.widthAnchor.constraint(equalToConstant: 414).isActive = true
		view.heightAnchor.constraint(equalToConstant: 0).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 448).isActive = true
	}
	
	
	// Line 5
	func createLine5() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 158, height: 0)
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
		view.widthAnchor.constraint(equalToConstant: 158).isActive = true
		view.heightAnchor.constraint(equalToConstant: 0).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 208).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 531).isActive = true
	}
	
	
	// Rectangle 3
	func createRectangle3() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 183, height: 72)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 1
		view.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 183).isActive = true
		view.heightAnchor.constraint(equalToConstant: 72).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 208).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 383).isActive = true
	}
	
	
	// Rectangle 28
	func createRectangle28() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 181, height: 72)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 1
		view.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 181).isActive = true
		view.heightAnchor.constraint(equalToConstant: 72).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 458).isActive = true
	}
	
	
	// Rectangle 29
	func createRectangle29() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 183, height: 72)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 1
		view.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 183).isActive = true
		view.heightAnchor.constraint(equalToConstant: 72).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 208).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 458).isActive = true
	}
	
	
	// Rectangle 27
	func createRectangle27() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 181, height: 72)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 1
		view.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 181).isActive = true
		view.heightAnchor.constraint(equalToConstant: 72).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 383).isActive = true
	}
	
	
	// 24 / basic / circle-checked
	func create24CircleChecked() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
		view.backgroundColor = .white
		
		let shadows = UIView()
		shadows.frame = view.frame
		shadows.clipsToBounds = false
		view.addSubview(shadows)
		
		let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
		let layer0 = CALayer()
		layer0.shadowPath = shadowPath0.cgPath
		layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
		layer0.shadowOpacity = 1
		layer0.shadowRadius = 3
		layer0.shadowOffset = CGSize(width: 0, height: 2)
		layer0.bounds = shadows.bounds
		layer0.position = shadows.center
		shadows.layer.addSublayer(layer0)
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
	}
	
	
	// Weight Icon
	func createWeightIcon() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 24, height: 13.26)
		view.backgroundColor = .white
		
		let shadows = UIView()
		shadows.frame = view.frame
		shadows.clipsToBounds = false
		view.addSubview(shadows)
		
		let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 1)
		let layer0 = CALayer()
		layer0.shadowPath = shadowPath0.cgPath
		layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
		layer0.shadowOpacity = 1
		layer0.shadowRadius = 3
		layer0.shadowOffset = CGSize(width: 0, height: 2)
		layer0.bounds = shadows.bounds
		layer0.position = shadows.center
		shadows.layer.addSublayer(layer0)
		
//		shapes.layer.cornerRadius = 1 // not sure what "shapes" is referring to
		let stroke = UIView()
		stroke.bounds = view.bounds.insetBy(dx: -2, dy: -2)
		stroke.center = view.center
		view.addSubview(stroke)
		stroke.layer.cornerRadius = 3
		view.bounds = view.bounds.insetBy(dx: -2, dy: -2)
		stroke.layer.borderWidth = 2
		stroke.layer.borderColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 24).isActive = true
		view.heightAnchor.constraint(equalToConstant: 13.26).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 226).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 411).isActive = true
	}
	
	
	// 8 workouts completed
	func createWorkoutsCompletedLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 128, height: 36)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 24)
		view.numberOfLines = 0
		view.lineBreakMode = .byWordWrapping
		
		// Line height: 21 pt
		
		view.text = "8\nworkouts completed"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 128).isActive = true
		view.heightAnchor.constraint(equalToConstant: 36).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 68).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 401).isActive = true
	}
	
	
	// 1300 lbs weight lifted
	func createWeightLiftedLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 132, height: 36)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 24)
		view.numberOfLines = 0
		view.lineBreakMode = .byWordWrapping
		
		// Line height: 21 pt
		
		view.text = "1300 lbs\nweight lifted"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 132).isActive = true
		view.heightAnchor.constraint(equalToConstant: 36).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 259).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 401).isActive = true
	}
	
	
	// 01:30 hr avg duration
	func createAvgDuration() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 132, height: 36)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 24)
		view.numberOfLines = 0
		view.lineBreakMode = .byWordWrapping
		
		// Line height: 21 pt
		
		view.text = "01:30 hr\navg duration"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 132).isActive = true
		view.heightAnchor.constraint(equalToConstant: 36).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 259).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 477).isActive = true
	}
	
	
	// 10:30 hrs worked out
	func createHRSWorkedOut() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 132, height: 36)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1)
		view.font = UIFont(name: "Roboto-Bold", size: 24)
		view.numberOfLines = 0
		view.lineBreakMode = .byWordWrapping
		
		// Line height: 21 pt
		
		view.text = "10:30 hrs\nworked out"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 132).isActive = true
		view.heightAnchor.constraint(equalToConstant: 36).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 68).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 477).isActive = true
	}
	
	
	// EXERCISES
	func createExercisesLabel() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 82, height: 19)
		view.backgroundColor = .white
		
		view.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 0.62)
		view.font = UIFont(name: "Roboto-Medium", size: 16)
		
		// Line height: 19 pt
		// (identical to box height)
		
		view.textAlignment = .center
		view.text = "EXERCISES"
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 82).isActive = true
		view.heightAnchor.constraint(equalToConstant: 19).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 24).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 552).isActive = true
	}
	
	
	// access_time_24px
	func createAccessTime() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
		view.backgroundColor = .white
		
		let shadows = UIView()
		shadows.frame = view.frame
		shadows.clipsToBounds = false
		view.addSubview(shadows)
		
		let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
		let layer0 = CALayer()
		layer0.shadowPath = shadowPath0.cgPath
		layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
		layer0.shadowOpacity = 1
		layer0.shadowRadius = 3
		layer0.shadowOffset = CGSize(width: 0, height: 2)
		layer0.bounds = shadows.bounds
		layer0.position = shadows.center
		shadows.layer.addSublayer(layer0)
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 24).isActive = true
		view.heightAnchor.constraint(equalToConstant: 24).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 226).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 482).isActive = true
	}
	
	
	// date_range_24px
	func createDateRange() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
		view.backgroundColor = .white
		
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 24).isActive = true
		view.heightAnchor.constraint(equalToConstant: 24).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 35).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 482).isActive = true
	}
	
	
	// Group 37
	func createGroup37() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 397, height: 302)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 397).isActive = true
		view.heightAnchor.constraint(equalToConstant: 302).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 8).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 579).isActive = true
	}
	
	
	// Menu Bar
	func createMenuBar() {
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 415, height: 119)
		view.backgroundColor = .white
		
		view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
		
		let parent = self.view!
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 415).isActive = true
		view.heightAnchor.constraint(equalToConstant: 119).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: -1).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 821).isActive = true
	}
	
}/// WorkoutDetailViewController
