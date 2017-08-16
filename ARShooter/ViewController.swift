//
//  ViewController.swift
//  ARShooter
//
//  Created by Xianning Liu  on 09/08/2017.
//  Copyright © 2017 Xianning Liu . All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, SCNPhysicsContactDelegate {
    
    @IBOutlet weak var sceneView:ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self;
        sceneView.showsStatistics = true;
        
        let scene = SCNScene();
        sceneView.scene = scene;
        sceneView.scene.physicsWorld.contactDelegate = self;
        
        self.addNewShip()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let configuration = ARWorldTrackingSessionConfiguration();
        configuration.planeDetection = ARWorldTrackingSessionConfiguration.PlaneDetection.horizontal;
        sceneView.session.run(configuration);
    }
    
    func addNewShip() {
        let newShip = Ship()
        let positionX = floatBetween(-0.5, and: 0.5)
        let positionY = floatBetween(-0.5, and: 0.5)
        newShip.position = SCNVector3(positionX, positionY, -1)
        sceneView.scene.rootNode.addChildNode(newShip)
    }
    
    @IBAction func didTapScreen(_ sender:UITapGestureRecognizer) {
        let bullet = Bullet()
        bullet.position = SCNVector3(0, 0, -0.2)
        
        let bulletDirection = self.getUserDirection()
        bullet.physicsBody?.applyForce(bulletDirection, asImpulse: true)
        sceneView.scene.rootNode.addChildNode(bullet)
    }
    
    func getUserDirection() -> SCNVector3 {
        if let frame  = self.sceneView.session.currentFrame {
            let mat = SCNMatrix4(frame.camera.transform)
            return SCNVector3(-1 * mat.m31, -1 * mat.m32, -1 * mat.m33)
        }
        
        return SCNVector3(0,0,-1)
    }
    
    func floatBetween(_ x:Float, and y:Float) -> Float{
        return (Float(arc4random())/Float(UInt32.max)) * (x - y) + y
    }
    
    //MARK: Contact Delegate
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        contact.nodeA.removeFromParentNode()
        contact.nodeB.removeFromParentNode()
        print("Hit ship")
        self.addNewShip()
    }
}


