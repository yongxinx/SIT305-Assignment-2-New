//
//  ForestViewController.swift
//  SIT305-Assignment-2
//
//  Created by NICK XIE on 2018/5/12.
//  Copyright © 2018年 NICK XIE. All rights reserved.
//

import UIKit

class ForestViewController: UIViewController {

    @IBOutlet weak var forestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Forest page";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function enables player to navigate and search the forest.
    @IBAction func onClickLeft(_ sender: Any) {
        // Check if player still has enough inventories to keep searching in the forest. If not, alert pop up and exit forest.
        if (Shelter.userInventory.meet == 0 || Shelter.userInventory.water == 0){
            let alert = UIAlertController.init(title: nil, message: "You don't have enough meat or water...", preferredStyle: .alert);
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (UIAlertAction) in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.2){
                    self.navigationController?.popViewController(animated: true);
                }
            }))
            self.present(alert, animated: true, completion: nil);

            return;
        }
        // Every time when player makes a step in forest, they lost 1 meet and 1 water.
        Shelter.userInventory.editMeet(quantity: -1);
        Shelter.userInventory.editWater(quantity: -1);
        // Every step players make, they either randomly find nothing, or find wood and pick up a piece of wood. When they find wood, wood's quantity in inventory increase by 1.
        let getWaterSuccess = arc4random()%UInt32(2);
        if getWaterSuccess == 0 {
            forestLabel.text = "There is nothing towards this direction...";
        }else{
            Shelter.userInventory.editWood(quantity: 1);
            forestLabel.text = "You picked up piece of wood!";
        }
        // Check if player has match the win requirements.
        winChech();
    }
    
    // Function enables player to navigate and search the forest.
    @IBAction func onClickRight(_ sender: Any) {
        // Check if player still has enough inventories to keep searching in the forest. If not, alert pop up and exit forest.
        if (Shelter.userInventory.meet == 0 || Shelter.userInventory.water == 0){
            let alert = UIAlertController.init(title: nil, message: "You don't have enough meat or water...", preferredStyle: .alert);
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (UIAlertAction) in
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.2){
                    self.navigationController?.popViewController(animated: true);
                }
            }))
            
            self.present(alert, animated: true, completion: nil);
            return;
        }
        // Every time when player makes a step in forest, they lost 1 meet and 1 water.
        Shelter.userInventory.editMeet(quantity: -1);
        Shelter.userInventory.editWater(quantity: -1);
        // Every step players make, they either randomly find nothing, or find wood and pick up a piece of wood. When they find wood, wood's quantity in inventory increase by 1.
        let getWaterSuccess = arc4random()%UInt32(2);
        if getWaterSuccess == 0 {
            forestLabel.text = "You hear a little noise in this direction but you didn’t find anything...";
        }else{
            Shelter.userInventory.editWood(quantity: 1);
            forestLabel.text = "You picked up piece of wood!";
        }
        // Check if player has match the win requirements.
        winChech();
    }
    
    // Function to check if player has win the game.
    func winChech() {
        // When wood's quantity in player's inventory reach 20, alert will pop up promoting player that there are already enough wood to make a raft. When player tapped Ok, player will be navigated to win page and game is over.
        if Shelter.userInventory.wood >= 20 {
            let alert = UIAlertController.init(title: nil, message: "You have enough wood to make a raft.", preferredStyle: .alert);
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (UIAlertAction) in
                let win = self.storyboard?.instantiateViewController(withIdentifier: "WinViewController");
                self.present(win!, animated: true, completion: nil);
            }))
            self.present(alert, animated: true, completion: nil);

        }
    }
}
