//
//  Shelter.swift
//  SIT305-Assignment-2
//
//  Created by NICK XIE on 2018/5/12.
//  Copyright © 2018年 NICK XIE. All rights reserved.
//

import UIKit

class Shelter: NSObject {
    static let userInventory = Shelter();
    
    // Create inventory variables
    var meet = 0;
    var water = 0;
    var fish = 0;
    var wood = 0;
    
    public func editMeet(quantity: NSInteger)  {
        meet = meet + quantity;
        if meet < 0 {
            meet = 0
        }
    }
    
    public func editWater(quantity: NSInteger)  {
        self.water = self.water + quantity;
        if self.water < 0 {
            self.water = 0
        }
    }
    public func editWood(quantity: NSInteger)  {
        self.wood = self.wood + quantity;
        if self.wood < 0 {
            self.wood = 0
        }
    }
}
