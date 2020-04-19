	//
//  FirstViewController.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-12.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit
import os.log

class HomeViewController: UIViewController {
	
// MARK: Property Initialization
    var sharedUser: User!
    var sharedExerciseCollection: ExerciseCollection!
    
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
    var workoutButton = UIButton()
    var workoutsTableView : UITableView!
    
    // Subtitle strings
    let workoutsSubtitle = "workouts\ncompleted"
    let weightSubtitle = "current\nweight"
    let hoursSubtitle = "worked\nout"
    let myWorkoutsSubtitle = "MY WORKOUTS"
    let prevSubtitle = "Previous Workout"
    
    var workoutTitleSubtitle = "No workouts completed yet..."
    var exercisesSubtitle = ""
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
        let boxSize = self.view.frame.width/3 - 30
        super.viewDidLoad()
        initializeExerciseCollection()
        initializeUser()
                
        createBackground()
        createTitle(name: sharedUser.getFirstName())
        createLine(line: line1, topNeighbour: nameLabel)
        
        createBox(box: box1, neighbour: nil, text:workoutsSubtitle, label: workoutsCompleted, numLabel: numWorkouts, num: String(sharedUser.getNumWorkoutsCompleted()), height: boxSize, width: boxSize, topNeighbour: line1)
        
        createBox(box: box2, neighbour: box1, text:weightSubtitle, label:currentWeight, numLabel: weight, num:String(sharedUser.getWeight()) + " lbs", height: boxSize, width: boxSize, topNeighbour: line1)
        
        createBox(box: box3, neighbour: box2, text:hoursSubtitle, label:hoursWorked, numLabel: workouts, num: String(sharedUser.getTotalHoursWorked()) + " hrs", height: boxSize, width: boxSize, topNeighbour: line1)
        
