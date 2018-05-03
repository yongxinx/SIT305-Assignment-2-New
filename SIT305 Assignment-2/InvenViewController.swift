//
//  InvenViewController.swift
//  SIT305 Assignment-2
//
//  Created by Manko on 2018/5/1.
//  Copyright © 2018年 NICK XIE. All rights reserved.
//

import UIKit

class InvenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableVIew: UITableView!
    
    var inventory = [String]()
//    var invenName = [String]()
//    var invenQty = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON() {
            self.tableVIew.reloadData()
            
        }

        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = inventory[indexPath.row].capitalized
        cell.detailTextLabel?.text = inventory[indexPath.row].capitalized
        return cell

    }
    
    
    func downloadJSON(completed: @escaping () -> ()) {
        
        if let path = Bundle.main.path(forResource: "inventory", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, Any> {
                    if let inventory = jsonResult["inventory"] as? [[String:Any]] {
//                        if let invenName = inventory["name"] as? [String:Any], let invenQty = inventory["qty"] as? [String:Any] {
//                            print(invenName)
//                            print(invenQty)
//
//                        }
print(inventory)
                    }
                }
            } catch {
                print("Error!")
            }
        }
        
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


