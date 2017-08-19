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
    
}
