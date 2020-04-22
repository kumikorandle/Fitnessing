//
//  ProfileViewController.swift
//  Fitnessing
//
//  Created by Justin Harrott on 2020-04-12.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
	
	// MARK: Property Initialization
	var sharedUser: User!
	
	// Title
	var welcomeLabel = UILabel()
	var nameLabel = UILabel()
	
	let line1 = UIView()

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    // Title
	let welcome = "Welcome"
	
	//MARK: viewDidLoad
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		initializeUser()
		createBackground()
		createTitle(name: sharedUser.getFirstName())
		createLine(line: line1, topNeighbour: nameLabel)
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        defineConstraints(view: firstNameTextField, width: firstNameTextField.frame.width, height: firstNameTextField.frame.height, topConstant: 20, top: line1.bottomAnchor, leadingConstant: -20, leading: self.view.trailingAnchor)
        defineConstraints(view: lastNameTextField, width: lastNameTextField.frame.width, height: lastNameTextField.frame.height, topConstant: 20, top: firstNameTextField.bottomAnchor, leadingConstant: -20, leading: self.view.trailingAnchor)
        defineConstraints(view: heightTextField, width: heightTextField.frame.width, height: heightTextField.frame.height, topConstant: 20, top: lastNameTextField.bottomAnchor, leadingConstant: -20, leading: self.view.trailingAnchor)
        defineConstraints(view: weightTextField, width: weightTextField.frame.width, height: weightTextField.frame.height, topConstant: 20, top: heightTextField.bottomAnchor, leadingConstant: -20, leading: self.view.trailingAnchor)
        defineConstraints(view: firstNameLabel, width: firstNameLabel.frame.width, height: firstNameLabel.frame.height, topConstant: 25, top: line1.bottomAnchor, leadingConstant: -5, leading: firstNameTextField.leadingAnchor)
        defineConstraints(view: lastNameLabel, width: lastNameLabel.frame.width, height: lastNameLabel.frame.height, topConstant: 35, top: firstNameLabel.bottomAnchor, leadingConstant: -5, leading: lastNameTextField.leadingAnchor)
        defineConstraints(view: heightLabel, width: heightLabel.frame.width, height: heightLabel.frame.height, topConstant: 35, top: lastNameLabel.bottomAnchor,leadingConstant: -5, leading: heightTextField.leadingAnchor)
        defineConstraints(view: weightLabel, width: weightLabel.frame.width, height: weightLabel.frame.height, topConstant: 35, top: heightLabel.bottomAnchor, leadingConstant: -5, leading: weightTextField.leadingAnchor)
        
        firstNameTextField.text = sharedUser.getFirstName()
        lastNameTextField.text = sharedUser.getLastName()
        heightTextField.text = String(sharedUser.getHeight())
        weightTextField.text = String(sharedUser.getWeight())
        
        firstNameTextField.isEnabled = false
        lastNameTextField.isEnabled = false
        heightTextField.isEnabled = false
        weightTextField.isEnabled = false
        saveButton.isEnabled = false
        saveButton.alpha = 0.5
        
        firstNameTextField.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        lastNameTextField.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        heightTextField.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        weightTextField.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        
        firstNameTextField.backgroundColor = .white
        lastNameTextField.backgroundColor = .white
        heightTextField.backgroundColor = .white
        weightTextField.backgroundColor = .white
        
        editButton.backgroundColor = .white
        saveButton.backgroundColor = .white
        editButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
        
        editButton.setTitleColor(UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1), for: .normal)
        saveButton.setTitleColor(UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1), for: .normal)
        
       
	}/// viewDidLoad
	
	override func viewDidAppear(_ animated: Bool) {
		self.navigationController?.isNavigationBarHidden = true
	}/// viewDidAppear
	
	
	//MARK: Utility Functions
	
	func initializeUser() {
		_ = SharingUser()
		sharedUser = SharingUser.sharedUser.user
		
	}/// initializeUser
    
    func defineConstraints(view: UIView, width: CGFloat, height: CGFloat, topConstant: CGFloat, top: NSLayoutAnchor<NSLayoutYAxisAnchor>, leadingConstant: CGFloat, leading: NSLayoutXAxisAnchor) {
         
         view.translatesAutoresizingMaskIntoConstraints = false
         view.widthAnchor.constraint(equalToConstant: width).isActive = true
         view.heightAnchor.constraint(equalToConstant: height).isActive = true
         view.topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        view.trailingAnchor.constraint(equalTo: leading, constant: leadingConstant).isActive = true
    
     }
	
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
	
    // MARK: TextField functions
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
        saveButton.alpha = 0.5
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = firstNameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        if (saveButton.isEnabled) {
            saveButton.alpha = 1.0
        }

    }
    
    func reload() {
        nameLabel.text = sharedUser.getFirstName()
        firstNameTextField.text = sharedUser.getFirstName()
        lastNameTextField.text = sharedUser.getLastName()
        heightTextField.text = String(sharedUser.getHeight())
        weightTextField.text = String(sharedUser.getWeight())
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        editButton.isEnabled = true
        editButton.alpha = 1.0
        saveButton.isEnabled = false
        saveButton.alpha = 0.5
        if let firstName = firstNameTextField.text {
            if firstName != "" {
                sharedUser.setFirstName(name: firstName)
            }
        }
        if let lastName = lastNameTextField.text {
            if lastName != "" {
                sharedUser.setLastName(name: lastName)
            }
        }
        if let height = heightTextField.text {
            if height != "" {
                sharedUser.setHeight(height: Float(height)!)
            }
        }
        if let weight = weightTextField.text {
            if weight != "" {
                sharedUser.setWeight(weight: Float(weight)!)
            }
        }
        SharingUser.sharedUser.saveUser()
        reload()
    }
    
    @IBAction func editAction(_ sender: Any) {
        editButton.isEnabled = false
        editButton.alpha = 0.5
        saveButton.isEnabled = true
        saveButton.alpha = 1
        
        firstNameTextField.isEnabled = true
        lastNameTextField.isEnabled = true
        heightTextField.isEnabled = true
        weightTextField.isEnabled = true
    }
    
}/// ProfileViewController

