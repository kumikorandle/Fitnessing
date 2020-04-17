//
//  WorkoutTableViewController.swift
//  Fitnessing
//
//  Created by Kumiko Randle on 2020-04-12.
//  Copyright © 2020 Kumiko Randle. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    // MARK: Properties
    //let workouts = [Workout?]()
    let workouts = [1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = false
        customizeNavBar()
        
        self.tableView.rowHeight = 200;
        
        // Remove cell separators
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func addWorkoutsForTesting() {
        
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        createBackground()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "WorkoutTableViewCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WorkoutTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? WorkoutTableViewCell
        }
        
        // Fetches the appropriate meal for the data source layout.
        let workout = workouts[indexPath.row]
                
        cell!.Background.layer.cornerRadius = 10
        cell!.Background.layer.backgroundColor = UIColor.white.cgColor
        cell!.backgroundColor = UIColor.clear
        
        //cell.layer.cornerRadius = 8
        //cell.layer.masksToBounds = true
        
        return cell!
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
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    // MARK: Button functions
    @objc func backAction() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.popViewController(animated: true)
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
        self.tableView.insertSubview(background, at: 0)
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
                
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "BackButton.png"), for: .normal)
        backbutton.addTarget(self, action: #selector(backAction), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
