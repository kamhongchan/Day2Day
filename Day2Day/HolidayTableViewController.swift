//
//  HolidayTableViewController.swift
//  Day2Day
//
//  Created by Kam Hong Chan on 19/06/2018.
//  Copyright © 2018 Kam Hong Chan. All rights reserved.
//

import UIKit

class HolidayTableViewController: UITableViewController {
  
    var holidays = [HolidayResults]()
    var holidaydate = [String]()
    var holidayevent = [String]()
    var row :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    
        if let urlStr = "https://drive.ntou.edu.tw/STgj/document.json?a=r11a0Y6l-4M&dl=1&ht=NTA0ODhkZjMyOTZkNWI3OTFhMWVkZGI0NjA1ZjIxYTA=".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data, let holidayResults = try?decoder.decode(HolidayResults.self, from: data)
                {
                    for Holiday in holidayResults.results {
                         print("error")
                        let holidaydate = self.holidaydate.append(Holiday.date)
                        let holidayevent = self.holidayevent.append(Holiday.name)
                    }
                } else {
                    print("error")
                }
            }
            task.resume()
        }
        
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
        /*if holidaydate.count > 0
        {
            return holidaydate.count
        }
        else{
             return 1
        }*/
        return 17
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "holidaycell", for: indexPath) as! HolidayTableViewCell
       // if holidaydate.count > 0
        //{
            cell.dateLabel.text = holidaydate[indexPath.row]
            cell.eventLabel.text = holidayevent[indexPath.row]
        //}
        //else{
            
        //}
        return cell
    }


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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}


