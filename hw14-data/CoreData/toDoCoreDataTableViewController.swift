//
//  toDoCoreDataTableViewController.swift
//  hw14-data
//
//  Created by gleba on 04.03.2022.
//

import UIKit
import CoreData
class toDoCoreDataViewController: UIViewController {
    var newNote = ""
    var coreTasks = [RightEntity]()
    var isFirstLoad = true
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "RightEntity")
    
    
    
    @IBOutlet weak var newTextNote: UITextField!
    @IBOutlet weak var tableViewCD: UITableView!
    @IBAction func addNewCD(_ sender: Any) {
        let entity = NSEntityDescription.entity(forEntityName: "RightEntity", in: context)
        let newTask = RightEntity(entity: entity!, insertInto: context)
        newTask.item = newNote
        newTextNote.text = nil
        do{
            try context.save()
            coreTasks.append(newTask)
        } catch {
            print("save Error")
        }
        tableViewCD.reloadData()
    }
    @IBAction func deleteAllCD(_ sender: Any) {
        for task in coreTasks {
            self.context.delete(task)
        }
        do{
            try context.save()
        } catch {
            print("delete Error")
        }
        
        
        coreTasks.removeAll()
        tableViewCD.reloadData()
    }
    @IBAction func newTextInsert(_ sender: Any) {
        newNote = newTextNote.text!
    }
    
    override func viewDidLoad() {
        if (isFirstLoad) {
            isFirstLoad = false
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! RightEntity
                    coreTasks.append(note)
                }
            } catch{
                print("Fetch Error")
            }
        }
        super.viewDidLoad()
    }
    
}
extension toDoCoreDataViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coreCell", for: indexPath) as! CoreDataTableViewCell
        let item = self.coreTasks[indexPath.row]
        cell.coreText.text = item.item
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle==UITableViewCell.EditingStyle.delete){
            let item = self.coreTasks[indexPath.row]
            self.context.delete(item)
            do{
                try context.save()
            } catch {
                print("delete Error")
            }
            coreTasks.remove(at: indexPath.row)
            self.tableViewCD.reloadData()
        }
    }
    
    
}
