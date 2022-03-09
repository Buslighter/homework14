//
//  ViewController.swift
//  hw14-data
//
//  Created by gleba on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextfield: UITextField!
    @IBAction func bottomTextAction(_ sender: Any) {
        Persistance.sharedTx1.text1 = bottomTextfield.text
        Persistance.sharedTx1.mark = true
    }
    @IBAction func topTextAction(_ sender: Any) {
        Persistance.sharedTx1.text2 = topTextField.text
        Persistance.sharedTx1.mark = true
    }
    override func viewDidLoad() {

        super.viewDidLoad()
        bottomTextfield.layer.borderColor = UIColor.black.cgColor
        bottomTextfield.layer.borderWidth = 1.0
        if Persistance.sharedTx1.mark==true{
            bottomTextfield.text = Persistance.sharedTx1.text1
            topTextField.text = Persistance.sharedTx1.text2
        }
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }


}

