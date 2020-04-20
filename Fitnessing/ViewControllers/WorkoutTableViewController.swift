//
//  WorkoutTableViewController.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-12.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit
import os.log

class WorkoutTableViewController: UITableViewController {
// MARK: Properties
    var sharedUser: User!
    var createButton = UIButton(type: .custom)
    var destinationController : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUser()
        createBackground()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 200
        
        self.navigationController?.isNavigationBarHidden = false
                
        // Remove cell separators
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        customizeNavBar()
        self.navigationItem.setRightBarButtonItems([self.editButtonItem, UIBarButtonItem(customView: createButton)], animated: true)
    }
    
    func initializeUser() {
        _ = SharingUser()
        sharedUser = SharingUser.sharedUser.user
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.reloadData()
    }
    
//    override func viewDidLayoutSubviews() {
//        createBackground()
//    }
    
// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedUser.getWorkoutCollection().count
    }
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "WorkoutTableViewCell"
                
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WorkoutTableViewCell  else {
            fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let workout = sharedUser.getWorkoutCollection()[indexPath.row]
                
        cell.startButtonLabel.tag = indexPath.row
        cell.startButtonLabel.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        cell.Background.layer.cornerRadius = 10
        cell.Background.layer.backgroundColor = UIColor.white.cgColor
        cell.backgroundColor = UIColor.clear
        cell.workoutTitle.text = workout.getName()
        
        let date = workout.getLastDateCompleted()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        let monthName = DateFormatter().monthSymbols[month - 1]
        
        cell.workoutDate.text = String(monthName) + " " + String(day) + ", " + String(year)
        cell.timesCompleted.text = String(workout.getTimesCompleted())
//
//        var i = 0
//        let fullBarHeight = CGFloat(96)
//        for exercise in workout!.exercises {
//            var percent = CGFloat(exercise.getWeightLifted()/5000)
//            if percent > 1 {
//                percent = 1
//            }
//            if i == 0 {
//                cell!.bar1.heightAnchor.constraint(equalToConstant: percent * fullBarHeight).isActive = true
//            } else if i == 1 {
//                cell!.bar2.heightAnchor.constraint(equalToConstant: percent * fullBarHeight).isActive = true
//            } else if i == 2 {
//                cell!.bar3.heightAnchor.constraint(equalToConstant: percent * fullBarHeight).isActive = true
//            } else if i == 3 {
//                cell!.bar4.heightAnchor.constraint(equalToConstant: percent * fullBarHeight).isActive = true
//            } else if i == 4 {
//                cell!.bar5.heightAnchor.constraint(equalToConstant: percent * fullBarHeight).isActive = true
//            }
//            i = i + 1
//        }
 
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            sharedUser.removeWorkout(workout: sharedUser.getWorkoutCollection()[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sharedUser.setCurrentIndex(index: indexPath.row)
    }
    

// MARK: Button functions
    @objc func backAction() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func createAction() {
        print("Clicked create")
        destinationController = self.storyboard!.instantiateViewController(withIdentifier: "create") as! CreateWorkoutViewController
        destinationController!.title = "New Workout"
        self.navigationController!.pushViewController(destinationController!, animated: true)
    }
    
    @objc func buttonAction(sender: UIButton) {
        sharedUser.setCurrentIndex(index: sender.tag)
        destinationController = self.storyboard!.instantiateViewController(withIdentifier: "inProgressWorkout") as! WorkoutInProgressViewController
        self.navigationController!.pushViewController(destinationController!, animated: true)
    }
    
// MARK: Create view functions
    func createBackground() {
        let background = UIView()
        background.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        background.backgroundColor = .white
        
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

        background.layer.insertSublayer(layer0, at: 0)
        self.tableView.backgroundView = background
    }
    
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
                
        // Back button
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "BackButton.png"), for: .normal)
        backbutton.addTarget(self, action: #selector(backAction), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
        // Create button
        createButton.setTitle("Create", for: .normal)
        createButton.addTarget(self, action: #selector(createAction), for: .touchUpInside)
        
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
