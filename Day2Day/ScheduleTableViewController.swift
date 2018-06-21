//
//  ScheduleTableViewController.swift
//  Day2Day
//
//  Created by Kam Hong Chan on 20/06/2018.
//  Copyright © 2018 Kam Hong Chan. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
   
    var schedules = [Schedule]()
    
    @IBAction func goBackToScheduleTable(segue: UIStoryboardSegue) {
        let controller = segue.source as? EditScheduleTableViewController
        
        if  let schedule = controller?.schedule {
            if let row = tableView.indexPathForSelectedRow?.row {
                schedules[row] = schedule
            } else {
                schedules.insert(schedule, at: 0)
            }
            Schedule.saveToFile(schedules: schedules)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let schedules = Schedule.readSchedulesFromFile() {
            self.schedules = schedules
        }
        
         print("error")
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
        return schedules.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell

        // Configure the cell...
        let schedule = schedules[indexPath.row]
        cell.seventLabel.text = schedule.event
        cell.sdateLabel.text = schedule.date
        cell.stimeLabel.text = schedule.time
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        schedules.remove(at: indexPath.row)
        Schedule.saveToFile(schedules: schedules)
        tableView.reloadData()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let row = tableView.indexPathForSelectedRow?.row {
            let schedule = schedules[row]
            let controller = segue.destination as? EditScheduleTableViewController
            controller?.schedule =  schedule
        }
    }
    

}
