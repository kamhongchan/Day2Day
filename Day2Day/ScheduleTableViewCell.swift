//
//  ScheduleTableViewCell.swift
//  Day2Day
//
//  Created by Kam Hong Chan on 20/06/2018.
//  Copyright © 2018 Kam Hong Chan. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    @IBOutlet weak var seventLabel: UILabel!
    @IBOutlet weak var stimeLabel: UILabel!
    @IBOutlet weak var sdateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
