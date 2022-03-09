//
//  CoreDataTableViewCell.swift
//  hw14-data
//
//  Created by gleba on 07.03.2022.
//

import UIKit

class CoreDataTableViewCell: UITableViewCell {

    @IBOutlet weak var coreText: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func coreTextAction(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
