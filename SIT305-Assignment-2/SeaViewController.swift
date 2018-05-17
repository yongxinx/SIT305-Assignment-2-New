//
//  SeaViewController.swift
//  SIT305-Assignment-2
//
//  Created by NICK XIE on 2018/5/12.
//  Copyright © 2018年 NICK XIE. All rights reserved.
//

import UIKit

class SeaViewController: UIViewController {

    @IBOutlet weak var waterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Sea page";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // Function to enable player whether randomly get water or get nothing. If fail, alert pop up. If succeed, alert pop up as well and water's quantity in inventory increse by 1.
    @IBAction func onClickGetWater(_ sender: Any) {
        let getWaterSuccess = arc4random()%UInt32(2);
        if getWaterSuccess == 0 {
            waterLabel.text = "You have got nothing...";
        }else{
            Shelter.userInventory.editWater(quantity: 1);
            waterLabel.text = "You have found some water!";
        }
        
    }
}
