//
//  MyContactsTableViewCell.swift
//  ContactList
//
//  Created by student on 5/28/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class MyContactsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    
    func SetLabel (type: Array<String>) {
        self.NameLabel!.text = type[0]
        self.EmailLabel!.text = type[1]
    
    }
}
