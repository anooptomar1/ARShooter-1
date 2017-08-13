//
//  Ship.swift
//  ARShooter
//
//  Created by Xianning Liu  on 10/08/2017.
//  Copyright © 2017 Xianning Liu . All rights reserved.
//

import UIKit
import SceneKit

class Ship:SCNNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1)
        self.geometry = box
        let shape = SCNPhysicsShape(geometry: box, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        self.physicsBody?.categoryBitMask = CollisionCategory.ship.rawValue
        self.physicsBody?.contactTestBitMask = CollisionCategory.bullets.rawValue
    }
    
}

struct CollisionCategory {
    let rawValue:Int
    
    static let bullets = CollisionCategory(rawValue: 0 << 1)
    static let ship = CollisionCategory(rawValue: 1 << 1)
}
