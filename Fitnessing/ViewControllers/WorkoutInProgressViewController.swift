//
//  WorkoutInProgressViewController.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-18.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class WorkoutInProgressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var sharedUser: User!
    var exercises: [Exercise]?
    var workout: Workout?
    
    var header = UILabel()
    var subtitle = UILabel()
    var editButton = UIButton()
    var timerLabel = UILabel()
    var timer = Timer()
    var time: Date?
    var startTime: Date?
    var runningTime: TimeInterval?
    
    @IBOutlet weak var tableView: UITableView!

    
//MARK: viewDidLoad
	override func viewDidLoad() {
        super.viewDidLoad()
        time = Date()
        startTime = Date()
        runningTime = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
                
        initializeUser()
        workout = sharedUser.getWorkoutCollection()[sharedUser.getCurrentIndex()]
        exercises = workout!.getExercises()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 365
        self.tableView.backgroundColor = .clear
        
        // Remove cell separators
        self.tableView!.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.title = workout?.getName()
        
        self.navigationController?.isNavigationBarHidden = false
        customizeNavBar()
        createBackground()
        createSubtitle()
        createEditWorkout()
        createTimer()
        
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 50).isActive = true
    }/// viewDidLoad
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises!.count
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
        let exercise = exercises![indexPath.row]
                
        cell!.backgroundColor = UIColor.clear
        cell!.num.text = String(indexPath.row + 1) + " of " + String(exercises!.count)
        cell!.titleLabel.text = exercise.getName()

        
        return cell!
    }/// cellForRowAt
    
    func initializeUser() {
           _ = SharingUser()
           sharedUser = SharingUser.sharedUser.user
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
	
    func createEditWorkout() {
        editButton.setTitle("Edit Workout", for: .normal)
        editButton.setTitleColor(UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: 1), for: .normal)
        editButton.frame = CGRect(x: 0, y: 0, width: 150, height: 16)
        editButton.titleLabel?.textAlignment = .right
        editButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        editButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        editButton.setImage(UIImage(named:"pencil-icon.png"), for: .normal)
        
        self.view.addSubview(editButton)
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.widthAnchor.constraint(equalToConstant: editButton.frame.width).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: editButton.frame.height).isActive = true
        editButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        editButton.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
    }
    
    func createTimer() {
        // Create Attachment
        formatLabel(label: timerLabel, text: "00:00", font: "Roboto-Regular", alpha: 1, width: 100, height: 20, fontSize: 16)
        timerLabel.textColor = UIColor(red: 0.583, green: 0.583, blue: 0.583, alpha: 1)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named:"grey-clock-icon.png")
        // Set bound to reposition
        let imageOffsetY: CGFloat = -5.0
        let imageOffsetX: CGFloat = -5.0

        imageAttachment.bounds = CGRect(x: imageOffsetX, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: "00:00:00")
        completeText.append(textAfterIcon)
        self.timerLabel.textAlignment = .center
        self.timerLabel.attributedText = completeText
        
        self.view.addSubview(timerLabel)
        
        defineConstraints(label: timerLabel, width: timerLabel.frame.width, height: timerLabel.frame.height, leadingConstant: 20, topConstant: 20, top: header.bottomAnchor, leading: self.view.leadingAnchor)
    }
    
// MARK: Button functions
    @objc func finishAction() {
        print("Clicked finish")
        workout?.setTimesCompleted(num: workout!.getTimesCompleted() + 1)
        workout?.setLastDateCompleted(date: Date())
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        formatter.unitsStyle = .positional
        
        print("Workout #: " + String(sharedUser.getCurrentIndex()))
        print("Total time BEFORE:" + formatter.string(from: (workout?.getTotalTime())!)!)
        workout?.setTotalTime(time: (workout?.getTotalTime())! + runningTime!)
        print("Total time AFTER:" + formatter.string(from: (sharedUser.getWorkoutCollection()[sharedUser.getCurrentIndex()].getTotalTime()))!)

        print("Avg time BEFORE:" + formatter.string(from: (workout?.getAvgTimeCompleted())!)!)
        workout?.setAvgTimeCompleted(time: (workout?.getTotalTime())!/Double((workout?.getTimesCompleted())!))
        print("Avg time AFTER:" + formatter.string(from: (workout?.getAvgTimeCompleted())!)!)

        sharedUser.setTotalHoursWorked(hours: sharedUser.getTotalHoursWorked() + Float(workout?.getTotalTime() ?? 0)/3600)
        
        var weightTotal = Float(0)
        for exercise in workout!.getExercises() {
            exercise.setWeightLifted(weight: exercise.getWeightLifted() + (Float(exercise.getNumReps() * exercise.getNumSets()) * exercise.getWeight()))
            weightTotal = weightTotal + exercise.getWeightLifted()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func editAction() {
        print("Clicked edit")
        let destinationController = self.storyboard!.instantiateViewController(withIdentifier: "create") as! CreateWorkoutViewController
        destinationController.title = "Edit Workout"
        destinationController.workout = self.workout!
        destinationController.exercises = self.exercises!
        destinationController.workoutTitle.text = self.workout!.getName()
        self.navigationController!.pushViewController(destinationController, animated: true)
    }
    
    @objc func timerAction() {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        formatter.unitsStyle = .positional
        
        // The amount of time which has past since we started
        let cal: Calendar = Calendar.current

        time = cal.date(byAdding: .second, value: 1, to: time!)!
        
        // How long have we been running for?
        runningTime = time!.timeIntervalSince(startTime!)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named:"grey-clock-icon.png")
        // Set bound to reposition
        let imageOffsetY: CGFloat = -5.0
        let imageOffsetX: CGFloat = -5.0

        imageAttachment.bounds = CGRect(x: imageOffsetX, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string:formatter.string(from: runningTime!)!)
        completeText.append(textAfterIcon)
        self.timerLabel.attributedText = completeText

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}/// WorkoutInProgressViewController
