//
//  Bullet.swift
//  ARShooter
//
//  Created by Xianning Liu  on 15/08/2017.
//  Copyright © 2017 Xianning Liu . All rights reserved.
//

import UIKit
import SceneKit

class Bullet:SCNNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        let sphere = SCNSphere(radius: 0.025)
        self.geometry = sphere
        let shape = SCNPhysicsShape(geometry: sphere, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        self.physicsBody?.isAffectedByGravity = false
        self.physicsBody?.categoryBitMask = CollisionCategory.bullets.rawValue
        self.physicsBody?.contactTestBitMask = CollisionCategory.ship.rawValue
    }
}
