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
    
    func floatBetween(_ x:Float, and y:Float) -> Float{
        return (Float(arc4random())/Float(UInt32.max)) * (x - y) + y
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


