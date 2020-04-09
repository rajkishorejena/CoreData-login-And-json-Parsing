//
//  EmployeeTableViewCell.swift
//  FirstAsignment
//
//  Created by Jovial on 3/2/20.
//  Copyright © 2020 Rajkishore. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
     @IBOutlet weak var idLbl: UILabel!
     @IBOutlet weak var nameLbl: UILabel!
     @IBOutlet weak var salaryLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
