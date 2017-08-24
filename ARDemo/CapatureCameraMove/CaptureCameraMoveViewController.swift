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
    weak var airplaneNode:SCNNode?
    
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
        airplaneNode = airplaneScene?.rootNode.childNodes[0];
        if let node = airplaneNode {
            let airplaneScale = SCNVector3Make(0.5, 0.5, 0.5)
            let airplanePosition = SCNVector3Make(0, -15, -15)
            node.position = airplanePosition
            node.scale = airplaneScale
            
            for childNode in node.childNodes {
                childNode.scale = airplaneScale
                childNode.position = airplanePosition
            }
            
            let container = SCNNode()
            let rootNode = sceneView.scene.rootNode
            container.position =  rootNode.position
            container.addChildNode(node)
            rootNode.addChildNode(container)
            
            let rotateAnimation = CABasicAnimation(keyPath: "rotation")
            rotateAnimation.duration = 30
            rotateAnimation.toValue = NSValue(scnVector4: SCNVector4Make(0, 1, 0, Float(Double.pi * 2)))
            rotateAnimation.repeatCount = Float.greatestFiniteMagnitude
            
            container.addAnimation(rotateAnimation, forKey: "rotate around the camera")
        }
    }
    
    @IBAction func didTapGoBackButton() {
        print("Back to Home Screen!")
        self.dismiss(animated: true, completion: nil)
    }
    
    //Mark: AR session delegate
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        print("相机移动")
        if let node  = airplaneNode {
            let matrix = SCNMatrix4(frame.camera.transform)
            node.position = SCNVector3Make(matrix.m31,matrix.m32,matrix.m33)
        }
    }
}
