//
//  ViewController.swift
//  SIT305 Assignment-2
//
//  Created by NICK XIE on 3/4/18.
//  Copyright © 2018 NICK XIE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameChatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "gameChat", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let gameChat = jsonResult["gameChat"] as? [Any] {
                    print(gameChat)
                    self.gameChatLabel.text = "\(gameChat)"
//                    "\(json.valueForKeyPath("results.definition")!)"

                }
            } catch {
                print("Error!")
            }
        }
        
    }



}

