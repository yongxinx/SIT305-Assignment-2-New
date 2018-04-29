//
//  ViewController.swift
//  SIT305 Assignment-2
//
//  Created by NICK XIE on 3/4/18.
//  Copyright © 2018 NICK XIE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "item", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let item = jsonResult["item"] as? [Any] {
                    print(item)
                }
            } catch {
                // handle error
            }
        }
        
      
//        let path = Bundle.main.path(forResource: "item", ofType: "json")
//        let url = URL(fileURLWithPath: path! )
//
//        do{
//            let data = try Data(contentsOf: url)
//            let item = try JSONDecoder().decode([String : [Int]].self, from: data)
//            print(item)
//        }
//        catch{
//
//        }
    }



}