		createLine(line: line2, topNeighbour: box1)
        createPreviousWorkout()
        createLine(line: line3, topNeighbour: prevWorkoutButton)
        createWorkouts()
   
	}/// viewDidLoad
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        let boxSize = self.view.frame.width/3 - 30

        createBackground()
        createTitle(name: sharedUser.getFirstName())
        createLine(line: line1, topNeighbour: nameLabel)
        
        createBox(box: box1, neighbour: nil, text:workoutsSubtitle, label: workoutsCompleted, numLabel: numWorkouts, num: String(sharedUser.getNumWorkoutsCompleted()), height: boxSize, width: boxSize, topNeighbour: line1)
        
        createBox(box: box2, neighbour: box1, text:weightSubtitle, label:currentWeight, numLabel: weight, num:String(sharedUser.getWeight()) + " lbs", height: boxSize, width: boxSize, topNeighbour: line1)
        
        createBox(box: box3, neighbour: box2, text:hoursSubtitle, label:hoursWorked, numLabel: workouts, num: String(sharedUser.getTotalHoursWorked()) + " hrs", height: boxSize, width: boxSize, topNeighbour: line1)
        
        createLine(line: line2, topNeighbour: box1)
        createPreviousWorkout()
        createLine(line: line3, topNeighbour: prevWorkoutButton)
        createWorkouts()
    }
	
    func initializeUser() {
        _ = SharingUser()
        
        SharingUser.sharedUser.loadUser() // un-archive data
        
        if (SharingUser.sharedUser.user == nil) {
            SharingUser.sharedUser.user = User(firstName: "Name", lastName: "Name", heightCM: 0, weightLBS: 0, totalHoursWorked: 0, totalWeightLifted: 0, workoutCollection: createUserWorkoutCollection())
        }
        
        sharedUser = SharingUser.sharedUser.user
    }
    
    func initializeExerciseCollection() {
        _ = SharingExerciseCollection()
        
        SharingExerciseCollection.sharedExerciseCollection.loadExerciseCollection() // un-archive data
        
        if (SharingExerciseCollection.sharedExerciseCollection.exerciseCollection == nil) {
            SharingExerciseCollection.sharedExerciseCollection.exerciseCollection = ExerciseCollection()
        }
        
        sharedExerciseCollection = SharingExerciseCollection.sharedExerciseCollection.exerciseCollection
    }
    
    // Random workout collection data for testing
    func createUserWorkoutCollection() -> [Workout]{
        var workouts = [Workout]()
        var legExercises = [Exercise]()
        var fullBody = [Exercise]()
        
        legExercises.append(sharedExerciseCollection.getExercise(name: "Squat")!)
        legExercises.append(sharedExerciseCollection.getExercise(name: "Lunge")!)
        legExercises.append(sharedExerciseCollection.getExercise(name: "Hip Thrusts")!)
        legExercises.append(sharedExerciseCollection.getExercise(name: "Deadlift")!)
        
        fullBody.append(sharedExerciseCollection.getExercise(name: "Squat")!)
        fullBody.append(sharedExerciseCollection.getExercise(name: "Pushup")!)
        fullBody.append(sharedExerciseCollection.getExercise(name: "Bench Press")!)
        fullBody.append(sharedExerciseCollection.getExercise(name: "Bicep Curl")!)
        
        for exercise in fullBody {
            exercise.setNumReps(reps: 10)
            exercise.setNumSets(sets: 3)
            exercise.setWeight(weight: 20)
        }
        
        for exercise in legExercises {
            exercise.setNumReps(reps: 10)
            exercise.setNumSets(sets: 4)
            exercise.setWeight(weight: 200)
        }
        
        
        let legWorkout = Workout(name: "Legs", exercises: legExercises, dateCreated: Date(), lastDateCompleted: nil, timesCompleted: 0)
        let fullBodyWorkout = Workout(name: "Full Body", exercises: fullBody, dateCreated: Date(), lastDateCompleted: nil, timesCompleted: 0)
        
        workouts.append(legWorkout)
        workouts.append(fullBodyWorkout)
        
        return workouts
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
        defineConstraints(label: nameLabel, width: welcomeLabel.frame.width, height: welcomeLabel.frame.height, leadingConstant: 36, topConstant: 5, top: welcomeLabel.bottomAnchor, leading: self.view.leadingAnchor)
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
    
    func createBox(box: UIView, neighbour: UIView?, text: String, label: UILabel, numLabel: UILabel, num: String, height: CGFloat, width: CGFloat, topNeighbour: UIView) {
        box.frame = CGRect(x: 0, y: 0, width: width, height: height)
        box.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.35).cgColor
        box.layer.cornerRadius = 20
        
        formatLabel(label: label, text: text, font: "Roboto-Regular", alpha: 1, width: box.frame.width, height: 60, fontSize: 20)
        formatLabel(label: numLabel, text: num, font: "Roboto-Bold", alpha: 1, width: box.frame.width, height: 60, fontSize: 24)
        
        box.addSubview(numLabel)
        box.addSubview(label)
        self.view.addSubview(box)

        numLabel.translatesAutoresizingMaskIntoConstraints = false
        numLabel.centerXAnchor.constraint(equalTo: box.centerXAnchor).isActive = true
        numLabel.topAnchor.constraint(equalTo: box.topAnchor, constant: 15).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: box.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: 1).isActive = true

        box.translatesAutoresizingMaskIntoConstraints = false
        box.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        box.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        box.topAnchor.constraint(equalTo: topNeighbour.bottomAnchor, constant: 30).isActive = true
        if (neighbour != nil) {
            box.leadingAnchor.constraint(equalTo: neighbour!.trailingAnchor, constant: 15).isActive = true
        } else {
            box.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 36).isActive = true
        }
    }/// createBox
    
    func createPreviousWorkout() {
        prevWorkoutButton.frame = CGRect(x: 0, y:0, width: self.view.frame.width - 60, height: 145)
        prevWorkoutButton.addTarget(self, action: #selector(previousWorkoutSelected), for: .touchUpInside)
        
        if (sharedUser.getWorkoutCollection().count > 0) {
            let workout = sharedUser.getWorkoutCollection()[sharedUser.getPreviousWorkout()]
            workoutTitleSubtitle = workout.getName()
            exercisesSubtitle = String(workout.getExercises().count) + " exercises completed"
            
            let date = workout.getLastDateCompleted()
            let calendar = Calendar.current
            let calDay = calendar.component(.hour, from: date)
            let mon = calendar.component(.month, from: date)
            
            let monthName = DateFormatter().monthSymbols[mon - 1]
            monthString = monthName
            dayString = String(calDay)
        }
        createBox(box: dateBox, neighbour: nil, text:monthString, label:month, numLabel:day, num: dayString, height: 90, width: 70, topNeighbour: line2)
        
        formatLabel(label: prevWorkout, text: prevSubtitle, font: "Roboto-Regular", alpha: 0.7, width: 142, height: 21, fontSize: 18)
        formatLabel(label: workoutTitle, text: workoutTitleSubtitle, font: "Roboto-Bold", alpha: 1, width: 221, height: 28, fontSize: 24)
        workoutTitle.textAlignment = .left
        formatLabel(label: exercises, text: exercisesSubtitle, font: "Roboto-Regular", alpha: 1, width: 180, height: 21, fontSize: 18)
        
        arrow.frame = CGRect(x: 0, y: 0, width: 10, height: 12)
        arrow.image = UIImage(named: "Arrow.png")
        
        let parent = self.view!

        parent.addSubview(exercises)
        parent.addSubview(prevWorkout)
        parent.addSubview(workoutTitle)
        parent.addSubview(arrow)
        parent.addSubview(prevWorkoutButton)

        prevWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        prevWorkoutButton.widthAnchor.constraint(equalToConstant: prevWorkoutButton.frame.width).isActive = true
        prevWorkoutButton.heightAnchor.constraint(equalToConstant: prevWorkoutButton.frame.height).isActive = true
        prevWorkoutButton.topAnchor.constraint(equalTo: line2.topAnchor, constant: 1).isActive = true
        prevWorkoutButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 35).isActive = true
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.widthAnchor.constraint(equalToConstant: 10).isActive = true
        arrow.heightAnchor.constraint(equalToConstant: 12).isActive = true
        arrow.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -32).isActive = true
        arrow.topAnchor.constraint(equalTo: prevWorkout.bottomAnchor, constant: 10).isActive = true
        
        defineConstraints(label: exercises, width: exercises.frame.width, height: exercises.frame.height, leadingConstant: 20, topConstant: 1, top: workoutTitle.bottomAnchor, leading: dateBox.trailingAnchor)
        defineConstraints(label: workoutTitle, width: workoutTitle.frame.width, height: workoutTitle.frame.height, leadingConstant: 20, topConstant: 1, top: prevWorkout.bottomAnchor, leading: dateBox.trailingAnchor)
        defineConstraints(label: prevWorkout, width: prevWorkout.frame.width, height: workoutTitle.frame.height, leadingConstant: 20, topConstant: 30, top: line2.topAnchor, leading: dateBox.trailingAnchor)
    }/// createPreviousWorkout
    
    func createWorkouts() {
        formatLabel(label: myWorkoutsLabel, text: myWorkoutsSubtitle, font: "Roboto-Bold", alpha: 0.7, width: 143, height: 23, fontSize: 20)

        showAll.frame = CGRect(x: 0, y: 0, width: 79, height: 23)
        showAll.titleLabel!.font = UIFont(name: "Roboto-Bold", size: 20)
        showAll.setTitle(showAllButton, for: .normal)
        showAll.setTitleColor(.white, for: .normal)
        showAll.addTarget(self, action: #selector(showAllButtonSelected), for: .touchUpInside)

        let parent = self.view!

        parent.addSubview(myWorkoutsLabel)
        parent.addSubview(showAll)

        showAll.translatesAutoresizingMaskIntoConstraints = false
        showAll.widthAnchor.constraint(equalToConstant: showAll.frame.width).isActive = true
        showAll.heightAnchor.constraint(equalToConstant: showAll.frame.height).isActive = true
        showAll.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -30).isActive = true
        showAll.topAnchor.constraint(equalTo: line3.topAnchor, constant: 30).isActive = true

        defineConstraints(label: myWorkoutsLabel, width: myWorkoutsLabel.frame.width, height: myWorkoutsLabel.frame.height, leadingConstant: 35, topConstant: 30, top: line3.topAnchor, leading: parent.leadingAnchor)
        
        createExercise()
    }/// createWorkouts
    
    
    func createExercise() {
        workoutButton.frame = CGRect(x: 0, y:0, width: self.view.frame.width - 60, height: 190)
        workoutButton.layer.cornerRadius = 20
        workoutButton.addTarget(self, action: #selector(workoutSelected), for: .touchUpInside)
        
        exerciseBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 60, height: 190)
        exerciseBox.backgroundColor = .white
        exerciseBox.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        exerciseBox.layer.cornerRadius = 20

        let parent = self.view!

        formatLabel(label: firstWorkoutTitle, text: sharedUser.getWorkoutCollection()[0].getName(), font: "Roboto-Bold", alpha: 1, width: 155, height: 28, fontSize: 24)
        firstWorkoutTitle.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 1)
        firstWorkoutTitle.textAlignment = .left

        let date = sharedUser.getWorkoutCollection()[0].getLastDateCompleted()
        let calendar = Calendar.current
        let day = calendar.component(.hour, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        let monthName = DateFormatter().monthSymbols[month - 1]
        
        workoutDateSubtitle = String(monthName) + " " + String(day) + ", " + String(year)
        
        formatLabel(label: workoutDate, text: workoutDateSubtitle, font: "Roboto-Regular", alpha: 0.7, width: 200, height: 21, fontSize: 18)
        workoutDate.textColor = UIColor(red: 1, green: 0.604, blue: 0.576, alpha: 0.7)
        workoutDate.sizeToFit()
        workoutDate.textAlignment = .left
        
        exerciseBox.addSubview(workoutDate)
        exerciseBox.addSubview(firstWorkoutTitle)
        parent.addSubview(exerciseBox)
        parent.addSubview(workoutButton)
                
        defineConstraints(label: firstWorkoutTitle, width: firstWorkoutTitle.frame.width, height: firstWorkoutTitle.frame.height, leadingConstant: 20, topConstant: 20, top: exerciseBox.topAnchor, leading: exerciseBox.leadingAnchor)
        defineConstraints(label: workoutDate, width: workoutDate.frame.width, height: workoutDate.frame.height, leadingConstant: 20, topConstant: 1, top: firstWorkoutTitle.bottomAnchor, leading: exerciseBox.leadingAnchor)
        
        workoutButton.translatesAutoresizingMaskIntoConstraints = false
        workoutButton.widthAnchor.constraint(equalToConstant: workoutButton.frame.width).isActive = true
        workoutButton.heightAnchor.constraint(equalToConstant: workoutButton.frame.height).isActive = true
        workoutButton.leadingAnchor.constraint(equalTo: exerciseBox.leadingAnchor, constant: 0).isActive = true
        workoutButton.topAnchor.constraint(equalTo: exerciseBox.topAnchor, constant: 0).isActive = true
        
        exerciseBox.translatesAutoresizingMaskIntoConstraints = false
        exerciseBox.widthAnchor.constraint(equalToConstant: exerciseBox.frame.width).isActive = true
        exerciseBox.heightAnchor.constraint(equalToConstant: exerciseBox.frame.height).isActive = true
        exerciseBox.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 32).isActive = true
        exerciseBox.topAnchor.constraint(equalTo: myWorkoutsLabel.bottomAnchor, constant: 15).isActive = true
   
	}/// createExercise
    
    
// MARK: Button Actions
    @objc func previousWorkoutSelected() {
        print("Clicked previous workout")
        let dc = self.storyboard!.instantiateViewController(withIdentifier: "workoutDetails") as! WorkoutDetailViewController
        sharedUser.setCurrentIndex(index: sharedUser.getPreviousWorkout())
        self.navigationController!.pushViewController(dc, animated: true)
		
    }/// previousWorkoutSelected
    
    @objc func showAllButtonSelected() {
		print("Clicked show all")
        destinationController = self.storyboard!.instantiateViewController(withIdentifier: "workouts") as! WorkoutTableViewController
        self.navigationController!.pushViewController(destinationController!, animated: true)
    
	}/// showAllButtonSelected
    
    @objc func workoutSelected() {
        print("Clicked workout")
        let dc = self.storyboard!.instantiateViewController(withIdentifier: "workoutDetails") as! WorkoutDetailViewController 
        sharedUser.setCurrentIndex(index: 0)
        self.navigationController!.pushViewController(dc, animated: true)
    }/// workoutSelected


} /// HomeViewController
