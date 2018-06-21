//
//  EditScheduleTableViewController.swift
//  Day2Day
//
//  Created by Kam Hong Chan on 20/06/2018.
//  Copyright © 2018 Kam Hong Chan. All rights reserved.
//

import UIKit

class EditScheduleTableViewController: UITableViewController {
    
    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    
    var schedule: Schedule?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let schedule = schedule {
            eventTextField.text = schedule.event
            dateTextField.text = schedule.date
            timeTextField.text = schedule.time
            positionTextField.text = schedule.position
            memoTextField.text = schedule.memo
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    @IBAction func AddNew(_ sender: Any) {
         if eventTextField.text?.count == 0 {
            let alertController = UIAlertController(title: "請輸入事件名稱", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        if dateTextField.text?.count == 0 {
            let alertController = UIAlertController(title: "請輸入日期", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        if timeTextField.text?.count == 0 {
            let alertController = UIAlertController(title: "請輸入時間", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        performSegue(withIdentifier: "goBackToScheduleTable", sender: nil)
    }
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if schedule == nil {
            schedule = Schedule(event:eventTextField.text!,date:dateTextField.text!,time:timeTextField.text!,position:positionTextField.text!,memo:memoTextField.text!)
        } else {
            schedule?.event = eventTextField.text!
            schedule?.date = dateTextField.text!
            schedule?.time = timeTextField.text!
            schedule?.position = positionTextField.text!
            schedule?.memo = memoTextField.text!
        }
    }
    

}
