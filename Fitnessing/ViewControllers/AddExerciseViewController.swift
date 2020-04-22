//
//  WorkoutInProgressViewController.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class AddExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: Properties
    var sharedUser: User!
    var exerciseCollection: ExerciseCollection! = ExerciseCollection() // New exercise collection to get exercises for workout
    var exercises: [Exercise]! // Array of exercises to choose from
    var selectedExercises = [Exercise]() // Exercises to add to workout
    
    // Constants
    // View elements
    let finishButton = UIButton(type: .custom)
    let detailButton = UIButton(type: .custom)
    
    var header = UILabel()
    var subtitle = UILabel()
    var editButton = UIButton()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUser()
        
        self.title = "Add Exercises"
                
        exercises = exerciseCollection.getCollection() // Initialize exercise collection
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
                
        self.tableView.rowHeight = 100
        self.tableView.backgroundColor = .clear
        
        // Remove cell separators
        self.tableView!.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.navigationController?.isNavigationBarHidden = false
        customizeNavBar()
        createBackground()
        
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
    }/// viewDidLoad
    
    func initializeUser() {
           _ = SharingUser()
           sharedUser = SharingUser.sharedUser.user
    }
    
    // MARK: TableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "AddExerciseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AddExerciseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of AddExerciseTableViewCell.")
        }
                
        // Fetches the appropriate exercise for the data source layout.
        let exercise = exercises![indexPath.row]

        cell.backgroundColor = UIColor.clear
        cell.exerciseName.text = exercise.getName()
        
        var i = 1
        // Adds label for muscles involved in exercise to cell
        for muscle in exercise.getMusclesWorked() {
            if i == 1 { // First label
                formatLabel(label: cell.muscleOne, muscle: muscle)
            } else if i == 2 { // Second label, etc.
                formatLabel(label: cell.muscleTwo, muscle: muscle)
            } else if i == 3 {
                formatLabel(label: cell.muscleThree, muscle: muscle)
            } else if i == 4 {
                formatLabel(label: cell.muscleFour, muscle: muscle)
            } else if i == 5 {
                formatLabel(label: cell.muscleFive, muscle: muscle)
            } else if i == 6 {
                formatLabel(label: cell.muscleSix, muscle: muscle)
            }
            i = i + 1
        }
        
        if i == 2 { // Remaining 5 unset labels hidden (each exercise has at least 1 muscle group)
            cell.muscleTwo.isHidden = true
            cell.muscleThree.isHidden = true
            cell.muscleFour.isHidden = true
            cell.muscleFive.isHidden = true
            cell.muscleSix.isHidden = true
        } else if i == 3 { // Remaining 4 unset labels hidden
            cell.muscleTwo.isHidden = false
            cell.muscleThree.isHidden = true
            cell.muscleFour.isHidden = true
            cell.muscleFive.isHidden = true
            cell.muscleSix.isHidden = true
        } else if i == 4 { // Remaining 3 unset labels hidden
            cell.muscleTwo.isHidden = false
            cell.muscleThree.isHidden = false
            cell.muscleFour.isHidden = true
            cell.muscleFive.isHidden = true
            cell.muscleSix.isHidden = true
        } else if i == 5 { // Remaining 2 unset labels hidden
            cell.muscleTwo.isHidden = false
            cell.muscleThree.isHidden = false
            cell.muscleFour.isHidden = false
            cell.muscleFive.isHidden = true
            cell.muscleSix.isHidden = true
        } else if i == 6 { // Remaining 1 unset label hidden
            cell.muscleTwo.isHidden = false
            cell.muscleThree.isHidden = false
            cell.muscleFour.isHidden = false
            cell.muscleFive.isHidden = false
            cell.muscleSix.isHidden = true
        }
        
        return cell
    }/// cellForRowAt

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AddExerciseTableViewCell
        cell.addIcon.image = UIImage(named: "added-icon.png")
        cell.background.backgroundColor = UIColor(red: 1, green: 0.969, blue: 0.965, alpha: 1)
        selectedExercises.append(exercises[indexPath.row]) // Add exercise to exercises to be added to workout
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AddExerciseTableViewCell
        cell.addIcon.image = UIImage(named:"add-icon.png")
        cell.addIcon.contentMode = .scaleAspectFit
        cell.background.backgroundColor = .white
        
        // Remove first occurence of deselected exercise from selected exercises
        if let index = selectedExercises.firstIndex(of: exercises[indexPath.row]) {
            selectedExercises.remove(at: index)
        }
    }
    
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
    
    func formatLabel(label: UILabel, muscle: String) {
        label.text = muscle
        label.sizeToFit()
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
    }
    
// MARK: View functions
      func createBackground() {
          header.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
          header.backgroundColor = .white
          self.view.addSubview(header)

          let layer0 = CAGradientLayer()
          layer0.colors = [
            UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
            UIColor(red: 1, green: 0, blue: 0, alpha: 0.28).cgColor
          ]

        layer0.locations = [0, 1, 2]
          layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
          layer0.endPoint = CGPoint(x: 0.75, y: 0.5)

          layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))

          layer0.position = header.center
        layer0.frame = header.frame
          
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
                
        finishButton.setTitle("Add Selected", for: .normal)
        finishButton.addTarget(self, action: #selector(finishAction), for: .touchUpInside)
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: finishButton), animated: true) // Adds button to nav bar
    }/// customizeNavBar
    
    func createSubtitle() {
        formatLabel(label: subtitle, text: "In Progress", font: "Roboto-Bold", alpha: 0.8, width: 100, height: 25, fontSize: 16)
        self.view.addSubview(subtitle)
        defineConstraints(label: subtitle, width: subtitle.frame.width, height: subtitle.frame.height, leadingConstant: 10, topConstant: 140, top: self.view.topAnchor, leading: self.view.leadingAnchor)
    }/// createSubtitle
    
// MARK: Button functions
    @objc func finishAction() {
        print("Clicked add selected")
        
        _ = self.navigationController?.popViewController(animated: true) // Return to previous controller
        let previousViewController = self.navigationController?.viewControllers.last as! CreateWorkoutViewController
        
        for exercise in self.selectedExercises {
            previousViewController.exercises.append(exercise) // Add selected exercises to workout

        }
        sharedUser.setTempExercises(exercises: previousViewController.exercises)
        previousViewController.tableView.reloadData() // Reload data in edit/create workout table
        
    }
}/// WorkoutInProgressViewController
