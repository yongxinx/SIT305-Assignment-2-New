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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
