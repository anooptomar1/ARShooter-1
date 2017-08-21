//
//  PlaneDetectionViewController.swift
//  ARDemo
//
//  Created by Xianning Liu  on 18/08/2017.
//  Copyright © 2017 Xianning Liu . All rights reserved.
//

import UIKit
import ARKit

class PlaneDetectionViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
    @IBOutlet weak var sceneView:ARSCNView!
    @IBOutlet weak var goBackButton:UIButton!
    
    @IBAction func didTapGoBackButton() {
        print("Back to Home Screen!")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        sceneView.automaticallyUpdatesLighting = true
        sceneView.session.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
     let arSessionConfiguration = ARWorldTrackingSessionConfiguration()
        arSessionConfiguration.planeDetection = ARWorldTrackingSessionConfiguration.PlaneDetection.horizontal
        arSessionConfiguration.isLightEstimationEnabled = true
        sceneView.session.run(arSessionConfiguration)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let planeAnchor = anchor as? ARPlaneAnchor {
            print("Plane detection")
            
            let scnBox = SCNBox(width: CGFloat(planeAnchor.extent.x * 0.3), height: 0, length: CGFloat(planeAnchor.extent.y * 0.3), chamferRadius: 0)
            let planeNode = SCNNode(geometry: scnBox)
            let planePosition = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.position = planePosition
            node.addChildNode(planeNode)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                let vaseScene = SCNScene(named: "Assets.xcassets/vase.scn")
                let vaseNode =  vaseScene!.rootNode.childNodes[0]
                vaseNode.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
                node.addChildNode(vaseNode)
            })
        }
    } 
}
