//
//  AddEditTableViewController.swift
//  TableViewPractice
//
//  Created by Евгений Березенцев on 15.05.2021.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    
    var emoji: Emoji?
    
    init?(coder: NSCoder, emoji: Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var labelTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            labelTextField.text = emoji.label
            nameTextField.text = emoji.name
            navigationItem.title = "Edit Emoji"
        } else {
            navigationItem.title = "Add new Emoji"
        }
        
        updateSavebuttonState()
    }
    
    func updateSavebuttonState() {
        let label = labelTextField.text ?? ""
        let name = nameTextField.text ?? ""
        saveButton.isEnabled = !label.isEmpty && !name.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSavebuttonState()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "unwind" else { return }
        let label = labelTextField.text ?? ""
        let name = nameTextField.text ?? ""
        emoji = Emoji(label: label, name: name)
    }


    
    
    
    
    

}
