//
//  ViewController.swift
//  ttestt
//
//  Created by 최서연 on 2020/08/31.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
//  .notifications.goToDae.post()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! ChangdeokAR.loadBoxx()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        if (try! ChangdeokAR.loadBoxxDae().actions.goToDae.onAction != nil) {
//            performSegue(withIdentifier: "goToVC", sender: nil)
            print("ready")
        }
            
        
        }
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
         
     }
    }
        
//class Preliminary_Trigger "NotificationTrigger" do {
//
//}
    

