//
//  TaskjTableViewCell.swift
//  hw14-data
//
//  Created by gleba on 28.02.2022.
//

import UIKit
public protocol textDelegate{
    func textDel(_ textInfo: [String])
}

class TaskjTableViewCell: UITableViewCell {
    var delegate: textDelegate?
   
    @IBAction func textFieldAct(_ sender: Any) {
//        items.append(textFieldOut.text!)
//        delegate?.textDel(items)
    }
    @IBOutlet weak var textFieldOut: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
