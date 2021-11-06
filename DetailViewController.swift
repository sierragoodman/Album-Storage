//
//  DetailViewController.swift
//  Program3
//
//  Created by Sierra Goodman on 10/31/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var masterViewController: MasterViewController!
    var itemIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameField.text = masterViewController.objects[itemIndex]["name"]
        detailField.text = masterViewController.objects[itemIndex]["detail"]
        labelField.text = masterViewController.objects[itemIndex]["label"]
        yearField.text = masterViewController.objects[itemIndex]["year"]
       reviewField.text = masterViewController.objects[itemIndex]["review"]
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        if masterViewController.newFlag {
            masterViewController.objects.remove(at: itemIndex)
            masterViewController.tableView.reloadData()
            masterViewController.newFlag = false
        }
    }
    @IBAction func savePressed2(_ sender: Any) {
        print("save pressed")
        masterViewController.objects[itemIndex]["name"] = nameField.text
        masterViewController.objects[itemIndex]["detail"] = detailField.text
        masterViewController.objects[itemIndex]["label"] = labelField.text
        masterViewController.objects[itemIndex]["year"] = yearField.text
        masterViewController.objects[itemIndex]["review"] = reviewField.text

        masterViewController.tableView.reloadData()
    }
    
 
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var detailField: UITextField!
    
    @IBOutlet weak var labelField: UITextField!
    
    @IBOutlet weak var yearField: UITextField!
    
    @IBOutlet weak var reviewField: UITextField!
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
