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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

