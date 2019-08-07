//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Rahul Nath on 6/8/19.
//  Copyright © 2019 Parvathy Thottathil. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
         print((FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")))
        
        loadCategories()
    }
    
   // Mark : - TableView DataSource methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let item = categoryArray[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    
  
   // Mark : - Add New Categories
  
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let textField = alert.textFields![0] as UITextField
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categoryArray.append(newCategory)
            self.saveCategories()()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new Category"
        }
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
    }
    
    
    // Mark : - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
//        itemArray[indexPath.row].done.toggle()
//
//        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // Mark : - Data Manipulation methods
    
    func saveCategories() {
        
        do {
            try context.save()
        } catch {
            print("Error in saving data\(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories(){
        
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
           categoryArray = try context.fetch(request)
        } catch {
            print("Error in reading data\(error)")
        }
        tableView.reloadData()
    }
    
    
}
