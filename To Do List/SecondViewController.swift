//
//  SecondViewController.swift
//  To Do List
//
//  Created by Christopher on 10/24/15.
//  Copyright © 2015 Idea360. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addButton(sender: AnyObject) {
        
        if let item: String = textField.text {
            if(item.characters.count > 1){
                toDoList.append(item)
                NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
                textField.text = ""
            } else {
                errorMessage("Note title cannot be blank")
            }
        }
        else {
            errorMessage("Failed to add note.")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func errorMessage(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}

