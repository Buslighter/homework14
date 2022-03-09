//
//  toDoRealmViewController.swift
//  hw14-data
//
//  Created by gleba on 28.02.2022.
//

import UIKit
import RealmSwift
class toDoRealmViewController: UIViewController {
    public var indexRow = 0
    var realm = try! Realm()
    var toDoList:Results<infoObj>{
        get{return realm.objects(infoObj.self)}
    }
    @IBAction func deleteAllTasks(_ sender: Any) {
        try! self.realm.write{
            realm.deleteAll()
        }
        indexRow=0
        tableView.reloadData()
        
    }
    var str = ""
    @IBOutlet weak var tableView: UITableView!
    @IBAction func addNew(_ sender: Any) {
        newNoteText.text = nil
        let items = infoObj()
        try! self.realm.write{
            items.stringData = str
            self.realm.add(items)
        }
        indexRow+=1
        tableView.reloadData()
        print(items)
    }
    
    public var stringInfo = infoObj()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func newNoteAct(_ sender: Any) {
        str = newNoteText.text!
    }
    @IBOutlet weak var newNoteText: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension toDoRealmViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TaskjTableViewCell
        let item = toDoList[indexPath.row]
        cell.textFieldOut!.text = item.stringData
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle==UITableViewCell.EditingStyle.delete){
//            items.remove(at: indexPath.row)
            let item = toDoList[indexPath.row]
            try!self.realm.write{
                self.realm.delete(item)
            }
            indexRow-=1
            tableView.reloadData()
        }
    }
    
}
