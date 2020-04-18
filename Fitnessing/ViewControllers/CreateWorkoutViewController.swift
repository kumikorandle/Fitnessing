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
	
	var header = UILabel()
	var subtitle = UILabel()

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
		
		
		self.title = "Legs"
		
		self.navigationController?.isNavigationBarHidden = false
		customizeNavBar()
		createBackground()
		createSubtitle()
		
		tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 50).isActive = true
	}/// veiwDidLoad
	
	
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
	}/// cellForRowAt
	
	// MARK: Helper Functions
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
		label.textAlignment = .center
		label.text = text
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		
	}/// formatLabel
	
	
	// MARK: View functions
	func createBackground() {
		header.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.bounds.height)!, width: self.view.frame.width, height: 230)
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
		
		let finishButton = UIButton(type: .custom)
		finishButton.setTitle("Finish Workout", for: .normal)
		finishButton.addTarget(self, action: #selector(finishAction), for: .touchUpInside)
		
		self.navigationItem.setRightBarButton(UIBarButtonItem(customView: finishButton), animated: true)
	}/// customizeNavBar
	
	func createSubtitle() {
		formatLabel(label: subtitle, text: "In Progress", font: "Roboto-Bold", alpha: 0.8, width: 100, height: 25, fontSize: 16)
		self.view.addSubview(subtitle)
		defineConstraints(label: subtitle, width: subtitle.frame.width, height: subtitle.frame.height, leadingConstant: 10, topConstant: 140, top: self.view.topAnchor, leading: self.view.leadingAnchor)
	}/// createSubtitle
	
	
	// MARK: Button functions
	@objc func finishAction() {
		print("Clicked finish")
		self.navigationController?.popViewController(animated: true)
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
