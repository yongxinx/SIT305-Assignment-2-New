//
//  CaveViewController.swift
//  SIT305-Assignment-2
//
//  Created by NICK XIE on 2018/5/12.
//  Copyright © 2018年 NICK XIE. All rights reserved.
//

import UIKit

class CaveViewController: UIViewController {

    @IBOutlet weak var meetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Cave page";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function to enable player whether randomly get meat or get nothing. If fail, alert pop up. If succeed, alert pop up as well and meat's quantity in inventory increse by 1.
    @IBAction func onClickGetMeat(_ sender: Any) {
        let getWaterSuccess = arc4random()%UInt32(2);
        if getWaterSuccess == 0 {
            meetLabel.text = "You have got nothing...";
        }else{
            Shelter.userInventory.editMeet(quantity: 1);
            meetLabel.text = "You have found some meat!";
        }
    }
    
}
