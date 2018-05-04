//
//  ViewController.swift
//  SIT305 Assignment-2
//
//  Created by NICK XIE on 3/4/18.
//  Copyright © 2018 NICK XIE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


    @IBOutlet weak var gameNameLbl: UILabel!
    @IBOutlet weak var tapToStartButton: UIButton!
    @IBOutlet weak var gameChatLabel: UILabel!
    @IBOutlet weak var shelterButton: UIButton!
    @IBOutlet weak var seaButton: UIButton!
    @IBOutlet weak var forestButton: UIButton!
    @IBOutlet weak var caveButton: UIButton!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Build path to access the audio file
        let path = Bundle.main.path(forResource: "Sad Cinematic", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
}
    //Create action for start button
    @IBAction func startButton(_ sender: Any) {
        self.player.play()
        gameNameLbl.isHidden = true
        tapToStartButton.isHidden = true
        shelterButton.isHidden = false
        gameChatLabel.isHidden = false; do {
            self.downloadJSON() {
            }
        }

    }
    //Load json file for system dialog
    func downloadJSON(completed: @escaping () -> ()) {
        //Create path to access the gameChat.json file
        if let path = Bundle.main.path(forResource: "gameChat", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let gameChat = jsonResult["gameChat"] as? [Any] {
                    for gamechat in gameChat {
                    print(gamechat)
                    self.gameChatLabel.text = "\(gamechat)"
                    }
                }
            } catch {
                print("Error!")
            }
        }
    }


}
