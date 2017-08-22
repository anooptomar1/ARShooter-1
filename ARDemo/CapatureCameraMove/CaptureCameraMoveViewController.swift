//
//  CaptureCameraMoveDemo.swift
//  ARDemo
//
//  Created by Xianning Liu  on 21/08/2017.
//  Copyright © 2017 Xianning Liu . All rights reserved.
//

import UIKit
import ARKit

class CaptureCameraMoveViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    @IBOutlet weak var sceneView:ARSCNView!
    @IBOutlet weak var goBackButton:UIButton!
    
    override func viewDidLoad() {
        sceneView.delegate = self
        sceneView.session.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let arSessionConfiguration = ARWorldTrackingSessionConfiguration()
        arSessionConfiguration.planeDetection = ARWorldTrackingSessionConfiguration.PlaneDetection.horizontal
        sceneView.session.run(arSessionConfiguration)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let airplaneScene = SCNScene(named: "");
        let airplaneNode = airplaneScene!.rootNode.childNodes[0];
        let airplaneScale = SCNVector3Make(0.5, 0.5, 0.5)
        let airplanePosition = SCNVector3Make(0, -15, -15)
        airplaneNode.position = airplanePosition
        airplaneNode.scale = airplaneScale
        
        for node in airplaneNode.childNodes {
            node.scale = airplaneScale
            node.position = airplanePosition
        }
        
        sceneView.scene.rootNode.addChildNode(airplaneNode)
    }
    
    @IBAction func didTapGoBackButton() {
        print("Back to Home Screen!")
        self.dismiss(animated: true, completion: nil)
    }
}
