//
//  HolidayTableViewCell.swift
//  Day2Day
//
//  Created by Kam Hong Chan on 19/06/2018.
//  Copyright © 2018 Kam Hong Chan. All rights reserved.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
