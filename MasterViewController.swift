//
//  MasterViewController.swift
//  Program3
//
//  Created by Sierra Goodman on 10/31/21.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var newFlag = false;
    
    var objects = [["name": "T R A P S O U L", "detail": "Bryson Tiller", "label": "Interscope", "year": "2015", "review": "review album"],["name": "Cheers to the Best Memories", "detail": "DVSN", "label": "Interscope", "year": "2015", "review": "review album"],["name": "Please Excuse Me for Being Antisocial", "detail": "Roddy Rich","label": "Atlantic", "year": "2020", "review": "review album"],["name": "Certified Lover Boy", "detail": "Drake", "label": "OVO", "year": "2021", "review": "review album"],["name": "Coloring Book", "detail": "Chance the Rapper", "label": "No label", "year": "2016", "review": "review album"]]
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    @IBAction func newPressed(_ sender: Any) {
        
    }
    
    @IBAction func editPressed(_ sender: UIButton) {
        tableView.isEditing = !tableView.isEditing
        if sender.currentTitle == "Edit" {
            sender.setTitle("Done Editing", for: .normal)
        } else{
            sender.setTitle("Edit", for: .normal)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let objectToBeMoved = objects[sourceIndexPath.row]
        objects.remove(at: sourceIndexPath.row)
        objects.insert(objectToBeMoved, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            objects.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = objects[indexPath.row]
        cell.textLabel!.text = object["name"]
        return cell
    
    }
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        print("unwind")
        //tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = (segue.destination as! DetailViewController)
        controller.masterViewController = self
        if segue.identifier == "ShowDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                controller.itemIndex = indexPath.row
            }
        } else {
            controller.itemIndex = 0
            objects.insert(["name": "new name", "detail": "new detail", "year": "new year", "label": "new label", "review": "new review"], at:0)
            newFlag = true
        }
    }

}
