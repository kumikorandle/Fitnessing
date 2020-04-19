//
//  WorkoutDetailViewController.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-17.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class WorkoutDetailViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var sharedUser: User!
    
    var exercises: [Exercise]?
    var workout: Workout?
    
    let header = UILabel()
    var exerciseLabel = UILabel()
    var completedRect = UIView()
    var liftedRect = UIView()
    var hoursRect = UIView()
    var avgRect = UIView()
    var startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        createRectangle(imgName: "circle-checked.png", rect: completedRect, topNeighbour: header.bottomAnchor, leadingNeighbour: self.view.leadingAnchor, subtitle: "workouts completed", text: "0")
        createRectangle(imgName: "weight-icon.png", rect: liftedRect, topNeighbour: header.bottomAnchor, leadingNeighbour: completedRect.trailingAnchor, subtitle: "weight lifted", text: "0 lbs")
        createRectangle(imgName: "date-icon.png", rect: hoursRect, topNeighbour: completedRect.bottomAnchor, leadingNeighbour: self.view.leadingAnchor, subtitle: "worked out", text: "0 hrs")
        createRectangle(imgName: "clock-icon.png", rect: avgRect, topNeighbour: liftedRect.bottomAnchor, leadingNeighbour: hoursRect.trailingAnchor, subtitle: "avg duration", text: "0 hr")
        createExerciseTitle()
        createStartButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sharedUser = SharingUser.sharedUser.user
    }
    
    func initializeUser() {
        _ = SharingUser()
        sharedUser = SharingUser.sharedUser.user
    }
    
    // MARK: Table functions
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
    }
    
    // MARK: Helper functions
    func formatLabel(label: UILabel, text: String, font: String, alpha: CGFloat, width: CGFloat, height: CGFloat, fontSize: CGFloat) {
         
         label.frame = CGRect(x: 0, y: 0, width: width, height: height)
         label.textColor = UIColor(red: 0.562, green: 0.562, blue: 0.562, alpha: alpha)
         label.font = UIFont(name: font, size: fontSize)
        label.textAlignment = .left
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
    
    func defineConstraints(view: UIView, width: CGFloat, height: CGFloat, leadingConstant: CGFloat, topConstant: CGFloat, top: NSLayoutAnchor<NSLayoutYAxisAnchor>, leading: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
         
         view.translatesAutoresizingMaskIntoConstraints = false
         view.widthAnchor.constraint(equalToConstant: width).isActive = true
         view.heightAnchor.constraint(equalToConstant: height).isActive = true
         view.leadingAnchor.constraint(equalTo: leading, constant: leadingConstant).isActive = true
         view.topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
    
     }/// defineConstraints
    
    // MARK: View functions
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
                
        let editButton = UIButton(type: .custom)
        editButton.setTitle("Edit", for: .normal)
        editButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: editButton), animated: true)
    }
    
    func createBackground() {
        header.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)!, width: self.view.frame.width, height: 325)
        header.backgroundColor = .white
        self.view.addSubview(header)

        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
          UIColor(red: 1, green: 0, blue: 0, alpha: 0.28).cgColor
        ]

        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))

        layer0.position = header.center
        layer0.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)!, width: self.view.frame.width, height: 325 - (self.navigationController?.navigationBar.frame.height)!)
        
        header.layer.insertSublayer(layer0, at: 0)
        defineConstraints(label: header, width: self.view.frame.width, height: header.frame.height, leadingConstant: 0, topConstant: -10, top: self.view.topAnchor, leading: self.view.leadingAnchor)
    }
    
    func createRectangle(imgName: String, rect: UIView, topNeighbour: NSLayoutYAxisAnchor, leadingNeighbour: NSLayoutXAxisAnchor, subtitle: String, text: String) {
        let img = UIImage(named: imgName)
        let subtitleLabel = UILabel()
        let textLabel = UILabel()
        
        formatLabel(label: textLabel, text: text, font: "Roboto-Bold", alpha: 1, width: 100, height: 20, fontSize: 16)
        formatLabel(label: subtitleLabel, text: subtitle, font: "Roboto-Regular", alpha: 1, width: 100, height: 20, fontSize: 16)
        
        let imgView = UIImageView(image: img)
        if (imgName == "weight-icon.png") {
            imgView.frame = CGRect(x: 0, y: 0, width: 24, height: 20)
        } else {
            imgView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        }
        
        rect.frame = CGRect(x: 0, y: 0, width: self.view.frame.width/2 - 30 , height: 72)
        rect.backgroundColor = .white
        
        rect.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        rect.layer.cornerRadius = 10
        rect.layer.borderWidth = 1
        rect.layer.borderColor = UIColor(red: 0.942, green: 0.942, blue: 0.942, alpha: 1).cgColor
        
        let parent = self.view!
        rect.addSubview(imgView)
        rect.addSubview(textLabel)
        rect.addSubview(subtitleLabel)
        parent.addSubview(rect)
        
        defineConstraints(view: rect, width: rect.frame.width, height: rect.frame.height, leadingConstant: (self.view.frame.width - (rect.frame.width * 2))/3 , topConstant: 10, top: topNeighbour, leading: leadingNeighbour)
        
        defineConstraints(view: imgView, width: imgView.frame.width, height: imgView.frame.height, leadingConstant: 15, topConstant: rect.frame.height/2 - imgView.frame.height/2, top: rect.topAnchor, leading: rect.leadingAnchor)
        
        defineConstraints(label: textLabel, width: textLabel.frame.width, height: textLabel.frame.height, leadingConstant: 10, topConstant: rect.frame.height/2 - (textLabel.frame.height + subtitleLabel.frame.height)/2, top: rect.topAnchor, leading: imgView.trailingAnchor)
        
        defineConstraints(label: subtitleLabel, width: subtitleLabel.frame.width, height: subtitleLabel.frame.height, leadingConstant: 10, topConstant: 0, top: textLabel.bottomAnchor, leading: imgView.trailingAnchor)
    }
    
    func createExerciseTitle() {
        formatLabel(label: exerciseLabel, text: "EXERCISES", font: "Roboto-Bold", alpha: 0.6, width: 100, height: 20, fontSize: 16)
        let parent = self.view!
        parent.addSubview(exerciseLabel)
        defineConstraints(label: exerciseLabel, width: exerciseLabel.frame.width, height: exerciseLabel.frame.height, leadingConstant: (self.view.frame.width - (hoursRect.frame.width * 2))/3, topConstant: 30, top: hoursRect.bottomAnchor, leading: self.view.leadingAnchor)
        
    }
    
    func createStartButton() {
        startButton.setTitle("START", for: .normal)
        startButton.backgroundColor = .white
        startButton.setTitleColor(.white, for: .normal)
        startButton.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        startButton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20)
        startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)

        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 1, green: 0.757, blue: 0.655, alpha: 1).cgColor,
          UIColor(red: 1, green: 0, blue: 0, alpha: 0.28).cgColor
        ]

        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)

        layer0.position = startButton.center
        layer0.frame = startButton.frame
        
        startButton.layer.insertSublayer(layer0, at: 0)
        self.view.addSubview(startButton)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.widthAnchor.constraint(equalToConstant: startButton.frame.width).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: startButton.frame.height).isActive = true
        startButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        startButton.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: Button Methods
    @objc func editAction() {
        print("Clicked edit")
        let dc : UIViewController?
        dc = self.storyboard!.instantiateViewController(withIdentifier: "create") as! CreateWorkoutViewController
        self.navigationController!.pushViewController(dc!, animated: true)
    }
    
    @objc func startAction() {
        print("Clicked start")
        let dc : UIViewController?
        dc = self.storyboard!.instantiateViewController(withIdentifier: "inProgressWorkout") as! WorkoutInProgressViewController
        self.navigationController!.pushViewController(dc!, animated: true)
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
