//
//  ViewController.swift
//  ttestt
//
//  Created by 최서연 on 2020/08/31.
//  Copyright © 2020 최서연. All rights reserved.
//

import UIKit
import RealityKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
//  .notifications.goToDae.post()
    func handleTapOnEntity(_ entity: Entity?) {
           guard let entity = entity else { return }
        print("ready")
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! ChangdeokAR.loadBoxx()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        try! ChangdeokAR.loadBoxxDae().actions.goToDae.onAction = handleTapOnEntity(_:)
//
            
        
        }
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
         
     }
    }
        
//class Preliminary_Trigger "NotificationTrigger" do {
//
//}
    

