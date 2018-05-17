//
//  ShelterViewController.swift
//  SIT305-Assignment-2
//
//  Created by NICK XIE on 2018/5/12.
//  Copyright © 2018年 NICK XIE. All rights reserved.
//

import UIKit

class ShelterViewController: UIViewController {
    @IBOutlet weak var shelterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Shelter Page";
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onClickInventory(_ sender: Any) {
        let displayText = "meet : \(Shelter.userInventory.meet) \n water : \(Shelter.userInventory.water) \n wood : \(Shelter.userInventory.wood)";
        
        shelterLabel.text = displayText;
    }
    

}
