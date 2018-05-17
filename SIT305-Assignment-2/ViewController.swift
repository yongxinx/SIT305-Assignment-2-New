//
//  ViewController.swift
//  SIT305-Assignment-2
//
//  Created by NICK XIE on 2018/5/12.
//  Copyright © 2018年 NICK XIE. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    //Outlets created
    @IBOutlet weak var gameChatLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var seaButton: UIButton!
    @IBOutlet weak var shelterButton: UIButton!
    @IBOutlet weak var forestButton: UIButton!
    @IBOutlet weak var caveButton: UIButton!
    
    var gamechatArray = NSArray.init();
    var chatIndex = 0;
    var audioPlayer: AVAudioPlayer?

// When the game launches, hide some buttons, load game chat data from json file and play background music.
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.readGameChatData();
        
        self.seaButton.isHidden = true;
        self.shelterButton.isHidden = true;
        self.forestButton.isHidden = true;
        self.caveButton.isHidden = true;
        
        playMusic();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /// Function to load and read local json data, then used to display game chat.
    func readGameChatData() {
        let path = Bundle.main.path(forResource: "gameChat", ofType: "json");
        if path != nil {
            do
            {
                let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe);
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves);
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let gamechatsArray = jsonResult["gameChat"] as? [Any] {
                    if gamechatsArray.count > 0{
                        self.gamechatArray = gamechatsArray as NSArray;
                    }
                }
            }
            catch
            {
                print("Error");
            }
        }
    }
    
    // Function to load and gain access to the background music and called from videDidLoad function
    func playMusic() {
        let path = Bundle.main.path(forResource: "Sad-Cinematic", ofType: "mp3")
        let pathURL = NSURL.init(fileURLWithPath: path!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pathURL as URL)
        } catch {
            audioPlayer = nil
        }
        
        if audioPlayer != nil {
            audioPlayer?.prepareToPlay();
            audioPlayer?.play();
        }
    }
    
    // Function to display game chat in order when start button is clicked each time. When game chat is finished, all buttons to nevigate the map appear and start button is hidden.
    @IBAction func onClickStartGame(_ sender: UIButton) {
        sender.setTitle("Tap to continue...", for: .normal);
        if chatIndex < gamechatArray.count {
            self.gameChatLabel.text = gamechatArray[chatIndex] as? String;
            chatIndex += 1;
        }else{
            self.gameChatLabel.text = "Select an action to continue";
            self.seaButton.isHidden = false;
            self.shelterButton.isHidden = false;
            self.forestButton.isHidden = false;
            self.caveButton.isHidden = false;
            self.startBtn.isHidden = true;
        }
    }
    
    // Create navigation to the shelter scene
    @IBAction func onClickShelterButton(_ sender: Any) {
        let shelter = self.storyboard?.instantiateViewController(withIdentifier: "ShelterViewController");
        self.navigationController?.pushViewController(shelter!, animated: true);
    }
    
    // Create navigation to the sea scene
    @IBAction func onClickSeaButton(_ sender: Any) {
        let sea = self.storyboard?.instantiateViewController(withIdentifier: "SeaViewController");
        self.navigationController?.pushViewController(sea!, animated: true);
    }
    
    // Create navigation to the cave scene
    @IBAction func onClickCaveButton(_ sender: Any) {
        let cave = self.storyboard?.instantiateViewController(withIdentifier: "CaveViewController");
        self.navigationController?.pushViewController(cave!, animated: true);
    }
    
    // Create navigation to the forest scene and set up conditons to enter, player can only enter once their inventory quantities meet requirements. When required inventories are not enough and they try to enter to the forest scene, alert will pop up.
    @IBAction func onClickForestButton(_ sender: Any) {
        if Shelter.userInventory.water >= 5 && Shelter.userInventory.meet >= 5{
            let forest = self.storyboard?.instantiateViewController(withIdentifier: "ForestViewController");
            self.navigationController?.pushViewController(forest!, animated: true);
        }else{
            let alert = UIAlertController.init(title: nil, message: "You don't have enough meat and water to go into the forest...", preferredStyle: .alert);
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil));
            
            self.present(alert, animated: true, completion: nil);
        }
    }
    
}

