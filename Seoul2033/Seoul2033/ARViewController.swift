//
//  ARViewController.swift
//  Seoul2033
//
//  Created by 최서연 on 2020/09/25.
//  Copyright © 2020 손영웅. All rights reserved.
//

import UIKit

import ARKit
import RealityKit

class ARViewController: UIViewController, ARSessionDelegate {

    @IBOutlet weak var arLable: UILabel!
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var arButtonLable: UIButton!
    
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
    
        super.viewDidLoad()
        arLable.text = "돌 아래 뭐가 있나 치워보자!"
        arButtonLable.setTitle( "꼭 확인한 후에 돌아가자.", for: .normal)
        
    
        let woodAnchor = try! WoodAR.loadWood()
        
      
          
          // Add the box anchor to the scene
        arView.scene.anchors.append(woodAnchor)
    
       
    }
    
    @IBAction func arButtonAction(_ sender: Any) {
        arView.session.pause()
        self.navigationController?.popViewController(animated: true)
    }
    
}
