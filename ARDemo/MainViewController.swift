//
//  MainViewController.swift
//  ARDemo
//
//  Created by Xianning Liu  on 17/08/2017.
//  Copyright © 2017 Xianning Liu . All rights reserved.
//

import UIKit

class MainViewController:UIViewController {
    @IBOutlet weak var shooterDemo:UIButton!
    @IBOutlet weak var planeDetectionDemo:UIButton!
    
    @IBAction func didTapOnShooterDemoButton() {
        self.performSegue(withIdentifier: "showShooterDemo", sender: self)
    }
    @IBAction func didTapOnPlaneDetectionDemoButton() {
        self.performSegue(withIdentifier: "showPlaneDetectionDemo", sender: self)
    }
    
    @IBAction func didTapOnCameraMoveDemoButton() {
        self.performSegue(withIdentifier: "showCaptureCameraMoveDemo", sender: self)
    }
}
