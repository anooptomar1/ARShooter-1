//
//  AnimationViewController.swift
//  ARDemo
//
//  Created by Xianning Liu  on 23/08/2017.
//  Copyright © 2017 Xianning Liu . All rights reserved.
//
import UIKit
import ARKit

class AnimationViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {
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
    }
    
    @IBAction func didTapGoBackButton() {
        print("Back to Home Screen!")
        self.dismiss(animated: true, completion: nil)
    }
}
